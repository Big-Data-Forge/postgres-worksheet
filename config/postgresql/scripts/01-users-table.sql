CREATE TABLE users
(
    id         uuid         NOT NULL DEFAULT gen_random_uuid(),
    name       varchar(128) NOT NULL,

    created_at timestamp without time zone NOT NULL DEFAULT (current_timestamp AT TIME ZONE 'UTC'),
    updated_at timestamp without time zone NOT NULL DEFAULT (current_timestamp AT TIME ZONE 'UTC'),
    created_by varchar(256) NOT NULL DEFAULT current_user,
    updated_by varchar(256) NOT NULL DEFAULT current_user,

    PRIMARY KEY (id),
    UNIQUE (name)
);


INSERT INTO users (name)
SELECT md5(random()::text)
  FROM generate_series(1, 10000);
