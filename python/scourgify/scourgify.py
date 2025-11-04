import csv
import sys
import os

def main():
    if len(sys.argv) < 3:
        sys.exit("Too few command-line arguments")
    elif len(sys.argv) > 3:
        sys.exit("Too many command-line arguments")

    input_file = sys.argv[1]
    output_file = sys.argv[2]

    if not os.path.isfile(input_file):
        sys.exit(f"Could not read {input_file}")

    students = []

    try:
        with open(input_file, "r") as csvfile:
            reader = csv.DictReader(csvfile)
            for row in reader:
                try:
                    last, first = row["name"].split(",")
                    students.append({
                        "first": first.strip(),
                        "last": last.strip(),
                        "house": row["house"].strip()
                    })
                except ValueError:
                    sys.exit(f"Invalid name format in row: {row}")
    except FileNotFoundError:
        sys.exit(f"Could not read {input_file}")

    with open(output_file, "w", newline="") as csvfile:
        writer = csv.DictWriter(csvfile, fieldnames=["first", "last", "house"])
        writer.writeheader()
        for student in students:
            writer.writerow(student)

if __name__ == "__main__":
    main()

