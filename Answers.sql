-- =============================================================================
-- Assignment: Database Indexing and Optimization
-- File: answers.sql
-- =============================================================================


-- =============================================================================
-- PART 1: INDEXING AND OPTIMIZATION
-- =============================================================================

-- Question 1: Drop an index named IdxPhone from customers table.
DROP INDEX IdxPhone ON customers;

-- Add index on customerNumber in orders table to speed up lookup performance
CREATE INDEX idx_orders_customernumber ON orders (customerNumber);

-- Add composite index on orderDate and status for filtered reporting queries
CREATE INDEX idx_orders_date_status ON orders (orderDate, status);


-- =============================================================================
-- PART 2: USER ACCOUNTS, ROLES, AND ACCESS CONTROL
-- =============================================================================

-- Question 2: Create a user named bob restricted to localhost with initial password.
CREATE USER 'bob'@'localhost' IDENTIFIED BY 'S$cu3r3!';

-- Question 3: Grant the INSERT privilege to user bob on salesDB database.
GRANT INSERT ON salesDB.* TO 'bob'@'localhost';

-- Question 4: Change the password for user bob to 'P$55!23'.
ALTER USER 'bob'@'localhost' IDENTIFIED BY 'P$55!23';

-- Create custom security roles for privilege management
CREATE ROLE analyst_role;
CREATE ROLE manager_role;

-- Assign read-only access to analyst role
GRANT SELECT ON salesDB.products TO analyst_role;
GRANT SELECT ON salesDB.orders TO analyst_role;

-- Assign full privileges to manager role
GRANT SELECT, INSERT, UPDATE, DELETE ON salesDB.* TO manager_role;


-- =============================================================================
-- PART 3: DATABASE SECURITY MEASURES
-- =============================================================================

-- Create a secure view to restrict access to sensitive customer data
CREATE OR REPLACE VIEW view_customer_summary AS
SELECT 
    c.customerNumber,
    c.customerName,
    c.city,
    c.country
FROM customers c;

-- Grant access on the secure view to analyst role
GRANT SELECT ON view_customer_summary TO analyst_role;


-- =============================================================================
-- PART 4: ADVANCED SQL SCENARIO QUERIES
-- =============================================================================

-- Calculate total revenue generated per customer
SELECT 
    c.customerNumber,
    c.customerName,
    COUNT(DISTINCT o.orderNumber) AS total_orders,
    ROUND(SUM(od.quantityOrdered * od.priceEach), 2) AS total_revenue
FROM customers c
JOIN orders o ON c.customerNumber = o.customerNumber
JOIN orderdetails od ON o.orderNumber = od.orderNumber
WHERE o.status = 'Shipped'
GROUP BY c.customerNumber, c.customerName
ORDER BY total_revenue DESC;
