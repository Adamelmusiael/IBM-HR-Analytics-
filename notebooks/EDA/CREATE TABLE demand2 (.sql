CREATE TABLE demand2 (
  day INT,
  qty FLOAT
);


INSERT INTO demand2
  (day, qty)
VALUES
  (1, 10),
  (2, 6),
  (3, 21),
  (4, 9),
  (6, 12),
  (7, 18),
  (8, 3),
  (9, 6),
  (10, 23);

SELECT * FROM demand2

DROP TABLE IF EXISTS demand;

CREATE TABLE demand (
  product VARCHAR(10),
  day INT,
  qty FLOAT
);


INSERT INTO demand
  (product, day, qty)
VALUES
  ("A", 1, 10),
  ("A", 2, 6),
  ("A", 3, 21),
  ("A", 4, 9),
  ("A", 5, 19),
  ("B", 1, 12),
  ("B", 2, 18),
  ("B", 3, 3),
  ("B", 4, 6),
  ("B", 5, 23);


