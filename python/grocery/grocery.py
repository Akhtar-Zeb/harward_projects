item_list = {}

while True:
    try:
        user_item = input("")
        user_item = user_item.strip().upper()

        if user_item in item_list:
            item_list[user_item] += 1
        else:
            item_list[user_item] = 1
    except EOFError:
        break

for user_item in sorted(item_list.keys()):
    print(f"{item_list[user_item]} {user_item}")
