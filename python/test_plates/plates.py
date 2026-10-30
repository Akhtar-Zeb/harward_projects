def main():
    plate = input("Plate: ")
    if is_valid(plate):
        print("Valid")
    else:
        print("Invalid")


def is_valid(s):
    if not 2 <= len(s) <= 6:
        return False

    if not (s[0].isalpha() and s[1].isalpha()):
        return False

    found_number = False
    for i in range(len(s)):
        if s[i].isdigit():
            if not found_number:
                if s[i] == '0':
                    return False
                found_number = True
            if not s[i:].isdigit():
                return False
            break
        elif found_number:
            return False

    if not s.isalnum():
        return False

    return True


if __name__ == "__main__":
    main()
