
DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist


CREATE TABLE regions (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE categories (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    username VARCHAR(15) NOT NULL UNIQUE,
    encrypted_password VARCHAR(20) NOT NULL,
    preferred_region_id INTEGER NOT NULL
);

CREATE TABLE posts (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    text TEXT NOT NULL,
    location TEXT NOT NULL,
    user_id INTEGER REFERENCES users (id),
    region_id INTEGER REFERENCES regions (id),
    category_id INTEGER REFERENCES categories (id)
);

