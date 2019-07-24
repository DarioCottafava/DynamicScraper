#======================================================================================================
# ADMIN
#======================================================================================================
want = c("tidyverse", "broom",   # Data management
         "rvest","V8","splashr","RSelenium",               # Scraping
         "rio", "readtext",      # Leggere/scrivere dati
         "hunspell", "quanteda") # QTA
have = want %in% rownames(installed.packages())
if ( any(!have) ) { install.packages( want[!have] ) }
junk <- lapply(want, library, character.only = TRUE)
rm(have,want,junk)

rm(list = ls()) # Rimuove tutti gli oggetti presenti nel workspace

setwd("C:/Users/Plinio/Desktop/QTA_Torino/DynamicScraping")


##################################################################################
#################################### TUTORIAL ####################################
##################################################################################
#https://cran.r-project.org/web/packages/RSelenium/vignettes/basics.html

##################################################################################
############################TO DO FOR THE FIRST TIME##############################
##################################################################################
#1) Install docker https://docs.docker.com/docker-for-windows/install/
#2) cmd shell
#docker run -d -p 4445:4444 selenium/standalone-firefox:2.53.1
#docker run -d -p 5901:5900 -p 127.0.0.1:4445:4444 --link http-server selenium/standalone-firefox-debug:2.53.1


##################################################################################
################################DYNAMIC SCRAPING##################################
##################################################################################

remDr <- remoteDriver(
  remoteServerAddr = "localhost",
  port = 4445L,
  browserName = "firefox"
)
remDr$open()
remDr$getStatus()


url_string <- "https://map.muoversinpiemonte.it/?module=planner&fromPlace=Torino%3A%3A45.07136%2C7.66641&toPlace=Cuneo%3A%3A44.38956%2C7.54787&date=2019-08-16&time=15%3A00"
remDr$navigate(url_string)

webElem <- remDr$findElement(using = "class", "duration")
webElem$getElementText()

