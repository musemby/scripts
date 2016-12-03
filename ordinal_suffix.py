import cmd

class GetOrdinal(cmd.Cmd):
    '''
        Return the ordinal suffix of a given number
    '''

    def do_get_ordinal(self, number):
        mod_ten = number % 10
        mod_soo = number % 100

        # 1,2,3 in teens are the exceptions
        if mod_ten == 1 and mod_soo != 11:
            return number + 'st'
        if mod_ten == 2 and mode_soo != 12:
            return number + 'nd'
        if mod_ten == 3 and mod_soo != 13:
            return number + 'rd'

        return i + 'th'

    def do_EOF(self, line):
        return True


if __name__ == '__main__':
    GetOrdinal().cmdloop()
