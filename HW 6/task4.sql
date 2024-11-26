-- 1

SELECT b.cust_name
FROM restBill b
WHERE b.bill_total > 450.00 AND b.waiter_no IN (
  SELECT s.staff_no
  FROM restStaff s
  WHERE s.headwaiter IN (
    SELECT staff_no
    FROM restStaff
    WHERE first_name = 'Charles')
  );
  
-- 2

SELECT s.first_name, s.surname
FROM restStaff s
WHERE s.staff_no IN (
  SELECT headwaiter
  FROM restStaff
  WHERE staff_no IN (
    SELECT waiter_no
    FROM restBill
    WHERE cust_name = 'Nerida Smith' AND bill_date = 160111
  )
);

-- 3

SELECT b.cust_name
FROM restBill b
WHERE b.bill_total IN (
  SELECT MIN(bill_total)
  FROM restBill
);

-- 4

SELECT s.first_name, s.surname
FROM restStaff s
WHERE s.staff_no NOT IN (
  SELECT DISTINCT b.waiter_no
  FROM restBill b
);

-- 5

SELECT b.cust_name, hs.first_name AS headwaiter_first_name, hs.surname AS headwaiter_surname, rt.room_name
FROM restBill b
JOIN restRest_table rt ON b.table_no = rt.table_no
JOIN restStaff ws ON b.waiter_no = ws.staff_no
JOIN restStaff hs ON ws.headwaiter = hs.staff_no
WHERE b.bill_total IN (
  SELECT MAX(bill_total)
  FROM restBill
);