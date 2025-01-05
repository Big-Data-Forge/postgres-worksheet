CREATE TABLE products
(
    id         uuid                        NOT NULL DEFAULT gen_random_uuid(),
    title      varchar(128)                NOT NULL,
    price      decimal(10, 2)              NOT NULL,

    created_at timestamp without time zone NOT NULL DEFAULT (current_timestamp AT TIME ZONE 'UTC'),
    updated_at timestamp without time zone NOT NULL DEFAULT (current_timestamp AT TIME ZONE 'UTC'),
    created_by varchar(256)                NOT NULL DEFAULT current_user,
    updated_by varchar(256)                NOT NULL DEFAULT current_user,

    PRIMARY KEY (id),
    UNIQUE (title)
);


INSERT INTO products (title, price)
SELECT md5(random()::text) AS title,
       random() * 1000     AS price
  FROM generate_series(1, 100000);
