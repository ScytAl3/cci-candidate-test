#------------------------------------------------------------
#                        Script MySQL.
#------------------------------------------------------------
#-- creation de la base de donnees si elle n existe pas
CREATE DATABASE IF NOT EXISTS db_cci_candidate_test;
#-- on precise que l on va utiliser cette datbase pour creer les tables
USE db_cci_candidate_test;

#------------------------------------------------------------
# Table: USERS
#------------------------------------------------------------

CREATE TABLE users (
    /*userId                          int                       not null  Auto_increment,
    userLastName            varchar(75)         not null,
    userFirstName           varchar(75)         not null, 
    userEmail                   varchar(100)       not null,
    userPassword            varchar(255)         not null,
    userSalt                      varchar(255)         not null,
    accountCreated_at       datetime     not null,
    userRole                    varchar(20)             not null  DEFAULT 'Member',
    CONSTRAINT users_PK PRIMARY KEY (userId),
    UNIQUE KEY unique_email (userEmail)*/
) ENGINE=InnoDB;

#------------------------------------------------------------
# Table: ROLE
#------------------------------------------------------------

CREATE TABLE ROLE (
   role_ID 					INT				NOT NULL  Auto_increment,
   role_Name				VARCHAR(50)		NOT NULL,
   CONSTRAINT ROLE_PK PRIMARY KEY (role_ID)
) ENGINE=InnoDB;

#------------------------------------------------------------
# Table: VILLE
#------------------------------------------------------------

CREATE TABLE VILLE (
    ville_Id				INT				NOT NULL  Auto_increment,
    ville_Name				VARCHAR(100)	NOT NULL,    
    ville_ZipCode			VARCHAR(5)		NOT NULL,
    CONSTRAINT VILLE_PK PRIMARY KEY (ville_Id)
) ENGINE=InnoDB;

#------------------------------------------------------------
# Table: CENTRE
#------------------------------------------------------------

CREATE TABLE CENTRE (
    centre_Id				INT				NOT NULL  Auto_increment,
    centre_Name				VARCHAR(100)	NOT NULL,    
    centre_address			VARCHAR(255)    NOT NULL,
	ville_Id				INT				NOT NULL,
    CONSTRAINT CENTRE_PK PRIMARY KEY (centre_Id),
    FOREIGN KEY (ville_Id) REFERENCES VILLE(ville_Id)
) ENGINE=InnoDB;

#------------------------------------------------------------
# Table: FORMATION
#------------------------------------------------------------

CREATE TABLE FORMATION (
   formation_ID				INT				NOT NULL  Auto_increment,
   formation_Intitule		VARCHAR(255)	NOT NULL,
   dateDebutFormation		DATE			NOT NULL,
   dateFinFormation			DATE			NOT NULL,
   CONSTRAINT FORMATION_PK PRIMARY KEY(formation_ID)
) ENGINE=InnoDB;

#------------------------------------------------------------
# Table associative : dispenser
#------------------------------------------------------------

CREATE TABLE dispenser(
   centre_Id				INT,
   formation_ID				INT,
   PRIMARY KEY(centre_Id, formation_ID),
   FOREIGN KEY(centre_Id) REFERENCES CENTRE(centre_Id),
   FOREIGN KEY(formation_ID) REFERENCES FORMATION(formation_ID)
) ENGINE=InnoDB;

#----------------------------------------------------------------------------------------
#                     JEU DE DONNEES
#----------------------------------------------------------------------------------------

#-----------------------------------------------------------
# Table: ROLE - Data
#-----------------------------------------------------------
INSERT INTO 
	`role`(`role_Name`) 
VALUES 
	('Administrateur'),
	('Formateur');


#-----------------------------------------------------------
# Table: VILLE - Data
#-----------------------------------------------------------
INSERT INTO 
	`ville`(`ville_Name`, `ville_ZipCode`) 
VALUES
	('Metz', '57070'),
	('Yutz', '57970'),
	('Sarrebourg', '57400'),
	('Sarreguemines', '57200'),
	('Forbach', '57600');

#-----------------------------------------------------------
# Table: CENTRE - Data
#-----------------------------------------------------------
INSERT INTO 
	`centre`(`centre_Name`, `centre_address`, `ville_Id`) 
VALUES
	('CCI Formation Metz', '5 Rue Jean Antoine Chaptal', 1),
	('CCI Formation Yutz', '2 boulevard Henri Becquerel', 2),
	('CCI Formation Sarrebourg', 'Zac Les Terrasses De La Sarre', 3),
	('CCI Formation Sarreguemines', '27 Rue du Champ de Mars', 4),
	('CCI Formation Forbach', '1 rue Jacques Callot', 5);

#-----------------------------------------------------------
# Table: FORMATION - Data
#-----------------------------------------------------------
INSERT INTO 
	`formation`(`formation_Intitule`, `dateDebutFormation`, `dateFinFormation`)
VALUES
	(),

#-----------------------------------------------------------
# Table: dispenser - Data
#-----------------------------------------------------------
