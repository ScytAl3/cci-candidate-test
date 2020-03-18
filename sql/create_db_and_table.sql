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
