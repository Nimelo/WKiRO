library(mmand)
library(png)


source(paste0(getwd(), "/OnlyR/Algorithms/Context Processing/ContextProcessing.R"))
source(paste0(getwd(), "/OnlyR/Algorithms/Contextless Processing/Distortion.R"))

fan <- readPNG(paste0(getwd(), "/Files/Input/wall.png"))

display(imgPixelNormalization(imgGreyScale(imgSobel(imgMedian(imgSaltPepper(fan, 140, 140), 3)))))