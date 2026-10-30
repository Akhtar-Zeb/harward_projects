CREATE TABLE passengers (
    "id" INTEGER,
    "fisrt_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "age" INTEGER NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE check_ins (
    "id" INTEGER,
    "check_ins_time" DATETIME,
    "passenger_id" INTEGER,
    "flight_id" INTEGER,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("passenger_id") REFERENCES "passengers"("id"),
    FOREIGN KEY ("flight_id") REFERENCES "flights"("id")
);

CREATE TABLE airlines (
    "id" INTEGER,
    "name" TEXT,
    "concoure" TEXT CHECK ("concoure" IN ("A", "B", "C", "D", "E", "F", "T")),
    PRIMARY KEY ("id")
);

CREATE TABLE flights (
    "id" INTEGER,
    "flights_number" TEXT,
    "airline_id" INTEGER,
    "departure_airport" TEXT,
    "arrival_airport" TEXT,
    "departure_time" DATETIME,
    "arrival_time" DATETIME,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("airline_id") REFERENCES "airlines"("id")
);
