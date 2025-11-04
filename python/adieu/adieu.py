import inflect

j = inflect.engine()

names = []
while True:
    try:
        user = input("Name: ")
        names.append(user)
    except EOFError:
        print()
        break

print(f"Adieu, adieu, to {j.join(names)}")

