library(mmand)
library(png)

algorithmsPath = "./OnlyR/Algorithms"

for (f in list.files(path = algorithmsPath, pattern = "*.R", full.names = TRUE, recursive = TRUE)) {
    source(f)
}


fan <- readPNG(paste0(getwd(), "/Files/Input/wall.png"))

#display(imgPixelNormalization(imgGreyScale(imgSobel(imgMedian(imgSaltPepper(fan, 140, 140), 3)))))




bike <- readPNG(paste0(getwd(), "/Files/Input/5EJJH.png"))


bike <- imgGreyScale(bike)



#display(threshold(G, 0.08995))

display(imgPrewitt(bike, 0.08))

squeres <- readPNG(paste0(getwd(), "/Files/Input/Squeres.png"))

bike2 <- triangle
for (i in 1:100) {
    squeres <- imgErode(squeres)
}

display(squeres)


circle <- readPNG(paste0(getwd(), "/Files/Input/j.png"))


display(circle)

display(imgClosing(circle))
