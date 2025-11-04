def main():
    user_input = shorten(input("Input: "))
    print(user_input)

def shorten(word):
    vowels = "aeiouAEIOU"
    result = ""
    for i in word:
        if i not in vowels:
            result += i
    return result

if __name__ == "__main__":
    main()
