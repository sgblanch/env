# Set the default paper size to letter
options(papersize = "letter")

# Always use RStudio's CRAN mirror.  Don't bother if we are running in
# RStudio since it will muck with this on its own.
local({
  if(Sys.getenv("RSTUDIO") != "1") {
    r = getOption("repos")             
    r["CRAN"] = "https://cran.rstudio.com/"
    options(repos = r)
  }
})

# Read user .Renviron.  This is usually redundant but is useful if a
# .Renviron exists in the current directory
if(file.exists("~/.Renviron"))
  readRenviron("~/.Renviron")
