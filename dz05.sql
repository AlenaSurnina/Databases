USE shop;

-- ����� � ������� users ���� created_at � updated_at ��������� ��������������.
-- ��������� �� �������� ����� � ��������.
UPDATE users SET created_at = NOW();
UPDATE users SET updated_at = NOW();
SELECT * FROM users;

-- ������� users ���� �������� ��������������.
-- ������ created_at � updated_at ���� ������ ����� VARCHAR � � ��� ������ ����� ���������� �������� � ������� "20.10.2017 8:10". 
-- ���������� ������������� ���� � ���� DATETIME, �������� �������� ����� ��������.

UPDATE 
 users 
SET created_at = STR_TO_DATE(created_at, '%d.%m.%Y %k:%i'),
    updated_at = STR_TO_DATE(updated_at, '%d.%m.%Y %k:%i');
   
ALTER TABLE 
 users 
CHANGE 
 created_at created_at DATETIME DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE 
 users 
CHANGE 
 updated_at updated_at DATETIME DEFAULT CURRENT_TIMESTAMP;
 
-- � ������� ��������� ������� storehouses_products � ���� value �����
-- ����������� ����� ������ �����: 0, ���� ����� ���������� � ���� ����,
-- ���� �� ������ ������� ������. ���������� ������������� ������ ����� �������,
-- ����� ��� ���������� � ������� ���������� �������� value. ������,
-- ������� ������ ������ ���������� � �����, ����� ���� �������.

INSERT INTO
  storehouses_products (storehouses_id, product_id, value)
VALUES
  (1, 11, 0),
  (1, 775, 2500),
  (1, 257, 0),
  (1, 56, 30),
  (1, 452, 500),
  (1, 123, 1);

SELECT * FROM storehouses_products;
SELECT
  *
FROM
  storehouses_products
ORDER BY
  value = 0,
  value;
 
-- �� ������� users ���������� ������� �������������, ���������� � ������� � ���.
-- ������ ������ � ���� ������ ���������� �������� ('may', 'august')
 
 SELECT name  
  FROM users
  WHERE DATE_FORMAT(birthday_at, '%M') IN ('may', 'august');
 
 -- �� ������� catalogs ����������� ������ ��� ������ �������. 
 -- SELECT * FROM catalogs WHERE id IN (5, 1, 2);
 -- ������������ ������ � �������, �������� � ������ IN.
TRUNCATE catalogs;
 INSERT INTO catalogs VALUES
  (NULL, '����������'),
  (NULL, '����������� �����'),
  (NULL, '����������'),
  (NULL, '������� �����'),
  (NULL, '����������� ������');

SELECT
  *
FROM
  catalogs
WHERE
  id IN (5, 1, 2)
ORDER BY
  FIELD(id, 5, 1, 2);
 
 -- ����������� ������� ������� ������������� � ������� users
 
 SELECT
  AVG(TIMESTAMPDIFF(YEAR, birthday_at, NOW())) AS age
FROM
  users;
 
-- ����������� ���������� ���� ��������, ������� ���������� �� ������ �� ���� ������. 
-- ������� ������, ��� ���������� ��� ������ �������� ����, � �� ���� ��������.
SELECT
  DATE_FORMAT(DATE(CONCAT_WS('-', YEAR(NOW()), MONTH(birthday_at), DAY(birthday_at))), '%W') AS day,
  COUNT(*) AS total
FROM
  users
GROUP BY
  day
ORDER BY
  total DESC;
 
 
 
 
 
 
 
 
