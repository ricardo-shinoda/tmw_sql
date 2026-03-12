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