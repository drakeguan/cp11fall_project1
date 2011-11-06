This is the reference implementation of the domain transform filters described
in the paper:

   Domain Transform for Edge-Aware Image and Video Processing
   Eduardo S. L. Gastal  and  Manuel M. Oliveira
   ACM Transactions on Graphics. Volume 30 (2011), Number 4.
   Proceedings of SIGGRAPH 2011, Article 69.

Please refer to the publication above if you use this software. For an
up-to-date version go to:

           http://inf.ufrgs.br/~eslgastal/DomainTransform/


THIS SOFTWARE IS PROVIDED "AS IS" WITHOUT ANY EXPRESSED OR IMPLIED WARRANTIES
OF ANY KIND, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THIS SOFTWARE OR THE USE OR OTHER DEALINGS IN
THIS SOFTWARE.


=== Introduction
================================================================================

This package contains MATLAB/Octave source code which implement our normalized
convolution (NC), interpolated convolution (IC) and recursive (RF)
edge-preserving filters.

Please note that the NC and IC implementations contain loops which are slow in
an interpreted language. If you are using a MATLAB version which supports the
'parallel for' construct, you can obtain better performance by replacing the
'for' by a 'parfor' in IC.m and NC.m, line 133.

For example usage see the file "example.m".


=== Changelog
================================================================================

August 2011 - Version 1.0: 
  - Initial release.
