WITH LoanCounts AS (
    SELECT l.no, l.type, COUNT(b.cname) AS cnt
    FROM loan l, borrower b
    WHERE l.no = b.lno
    GROUP BY l.no, l.type
    UNION
    SELECT no, type, 0 AS cnt
    FROM loan
    WHERE no NOT IN (SELECT lno FROM borrower)
),
TypeAverages AS (
    SELECT type, AVG(cnt) AS avg_cnt
    FROM LoanCounts
    GROUP BY type
)
SELECT lc.no
FROM LoanCounts lc, TypeAverages ta
WHERE lc.type = ta.type AND lc.cnt > ta.avg_cnt;