for i in range(10):
    x = 5

# for 的作用域并不是局部的, 将产生 个 global 的变量 ， 这与很多语言 (如 c++) 不一样
print(i+1)
