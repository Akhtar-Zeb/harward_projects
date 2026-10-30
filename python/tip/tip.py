def main():
    dollars = dollars_to_float(input("How much was the meal? "))
    percent = percent_to_float(input("What percentage would you like to tip? "))
    tip = dollars * percent
    print(f"Leave ${tip:.2f}")


def dollars_to_float(d):
    digit = d.replace("$", "")
    digit = float(digit)
    return digit


def percent_to_float(p):
    percent = p.replace("%", "")
    percent = float(percent)
    percent = percent / 100
    return percent

main()
