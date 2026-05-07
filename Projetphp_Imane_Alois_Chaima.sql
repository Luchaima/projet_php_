

CREATE DATABASE IF NOT EXISTS ecoloc CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE ecoloc;

CREATE TABLE IF NOT EXISTS utilisateur (
    id_utilisateur  INT          NOT NULL AUTO_INCREMENT,
    nom             VARCHAR(100) NOT NULL,
    prenom          VARCHAR(100) NOT NULL,
    email           VARCHAR(150) NOT NULL UNIQUE,
    telephone       VARCHAR(25)  DEFAULT NULL,
    adresse         VARCHAR(255) DEFAULT NULL,
    mot_de_passe    VARCHAR(255) NOT NULL,
    role            VARCHAR(25)  NOT NULL DEFAULT 'abonne', 
    CONSTRAINT pk_utilisateur PRIMARY KEY (id_utilisateur)
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS abonne (
    id_abonne   INT         NOT NULL,
    statut      VARCHAR(25) NOT NULL DEFAULT 'en_attente',  
    CONSTRAINT pk_abonne        PRIMARY KEY (id_abonne),
    CONSTRAINT fk_abonne_utilisateur
        FOREIGN KEY (id_abonne) REFERENCES utilisateur(id_utilisateur)
        
) ENGINE=INNODB;


CREATE TABLE IF NOT EXISTS categorie (
    id_categorie    INT          NOT NULL AUTO_INCREMENT,
    libelle         VARCHAR(100) NOT NULL,
    CONSTRAINT pk_categorie PRIMARY KEY (id_categorie)
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS materiel (
    id_materiel     INT          NOT NULL AUTO_INCREMENT,
    nom             VARCHAR(150) NOT NULL,
    id_categorie    INT          NOT NULL,
    caracteristique TEXT         DEFAULT NULL,
    duree_pret_max  INT          NOT NULL DEFAULT 7, 
    disponible      TINYINT(1)   NOT NULL DEFAULT 1,  
    etat            VARCHAR(50)  NOT NULL DEFAULT 'bon', 
    id_proprietaire INT          NOT NULL,
    CONSTRAINT pk_materiel          PRIMARY KEY (id_materiel),
    CONSTRAINT fk_materiel_categorie
        FOREIGN KEY (id_categorie)    REFERENCES categorie(id_categorie),
    CONSTRAINT fk_materiel_proprietaire
        FOREIGN KEY (id_proprietaire) REFERENCES utilisateur(id_utilisateur)
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS demande_emprunt (
    id_demande      INT     NOT NULL AUTO_INCREMENT,
    date_creation   DATE    NOT NULL,
    statut          BOOLEAN NOT NULL DEFAULT FALSE,  
    id_abonne       INT     NOT NULL,
    CONSTRAINT pk_demande_emprunt       PRIMARY KEY (id_demande),
    CONSTRAINT fk_demande_abonne
        FOREIGN KEY (id_abonne) REFERENCES abonne(id_abonne)
       
) ENGINE=INNODB;


CREATE TABLE IF NOT EXISTS demande_emprunt_materiel (
    id_demande  INT NOT NULL,
    id_materiel INT NOT NULL,
    CONSTRAINT pk_demande_materiel  PRIMARY KEY (id_demande, id_materiel),
    CONSTRAINT fk_dem_mat_demande
        FOREIGN KEY (id_demande)  REFERENCES demande_emprunt(id_demande)
        ON DELETE CASCADE,
    CONSTRAINT fk_dem_mat_materiel
        FOREIGN KEY (id_materiel) REFERENCES materiel(id_materiel)
       
) ENGINE=INNODB;


CREATE TABLE IF NOT EXISTS emprunt (
    id_emprunt      INT         NOT NULL AUTO_INCREMENT,
    id_materiel     INT         NOT NULL,
    id_emprunteur   INT         NOT NULL,
    date_debut      DATE        NOT NULL,
    date_fin        DATE        DEFAULT NULL,
    statut          VARCHAR(25) NOT NULL DEFAULT 'en_cours',  
    CONSTRAINT pk_emprunt       PRIMARY KEY (id_emprunt),
    CONSTRAINT fk_emprunt_materiel
        FOREIGN KEY (id_materiel)   REFERENCES materiel(id_materiel),
    CONSTRAINT fk_emprunt_emprunteur
        FOREIGN KEY (id_emprunteur) REFERENCES utilisateur(id_utilisateur)
) ENGINE=INNODB;
