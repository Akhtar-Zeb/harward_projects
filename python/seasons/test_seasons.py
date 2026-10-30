import pytest
from seasons import calculate_minutes
from datetime import date, timedelta

def test_one_year():
    today = date.today()
    one_year_ago = today - timedelta(days=365)
    minutes = calculate_minutes(one_year_ago.strftime("%Y-%m-%d"))
    assert minutes == 525600

def test_leap_year():
    today = date.today()
    leap_days = 366
    leap_date = today - timedelta(days=leap_days)
    minutes = calculate_minutes(leap_date.strftime("%Y-%m-%d"))
    assert minutes == 527040

def test_invalid_date():
    with pytest.raises(ValueError):
        calculate_minutes("2025-13-01")  # Invalid month

def test_future_date():
    future_date = (date.today() + timedelta(days=1)).strftime("%Y-%m-%d")
    with pytest.raises(ValueError):
        calculate_minutes(future_date)
