import sys
import random
from pyfiglet import Figlet

def main():
    figlet = Figlet()

    if len(sys.argv) == 1:
        font = random.choice(figlet.getFonts())
        figlet.setFont(font=font)

    elif len(sys.argv) == 3:
        if sys.argv[1] not in ["-f", "--font"]:
            sys.exit("Invalid usage")

        font = sys.argv[2]
        if font not in figlet.getFonts():
            sys.exit("Invalid usage")
        figlet.setFont(font=font)
    else:
        sys.exit("Invalid usage")

    user = input("Input: ")
    print(figlet.renderText(user))

main()





