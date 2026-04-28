WITH TypeCounts AS (
    SELECT l.type, COUNT(b.cname) AS bcnt
    FROM loan l, borrower b
    WHERE l.no = b.lno
    GROUP BY l.type
    UNION
    SELECT type, 0 AS bcnt
    FROM loan
    WHERE no NOT IN (SELECT lno FROM borrower)
)
SELECT type AS loanType
FROM TypeCounts
WHERE bcnt = (SELECT MIN(bcnt) FROM TypeCounts);