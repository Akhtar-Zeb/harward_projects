import csv
import sys

from util import Node, StackFrontier, QueueFrontier

names = {}
people = {}
movies = {}

def load_data(directory):
    """
    Load data from csv files into memory
    """

    # Load people
    with open(f"{directory}/people.csv", encoding="utf-8") as f:
        reader = csv.DictReader(f)
        print(reader)

def main():
    if len(sys.argv) > 2:
        sys.exit("Usage: python degrees.py [directory]")
    directory = sys.argv[1] if len(sys.argv) == 2 else "small"

    print("Loading data...")
    load_data(directory)
    print("Data loaded.")

if __name__ == "__main__":
    main()
