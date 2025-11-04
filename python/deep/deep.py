user = input("What is the Answer to the Great Question of Life, the Universe, and Everyting? ")

user = user.strip().lower()

if user == "42":
    print("Yes")
elif user == "forty two":
    print("Yes")
elif user == "forty-two":
    print("Yes")
else:
    print("No")
