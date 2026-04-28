WITH TypeCounts AS (
    SELECT l.type, COUNT(b.cname) AS bcount
    FROM loan l, borrower b
    WHERE l.no = b.lno
    GROUP BY l.type
    UNION
    SELECT type, 0 AS bcount
    FROM loan
    WHERE no NOT IN (SELECT lno from borrower)
)
SELECT type AS loanType
FROM TypeCounts
WHERE bcount = (SELECT MIN(bcount) FROM TypeCounts);