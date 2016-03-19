#dyn.load("foo.dll")
dyn.load("E:/GitHubRepo/WKiRO/AS4C/Main.dll")

x = 1:3
#ret_val = .C("addOneToVector", n = length(x), vector = as.double(x))

mat = matrix(1:16, 8, 2, TRUE)
mask = matrix(1, 3, 3, TRUE)
mask[2,2] = 1
#ret_val = .C("addOneToMatrix", x = nrow(mat), y = ncol(mat),  matrix = mat)


ret_val = .C("bitmapMatrix", vRows = as.integer(nrow(mat)), vCols = as.integer(ncol(mat)), vector = as.integer(mat), maskRows = as.integer(nrow(mask)), maskCols = as.integer(ncol(mask)), mask = as.integer(mask))

print(as.integer(mat))

print(ret_val$vector)

print(mat)

print(matrix(ret_val$vector, 8, 2, TRUE))

