SELECT DISTINCT cname AS name, COUNT(l.no) AS loanCount
FROM borrower
GROUP BY cname
UNION
SELECT name, 0 AS loanCount
FROM borrower
WHERE cname NOT IN (SELECT cname FROM borrower);