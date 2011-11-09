# WLS filter

## Edge-Preserving Decompositions for Multi-Scale Tone and Detail Manipulation

## original readme:

original src: http://www.cs.huji.ac.il/~danix/epd/wlsFilter.m
original author: Dani Lischinski
<danix@mail.huji.ac.il>
http://www.cs.huji.ac.il/~danix/

  function OUT = wlsFilter(IN, lambda, alpha, L)

WLSFILTER Edge-preserving smoothing based on the weighted least squares(WLS) 
optimization framework, as described in Farbman, Fattal, Lischinski, and
Szeliski, "Edge-Preserving Decompositions for Multi-Scale Tone and Detail
Manipulation", ACM Transactions on Graphics, 27(3), August 2008.

Given an input image IN, we seek a new image OUT, which, on the one hand,
is as close as possible to IN, and, at the same time, is as smooth as
possible everywhere, except across significant gradients in L.
