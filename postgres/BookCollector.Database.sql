-- Database: BookCollector

-- DROP DATABASE IF EXISTS "BookCollector";

CREATE DATABASE "BookCollector"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

COMMENT ON DATABASE "BookCollector"
    IS 'Tracks users book collection';