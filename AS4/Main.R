#dyn.load("foo.dll")
dyn.load("E:/GitHubRepo/WKiRO/AS4C/Main.dll")

x = 1:3
#ret_val = .C("addOneToVector", n = length(x), vector = as.double(x))

mat = matrix(1:9, 3, 3, TRUE)
mask = matrix(1, 3, 3)
#ret_val = .C("addOneToMatrix", x = nrow(mat), y = ncol(mat),  matrix = mat)


ret_val = .C("bitmapMatrix", vRows = nrow(mat), vCols = ncol(mat), vector = mat, maskRows = nrow(mask), maskCols = ncol(mask), mask = as.integer(mask))

print(ret_val$vector)