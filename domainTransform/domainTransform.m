%  NC  Domain transform normalized convolution edge-preserving filter.
% 
%  F = NC(img, sigma_s, sigma_r, num_iterations, joint_image)
%
%  Parameters:
%    img             Input image to be filtered.
%    sigma_s         Filter spatial standard deviation.
%    sigma_r         Filter range standard deviation.
%    num_iterations  Number of iterations to perform (default: 3).
%    joint_image     Optional image for joint filtering.
%
%
%
%  This is the reference implementation of the domain transform NC filter
%  described in the paper:
% 
%    Domain Transform for Edge-Aware Image and Video Processing
%    Eduardo S. L. Gastal  and  Manuel M. Oliveira
%    ACM Transactions on Graphics. Volume 30 (2011), Number 4.
%    Proceedings of SIGGRAPH 2011, Article 69.
%
%  Please refer to the publication above if you use this software. For an
%  up-to-date version go to:
%  
%             http://inf.ufrgs.br/~eslgastal/DomainTransform/
%
%
%  THIS SOFTWARE IS PROVIDED "AS IS" WITHOUT ANY EXPRESSED OR IMPLIED WARRANTIES
%  OF ANY KIND, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
%  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
%  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
%  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
%  OUT OF OR IN CONNECTION WITH THIS SOFTWARE OR THE USE OR OTHER DEALINGS IN
%  THIS SOFTWARE.
%
%  Version 1.0 - August 2011.

function F = domainTransform(img, sigma_s, sigma_r, num_iterations, joint_image)

    I = double(img);

    if ~exist('num_iterations', 'var')
        num_iterations = 3;
    end
    
    if exist('joint_image', 'var') && ~isempty(joint_image)
        J = double(joint_image);
    
        if (size(I,1) ~= size(J,1)) || (size(I,2) ~= size(J,2))
            error('Input and joint images must have equal width and height.');
        end
    else
        J = I;
    end
    
    [h w num_joint_channels] = size(J);

    %% Compute the domain transform (Equation 11 of our paper).
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % Estimate horizontal and vertical partial derivatives using finite
    % differences.
    dIcdx = diff(J, 1, 2);
    dIcdy = diff(J, 1, 1);
    
    dIdx = zeros(h,w);
    dIdy = zeros(h,w);
    
    % Compute the l1-norm distance of neighbor pixels.
    for c = 1:num_joint_channels
        dIdx(:,2:end) = dIdx(:,2:end) + abs( dIcdx(:,:,c) );
        dIdy(2:end,:) = dIdy(2:end,:) + abs( dIcdy(:,:,c) );
    end
    
    % Compute the derivatives of the horizontal and vertical domain transforms.
    dHdx = (1 + sigma_s/sigma_r * dIdx);
    dVdy = (1 + sigma_s/sigma_r * dIdy);
    
    % Integrate the domain transforms.
    ct_H = cumsum(dHdx, 2);
    ct_V = cumsum(dVdy, 1);
    
    % The vertical pass is performed using a transposed image.
    ct_V = ct_V';
    
    %% Perform the filtering.
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    N = num_iterations;
    F = I;

    sigma_H = sigma_s;
    
    for i = 0:num_iterations - 1
        
        % Compute the sigma value for this iteration (Equation 14 of our paper).
        sigma_H_i = sigma_H * sqrt(3) * 2^(N - (i + 1)) / sqrt(4^N - 1);
        
        % Compute the radius of the box filter with the desired variance.
        box_radius = sqrt(3) * sigma_H_i;
        
        F = TransformedDomainBoxFilter_Horizontal(F, ct_H, box_radius);
        F = image_transpose(F);

        F = TransformedDomainBoxFilter_Horizontal(F, ct_V, box_radius);
        F = image_transpose(F);
        
    end
    
    F = cast(F, class(img));

end

%% Box filter normalized convolution in the transformed domain.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function F = TransformedDomainBoxFilter_Horizontal(I, xform_domain_position, box_radius)

    [h w num_channels] = size(I);

    % Compute the lower and upper limits of the box kernel in the transformed domain.
    l_pos = xform_domain_position - box_radius;
    u_pos = xform_domain_position + box_radius;

    % Find the indices of the pixels associated with the lower and upper limits
    % of the box kernel.
    %
    % This loop is much faster in a compiled language.  If you are using a
    % MATLAB version which supports the 'parallel for' construct, you can
    % improve performance by replacing the following 'for' by a 'parfor'.

    l_idx = zeros(size(xform_domain_position));
    u_idx = zeros(size(xform_domain_position));

    for row = 1:h
        xform_domain_pos_row = [xform_domain_position(row,:) inf];

        l_pos_row = l_pos(row,:);
        u_pos_row = u_pos(row,:);

        local_l_idx = zeros(1, w);
        local_u_idx = zeros(1, w);

        local_l_idx(1) = find(xform_domain_pos_row > l_pos_row(1), 1, 'first');
        local_u_idx(1) = find(xform_domain_pos_row > u_pos_row(1), 1, 'first');

        for col = 2:w
            local_l_idx(col) = local_l_idx(col-1) + ...
                find(xform_domain_pos_row(local_l_idx(col-1):end) > l_pos_row(col), 1, 'first') - 1;

            local_u_idx(col) = local_u_idx(col-1) + ...
                find(xform_domain_pos_row(local_u_idx(col-1):end) > u_pos_row(col), 1, 'first') - 1;
        end

        l_idx(row,:) = local_l_idx;
        u_idx(row,:) = local_u_idx;
    end

    % Compute the box filter using a summed area table.
    SAT            = zeros([h w+1 num_channels]);
    SAT(:,2:end,:) = cumsum(I, 2);
    row_indices    = repmat((1:h)', 1, w);
    F              = zeros(size(I));

    for c = 1:num_channels
        a = sub2ind(size(SAT), row_indices, l_idx, repmat(c, h, w));
        b = sub2ind(size(SAT), row_indices, u_idx, repmat(c, h, w));
        F(:,:,c) = (SAT(b) - SAT(a)) ./ (u_idx - l_idx);
    end
    
end

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function T = image_transpose(I)

    [h w num_channels] = size(I);
    
    T = zeros([w h num_channels], class(I));
    
    for c = 1:num_channels
        T(:,:,c) = I(:,:,c)';
    end
    
end
