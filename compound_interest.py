import sys

from decimal import Decimal


def calculate_compound_interest(principal, rate, time):
    amount = principal * (1 + rate)**time
    return amount


if __name__ == '__main__':
    principal = float(sys.argv[1])
    rate = float(sys.argv[2])
    time = float(sys.argv[3])

    print(principal)
    print(rate)
    print(time)

    amount = calculate_compound_interest(principal, rate, time)
    print('New Amount: {}'.format(amount))
