import sys

'''
    Return the ordinal suffix of a given number
    run: `python ordinal_suffix.py 890`
'''

def get_ordinal(number):
    mod_ten = number % 10
    mod_soo = number % 100

    number = str(number)

    # 1,2,3 in teens are the exceptions
    if mod_ten == 1 and mod_soo != 11:
        return number + 'st'
    if mod_ten == 2 and mode_soo != 12:
        return number + 'nd'
    if mod_ten == 3 and mod_soo != 13:
        return number + 'rd'

    # every number takes the th
    return number + 'th'

if __name__ == '__main__':
    num = int(sys.argv[1])
    print(get_ordinal(num))
