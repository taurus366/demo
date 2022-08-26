CREATE TABLE IF NOT EXISTS "job" (
    "job_id"           serial       PRIMARY KEY,
    "title"             text        NOT NULL,
    "person_id"         int         NOT NULL, -- reference Person (init.sql)
    "description"       text
);