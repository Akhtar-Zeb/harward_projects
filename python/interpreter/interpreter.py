def main():
    user = input("Expression: ")

    x, y, z = user.split(" ")

    x = int(x)
    z = int(z)

    if y == "+":
        result = x + z
    elif y == "-":
        result = x - z
    elif y == "*":
        result = x * z
    elif y == "/":
        if z == 0:
            print("Denominator must be greater than 0")
            return
        else:
            result = x / z
    else:
        print("Invalid operator")
        return

    print(f"{result:.1f}")

main()
