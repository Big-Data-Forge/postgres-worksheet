INSERT INTO products (title, price)
SELECT md5(random()::text) AS title,
       random() * 1000     AS price
  FROM generate_series(1, 100000);
