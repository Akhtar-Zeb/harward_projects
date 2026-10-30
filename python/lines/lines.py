import sys
import os


if len(sys.argv) < 2:
    sys.exit("Too few command-line arguments")
elif len(sys.argv) > 2:
    sys.exit("Too many command-line arguments")

file = sys.argv[1]

if not file.endswith(".py"):
    sys.exit("Not a Python file")

if not os.path.exists(file):
    sys.exit("File does not exist")


count = 0
with open(file, "r") as f:
    for line in f:
        line = line.lstrip()

        if not line or line.startswith("#"):
            continue
        else:
            count += 1

print(count)



