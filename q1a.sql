SELECT DISTINCT c.name AS name, l.no AS no
FROM customer c, borrower b, loan l
WHERE c.name = b.name
AND b.lno = l.no
AND c.credit < l.minCredit;