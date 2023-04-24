##' Script for installing camRa app
##' 

#### FIRST, RUN THESE THREE LINES (highlight, then ctrl-enter)
if (!require('utils')) install.packages('utils')
utils::remove.packages('camRa')
.rs.restartR()
####

#### THEN, RUN THESE NEXT ONES (highlight, then ctrl-enter)
#### 
update.packages()
if(!require('remotes')) install.packages('remotes')
if(!require('dplyr')) install.packages('dplyr')
if(!require('exifr')) install.packages('exifr')
camRa_path <- file.info(list.files(path = c(file.path(Sys.getenv('USERPROFILE'), 'Downloads'),
                                            file.path(Sys.getenv('USERPROFILE'), 'Documents'),
                                            file.path(Sys.getenv('USERPROFILE'), 'Desktop')),
                                   pattern = 'camRa_.*tar.gz',
                                   recursive = T,
                                   full.names = T))

camRa_path <- rownames(dplyr::filter(camRa_path, mtime == max(mtime))) %>% 
  as.data.frame()
remotes::install_local(camRa_path)
####
