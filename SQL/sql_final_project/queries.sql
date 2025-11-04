-- In this SQL file, write (and comment!) the typical SQL queries users will run on your database

-- List all employees and their latest salary payment
SELECT "employees"."name", "employees"."job_title", "salaries"."amount", "salaries"."payment_date"
FROM "employees"
JOIN "salaries" ON "employees"."id" = "salaries"."employee_id"
ORDER BY "salaries"."payment_date" DESC;

-- List employees who received the highest salary payment
SELECT "name", "job_title"
FROM "employees"
WHERE "id" IN (
    SELECT "employee_id"
    FROM "salaries"
    WHERE "amount" = (
        SELECT MAX("amount")
        FROM "salaries"
    )
);

-- Show all products purchased from the company with the most purchases
SELECT "product_name", "quantity", "total_price"
FROM "purchases"
WHERE "company_id" = (
    SELECT "company_id"
    FROM "purchases"
    GROUP BY "company_id"
    ORDER BY COUNT(*) DESC
);

-- Find companies with at least one unpaid purchase
SELECT "name"
FROM "companies"
WHERE "id" IN (
    SELECT "company_id"
    FROM "purchases"
    WHERE "payment_status" = 'Pending'
);

-- List sales with quantity above the average quantity sold

SELECT "product_name", "quantity", "total_price"
FROM "sales"
WHERE "quantity" > (
    SELECT AVG("quantity") FROM "sales"
);

-- Insert some employees
INSERT INTO employees (name, job_title, date_hire)
VALUES
    ('Ali Khan', 'Sales Manager', '2022-03-01'),
    ('Sara Ahmed', 'Accountant', '2021-07-15'),
    ('Bilal Raza', 'Warehouse Worker', '2023-01-10'),
    ('Nida Noor', 'Computer Operator', '2020-11-20'),
    ('Zeeshan Malik', 'Delivery Driver', '2022-08-05'
);

-- Insert salary payments
INSERT INTO salaries (employee_id, amount, payment_date)
VALUES
    (1, 60000, '2025-06-01'),
    (2, 50000, '2025-06-01'),
    (3, 30000, '2025-06-01'),
    (4, 45000, '2025-06-01'),
    (5, 35000, '2025-06-01'
);

-- Insert companies
INSERT INTO companies (name, address)
VALUES
    ('MediLife Pharma', 'Lahore, Punjab'),
    ('HealthPlus Ltd.', 'Karachi, Sindh'),
    ('CureMed Corporation', 'Islamabad, Capital'),
    ('WellCare Pharmaceuticals', 'Multan, Punjab'),
    ('BioGenix Ltd.', 'Peshawar, KPK'
);

-- Insert purchases from companies
INSERT INTO purchases (company_id, product_name, quantity, unit_price, total_price, purchase_date, payment_status)
VALUES
    (1, 'Paracetamol 500mg', 1000, 5, 5000, '2025-06-01', 'Paid'),
    (2, 'Cough Syrup 100ml', 500, 15, 7500, '2025-06-02', 'Pending'),
    (3, 'Vitamin C Tablets', 800, 8, 6400, '2025-06-03', 'Paid'),
    (4, 'Antibiotic Ointment', 200, 20, 4000, '2025-06-04', 'Pending'),
    (5, 'Pain Relief Spray', 300, 10, 3000, '2025-06-05', 'Paid'
);

-- Insert retailers
INSERT INTO retailers (name, address)
VALUES
    ('City Pharmacy', 'Faisalabad'),
    ('Health Point Medical Store', 'Lahore'),
    ('MediCare Plus', 'Rawalpindi'),
    ('Cure Corner', 'Quetta'),
    ('Relief Pharmacy', 'Hyderabad'
);

-- Insert sales to retailers
INSERT INTO sales (retailer_id, product_name, quantity, unit_price, total_price, sale_date, payment_status)
VALUES
    (1, 'Paracetamol 500mg', 200, 10, 2000, '2025-06-10', 'Paid'),
    (2, 'Cough Syrup 100ml', 100, 25, 2500, '2025-06-11', 'Pending'),
    (3, 'Vitamin C Tablets', 150, 12, 1800, '2025-06-12', 'Paid'),
    (4, 'Antibiotic Ointment', 80, 30, 2400, '2025-06-13', 'Paid'),
    (5, 'Pain Relief Spray', 60, 18, 1080, '2025-06-14', 'Pending'
);
