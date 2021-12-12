putfile <- function(datestring) {
  basetime=as.numeric(as_datetime(datestring))
  basetimect=as.POSIXct(basetime, origin = "1970-01-01", tz = "UTC")
  basetimedate=as.Date(basetimect, format="%Y-%m-%d")
  filedate=format(basetimect, "%y%m%d")
  filename=paste("./analysis_", filedate, ".csv", sep="")
  #
  centerfreq=9999000.0
  audiofreq=1000.0
  #
  id_string="JJ1BDX Tokyo Japan PM95tp,LB GPSDO,LATITUDE,LONGITUDE,ELEVATION"
  csv_header_string="UTC, Freq, Freq Err, Vpk, dBV(Vpk)"
  #
  listtime=c(basetime+0:86399)
  #
  listtimehms=format(as.POSIXct(listtime, origin = "1970-01-01", tz = "UTC"),
		    "%H:%M:%S")
  listfreq=smoothfreqfun(listtime) 
  listaudiofreq=listfreq - audiofreq
  listrecfreq=listfreq + centerfreq
  listlevel=smoothlevelfun(listtime) 
  listreallevel=10 ^ (listlevel/20.0)
  #
  csvframe=data.frame(listtimehms, listrecfreq, listaudiofreq, listreallevel, listlevel, stringsAsFactors = FALSE)
  colnames(csvframe) <- c("UTC", "Freq", "Freq Err", "Vpk", "dBV(Vpk)")
  #
  fileconn <- file(filename)
  writeLines(c(paste(basetimedate,",",id_string,sep=""),
	       csv_header_string), fileconn)
  close(fileconn)
  #
  write.table(csvframe, file=filename, append=TRUE,
	      row.names=FALSE, quote=FALSE, col.names=FALSE, 
	      sep = ", ", eol = "\n", na = "NA", dec = ".", qmethod = "double")
}

putfile("20211201")
putfile("20211202")
putfile("20211203")
putfile("20211204")
putfile("20211205")
putfile("20211206")
putfile("20211207")
putfile("20211208")
putfile("20211209")
putfile("20211210")
