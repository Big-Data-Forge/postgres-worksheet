CREATE TABLE orders
(
    id         uuid                        NOT NULL DEFAULT gen_random_uuid(),
    user_id    uuid                        NOT NULL,
    product_id uuid                        NOT NULL,
    amount     smallint                    NOT NULL,

    created_at timestamp without time zone NOT NULL DEFAULT (current_timestamp AT TIME ZONE 'UTC'),
    updated_at timestamp without time zone NOT NULL DEFAULT (current_timestamp AT TIME ZONE 'UTC'),
    created_by varchar(256)                NOT NULL DEFAULT current_user,
    updated_by varchar(256)                NOT NULL DEFAULT current_user,

    PRIMARY KEY (id),
    FOREIGN KEY (user_id)
        REFERENCES users (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (product_id)
        REFERENCES products (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);


INSERT INTO orders (user_id, product_id, amount)
SELECT users.id                  AS user_id,
       products.id               AS product_id,
       (random() * 10)::smallint AS amount
  FROM users
      JOIN products
          ON random() <= 0.001
 LIMIT 1000000;
