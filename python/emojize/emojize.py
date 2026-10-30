import emoji

user = input("Input: ")

text = emoji.emojize(user, language = "alias")

print(f"Output: {text}")


