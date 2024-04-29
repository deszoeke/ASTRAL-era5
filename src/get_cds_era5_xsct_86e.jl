# activate environmennnt
using  Pkg; Pkg.activate("..")

# use packages
using CDSAPI
using NCDatasets
using PyPlot
using Dates


# download ERA5 data from Copernicus Climate Data Store CDS API                          'area': [30, 40, -4, 90],
# AD 07 mooring: 68.97 °E, 14.9 °N
# May-June meridional section along 15 N, one file per year

lon = 86 # ASTRAL IOP central BoB longitude

# for year in 2018:2023
for year in 2024:-1:2015
    req = CDSAPI.py2ju("""
                             {
                                 'product_type': 'reanalysis',
                                 'format': 'netcdf',
                                 'area': [-4, $(lon), 30, $(lon)],
                                 'time': '00:00',
                                 'month': [ '04', '05', '06' ],
                                 'day':   [ '01', '02', '03', '04', '05', '06',
                                  '07', '08', '09', '10', '11', '12',
                                  '13', '14', '15', '16', '17', '18',
                                  '19', '20', '21', '22', '23', '24',
                                  '25', '26', '27', '28', '29', '30',
                                  '31',],
                                 'year': ['$(year)'],
                                 'pressure_level': [ '1', '2', '3', '5', '7', '10', '20', '30', '50', '70', '100', '125', '150', '175', '200', '225', '250', '300', '350', '400', '450', '500', '550', '600', '650', '700', '750', '775', '800', '825', '850', '875', '900', '925', '950', '975', '1000'],
                                 'variable': [ 'divergence', 'fraction_of_cloud_cover', 'geopotential',
                                     'potential_vorticity', 'specific_humidity', 'temperature',
                                     'u_component_of_wind', 'v_component_of_wind', 'vertical_velocity',
                                     'vorticity'],
                             }
                        """)

    # download commented out
    r = CDSAPI.retrieve( "reanalysis-era5-pressure-levels", req , "xsct_$(lon)e_$(year).nc" ) # saves data in .nc
end

