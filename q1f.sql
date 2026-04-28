SELECT c1.name AS name1, c2.name AS name2
FROM customer c1, customer c2
WHERE c1.name < c2.name
AND NOT EXISTS (
    SELECT lno FROM borrower WHERE cname = c1.name
    EXCEPT
    SELECT lno FROM borrower WHERE cname = c2.name
)
AND NOT EXISTS (
    SELECT lno FROM borrower WHERE cname = c2.name
    EXCEPT
    SELECT lno FROM borrower WHERE cname = c1.name
);