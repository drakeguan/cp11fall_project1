# project 1: Edge-Aware Filtering

Assigned: 2011/10/20  
Due: 2011/11/09 11:59pm  
Author: Shuen-Huei (Drake) Guan, D99944013  
url: http://www.csie.ntu.edu.tw/~cyy/courses/comphoto/11fall/assignments/proj1/



## Project description

In the class, we have introduced a bunch of edge-aware filtering: bilateral,
WLS, Local extrema, Diffusion map, Domain transform, Local Laplacian, L0
minimization and Guided filter. In this assignment, you have three options. For
the first option, you have to implement one of Local extrema or Diffusion map
(which do not have their source codes released). You are free to use any
language of your choice. For the second option, you can implement one of the
following filters, bilateral, WLS, Guided filter, Domain transform, local
Laplacian and L0 minimization (which have made their matlab codes publically
available) with a language other than matlab. In the third option, you are
asked to compare at least three of the following filters, bilateral, WLS,
Guided filter, Domain transform, local Laplacian and L0 minimization (which
have made their code publically available). Note that, since these options have
different levels of difficulty, option #1 has the highest baseline grade,
followed by option #2 and option #3 has the lowest. You are asked to use detail
manipulation as the example to illustrate your filter or to compare filters.
Other applications will be counted as bonus. 



## Project features

