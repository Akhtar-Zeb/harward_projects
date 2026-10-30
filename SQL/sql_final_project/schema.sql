-- In this SQL file, write (and comment!) the schema of your database, including the CREATE TABLE, CREATE INDEX, CREATE VIEW, etc. statements that compose it
CREATE TABLE "employees" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "job_title" TEXT NOT NULL,
    "date_hire" NUMERIC NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "salaries" (
    "id" INTEGER,
    "employee_id" INTEGER NOT NULL,
    "amount" INTEGER CHECK("amount" >= 0),
    "payment_date" DATE NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY ("employee_id") REFERENCES "employees"("id")
);

CREATE TABLE "companies" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "purchases" (
    "id" INTEGER,
    "company_id" INTEGER NOT NULL,
    "product_name" TEXT NOT NULL,
    "quantity" INTEGER CHECK("quantity" >= 0),
    "unit_price" INTEGER CHECK("unit_price" >= 0),
    "total_price" INTEGER CHECK("total_price" >= 0),
    "purchase_date" DATE NOT NULL,
    "payment_status" TEXT NOT NULL CHECK ("payment_status" IN ('Paid', 'Pending')),
    PRIMARY KEY("id"),
    FOREIGN KEY ("company_id") REFERENCES "companies"("id")
);

CREATE TABLE "retailers" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "address" TEXT,
    PRIMARY KEY("id")
);

CREATE TABLE "sales" (
    "id" INTEGER,
    "retailer_id" INTEGER,
    "product_name" TEXT,
    "quantity" INTEGER CHECK("quantity" >= 0),
    "unit_price" INTEGER CHECK("unit_price" >= 0),
    "total_price" INTEGER CHECK("total_price" >= 0),
    "sale_date" DATE,
    "payment_status" TEXT NOT NULL CHECK ("payment_status" IN ('Paid', 'Pending')),
    PRIMARY KEY("id"),
    FOREIGN KEY ("retailer_id") REFERENCES "retailers"("id")
);
