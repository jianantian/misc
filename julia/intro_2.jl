function fib(n)
    if n <= 1
        return 1
    else
        a,b = 1, 1
        for i = 1:n
            a, b = b, a+b
        end
        return a
    end
end

print(fib(100))
