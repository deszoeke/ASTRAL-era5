##
using Pkg
Pkg.activate("~/Projects/ASTRAL/era5")

using NCDatasets
using Plots

unicodeplots()

ncfile = filter(x->contains(x,"69e_2023") && endswith(x,".nc"), readdir())
	ds = NCDataset(ncfile)

##