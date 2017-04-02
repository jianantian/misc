word = input("What is the input string?")
if not word:
    word = input("Please input some word!")
print("{} has {} characters.".format(word, len(word)))
