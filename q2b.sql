UPDATE customer
SET credit = -1
WHERE name IN (
    SELECT b.cname
    FROM borrower b, loan l
    WHERE b.lno = l.no AND l.type = 'jumbo mortgage'
);

DELETE FROM borrower
WHERE cname IN (
    SELECT name FROM customer WHERE credit = -1
);

DELETE FROM borrower
WHERE lno IN (
    SELECT no FROM loan WHERE type = 'jumbo mortgage'
);

DELETE FROM loan
WHERE type = 'jumbo mortgage';

DELETE FROM customer
WHERE credit = -1;