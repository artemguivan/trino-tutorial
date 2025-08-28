-- init-db.sql
CREATE TABLE IF NOT EXISTS employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    department VARCHAR(50),
    salary INTEGER,
    hire_date DATE
);

INSERT INTO employees (name, department, salary, hire_date) VALUES
('Alice Johnson', 'Engineering', 95000, '2022-01-15'),
('Bob Smith', 'Marketing', 75000, '2022-03-20'),
('Carol Davis', 'Engineering', 105000, '2021-11-10'),
('David Brown', 'Sales', 65000, '2022-02-28'),
('Eve Wilson', 'Engineering', 88000, '2022-04-05'),
('Frank Miller', 'Marketing', 82000, '2021-12-15'),
('Grace Lee', 'Sales', 72000, '2022-01-30'),
('Henry Chen', 'Engineering', 98000, '2021-10-20');

CREATE TABLE IF NOT EXISTS sales (
    id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    amount DECIMAL(10,2),
    sale_date DATE,
    employee_id INTEGER REFERENCES employees(id)
);

INSERT INTO sales (product_name, category, amount, sale_date, employee_id) VALUES
('Laptop Pro', 'Electronics', 1299.99, '2023-01-15', 4),
('Wireless Mouse', 'Electronics', 29.99, '2023-01-16', 4),
('Office Chair', 'Furniture', 399.99, '2023-01-17', 7),
('Standing Desk', 'Furniture', 599.99, '2023-01-18', 7),
('Monitor 4K', 'Electronics', 449.99, '2023-01-19', 4),
('Keyboard Mechanical', 'Electronics', 129.99, '2023-01-20', 4),
('Bookshelf', 'Furniture', 199.99, '2023-01-21', 7);
