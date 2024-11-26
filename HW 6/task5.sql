-- 1

SELECT s.first_name, s.surname, b.bill_date, COUNT(b.bill_no) AS num_bills
FROM restBill b
INNER JOIN  restStaff s
ON b.waiter_no = s.staff_no
GROUP BY s.first_name, s.surname, b.bill_date
HAVING COUNT(b.bill_no) >= 2;

-- 2

SELECT rt.room_name, COUNT(rt.table_no) AS num_big_tables
FROM restRest_table rt
WHERE rt.no_of_seats > 6
GROUP BY rt.room_name;

-- 3

SELECT rt.room_name, SUM(b.bill_total) AS total_bill_amount
FROM restBill b
JOIN restRest_table rt 
ON b.table_no = rt.table_no
GROUP BY rt.room_name;

-- 4

SELECT hs.first_name, hs.surname, SUM(b.bill_total) AS total_bill_amount
FROM restBill b
JOIN restStaff ws 
ON b.waiter_no = ws.staff_no
JOIN restStaff hs 
ON ws.headwaiter = hs.staff_no
GROUP BY hs.first_name, hs.surname
ORDER BY total_bill_amount DESC;

-- 5

SELECT b.cust_name, AVG(b.bill_total)
FROM restBill b
GROUP BY b.cust_name
HAVING AVG(b.bill_total) > 400;

-- 6

SELECT s.first_name, s.surname, b.bill_date, COUNT(b.bill_no) AS num_bills
FROM restBill b
INNER JOIN  restStaff s
ON b.waiter_no = s.staff_no
GROUP BY s.first_name, s.surname, b.bill_date
HAVING COUNT(b.bill_no) >= 3;