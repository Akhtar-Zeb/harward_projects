from datetime import date, datetime
import inflect
import sys

p = inflect.engine()

def main():
    birthdate = input("Date of Birth: ")
    try:
        minutes = calculate_minutes(birthdate)
    except ValueError:
        sys.exit("Invalid date")
    words = p.number_to_words(minutes, andword="").capitalize()
    print(f"{words} minutes")

def calculate_minutes(birthdate):
    birth = datetime.strptime(birthdate, "%Y-%m-%d").date()
    today = date.today()
    if birth > today:
        raise ValueError("Birthdate cannot be in the future")
    delta = today - birth
    return round(delta.days * 24 * 60)

if __name__ == "__main__":
    main()
