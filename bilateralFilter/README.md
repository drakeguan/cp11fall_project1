# Bilateral Filter

## Bilateral and Cross-Bilateral Filter using the Bilateral Grid.

## original readme:

original src: http://people.csail.mit.edu/jiawen/software/bilateralFilter.m
original author: Jiawen (Kevin) Chen 
  <jiawen@csail.mit.edu>
  http://people.csail.mit.edu/jiawen/


output = bilateralFilter( data, edge, ...
                         edgeMin, edgeMax, ...
                         sigmaSpatial, sigmaRange, ...
                         samplingSpatial, samplingRange )

Bilateral and Cross-Bilateral Filter using the Bilateral Grid.

Bilaterally filters the image 'data' using the edges in the image 'edge'.
If 'data' == 'edge', then it the standard bilateral filter.
Otherwise, it is the 'cross' or 'joint' bilateral filter.
For convenience, you can also pass in [] for 'edge' for the normal
bilateral filter.

Note that for the cross bilateral filter, data does not need to be
defined everywhere.  Undefined values can be set to 'NaN'.  However, edge
*does* need to be defined everywhere.

data and edge should be of the greyscale, double-precision floating point
matrices of the same size (i.e. they should be [ height x width ])

data is the only required argument

edgeMin and edgeMax specifies the min and max values of 'edge' (or 'data'
for the normal bilateral filter) and is useful when the input is in a
range that's not between 0 and 1.  For instance, if you are filtering the
L channel of an image that ranges between 0 and 100, set edgeMin to 0 and
edgeMax to 100.

edgeMin defaults to min( edge( : ) ) and edgeMax defaults to max( edge( : ) ).
This is probably *not* what you want, since the input may not span the
entire range.

sigmaSpatial and sigmaRange specifies the standard deviation of the space
and range gaussians, respectively.
sigmaSpatial defaults to min( width, height ) / 16
sigmaRange defaults to ( edgeMax - edgeMin ) / 10.

samplingSpatial and samplingRange specifies the amount of downsampling
used for the approximation.  Higher values use less memory but are also
less accurate.  The default and recommended values are:

samplingSpatial = sigmaSpatial
samplingRange = sigmaRange

