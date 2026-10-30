from um import count

def test_single_um():
    assert count("hello, um, world") == 1

def test_multiple_ums():
    assert count("Um, thanks, um... for the album. UM.") == 3

def test_no_um():
    assert count("yummy scrummy") == 0

def test_um_as_substring():
    assert count("aluminum, number, gum") == 0

def test_um_with_punctuation():
    assert count("um? hello. Um!") == 2

def test_empty_string():
    assert count("") == 0

def test_only_um():
    assert count("um") == 1
