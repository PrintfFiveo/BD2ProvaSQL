CREATE TABLE IF NOT EXISTS films (
id UUID PRIMARY KEY NOT NULL DEFAULT gen_random_uuid(),
title VARCHAR(45) NOT NULL,
duration_min VARCHAR(3) NOT NULL,
release_date DATE,
main_actors VARCHAR(45) NOT NULL,
director VARCHAR(45) NOT NULL,
poster BYTEA,
genre GENRE NOT NULL,
synopsis TEXT
);

CREATE TYPE genre AS ENUM(
'horror',
'thriller',
'comedy',
'romance',
'adventure',
'action',
'sci-fi',
'childish',
'slasher'
);

CREATE TABLE IF NOT EXISTS artists (
id UUID PRIMARY KEY NOT NULL DEFAULT gen_random_uuid(),
artist_name VARCHAR(45),
role ROLES NOT NULL,
date_of_birth DATE NOT NULL,
date_of_death DATE,
type VARCHAR(45),
biography TEXT,
most_known_movie UUID REFERENCES films(id)
);

CREATE TYPE roles AS ENUM (
'actor',
'director',
'both'
);

CREATE TABLE IF NOT EXISTS users (
id UUID PRIMARY KEY NOT NULL DEFAULT gen_random_uuid(),
email VARCHAR(100)NOT NULL,
password VARCHAR(45) NOT NULL,
full_name VARCHAR(100) NOT NULL,
age INT NOT NULL,
prefered_movie_genre GENRE,
profile_creation_date DATE NOT NULL,
last_access TIMESTAMP NOT NULL,
phone CHAR(13) NOT NULL,
plan PLANOS NOT NULL
);

CREATE TYPE planos AS ENUM(
'free',
'premium',
'family'
);

CREATE TABLE IF NOT EXISTS planos_info (
plan_id UUID PRIMARY KEY NOT NULL DEFAULT gen_random_uuid(),
plan_name PLANOS NOT NULL,
plan_price MONEY,
recurrence_in_days SMALLINT NOT NULL,
plan_description TEXT NOT NULL,
maximum_devices_at_once CHAR(1)
);




