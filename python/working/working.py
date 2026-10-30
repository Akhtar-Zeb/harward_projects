import re
import sys

def main():
    try:
        print(convert(input("Hours: ")))
    except ValueError:
        sys.exit("ValueError")

def convert(s):
    pattern = r"^(\d{1,2}(?::[0-5]\d)?)\s(AM|PM)\s(?:to)\s(\d{1,2}(?::[0-5]\d)?)\s(AM|PM)$"
    match = re.search(pattern, s)

    if not match:
        raise ValueError

    start_time_str, start_ampm, end_time_str, end_ampm = match.groups()

    try:
        start_24 = _convert_single_time(start_time_str, start_ampm)
        end_24 = _convert_single_time(end_time_str, end_ampm)
    except ValueError:
        raise ValueError

    return f"{start_24} to {end_24}"

def _convert_single_time(time_str, ampm):
    if ":" in time_str:
        hour_str, minute_str = time_str.split(":")
        minute = int(minute_str)
    else:
        hour_str = time_str
        minute = 0

    hour = int(hour_str)

    if not (1 <= hour <= 12) or not (0 <= minute <= 59):
        raise ValueError

    if ampm == "PM" and hour != 12:
        hour += 12
    elif ampm == "AM" and hour == 12:
        hour = 0

    return f"{hour:02}:{minute:02}"

if __name__ == "__main__":
    main()
