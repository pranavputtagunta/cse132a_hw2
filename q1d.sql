SELECT b.cname AS name
FROM borrower b, loan l
WHERE b.lno = l.no
GROUP BY b.cname
HAVING (COUNT(DISTINCT l.type) = (SELECT COUNT(DISTINCT type) FROM loan));