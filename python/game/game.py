import random

def get_positive_int(n):
    while True:
        try:
            value = int(input(n))
            if value > 0:
                return value
        except ValueError:
            pass

def main():
    level = get_positive_int("Level: ")

    number = random.randint(1, level)

    while True:
        guess = get_positive_int("Guess: ")

        if guess < number:
            print("Too small!")
        elif guess > number:
            print("Too large!")
        else:
            print("Just right!")
            break

main()


