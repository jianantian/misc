println("What is the first number?")
first  = readline(STDIN)
println("What is the second number?")
second = readline(STDIN)

first_num = parse(Int64, first)
second_num = parse(Int64, second)
println("Now I will show you the results:")
println("$first_num + $second_num = $(first_num+second_num)")
println("$first_num - $second_num = $(first_num - second_num)")
println("$first_num * $second_num = $(first_num * second_num)")
println("$first_num / $second_num = $(first_num / second_num)")