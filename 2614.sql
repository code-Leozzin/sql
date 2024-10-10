SELECT c.name, r.rentals_date
FROM customers c
JOIN rentals r ON c.id = r.id_customers
WHERE r.rentals_date >= '2016-09-01' AND r.rentals_date < '2016-10-01';
