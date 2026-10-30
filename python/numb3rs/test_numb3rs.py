from numb3rs import validate

def test_valid_ips():
    assert validate("127.0.0.1") == True
    assert validate("255.255.255.255") == True
    assert validate("0.0.0.0") == True
    assert validate("192.168.1.1") == True

def test_out_of_range():
    assert validate("275.3.6.28") == False
    assert validate("256.256.256.256") == False
    assert validate("1.2.3.1000") == False
    assert validate("512.512.512.512") == False

def test_leading_zeros():
    assert validate("192.168.001.001") == False
    assert validate("001.002.003.004") == False

def test_invalid_format():
    assert validate("cat") == False
    assert validate("127.0.0") == False
    assert validate("127.0.0.1.5") == False
    assert validate("...") == False
    assert validate("1234") == False
