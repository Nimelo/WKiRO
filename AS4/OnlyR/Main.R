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

#display(binarise(imgThresholdBottom(imgGreyScale(imgPixelNormalization(imgSobelVertical(bike))), 0.2)))

b = matrix(c(-1, -1, -1, 0, 0, 0, 1, 1, 1),3,3, byrow = TRUE) / 6
c = matrix(c(-1, 0, 1, -1, 0, 1, -1, 0, 1), 3, 3, byrow = TRUE) / 6
Gx = abs(conv2(bike[,,1], c))
Gy = abs(conv2(bike[,,1], b))
G = sqrt(Gx ^ 2 + Gy ^ 2)

#display(imgThresholdTop(G, 0.08995))
display(threshold(G, 0.08995))

imgPrewitt(bike, 0.08)