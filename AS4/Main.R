dyn.load("foo.dll")

x = 1:3
ret_val = .C("addOneToVector", n = length(x), vector = as.double(x))

mat = matrix(1:9, 3, 3, TRUE)

ret_val = .C("addOneToMatrix", x = nrow(mat), y = ncol(mat),  matrix = mat)


print(ret_val$matrix)