-- 1

SELECT s.first_name
FROM restStaff s
INNER JOIN restBill b
ON s.staff_no = b.waiter_no
WHERE b.cust_name = 'Tanya Singh';

-- 2

SELECT rm.room_date
FROM restRoom_management rm
INNER JOIN restStaff s
ON rm.headwaiter = s.staff_no
WHERE s.first_name = 'Charles' AND  rm.room_name = 'Green' AND rm.room_date LIKE '1602%';


-- 3

SELECT s1.first_name, s1.surname
FROM restStaff s1
JOIN restStaff s2
ON s1.headwaiter = s2.headwaiter
WHERE s2.first_name = 'Zoe' AND s2.surname = 'Ball';

-- 4

SELECT b.cust_name, b.bill_total, s.first_name AS waiter_first_name, s.surname AS waiter_surname
FROM restBill b
JOIN restStaff s 
ON b.waiter_no = s.staff_no
ORDER BY b.bill_total DESC;

-- 5

SELECT DISTINCT s.first_name, s.surname
FROM restStaff s
JOIN restBill b 
ON s.staff_no = b.waiter_no
WHERE b.table_no IN (
    SELECT DISTINCT b1.table_no
    FROM restBill b1
    WHERE b1.bill_no IN (00014, 00017)
);

-- 6 

SELECT DISTINCT s.first_name, s.surname
FROM restStaff s
WHERE s.staff_no IN (
    SELECT b.waiter_no
    FROM restBill b
    WHERE b.table_no IN (
        SELECT t.table_no
        FROM restRest_table t
        WHERE t.room_name = 'Blue'
    )
    AND b.bill_date = 160312
)
OR s.staff_no = (
    SELECT rm.headwaiter
    FROM restRoom_management rm
    WHERE rm.room_name = 'Blue' AND rm.room_date = 160312
);