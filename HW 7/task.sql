-- 1

CREATE VIEW samsBills 
AS
  (SELECT  restStaff.first_name, restStaff.surname, restBill.bill_date, restBill.cust_name, restBill.bill_total
  FROM restBill
  INNER JOIN restStaff 
  ON restBill.waiter_no = restStaff.staff_no
  WHERE restStaff.first_name = 'Sam' AND restStaff.surname = 'Pitt');
  
  SELECT * FROM samsBills;

-- 2

SELECT * FROM samsBills
WHERE bill_total > 400;

-- 3

CREATE VIEW roomTotals  
AS
  (SELECT  restRest_table.room_name, SUM(restBill.bill_total)  AS total_sum
  FROM restRest_table
  INNER JOIN restBill 
  ON restBill.table_no = restRest_table.table_no
  GROUP BY  restRest_table.room_name);
  
  SELECT * FROM roomTotals;
  
-- 4

CREATE VIEW teamTotals   
AS
  (SELECT  CONCAT(rs2.first_name, ' ', rs2.surname) AS headwaiter_name , SUM(restBill.bill_total)  AS total_sum
  FROM restBill
  INNER JOIN  restStaff rs1
  ON restBill.waiter_no = rs1.staff_no
  INNER JOIN  restStaff rs2
  ON rs1.headwaiter = rs2.staff_no
  GROUP BY headwaiter_name);
  
  SELECT * FROM teamTotals;