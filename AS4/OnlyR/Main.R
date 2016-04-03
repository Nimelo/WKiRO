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


field <- readPNG(paste0(getwd(), "/Files/Presentation/field.png"))
display(field)

addRField <- imgAdd(field, 0.2, 0, 0)
display(addRField)

cucumber <- readPNG(paste0(getwd(), "/Files/Presentation/cucumber.png"))
display(cucumber)

minRCucumber <- imgSubtract(cucumber, r = 0.1)
display(cucumber)

sand <- readPNG(paste0(getwd(), "/Files/Presentation/sand.png"))


desertmountain <- readPNG(paste0(getwd(), "/Files/Presentation/desertmountain.png"))

cs <- readPNG(paste0(getwd(), "/Files/Presentation/cs.png"))

cf <- readPNG(paste0(getwd(), "/Files/Presentation/cf.png"))

neg <- readPNG(paste0(getwd(), "/Files/Presentation/neg.png"))

forest2 <- readPNG(paste0(getwd(), "/Files/Presentation/forest2.png"))

forest <- readPNG(paste0(getwd(), "/Files/Presentation/forest.png"))

camel <- readPNG(paste0(getwd(), "/Files/Presentation/camel.png"))

view <- readPNG(paste0(getwd(), "/Files/Presentation/view.png"))

gamma <- readPNG(paste0(getwd(), "/Files/Presentation/gamma.png"))

snake <- readPNG(paste0(getwd(), "/Files/Presentation/snake.png"))

sp1 <- readPNG(paste0(getwd(), "/Files/Presentation/sp1.png"))

snake2 <- snake
for (i in 1:100) {
    snake2 <- imgAverage(snake2)
}

display(snake)


sh <- readPNG(paste0(getwd(), "/Files/Presentation/sh.png"))

wall <- readPNG(paste0(getwd(), "/Files/Presentation/wall.png"))

valve <- readPNG(paste0(getwd(), "/Files/Presentation/valve.png"))

spidey <- readPNG(paste0(getwd(), "/Files/Presentation/spidey.png"))
