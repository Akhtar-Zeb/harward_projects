import pytest
from working import convert

def test_valid_formats():
    assert convert("9 AM to 5 PM") == "09:00 to 17:00"
    assert convert("9:00 AM to 5:00 PM") == "09:00 to 17:00"
    assert convert("10:30 PM to 8:50 AM") == "22:30 to 08:50"
    assert convert("12 AM to 12 PM") == "00:00 to 12:00"
    assert convert("12 PM to 12 AM") == "12:00 to 00:00"
    assert convert("1 AM to 1 PM") == "01:00 to 13:00"
    assert convert("1 PM to 1 AM") == "13:00 to 01:00"

def test_invalid_times():
    with pytest.raises(ValueError):
        convert("9:60 AM to 5:00 PM")
    with pytest.raises(ValueError):
        convert("13 PM to 5 PM")
    with pytest.raises(ValueError):
        convert("9 AM to 13:00 PM")
    with pytest.raises(ValueError):
        convert("0 AM to 5 PM")
    with pytest.raises(ValueError):
        convert("9 AM to 5:60 PM")

def test_invalid_input_formats():
    with pytest.raises(ValueError):
        convert("9 AM - 5 PM")
    with pytest.raises(ValueError):
        convert("9AM to 5PM")
    with pytest.raises(ValueError):
        convert("9 AM 5 PM")
    with pytest.raises(ValueError):
        convert("09:00 AM - 17:00 PM")
    with pytest.raises(ValueError):
        convert("hello world")
    with pytest.raises(ValueError):
        convert("9:00 to 5:00")
