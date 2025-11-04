import tabulate
import sys
import os
import csv

if len(sys.argv) < 2:
    sys.exit("Too few command-line arguments")
elif len(sys.argv) > 2:
    sys.exit("Too many command-line arguments")

file = sys.argv[1]

if not file.endswith(".csv"):
    sys.exit("Not a CSV file")

if not os.path.exists(file):
    sys.exit("File does not exist")

table = []
with open(file, "r") as f:
    file = csv.DictReader(f)
    for line in file:
        table.append(line)

table = tabulate.tabulate(table, headers="keys", tablefmt="grid")

print(table)
