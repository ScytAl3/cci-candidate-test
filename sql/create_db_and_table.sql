#------------------------------------------------------------
#                        Script MySQL.
#------------------------------------------------------------
#-- creation de la base de donnees si elle n existe pas
CREATE DATABASE IF NOT EXISTS db_cci_candidate_test;
#-- on precise que l on va utiliser cette datbase pour creer les tables
USE db_cci_candidate_test;

#----------------------- CREATION TABLES ASSOCIEES UTILISATEUR -----------------------

#------------------------------------------------------------
# Table: UTILISATEUR
#------------------------------------------------------------
CREATE TABLE UTILISATEUR (
    utilisateur_ID INT NOT NULL AUTO_INCREMENT,
    utilisateur_nom VARCHAR(50) NOT NULL,
    utilisateur_prenom VARCHAR(50) NOT NULL,
    utilisateur_email VARCHAR(255) NOT NULL UNIQUE,
    utilisateur_telFixe VARCHAR(11),
    utilisateur_telMobile VARCHAR(13),
    utilisateurCreated_at DATETIME NOT NULL,
    PRIMARY KEY(utilisateur_ID)
) ENGINE=InnoDB;

#------------------------------------------------------------
# Table: ROLE
#------------------------------------------------------------
CREATE TABLE ROLE (
    role_ID INT NOT NULL AUTO_INCREMENT,
    role_Name VARCHAR(50) NOT NULL,
    PRIMARY KEY(role_ID)
) ENGINE=InnoDB;

/* Table pour les listes deroulantes */
#------------------------------------------------------------
# Table: DIPLOME
#------------------------------------------------------------
CREATE TABLE DIPLOME (
    diplome_ID INT NOT NULL AUTO_INCREMENT,
    diplome_libelle VARCHAR(255) NOT NULL,
    PRIMARY KEY(diplome_ID)
) ENGINE=InnoDB;

#------------------------------------------------------------
# Table: NIVEAU_ETUDE
#------------------------------------------------------------
CREATE TABLE NIVEAU_ETUDE (
    niveau_etude_ID INT NOT NULL AUTO_INCREMENT,
    niveau_etude_Libele VARCHAR(255),
    PRIMARY KEY(niveau_etude_ID)
) ENGINE=InnoDB;

#------------------------------------------------------------
# Table: SITUATION_FAMILLE
#------------------------------------------------------------
CREATE TABLE SITUATION_FAMILLE(
    situation_famille_ID INT NOT NULL AUTO_INCREMENT,
    situation_famille_libele VARCHAR(50) NOT NULL,
    PRIMARY KEY(situation_famille_ID)
) ENGINE=InnoDB;

#------------------------------------------------------------
# Table: CANDIDAT
#------------------------------------------------------------
CREATE TABLE CANDIDAT(
    utilisateur_ID INT,
    nomJeuneFille VARCHAR(100),
    dateNaissance DATE NOT NULL,
    numeroSecu VARCHAR(15) NOT NULL UNIQUE,
    lieuNaissance VARCHAR(100) NOT NULL,
    departementNaissance VARCHAR(3) NOT NULL,
    nationnalite VARCHAR(100) NOT NULL,
    voiturePermis BOOLEAN NOT NULL,
    voiturePersonnelle BOOLEAN NOT NULL,
    nomUrgence VARCHAR(100) NOT NULL,
    telUrgence VARCHAR(12) NOT NULL,
    derniereClasse VARCHAR(100) NOT NULL,
    adresse VARCHAR(255) NOT NULL,
    adresseSuite VARCHAR(100),
    codePostal VARCHAR(5) NOT NULL,
    ville VARCHAR(100) NOT NULL,
    NbEnfants SMALLINT,
    dateInscPoleEmploi DATE NOT NULL,
    identiantPoleEmploi VARCHAR(12) NOT NULL UNIQUE,
    agencePoleEmploi VARCHAR(100) NOT NULL,
    nomConseiller VARCHAR(100) NOT NULL,
    indemnisation BOOLEAN NOT NULL,
    typeIndemnisation SMALLINT,
    rsa BOOLEAN NOT NULL,
    ayantDroit BOOLEAN NOT NULL,
    situation_famille_ID INT NOT NULL,
    niveau_etude_ID INT NOT NULL,
    diplome_ID INT NOT NULL,
    PRIMARY KEY(utilisateur_ID),
    FOREIGN KEY(utilisateur_ID) REFERENCES UTILISATEUR(utilisateur_ID),
    FOREIGN KEY(situation_famille_ID) REFERENCES SITUATION_FAMILLE(situation_famille_ID),
    FOREIGN KEY(niveau_etude_ID) REFERENCES NIVEAU_ETUDE(niveau_etude_ID),
    FOREIGN KEY(diplome_ID) REFERENCES DIPLOME(diplome_ID)
) ENGINE=InnoDB;

