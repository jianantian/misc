import arrow

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

age = get_input("What is your current age? ")
retire_age = get_input("At what age would you like to retire? ")

duration = retire_age - age
now = arrow.now().year
retire_year = now + duration
if duration >= 0:
    print("You have {} years left until you can retire.".format(duration))
else:
    print("You retired {} years ago.".format(abs(duration)))
print("It's {}, so you retire in {}.".format(now, retire_year))
