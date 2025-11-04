months = [
        "January", "February", "March", "April", "May", "June",
        "July", "August", "September", "October", "November", "December"
]


while True:
    user = input("Date: ").strip()
    try:
        if "/" in user:
            month, date, year = user.split("/")
            month = int(month)
            date = int(date)
            year = int(year)

            if month < 1 or month > 12:
                raise ValueError
            if date < 1 or date > 31:
                raise ValueError
        elif "," in user:
            user = user.replace(",", "")
            user = user.split(" ")
            month, date, year = user
            if not month in months:
                raise ValueError
            month = months.index(month) + 1
            month = int(month)
            date = int(date)
            year = int(year)

            if month < 1 or month > 12:
                raise ValueError
            if date < 1 or date > 31:
                raise ValueError
        else:
            raise ValueError

        print(f"{year}-{month:02d}-{date:02d}")
        break
    except (ValueError, IndexError):
        pass

