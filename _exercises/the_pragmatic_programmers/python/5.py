def get_input(message=""):
    while True:
        raw = input(message)
        try:
            res = int(raw)
        except ValueError:
            print("Please check your input.")
        else:
            break
    return res

first = get_input("What is the first number?\n")
second = get_input("What is the second number?\n")

if a<0 or b<0:
    print("Number can not be negtive!")
    raise ValueError
else:
    print("\nNow I will show you the result: \n")
    print("{a} + {b} = {c}".format(a=a, b=b, c=a+b))
    print("{a} - {b} = {c}".format(a=a, b=b, c=a-b))
    print("{a} * {b} = {c}".format(a=a, b=b, c=a*b))
    print("{a} / {b} = {c}".format(a=a, b=b, c=a/b))