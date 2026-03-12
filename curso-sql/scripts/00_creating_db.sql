CREATE TABLE teams (
    team_id INT PRIMARY KEY,
    full_name TEXT,
    abbreviation TEXT,
    nickname TEXT,
    city TEXT,
    state TEXT,
    year_founded INT
);

CREATE TABLE players (
    player_id INT PRIMARY KEY,
    full_name TEXT,
    is_active BOOLEAN
);

DROP TABLE IF EXISTS players;

CREATE TABLE players (
    player_id INT PRIMARY KEY,
    full_name TEXT,
    first_name TEXT,
    last_name TEXT,
    is_active INT  -- Using INT because the CSV shows '0'
);

CREATE TABLE common_player_info (
    person_id INT PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    display_first_last TEXT,
    display_last_comma_first TEXT,
    display_fi_last TEXT,
    player_slug TEXT,
    birthdate TIMESTAMP,
    school TEXT,
    country TEXT,
    last_affiliation TEXT,
    height TEXT,
    weight TEXT,
    season_exp INT,
    jersey TEXT,
    position TEXT,
    roster_status TEXT,
    games_played_current_season_flag TEXT,
    team_id INT,
    team_name TEXT,
    team_abbreviation TEXT,
    team_code TEXT,
    team_city TEXT,
    playfrom INT,
    playto INT,
    dleague_flag TEXT,
    nba_flag TEXT,
    games_played_flag TEXT,
    draft_year TEXT,
    draft_round TEXT,
    draft_number TEXT,
    greatest_75_flag TEXT -- New column added in recent NBA datasets
);

DROP TABLE IF EXISTS common_player_info;

-- Ensure the clean table is ready
DROP TABLE IF EXISTS common_player_info;

CREATE TABLE common_player_info (
    player_id INT PRIMARY KEY,
    full_name TEXT,
    birthdate DATE,  -- Using DATE type here
    team_id INT,
    draft_year INT
);

-- Move data from staging and CONVERT types on the fly
INSERT INTO common_player_info (player_id, full_name, birthdate, team_id, draft_year)
SELECT 
    c1::INT, 
    c4, 
    c8::DATE,        -- Converts "1968-06-24" string into a real Date
    c19::INT, 
    NULLIF(c29, 'Undrafted')::INT -- Handles 'Undrafted' text so it doesn't break the INT
FROM common_player_info_staging;

CREATE TABLE common_player_info_staging (
    c1 TEXT, c2 TEXT, c3 TEXT, c4 TEXT, c5 TEXT, 
    c6 TEXT, c7 TEXT, c8 TEXT, c9 TEXT, c10 TEXT,
    c11 TEXT, c12 TEXT, c13 TEXT, c14 TEXT, c15 TEXT,
    c16 TEXT, c17 TEXT, c18 TEXT, c19 TEXT, c20 TEXT,
    c21 TEXT, c22 TEXT, c23 TEXT, c24 TEXT, c25 TEXT,
    c26 TEXT, c27 TEXT, c28 TEXT, c29 TEXT, c30 TEXT,
    c31 TEXT, c32 TEXT, c33 TEXT
);

DROP TABLE IF EXISTS team_staging;

CREATE TABLE team_staging (
    c1 TEXT, c2 TEXT, c3 TEXT, c4 TEXT, c5 TEXT, 
    c6 TEXT, c7 TEXT
);

-- Step A: Clear out the empty teams table
TRUNCATE teams;

-- Step B: Insert the data from staging with the correct column names and types
INSERT INTO teams (team_id, abbreviation, nickname, city, state, year_founded)
SELECT 
    c1::INT,        -- This is the 1610612737
    c3,             -- This is 'ATL'
    c4,             -- This is 'Hawks'
    c5,             -- This is 'Atlanta'
    c5,             -- Your CSV repeats 'Atlanta' for state in that row, so we'll use c5 again
    c7::FLOAT::INT  -- This is '1949.0', converted to a clean number
FROM team_staging;

-- Step 1: Make sure the table is empty before we fill it
TRUNCATE common_player_info;

-- Step 2: Move and transform the data
INSERT INTO common_player_info (player_id, full_name, birthdate, team_id, draft_year)
SELECT 
    c1::INT,              -- Converts ID to integer
    c4,                   -- Full Name
    c8::DATE,             -- Converts "1968-06-24" string to a real SQL DATE
    c19::INT,             -- Team ID
    c29                   -- Draft Year (kept as text for 'Undrafted' cases)
FROM common_player_info_staging;