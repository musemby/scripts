import sys

'''
    Return the ordinal suffix of a given number
'''

def get_ordinal(number):
    mod_ten = number % 10
    mod_soo = number % 100

    # 1,2,3 in teens are the exceptions
    if mod_ten == 1 and mod_soo != 11:
        return str(number) + 'st'
    if mod_ten == 2 and mode_soo != 12:
        return str(number) + 'nd'
    if mod_ten == 3 and mod_soo != 13:
        return str(number) + 'rd'

    return str(number) + 'th'


if __name__ == '__main__':
    num = int(sys.argv[1])
    print(get_ordinal(num))
