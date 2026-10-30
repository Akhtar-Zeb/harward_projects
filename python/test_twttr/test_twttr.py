from twttr import shorten

def test_oneWord():
    assert shorten("Word") == "Wrd"
    assert shorten("player") == "plyr"
    assert shorten("tea") == "t"

def test_sentance():
    assert shorten("What is your name?") == "Wht s yr nm?"
    assert shorten("That is great.") == "Tht s grt."
    assert shorten("How are you.") == "Hw r y."

def test_upper():
    assert shorten("THIS IS YOUR NAME.") == "THS S YR NM."

def test_number():
    assert shorten("This is cs50.") == "Ths s cs50."
