############################################################################################
# Routine developpee par C. Schmechtig Antoine Poteau et Henry Bittig
#
# March 2016 : Read Coriolis Data 
#############################################################################################

library(ncdf)

file_in_BRtraj="../DATA/6901032_BRtraj.nc"
file_in_Rtraj="../DATA/6901032_Rtraj.nc"


nc_file=open.ncdf(file_in_BRtraj,readunlim=FALSE)
nc_file2=open.ncdf(file_in_Rtraj,readunlim=FALSE)

CHLA=get.var.ncdf(nc_file,"CHLA")
PRES=get.var.ncdf(nc_file,"PRES")
plot(PRES,ylim=c(0,1500))

DATA_TYPE=get.var.ncdf(nc_file,"DATA_TYPE") # Btrajectory pas important


# liste des mesures 
TRAJECTORY_PARAMETERS=get.var.ncdf(nc_file,"TRAJECTORY_PARAMETERS")

# JULD 
JULD=get.var.ncdf(nc_file,"JULD")
plot(JULD,ylim=c(23000,23100))

timedec <- ((abs(JULD - trunc(JULD)) *24 ) )

TIME_H <- format(strptime( paste(floor(timedec), round((timedec-floor(timedec))*60), sep=":"), format="%H:%M"),"%H")
TIME_M <- format(strptime( paste(floor(timedec), round((timedec-floor(timedec))*60), sep=":"), format="%H:%M"),"%H")
TIME_Y <- format(as.Date(trunc(JULD), origin="1950-01-01 00:00:00 UTC"),"%Y")
TIME_M <- format(as.Date(trunc(JULD), origin="1950-01-01 00:00:00 UTC"),"%M")
TIME_D <- format(as.Date(trunc(JULD), origin="1950-01-01 00:00:00 UTC"),"%D")




# latitude
LATITUDE=get.var.ncdf(nc_file2,"LATITUDE")
POSITION_QC=get.var.ncdf(nc_file2,"POSITION_QC")

PRES_core=get.var.ncdf(nc_file2,"PRES")

#Measurement_code for BR_TRAJ
MEASUREMENT_CODE=get.var.ncdf(nc_file,"MEASUREMENT_CODE")

#Measurement_code for R_TRAJ
MEASUREMENT_CODE_core=get.var.ncdf(nc_file2,"MEASUREMENT_CODE")
