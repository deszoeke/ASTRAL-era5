using Pkg
Pkg.activate("..")

using NCDatasets
using Plots

unicodeplots()

for ncfile in filter(x->contains(x,"69e") && endswith(x,".nc"), readdir())
	ds = NCDataset(ncfile)

