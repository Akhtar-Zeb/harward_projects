from bank import value

def test_value():
    assert value("Hello") == 0
    assert value("hello") == 0
    assert value("hey, buddy") == 20
    assert value("how are you sir!") == 20
    assert value("what's up") == 100
    assert value("   Hello!") == 0
    assert value("Hi") == 20
    assert value("Good morning") == 100
