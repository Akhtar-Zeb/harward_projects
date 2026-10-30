def main():
    user = input("CamalCase: ")
    snack_case(user)

def snack_case(user):
    for i in user:
        if i.isupper():
            print("_" + i.lower(), end = "")
        else:
            print(i, end = "")
    print()


main()
