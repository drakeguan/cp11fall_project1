# Local Extrema Filter

## K. Subr, C. Soler, F. Durand, Edge-Preserving Multiscale Image Decomposition Based on Local Extrema, SIGGRAPH Asia 2009.

## Original README from Colorization Using Optimization

Source code in Colorization Using Optimization by Anat Levin, Dani Lischinski and Yair Weiss is borrowed
for its interpolation function.
This package contains an implementation of the image colorization approach described in the paper:
A. Levin D. Lischinski and Y. Weiss Colorization using Optimization.
ACM Transactions on Graphics, Aug 2004. 
 

Usage of this code is free for research purposes only. 
Please refer to the above publication if you use the program.

Copyrights: The Hebrew University of Jerusalem, 2004.
All rights reserved.

Written by Anat Levin.
Please address comments/suggestions/bugs to: alevin@cs.huji.ac.il
---------------------------------------------------------------------


General:

The package provides colorization implementation using two optional
solvers:

1. An exact solver using the matlab "\" operator.
  This solver is guarantee to provide the global optimum, but running
  time can be slow, especially for large images.

2. Multi Grid solver. Fast and efficient, but not always accurate. 
  This solver is written in C++ and links to matlab as a mex function.

Compilation:

Compiled version for  Windows(using Visual C++ 6.0) and Linux are included in this package, but you might need to recompile on your machine. 
To compile, type from within matlab:
>>mex -O getVolColor.cpp fmg.cpp mg.cpp  tensor2d.cpp  tensor3d.cpp


Usage:
You can either use your favorite image editing program
to scribble, or we provide a rudimentary user interface with the function
called (appropriately) cheapUI.m;
Here is an example:
im1=imread('example_res.bmp');
im1=double(im1/255); % images should be double between 0 and 1
cheapUI(im1);

You will see three Matlab figures. The first contains the input
image. You can click on the mouse in this figure to mark points
that define a scribble and then press 'c' to choose a color for 
the scribble. You choose a color by clicking in figure 2 on
the color chooser. If the input image is a color image, you
can press 'd' to have the color of the scribble be defined
by the colors in the original image. Pressing 'a' will run
the multigrid algorithm and display results in figure 2. 
Pressing 'A' will run the direct solver. 

If you prefer to use your favorite image editing program
(e.g. Photoshop, gimp) you need to save two images to
the disk. 

1. The original B/W image. The image needs to be saved in an RGB (3 channels) format.

2. The B/W with colors scribbled in the desired places. Use your favorite paint program (Photoshop, paint, gimp and each) to generate the scribbles. Make sure no compression is used and the only pixels in which the RGB value of the scribbled image are different then the original image are the colored pixels. 

To run the program define the desired solver and the input file names in the head of the 'colorize.m' file. Then just call the 'colorize' script from within matlab.
An example images pair is included in this package.
 


