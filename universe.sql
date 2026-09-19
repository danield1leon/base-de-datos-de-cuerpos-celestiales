CREATE DATABASE universe;
\c universe;

CREATE TABLE galaxy_type (
    galaxy_type_id SERIAL PRIMARY KEY,
    name VARCHAR(40) NOT NULL UNIQUE,
    description TEXT
);

CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(40) NOT NULL UNIQUE,
    galaxy_type_id INT REFERENCES galaxy_type(galaxy_type_id),
    distance_from_earth_ly NUMERIC(10,2) NOT NULL,
    has_active_nucleus BOOLEAN NOT NULL,
    estimated_stars_billions INT
);

CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(40) NOT NULL UNIQUE,
    galaxy_id INT NOT NULL REFERENCES galaxy(galaxy_id),
    spectral_type VARCHAR(5) NOT NULL,
    surface_temperature_k INT NOT NULL,
    is_luminous BOOLEAN NOT NULL
);

CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(40) NOT NULL UNIQUE,
    star_id INT NOT NULL REFERENCES star(star_id),
    orbital_period_days NUMERIC(8,2) NOT NULL,
    has_life BOOLEAN NOT NULL,
    has_rings BOOLEAN NOT NULL,
    mass_earth_relative INT
);

CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(40) NOT NULL UNIQUE,
    planet_id INT NOT NULL REFERENCES planet(planet_id),
    radius_km INT NOT NULL,
    is_tidal_locked BOOLEAN NOT NULL,
    discovery_year INT
);

INSERT INTO galaxy_type (name, description) VALUES
('Espiral', 'Galaxia con brazos en forma de espiral.'),
('Elíptica', 'Galaxia con forma de elipsoide casi perfecta.'),
('Irregular', 'Galaxia sin forma definida.');

INSERT INTO galaxy (name, galaxy_type_id, distance_from_earth_ly, has_active_nucleus, estimated_stars_billions) VALUES
('Vía Láctea', 1, 0.00, false, 400),
('Andrómeda', 1, 2537000.00, true, 1000),
('Triángulo', 1, 2730000.00, false, 40),
('Gran Nube de Magallanes', 3, 163000.00, false, 30),
('Pequeña Nube de Magallanes', 3, 200000.00, false, 3),
('Messier 87', 2, 53490000.00, true, 10000);

INSERT INTO star (name, galaxy_id, spectral_type, surface_temperature_k, is_luminous) VALUES
('Sol', 1, 'G2V', 5778, true),
('Sirio', 1, 'A1V', 9940, true),
('Proxima Centauri', 1, 'M5V', 3042, true),
('Alpheratz', 2, 'B8IV', 13800, true),
('Mirach', 2, 'M0III', 3800, true),
('M87-Star1', 6, 'O', 40000, true);

INSERT INTO planet (name, star_id, orbital_period_days, has_life, has_rings, mass_earth_relative) VALUES
('Mercurio', 1, 87.97, false, false, 0),
('Venus', 1, 224.70, false, false, 1),
('Tierra', 1, 365.25, true, false, 1),
('Marte', 1, 686.98, false, false, 0),
('Júpiter', 1, 4332.59, false, true, 317),
('Saturno', 1, 10759.22, false, true, 95),
('Urano', 1, 30688.50, false, true, 14),
('Neptuno', 1, 60182.00, false, true, 17),
('Sirio b', 2, 18262.00, false, false, 1),
('Proxima b', 3, 11.18, false, false, 1),
('Alpheratz b', 4, 5.00, false, false, 5),
('Mirach b', 5, 400.00, false, false, 10);

INSERT INTO moon (name, planet_id, radius_km, is_tidal_locked, discovery_year) VALUES
('Luna', 3, 1737, true, NULL),
('Fobos', 4, 11, true, 1877),
('Deimos', 4, 6, true, 1877),
('Ío', 5, 1821, true, 1610),
('Europa', 5, 1560, true, 1610),
('Ganímedes', 5, 2634, true, 1610),
('Calisto', 5, 2410, true, 1610),
('Mimas', 6, 198, true, 1789),
('Encélado', 6, 252, true, 1789),
('Tetis', 6, 531, true, 1684),
('Dione', 6, 561, true, 1684),
('Rea', 6, 763, true, 1672),
('Titán', 6, 2574, true, 1655),
('Hiperión', 6, 135, false, 1848),
('Jápeto', 6, 734, true, 1671),
('Miranda', 7, 235, true, 1948),
('Ariel', 7, 578, true, 1851),
('Umbriel', 7, 584, true, 1851),
('Titania', 7, 788, true, 1787),
('Oberón', 7, 761, true, 1787),
('Tritón', 8, 1353, true, 1846),
('Nereida', 8, 170, false, 1949);