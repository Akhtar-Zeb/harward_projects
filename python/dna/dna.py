import csv
import sys

def main():
    # Ensure proper usage
    if len(sys.argv) != 3:
        print("Usage: python dna.py data.csv sequence.txt")
        sys.exit(1)

    # Read database file into memory
    database = []
    with open(sys.argv[1], newline="") as csvfile:
        reader = csv.DictReader(csvfile)
        for row in reader:
            database.append(row)

        # Extract STR names (all columns except "name")
        strs = reader.fieldnames[1:]

    # Read DNA sequence file into memory
    with open(sys.argv[2], "r") as f:
        sequence = f.read()

    # Find longest match of each STR in sequence
    str_counts = {}
    for s in strs:
        str_counts[s] = longest_match(sequence, s)

    # Check database for matching profile
    for person in database:
        match = True
        for s in strs:
            if int(person[s]) != str_counts[s]:
                match = False
                break
        if match:
            print(person["name"])
            return

    print("No match")


def longest_match(sequence, subsequence):
    """
    Returns length of longest run of subsequence in sequence.
    """

    # Initialize variables
    longest_run = 0
    subseq_len = len(subsequence)
    seq_len = len(sequence)

    # Check each position in sequence
    for i in range(seq_len):

        # Count number of times subsequence repeats
        count = 0

        # Check for subsequence match in a "sliding window"
        while True:
            start = i + count * subseq_len
            end = start + subseq_len

            # If match, increase count
            if sequence[start:end] == subsequence:
                count += 1
            else:
                break

        # Update longest run found
        longest_run = max(longest_run, count)

    return longest_run


if __name__ == "__main__":
    main()
