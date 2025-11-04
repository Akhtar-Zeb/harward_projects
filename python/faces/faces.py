def main():
    user = input("Enter your text: ")
    output = convert(user)
    print(output)

def convert(user_input):
    user_input = user_input.replace(":)", "🙂")
    user_input = user_input.replace(":(", "🙁")
    return user_input

main()
