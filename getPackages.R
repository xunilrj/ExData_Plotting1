getPackages <- function(x) {
    x <- as.character(match.call()[[2]])
    writeLines(sprintf('Testing %s is installed...', x))
    if (!require(x, character.only = TRUE)) {
        writeLines(sprintf('\tInstalling...', x))
        install.packages(pkgs = x, repos = "http://cran.r-project.org")
        require(x, character.only = TRUE)
        writeLines(sprintf('\tInstalled!', x))
    }
}