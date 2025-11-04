CREATE TABLE meteorites_temp (
    "name" TEXT,
    "id" INTEGER,
    "nametype" TEXT,
    "class" TEXT,
    "mass" DECIMAL,
    "descovery" DECIMAL,
    "year" DECIMAL,
    "lat" DECIMAL,
    "long" TEXT
);

-----------------------------------------

.import --csv meteorites.csv meteorites_temp

-----------------------------------------

UPDATE "meteorites_temp"
SET "mass" = NULL
WHERE "mass" = '';

UPDATE "meteorites_temp"
SET "year" = NULL
WHERE "year" = '';

UPDATE "meteorites_temp"
SET "lat" = NULL
WHERE "lat" = '';

UPDATE "meteorites_temp"
SET "long" = NULL
WHERE "long" = '';

-----------------------------------

CREATE TABLE "meteorites" (
    id INTEGER,
    name TEXT,
    class TEXT,
    mass DECIMAL,
    discovery TEXT,
    year TEXT,
    lat DECIMAL,
    long DECIMAL,
    PRIMARY KEY("id")
);

--------------------------------------

INSERT INTO "meteorites" ("name", "class", "mass", "discovery", "year", "lat", "long")
SELECT "name", "class", ROUND("mass", 2), "discovery", "year", ROUND("lat", 2), ROUND("long", 2)
FROM "meteorites_temp"
WHERE "nametype" != 'Relict'
ORDER BY "year" ASC, "name" ASC;

---------------------------------------

DROP TABLE "meteorites_temp";
