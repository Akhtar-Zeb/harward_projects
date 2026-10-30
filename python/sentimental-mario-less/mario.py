while True:
    height = input("Height: ")
    if height.isnumeric():
        height = int(height)
        if 1 <= height <= 8:
            break

for i in range(1, height + 1):
    space = height - i
    print(" " * space, end="")
    print("#" * i)