#----------------------- CREATION TABLES ASSOCIEES CENTRE -----------------------

#------------------------------------------------------------
# Table: VILLE
#------------------------------------------------------------
CREATE TABLE VILLE (
    ville_ID INT NOT NULL AUTO_INCREMENT,
    ville_Name VARCHAR(100) NOT NULL,
    ville_ZipCode VARCHAR(5) NOT NULL,
    PRIMARY KEY(ville_ID)
) ENGINE=InnoDB;

#------------------------------------------------------------
# Table: CENTRE
#------------------------------------------------------------
CREATE TABLE CENTRE (
    centre_Id INT NOT NULL AUTO_INCREMENT,
    centre_Name VARCHAR(100) NOT NULL,
    centre_Address VARCHAR(255) NOT NULL,
    ville_ID INT NOT NULL,
    PRIMARY KEY(centre_Id),
    FOREIGN KEY(ville_ID) REFERENCES VILLE(ville_ID)
) ENGINE=InnoDB;

#------------------------------------------------------------
# Table: FORMATION
#------------------------------------------------------------
CREATE TABLE FORMATION (
    formation_ID INT NOT NULL AUTO_INCREMENT,
    formation_Intitule VARCHAR(255) NOT NULL,
   PRIMARY KEY(formation_ID)
) ENGINE=InnoDB;

#------------------------------------------------------------
# Table associative : dispenser
#------------------------------------------------------------
CREATE TABLE dispenser (
    centre_Id INT,
    formation_ID INT,
    dateDebutFormation DATE NOT NULL,
    dateFinFormation DATE NOT NULL,
    PRIMARY KEY(centre_Id, formation_ID, dateDebutFormation, dateFinFormation),
    FOREIGN KEY(centre_Id) REFERENCES CENTRE(centre_Id),
    FOREIGN KEY(formation_ID) REFERENCES FORMATION(formation_ID)
) ENGINE=InnoDB;

#------------------------------------------------------------
# Table: CONSEILLER
#------------------------------------------------------------
CREATE TABLE CONSEILLER (
    utilisateur_ID INT,
    password VARCHAR(255) NOT NULL,
    salt VARCHAR(255) NOT NULL,
    centre_Id INT NOT NULL,
    role_ID INT NOT NULL,
    PRIMARY KEY(utilisateur_ID),
    FOREIGN KEY(utilisateur_ID) REFERENCES UTILISATEUR(utilisateur_ID),
    FOREIGN KEY(centre_Id) REFERENCES CENTRE(centre_Id),
    FOREIGN KEY(role_ID) REFERENCES ROLE(role_ID)
) ENGINE=InnoDB;

#------------------------------------------------------------
# Table associative : candidater
#------------------------------------------------------------
CREATE TABLE candidater(
   utilisateur_ID INT,
   formation_ID INT,
   PRIMARY KEY(utilisateur_ID, formation_ID),
   FOREIGN KEY(utilisateur_ID) REFERENCES CANDIDAT(utilisateur_ID),
   FOREIGN KEY(formation_ID) REFERENCES FORMATION(formation_ID)
) ENGINE=InnoDB;

#----------------------- CREATION TABLES ASSOCIEES TEST -----------------------

