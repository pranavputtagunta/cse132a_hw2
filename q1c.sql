WITH TypeCounts AS (
    SELECT l.type, COUNT(b.cname) AS bcnt
    FROM loan l, borrower b
    WHERE l.no = b.lno
    GROUP BY l.type
    UNION
    SELECT type, 0 AS bcnt
    FROM loan
    WHERE type NOT IN (
        SELECT l2.type 
        FROM loan l2, borrower b2 
        WHERE l2.no = b2.lno
    )
)
SELECT type AS loanType
FROM TypeCounts
WHERE bcnt = (SELECT MIN(bcnt) FROM TypeCounts);