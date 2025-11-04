CREATE TABLE ingredients (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "price_per_unit" NUMERIC NOT NULL,
    "unit" TEXT NOT NULL,
    PRIMARY KEY ("id")
);

-- Donuts table
CREATE TABLE donuts (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    "is_gluten_free" BOOLEAN NOT NULL,
    "price_per_donut" NUMERIC NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE donut_ingredients (
    "donut_id" INTEGER NOT NULL,
    "ingredient_id" INTEGER NOT NULL,
    FOREIGN KEY ("donut_id") REFERENCES "donuts"("id"),
    FOREIGN KEY ("ingredient_id") REFERENCES "ingredients"("id")
);

CREATE TABLE orders (
    "id" INTEGER,
    "customer_id" INTEGER NOT NULL,
    "order_date" DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ("id")
    FOREIGN KEY ("customer_id") REFERENCES "customers"("id")
);

CREATE TABLE order_items (
    "order_id" INTEGER NOT NULL,
    "donut_id" INTEGER NOT NULL,
    "quantity" INTEGER NOT NULL,
    FOREIGN KEY ("order_id") REFERENCES "orders"("id"),
    FOREIGN KEY ("donut_id") REFERENCES "donuts"("id")
);

CREATE TABLE customers (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    PRIMARY KEY ("id")
);
