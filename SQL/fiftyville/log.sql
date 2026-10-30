-- Keep a log of any SQL queries you execute as you solve the mystery.

-- Find the thief by combining all evidence
SELECT id, description FROM crime_scene_reports
WHERE year = 2024 AND month = 7 AND day = 28
AND street = 'Humphrey Street';

SELECT * FROM interviews
WHERE year = 2024 AND month = 7 AND day = 28
AND transcript LIKE '%thief%' OR transcript LIKE '%duck%' OR transcript LIKE '%steal%';

SELECT * FROM bakery_security_logs
WHERE year = 2024 AND month = 7 AND day = 28
AND hour = 10 AND minute BETWEEN 15 AND 25;

SELECT * FROM atm_transactions
WHERE year = 2024 AND month = 7 AND day = 28
AND atm_location = 'Leggett Street'
AND transaction_type = 'withdraw';

SELECT * FROM phone_calls
WHERE year = 2024 AND month = 7 AND day = 28
AND duration < 60;

SELECT * FROM flights
WHERE origin_airport_id = (SELECT id FROM airports WHERE city = 'Fiftyville')
AND year = 2024 AND month = 7 AND day = 29
ORDER BY hour, minute
LIMIT 1;

SELECT city FROM airports
WHERE id = (
    SELECT destination_airport_id FROM flights
    WHERE origin_airport_id = (SELECT id FROM airports WHERE city = 'Fiftyville'
    )
    AND year = 2024 AND month = 7 AND day = 29
    ORDER BY hour, minute
    LIMIT 1
);

SELECT * FROM passengers
WHERE flight_id = (
    SELECT id FROM flights
    WHERE origin_airport_id = (SELECT id FROM airports WHERE city = 'Fiftyville'
    )
    AND year = 2024 AND month = 7 AND day = 29
    ORDER BY hour, minute
    LIMIT 1
);

-- Find the thief by combining all evidence
SELECT p.name FROM people p
JOIN bakery_security_logs bsl ON p.license_plate = bsl.license_plate
JOIN bank_accounts ba ON p.id = ba.person_id
JOIN atm_transactions atm ON ba.account_number = atm.account_number
JOIN phone_calls pc ON p.phone_number = pc.caller
JOIN passengers ps ON p.passport_number = ps.passport_number
JOIN flights f ON ps.flight_id = f.id
WHERE bsl.year = 2024 AND bsl.month = 7 AND bsl.day = 28
AND bsl.hour = 10 AND bsl.minute BETWEEN 15 AND 25
AND atm.year = 2024 AND atm.month = 7 AND atm.day = 28
AND atm.atm_location = 'Leggett Street' AND atm.transaction_type = 'withdraw'
AND pc.year = 2024 AND pc.month = 7 AND pc.day = 28 AND pc.duration < 60
AND f.year = 2024 AND f.month = 7 AND f.day = 29
AND f.origin_airport_id = (SELECT id FROM airports WHERE city = 'Fiftyville')
ORDER BY f.hour, f.minute
LIMIT 1;

SELECT p.name FROM people p
JOIN phone_calls pc ON p.phone_number = pc.receiver
WHERE pc.caller = (SELECT phone_number FROM people WHERE name = 'Bruce')
AND pc.year = 2024 AND pc.month = 7 AND pc.day = 28
AND pc.duration < 60;
