INSERT INTO orders (customer_id, product_id, amount)
SELECT customers.id              AS customer_id,
       products.id               AS product_id,
       (random() * 10)::smallint AS amount
  FROM customers
      JOIN products
          ON random() <= 0.001
 LIMIT 1000000;