* Option #1 is chose for this assignment, plus the option #3's testing.
* Local Extrema filtering is implemented as [matlab](https://github.com/drakeguan/cp11fall_project1/tree/develop/localExtrema/).
* Other filters are from copied from authors' web page. See the last part of this document for further information.
* The interpolation function in **[Colorization Using Optimization](http://www.cs.huji.ac.il/~yweiss/Colorization/)** is used.
* For some reason, I might not test all filtering algorithms.
* There are around 8 testing images located in **[input_images](https://github.com/drakeguan/cp11fall_project1/tree/develop/input_images/)**.
* The resulting images are located in **[result](https://github.com/drakeguan/cp11fall_project1/tree/develop/result/)**.
* For each combination of one filter and one testing image, the resulting images are named as:
    * **image name**\_**function name**\_by\_**filter name**
    * function name: smoothed(M), detail(D), enhanced(D\*2+M)
    * function name: plot_IMD: plotting of one line for its I, M, D.
    * filter name: [wlsFilter](https://github.com/drakeguan/cp11fall_project1/tree/develop/wlsFilter), [bilateralFilter](https://github.com/drakeguan/cp11fall_project1/tree/develop/bilateralFilter), [localExtrema](https://github.com/drakeguan/cp11fall_project1/tree/develop/localExtrema), [domainTransform](https://github.com/drakeguan/cp11fall_project1/tree/develop/DomainTransform), [guidedFilter](https://github.com/drakeguan/cp11fall_project1/tree/develop/guidedFilter), [l0Minimization](https://github.com/drakeguan/cp11fall_project1/tree/develop/l0Minimization), ...

The whole testing process is in **[testSmooth.m](https://github.com/drakeguan/cp11fall_project1/tree/develop/testSmooth.m)**. Just take a look at it and play with it.



## Input Images

Those input/testing images are gathered from each research mentioned, including two images
from this assignment webpage. They are already converted to JPEG with quality of 95 for
lesser image size to fit GitHub. I don't own any of those images and they are just used
as a research study and course assignment.

### cave-flash
![](https://github.com/drakeguan/cp11fall_project1/raw/develop/input_images/cave-flash.jpg)
### cave-noflash
![](https://github.com/drakeguan/cp11fall_project1/raw/develop/input_images/cave-noflash.jpg)
### flower
![](https://github.com/drakeguan/cp11fall_project1/raw/develop/input_images/flower.jpg)
### pflower
![](https://github.com/drakeguan/cp11fall_project1/raw/develop/input_images/pflower.jpg)
### rock2
![](https://github.com/drakeguan/cp11fall_project1/raw/develop/input_images/rock2.jpg)
### statue
![](https://github.com/drakeguan/cp11fall_project1/raw/develop/input_images/statue.jpg)
### toy
![](https://github.com/drakeguan/cp11fall_project1/raw/develop/input_images/toy.jpg)
### tulips
![](https://github.com/drakeguan/cp11fall_project1/raw/develop/input_images/tulips.jpg)



## Smoothed & Edge Enhanced Results

### cave-flash
![](https://github.com/drakeguan/cp11fall_project1/raw/develop/result/combo/cave-flash_bilateralFilter_combo.jpg)
![](https://github.com/drakeguan/cp11fall_project1/raw/develop/result/combo/cave-flash_wlsFilter_combo.jpg)
![](https://github.com/drakeguan/cp11fall_project1/raw/develop/result/combo/cave-flash_domainTransform_combo.jpg)
![](https://github.com/drakeguan/cp11fall_project1/raw/develop/result/combo/cave-flash_guidedFilter_combo.jpg)
![](https://github.com/drakeguan/cp11fall_project1/raw/develop/result/combo/cave-flash_l0Minimization_combo.jpg)
![](https://github.com/drakeguan/cp11fall_project1/raw/develop/result/combo/cave-flash_localExtrema_combo.jpg)
### cave-noflash
![](https://github.com/drakeguan/cp11fall_project1/raw/develop/result/combo/cave-noflash_bilateralFilter_combo.jpg)
![](https://github.com/drakeguan/cp11fall_project1/raw/develop/result/combo/cave-noflash_wlsFilter_combo.jpg)
![](https://github.com/drakeguan/cp11fall_project1/raw/develop/result/combo/cave-noflash_domainTransform_combo.jpg)
![](https://github.com/drakeguan/cp11fall_project1/raw/develop/result/combo/cave-noflash_guidedFilter_combo.jpg)
![](https://github.com/drakeguan/cp11fall_project1/raw/develop/result/combo/cave-noflash_l0Minimization_combo.jpg)
![](https://github.com/drakeguan/cp11fall_project1/raw/develop/result/combo/cave-noflash_localExtrema_combo.jpg)
### flower
![](https://github.com/drakeguan/cp11fall_project1/raw/develop/result/combo/flower_bilateralFilter_combo.jpg)
![](https://github.com/drakeguan/cp11fall_project1/raw/develop/result/combo/flower_wlsFilter_combo.jpg)
![](https://github.com/drakeguan/cp11fall_project1/raw/develop/result/combo/flower_domainTransform_combo.jpg)
![](https://github.com/drakeguan/cp11fall_project1/raw/develop/result/combo/flower_guidedFilter_combo.jpg)
![](https://github.com/drakeguan/cp11fall_project1/raw/develop/result/combo/flower_l0Minimization_combo.jpg)
![](https://github.com/drakeguan/cp11fall_project1/raw/develop/result/combo/flower_localExtrema_combo.jpg)
### pflower
![](https://github.com/drakeguan/cp11fall_project1/raw/develop/result/combo/pflower_bilateralFilter_combo.jpg)
![](https://github.com/drakeguan/cp11fall_project1/raw/develop/result/combo/pflower_wlsFilter_combo.jpg)
![](https://github.com/drakeguan/cp11fall_project1/raw/develop/result/combo/pflower_domainTransform_combo.jpg)
![](https://github.com/drakeguan/cp11fall_project1/raw/develop/result/combo/pflower_guidedFilter_combo.jpg)
![](https://github.com/drakeguan/cp11fall_project1/raw/develop/result/combo/pflower_l0Minimization_combo.jpg)
![](https://github.com/drakeguan/cp11fall_project1/raw/develop/result/combo/pflower_localExtrema_combo.jpg)
### rock2
![](https://github.com/drakeguan/cp11fall_project1/raw/develop/result/combo/rock2_bilateralFilter_combo.jpg)
![](https://github.com/drakeguan/cp11fall_project1/raw/develop/result/combo/rock2_wlsFilter_combo.jpg)
![](https://github.com/drakeguan/cp11fall_project1/raw/develop/result/combo/rock2_domainTransform_combo.jpg)
![](https://github.com/drakeguan/cp11fall_project1/raw/develop/result/combo/rock2_guidedFilter_combo.jpg)
![](https://github.com/drakeguan/cp11fall_project1/raw/develop/result/combo/rock2_l0Minimization_combo.jpg)
![](https://github.com/drakeguan/cp11fall_project1/raw/develop/result/combo/rock2_localExtrema_combo.jpg)
### statue
![](https://github.com/drakeguan/cp11fall_project1/raw/develop/result/combo/statue_bilateralFilter_combo.jpg)
![](https://github.com/drakeguan/cp11fall_project1/raw/develop/result/combo/statue_wlsFilter_combo.jpg)
![](https://github.com/drakeguan/cp11fall_project1/raw/develop/result/combo/statue_domainTransform_combo.jpg)
![](https://github.com/drakeguan/cp11fall_project1/raw/develop/result/combo/statue_guidedFilter_combo.jpg)
![](https://github.com/drakeguan/cp11fall_project1/raw/develop/result/combo/statue_l0Minimization_combo.jpg)
![](https://github.com/drakeguan/cp11fall_project1/raw/develop/result/combo/statue_localExtrema_combo.jpg)
### toy
![](https://github.com/drakeguan/cp11fall_project1/raw/develop/result/combo/toy_bilateralFilter_combo.jpg)
![](https://github.com/drakeguan/cp11fall_project1/raw/develop/result/combo/toy_wlsFilter_combo.jpg)
![](https://github.com/drakeguan/cp11fall_project1/raw/develop/result/combo/toy_domainTransform_combo.jpg)
![](https://github.com/drakeguan/cp11fall_project1/raw/develop/result/combo/toy_guidedFilter_combo.jpg)
![](https://github.com/drakeguan/cp11fall_project1/raw/develop/result/combo/toy_l0Minimization_combo.jpg)
![](https://github.com/drakeguan/cp11fall_project1/raw/develop/result/combo/toy_localExtrema_combo.jpg)
### tulips
![](https://github.com/drakeguan/cp11fall_project1/raw/develop/result/combo/tulips_bilateralFilter_combo.jpg)
![](https://github.com/drakeguan/cp11fall_project1/raw/develop/result/combo/tulips_wlsFilter_combo.jpg)
![](https://github.com/drakeguan/cp11fall_project1/raw/develop/result/combo/tulips_domainTransform_combo.jpg)
![](https://github.com/drakeguan/cp11fall_project1/raw/develop/result/combo/tulips_guidedFilter_combo.jpg)
![](https://github.com/drakeguan/cp11fall_project1/raw/develop/result/combo/tulips_l0Minimization_combo.jpg)
![](https://github.com/drakeguan/cp11fall_project1/raw/develop/result/combo/tulips_localExtrema_combo.jpg)



## Plotting of Input(I), Smoothed(M) and Detail(D)

For each filtering, the plotting of **flower** is demonstrated here.
I just randomly pick one line from the image (actually, I pick the line with one-third height). 
The original input image is **Blue**, the smoothed one is **Green**, and
the detail(the difference between input and smoothed one) is **Red**.

For more plotting, please go to **[result/plot](https://github.com/drakeguan/cp11fall_project1/tree/develop/result/plot/)**.

### Bilateral
![Bilateral](https://github.com/drakeguan/cp11fall_project1/raw/develop/result/plot/flower_plot_IMD_by_bilateralFilter.jpg)
### WLS
![WLS](https://github.com/drakeguan/cp11fall_project1/raw/develop/result/plot/flower_plot_IMD_by_wlsFilter.jpg)
### Domain Transform
![Domain Transform](https://github.com/drakeguan/cp11fall_project1/raw/develop/result/plot/flower_plot_IMD_by_domainTransform.jpg)
### Guided
![Guided](https://github.com/drakeguan/cp11fall_project1/raw/develop/result/plot/flower_plot_IMD_by_guidedFilter.jpg)
### L0 Minimization
![L0 Minimization](https://github.com/drakeguan/cp11fall_project1/raw/develop/result/plot/flower_plot_IMD_by_l0Minimization.jpg)
### Local Extrema
![Local Extrema](https://github.com/drakeguan/cp11fall_project1/raw/develop/result/plot/flower_plot_IMD_by_localExtrema.jpg)



## Video(Image Sequence) Result

Here, I apply the **Local Extrema Filter** to an open source movie, 
[Sintel, the Durian Open Movie Proejct](http://www.sintel.org/).
The first one is just the smoothed version, mimicing the NPR effect.
The second one (if generated) is the edge-enhanced version.

[![Sintel](http://www.sintel.org/wp-content/uploads/2010/06/08.2l_comp_000465.jpg)](http://www.youtube.com/watch?v=eRsGyueVLvQ)
Youtube: [Sintel - Third Open Movie by Blender Foundation](http://www.youtube.com/watch?v=eRsGyueVLvQ)

[![Sintel by Local Extrema](https://github.com/drakeguan/cp11fall_project1/raw/develop/result/sintel/sintel_trailer_smoothed.jpg)](http://www.youtube.com/watch?v=\_F0fnSJkFkI)
Youtube: [Sintel by Local Extrema](http://www.youtube.com/watch?v=\_F0fnSJkFkI)



## Reference

1. S. Paris and F. Durand, A Fast Approximation of the Bilateral Filter Using a Signal Processing Approach, IJCV 2009. ([matlab code](http://people.csail.mit.edu/jiawen/software/bilateralFilter.m))
2. Z. Farbman, R. Fattal, D. Lischinski, R. Szeliski, Edge-Preserving Decompositions for Multi-Scale Tone and Detail Manipulation, SIGGRAPH 2008. ([matlab code](http://www.cs.huji.ac.il/~danix/epd/wlsFilter.m))
3. K. Subr, C. Soler, F. Durand, Edge-Preserving Multiscale Image Decomposition Based on Local Extrema, SIGGRAPH Asia 2009.
4. Z. Farbman, R. Fattal, D. Lischinski, Diffusion Maps for Edge-Aware Image Editing, SIGGRAPH Asia 2010.
5. E. Gastal, M. Oliveira, Domain Transform for Edge-Aware Image and Video Processing, SIGGRAPH 2011. ([matlab code](http://inf.ufrgs.br/~eslgastal/DomainTransform/DomainTransformFilters-Source-v1.0.zip))
6. S. Paris, S. Hasinoff, J. Kautz, Local Laplacian Filters: Edge-Aware Image Processing with a Laplacian Pyramid, SIGGRAPH 2011. ([matlab code](http://people.csail.mit.edu/sparis/publi/2011/siggraph/matlab_source_code.zip))
7. L. Xu, C. Lu, Y. Xu, J. Jia, Image smoothing via L0 Gradient Minimization, SIGGRAPH Asia 2011. ([matlab code](http://www.cse.cuhk.edu.hk/~leojia/projects/L0smoothing/L0smoothing.zip))
8. K. He, J. Sun, X. Tang, Guided Image Filtering, ECCV 2010. ([matlab code](http://personal.ie.cuhk.edu.hk/~hkm007/eccv10/guided-filter-code-v1.rar))
