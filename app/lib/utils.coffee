# 为Array添加乱序方法
do -> Array::shuffle ?= ->
	for i in [@length-1..1]
		j = Math.floor Math.random() * (i + 1)
		[@[i], @[j]] = [@[j], @[i]]
	@