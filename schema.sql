DROP TABLE IF EXISTS Prix CASCADE;
DROP TABLE IF EXISTS Bar CASCADE;
DROP TABLE IF EXISTS Biere CASCADE;
DROP TABLE IF EXISTS Quartier CASCADE;

CREATE TABLE Quartier (
                          id_quartier SERIAL PRIMARY KEY,
                          nom_quartier VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Bar (
                     id_bar SERIAL PRIMARY KEY,
                     nom VARCHAR(100) NOT NULL,
                     adresse VARCHAR(255) NOT NULL,
                     id_quartier INT NOT NULL,
                     UNIQUE(nom, adresse),
                     CONSTRAINT fk_quartier
                         FOREIGN KEY(id_quartier)
                             REFERENCES Quartier(id_quartier)
                             ON DELETE CASCADE
);

CREATE TABLE Biere (
                       id_biere SERIAL PRIMARY KEY,
                       nom_biere VARCHAR(100) NOT NULL UNIQUE,
                       type_biere VARCHAR(50) NOT NULL,
                       degres_alcool NUMERIC(3,1) NOT NULL CHECK (degres_alcool >= 0 AND degres_alcool <= 20),
                       categorie VARCHAR(50) NOT NULL
);

CREATE TABLE Prix (
                      id_prix SERIAL PRIMARY KEY,
                      id_bar INT NOT NULL,
                      id_biere INT NOT NULL,
                      prix NUMERIC(5,2) NOT NULL CHECK (prix >= 0),
                      CONSTRAINT fk_bar
                          FOREIGN KEY(id_bar)
                              REFERENCES Bar(id_bar)
                              ON DELETE CASCADE,
                      CONSTRAINT fk_biere
                          FOREIGN KEY(id_biere)
                              REFERENCES Biere(id_biere)
                              ON DELETE CASCADE,
                      UNIQUE(id_bar, id_biere)
);