#------------------------------------------------------------
# Table QUESTIONNAIRE
#------------------------------------------------------------
CREATE TABLE QUESTIONNAIRE (
    questionnaire_ID INT NOT NULL AUTO_INCREMENT,
    questionnaire_libele VARCHAR(100) NOT NULL,
    questionnaie_cearte_at DATETIME NOT NULL,
    questionnaire_update_at DATETIME,
    formation_ID INT NOT NULL,
    PRIMARY KEY(questionnaire_ID),
    FOREIGN KEY(formation_ID) REFERENCES FORMATION(formation_ID)
) ENGINE=InnoDB;

#------------------------------------------------------------
# Table QUESTION
#------------------------------------------------------------
CREATE TABLE QUESTION (
    question_ID INT NOT NULL AUTO_INCREMENT,
    question_libele VARCHAR(255) NOT NULL,
    question_multiple BOOLEAN NOT NULL,
    question_create_at DATETIME NOT NULL,
    question_update_ate DATETIME,
    questionnaire_ID INT NOT NULL,
    PRIMARY KEY(question_ID),
    FOREIGN KEY(questionnaire_ID) REFERENCES QUESTIONNAIRE(questionnaire_ID)
) ENGINE=InnoDB;

#------------------------------------------------------------
# Table PROPOSITION
#------------------------------------------------------------
CREATE TABLE PROPOSITION (
    proposition_ID INT NOT NULL AUTO_INCREMENT,
    proposition_libele VARCHAR(255) NOT NULL,
    proposition_vrai BOOLEAN NOT NULL,
    question_ID INT NOT NULL,
    PRIMARY KEY(proposition_ID),
    FOREIGN KEY(question_ID) REFERENCES QUESTION(question_ID)
) ENGINE=InnoDB;

#------------ CREATION TABLES ASSOCIEES REPONSES CANDIDAT --------------

#------------------------------------------------------------
# Table REPONSE_CANDIDAT
#------------------------------------------------------------
CREATE TABLE REPONSE_CANDIDAT (
    reponse_candidat_ID INT NOT NULL AUTO_INCREMENT,
    utilisateur_ID INT NOT NULL,
    question_ID INT NOT NULL,
    PRIMARY KEY(reponse_candidat_ID),
    FOREIGN KEY(utilisateur_ID) REFERENCES CANDIDAT(utilisateur_ID),
    FOREIGN KEY(question_ID) REFERENCES QUESTION(question_ID)
) ENGINE=InnoDB;

#------------------------------------------------------------
# Table associative : repondre
#------------------------------------------------------------
CREATE TABLE repondre (
    proposition_ID INT,
    reponse_candidat_ID INT,
    PRIMARY KEY(proposition_ID, reponse_candidat_ID),
    FOREIGN KEY(proposition_ID) REFERENCES PROPOSITION(proposition_ID),
    FOREIGN KEY(reponse_candidat_ID) REFERENCES REPONSE_CANDIDAT(reponse_candidat_ID)
) ENGINE=InnoDB;

#------------------------------------------------------------
# Table associative : remplir
#------------------------------------------------------------
CREATE TABLE remplir (
    utilisateur_ID INT,
    questionnaire_ID INT,
    date_debut_questionnaire DATETIME,
    date_fin_questionnaire DATETIME,
    PRIMARY KEY(utilisateur_ID, questionnaire_ID),
    FOREIGN KEY(utilisateur_ID) REFERENCES CANDIDAT(utilisateur_ID),
    FOREIGN KEY(questionnaire_ID) REFERENCES QUESTIONNAIRE(questionnaire_ID)
) ENGINE=InnoDB;

#------------ CREATION TABLES ASSOCIEES ADMINISTRATION --------------

#------------------------------------------------------------
# Table associative : creer
#------------------------------------------------------------
CREATE TABLE creer (
    utilisateur_ID INT,
    questionnaire_ID INT,
    PRIMARY KEY(utilisateur_ID, questionnaire_ID),
    FOREIGN KEY(utilisateur_ID) REFERENCES CONSEILLER(utilisateur_ID),
    FOREIGN KEY(questionnaire_ID) REFERENCES QUESTIONNAIRE(questionnaire_ID)
) ENGINE=InnoDB;