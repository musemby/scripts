import time

# count down function used in musemby/poker
def count_down(num):
    for num in reversed(range(num)):
        print(num, end='\r')
        time.sleep(0.5)

if __name__ == '__main__':
    count_down(5)