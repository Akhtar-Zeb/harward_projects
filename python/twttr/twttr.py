user_input = input("Input: ")

vowel = ["a", "e", "i" , "o", "u", "A", "E", "I", "O", "U"]

for word in user_input:
    if word not in vowel:
        print(word, end = "")
print()
