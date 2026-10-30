
-- *** The Lost Letter ***
-- This is The address and the type where the package was found
SELECT "address", "type" FROM addresses
WHERE "id" = (
    -- This is the ID of address where the package was trace
    SELECT "address_id" FROM scans
    WHERE "package_id" = (
        SELECT "id" FROM  packages
        WHERE "from_address_id" = (
            -- Find ID of address From which the letter was send
            SELECT "id" FROM addresses
            WHERE "address" = '900 Somerville Avenue'
            ) AND "to_address_id" = (
            -- Find ID of address From Which the letter will be recived
            SELECT "id" FROM addresses
            WHERE "address" = '2 Finnigan Street'
        ) AND "action" = "Drop"
    )
);
-- *** The Devious Delivery ***
SELECT "type", "contents"
FROM "packages"
JOIN "scans" ON "packages"."id" = "scans"."package_id"
JOIN "addresses" ON "scans"."address_id" = "addresses"."id"
WHERE "packages"."from_address_id" IS NULL AND "scans"."action" = "Drop";

-- *** The Forgotten Gift ***
SELECT "contents", "name" FROM "drivers"
JOIN "scans" ON "drivers"."id" = "scans"."driver_id"
JOIN "packages" ON "packages"."id" = "scans"."package_id"
WHERE "drivers"."id" = (
    SELECT "driver_id" FROM scans
    WHERE "package_id" = (
        SELECT "id" FROM packages
        WHERE "from_address_id" = (
            SELECT "id" FROM addresses
            WHERE "address" = "109 Tileston Street"
            ) AND "to_address_id" = (
            SELECT "id" FROM "addresses"
            WHERE "address" = "728 Maple Place"
        )
    )
ORDER BY "timestamp" DESC
LIMIT 1
)
AND "contents" = "Flowers";

