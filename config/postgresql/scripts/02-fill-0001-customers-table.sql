INSERT INTO customers (name)
SELECT md5(random()::text)
  FROM generate_series(1, 10000);
