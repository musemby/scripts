mapping = {
    0: "th",
    1: "st",
    2: "nd",
    3: "rd",
    4: "th",
    5: "th",
    6: "th",
    7: "th",
    8: "th",
    9: "th"
}

def get_last_digit(number):
    return number % 10


def print_digit(number):
    last = get_last_digit(number)
    return str(number) + mapping[last]
