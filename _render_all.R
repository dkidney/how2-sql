files = list.files(pattern = "*.Rmd")
result = vector("list", length(files))
for (i in 1:length(files)) { # i=1
    file = files[i]
    result[[i]] = try(rmarkdown::render(file))
}
writeLines(files[sapply(result, inherits, "try-error")])

