CREATE DATABASE universe;
\c universe
CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    description TEXT,
    age_in_billions_of_years NUMERIC NOT NULL,
    is_spiral BOOLEAN NOT NULL,
    is_barred BOOLEAN NOT NULL
);

CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    galaxy_id INT NOT NULL REFERENCES galaxy(galaxy_id),
    mass_in_solar_masses NUMERIC NOT NULL,
    is_main_sequence BOOLEAN NOT NULL,
    luminosity INT NOT NULL
);

CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    star_id INT NOT NULL REFERENCES star(star_id),
    has_life BOOLEAN NOT NULL,
    radius_in_km INT NOT NULL,
    distance_from_star NUMERIC NOT NULL
);

CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    planet_id INT NOT NULL REFERENCES planet(planet_id),
    is_geologically_active BOOLEAN NOT NULL,
    radius_in_km INT NOT NULL,
    orbital_period NUMERIC NOT NULL
);

CREATE TABLE comet (
    comet_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    composition TEXT NOT NULL,
    perihelion_distance NUMERIC NOT NULL,
    is_periodic BOOLEAN NOT NULL
);

INSERT INTO galaxy (name, description, age_in_billions_of_years, is_spiral, is_barred)
VALUES
('Milky Way', 'Our home galaxy', 13.51, TRUE, FALSE),
('Andromeda', 'Nearest major galaxy', 10.0, TRUE, FALSE),
('Triangulum', 'Small spiral galaxy', 12.0, TRUE, FALSE),
('Large Magellanic Cloud', 'Satellite galaxy', 13.0, FALSE, FALSE),
('Small Magellanic Cloud', 'Satellite galaxy', 13.0, FALSE, FALSE),
('Whirlpool', 'Face-on spiral galaxy', 10.0, TRUE, TRUE);

INSERT INTO star (name, galaxy_id, mass_in_solar_masses, is_main_sequence, luminosity)
VALUES
('Sun', 1, 1.0, TRUE, 1),
('Sirius', 2, 2.1, TRUE, 25),
('Alpha Centauri A', 1, 1.1, TRUE, 1.5),
('Proxima Centauri', 1, 0.12, TRUE, 0.0017),
('Vega', 1, 2.1, TRUE, 40),
('Arcturus', 1, 1.1, FALSE, 170);

INSERT INTO planet (name, star_id, has_life, radius_in_km, distance_from_star)
VALUES
('Earth', 1, TRUE, 6371, 1.0),
('Mars', 1, FALSE, 3389, 1.5),
('Venus', 1, FALSE, 6051, 0.7),
('Proxima b', 4, FALSE, 6371, 0.05),
('Sirius b', 2, FALSE, 4500, 2.5),
('Alpha Centauri Bb', 3, FALSE, 4800, 1.2),
('Kepler-22b', 5, FALSE, 28000, 0.85),
('Kepler-452b', 5, FALSE, 25500, 1.04),
('Kepler-62f', 5, FALSE, 25500, 1.6),
('Kepler-186f', 5, FALSE, 25500, 1.11),
('Kepler-69c', 5, FALSE, 25500, 1.37),
('Kepler-442b', 5, FALSE, 25500, 1.34);

INSERT INTO moon (name, planet_id, is_geologically_active, radius_in_km, orbital_period)
VALUES
('Moon', 1, FALSE, 1737, 27.3),
('Phobos', 2, FALSE, 11, 0.3),
('Deimos', 2, FALSE, 6, 1.3),
('Io', 3, TRUE, 1821, 1.8),
('Europa', 3, TRUE, 1560, 3.5),
('Ganymede', 3, TRUE, 2634, 7.1),
('Callisto', 3, TRUE, 2410, 16.7),
('Triton', 5, TRUE, 1353, 5.9),
('Titan', 4, TRUE, 2575, 15.9),
('Rhea', 4, FALSE, 764, 4.5),
('Iapetus', 4, FALSE, 734, 79.3),
('Dione', 4, FALSE, 561, 2.7),
('Tethys', 4, FALSE, 536, 1.9),
('Enceladus', 4, TRUE, 252, 1.4),
('Mimas', 4, FALSE, 198, 0.9),
('Miranda', 4, TRUE, 235, 1.4),
('Ariel', 4, TRUE, 578, 2.5),
('Umbriel', 4, TRUE, 584, 4.1),
('Titania', 4, TRUE, 789, 8.7),
('Oberon', 4, TRUE, 761, 13.5);

INSERT INTO comet (name, composition, perihelion_distance, is_periodic)
VALUES
('Halley', 'Ice and dust', 0.6, TRUE),
('Hale-Bopp', 'Ice and dust', 0.9, TRUE),
('Encke', 'Ice and dust', 0.34, TRUE);
