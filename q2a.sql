UPDATE loan
SET type = "temp"
WHERE type = "jumbo mortgage";

UPDATE loan
SET type = "jumbo mortgage"
WHERE type = "student";

UPDATE loan
SET type = "student"
WHERE type = "temp";