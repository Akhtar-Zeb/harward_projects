import sys
import os
from PIL import Image, ImageOps


def main():
    if len(sys.argv) != 3:
        sys.exit("Too few command-line arguments")
    if len(sys.argv) < 3:
        sys.exit("Too many command-line arguments")

    input_file = sys.argv[1]
    output_file = sys.argv[2]

    valid_extensions = (".jpg", ".jpeg", ".png")
    input_ext = os.path.splitext(input_file)[1].lower()
    output_ext = os.path.splitext(output_file)[1].lower()

    if input_ext not in valid_extensions:
        sys.exit("Invalid input")
    if output_ext not in valid_extensions:
        sys.exit("Invalid output")
    if input_ext != output_ext:
        sys.exit("Input and output have different extensions")

    try:
        input_image = Image.open(input_file)
    except FileNotFoundError:
        sys.exit("Input does not exist")

    shirt = Image.open("shirt.png")
    size = shirt.size

    input_cropped = ImageOps.fit(input_image, size)
    input_cropped.paste(shirt, shirt)

    input_cropped.save(output_file)


if __name__ == "__main__":
    main()
