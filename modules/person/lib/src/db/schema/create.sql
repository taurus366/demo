CREATE TABLE IF NOT EXISTS "person" (
    "person_id"     serial      PRIMARY KEY,
    "name"          text        NOT NULL,
    "age"           integer     ,
    "phone"         text        NOT NULL,
    "mail"          text        NOT NULL,
    "birth"         timestamp,
    "comment"       text,
    "salary"        decimal(12,2)  NOT NULL
);