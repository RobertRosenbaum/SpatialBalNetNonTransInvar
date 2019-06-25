Code for simulating spatially extended balanced networks with non-translationally invariant connection probabilities. To accompany the article "Balanced networks in spatially extended networks without translationally invariant connectivity" by Christopher Ebsch and Robert Rosenbaum. 

Before running any simulations you must do "mex AdExNetworkSimDeluxe.c" in the Matlab command line within the directory that the code is in.

If you just want to reproduce the figures, run the scripts PlotRatesVsXAll.m and RasterAndCurrentPlotAll.m which generate the firing rate plots and the (rasters and currents) plots respectively. 

The simulations for generating the firing rate plots can take hours to run, depending on the number of processors available on your computer. The data for these simulations are stored in the .mat files so you do not need to re-run the simulations. If you want to re-run the simulations, call RatesVsX1.m, RatesVsX4.m, and RatesVsX2.m. 

The file name conventions for all figures is that the numbers 1, 2, and 4 (as in the RatesVsX*.m scripts) represent external input of the form sin^1, sin^2, and sin^4 respectively, which correspond to figures 1, 3, and 2 in the paper (figure 1=sin^1, figure 2=sin^4, figure 3=sin^2). The number following "N" in the file names (as in RatesVsX*N*nt.mat) correspond to the value of N for that simulation (N=1e3, 5e3, 2e4). 

Please contact Robert Rosenbaum at Robert.Rosenbaum@nd.edu with any questions.
