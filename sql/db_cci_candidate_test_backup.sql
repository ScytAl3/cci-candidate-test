-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 29 juil. 2020 à 09:29
-- Version du serveur :  10.4.10-MariaDB
-- Version de PHP : 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `db_cci_candidate_test`
--

-- --------------------------------------------------------

--
-- Structure de la table `candidat`
--

DROP TABLE IF EXISTS `candidat`;
CREATE TABLE IF NOT EXISTS `candidat` (
  `utilisateur_ID` int(11) NOT NULL,
  `nomJeuneFille` varchar(100) DEFAULT NULL,
  `dateNaissance` date NOT NULL,
  `numeroSecu` varchar(15) NOT NULL,
  `lieuNaissance` varchar(100) NOT NULL,
  `departementNaissance` varchar(3) NOT NULL,
  `nationnalite` varchar(100) NOT NULL,
  `voiturePermis` tinyint(1) NOT NULL,
  `voiturePersonnelle` tinyint(1) NOT NULL,
  `nomUrgence` varchar(100) NOT NULL,
  `telUrgence` varchar(12) NOT NULL,
  `derniereClasse` varchar(100) DEFAULT NULL,
  `adresse` varchar(255) NOT NULL,
  `adresseSuite` varchar(100) DEFAULT NULL,
  `codePostal` varchar(5) NOT NULL,
  `ville` varchar(100) NOT NULL,
  `NbEnfants` smallint(6) DEFAULT NULL,
  `dateInscPoleEmploi` date NOT NULL,
  `identiantPoleEmploi` varchar(12) NOT NULL,
  `agencePoleEmploi` varchar(100) NOT NULL,
  `nomConseiller` varchar(100) NOT NULL,
  `indemnisation` tinyint(1) NOT NULL,
  `typeIndemnisation` smallint(6) DEFAULT NULL,
  `rsa` tinyint(1) NOT NULL,
  `ayantDroit` tinyint(1) NOT NULL,
  `situation_famille_ID` int(11) NOT NULL,
  `niveau_etude_ID` int(11) NOT NULL,
  `diplome_ID` int(11) NOT NULL,
  PRIMARY KEY (`utilisateur_ID`),
  UNIQUE KEY `numeroSecu` (`numeroSecu`),
  UNIQUE KEY `identiantPoleEmploi` (`identiantPoleEmploi`),
  KEY `situation_famille_ID` (`situation_famille_ID`),
  KEY `niveau_etude_ID` (`niveau_etude_ID`),
  KEY `diplome_ID` (`diplome_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `candidat`
--

INSERT INTO `candidat` (`utilisateur_ID`, `nomJeuneFille`, `dateNaissance`, `numeroSecu`, `lieuNaissance`, `departementNaissance`, `nationnalite`, `voiturePermis`, `voiturePersonnelle`, `nomUrgence`, `telUrgence`, `derniereClasse`, `adresse`, `adresseSuite`, `codePostal`, `ville`, `NbEnfants`, `dateInscPoleEmploi`, `identiantPoleEmploi`, `agencePoleEmploi`, `nomConseiller`, `indemnisation`, `typeIndemnisation`, `rsa`, `ayantDroit`, `situation_famille_ID`, `niveau_etude_ID`, `diplome_ID`) VALUES
(1, '', '1986-04-28', '2860415796325', 'Paris', '75', 'Française', 1, 0, 'Bla mom', '0610489567', 'IUT', 'Adresse de bla', '', '57000', 'Metz', 1, '2019-09-06', '1293475N', 'Sebastopol', 'Ma conseillère', 1, 2, 0, 0, 2, 3, 8),
(3, '', '1998-02-11', '1980245685274', 'Metz', '57', 'Française', 0, 0, 'Bli mom', '0610458745', 'Lycée', 'Adresse Bli', '', '57000', 'Metz', 0, '2019-09-11', '5491258D', 'Sebastopol', 'Mon conseiller', 1, 2, 0, 0, 1, 3, 5);

-- --------------------------------------------------------

--
-- Structure de la table `candidater`
--

DROP TABLE IF EXISTS `candidater`;
CREATE TABLE IF NOT EXISTS `candidater` (
  `utilisateur_ID` int(11) NOT NULL,
  `formation_ID` int(11) NOT NULL,
  PRIMARY KEY (`utilisateur_ID`,`formation_ID`),
  KEY `formation_ID` (`formation_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `candidater`
--

INSERT INTO `candidater` (`utilisateur_ID`, `formation_ID`) VALUES
(3, 4);

-- --------------------------------------------------------

--
-- Structure de la table `centre`
--

DROP TABLE IF EXISTS `centre`;
CREATE TABLE IF NOT EXISTS `centre` (
  `centre_ID` int(11) NOT NULL AUTO_INCREMENT,
  `centre_Name` varchar(100) NOT NULL,
  `centre_Address` varchar(255) NOT NULL,
  `ville_ID` int(11) NOT NULL,
  PRIMARY KEY (`centre_ID`),
  KEY `ville_ID` (`ville_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `centre`
--

INSERT INTO `centre` (`centre_ID`, `centre_Name`, `centre_Address`, `ville_ID`) VALUES
(1, 'CCI Formation Metz', '5 Rue Jean Antoine Chaptal', 1),
(2, 'CCI Formation Yutz', '2 boulevard Henri Becquerel', 2),
(3, 'CCI Formation Sarrebourg', 'Zac Les Terrasses De La Sarre', 3),
(4, 'CCI Formation Sarreguemines', '27 Rue du Champ de Mars', 4),
(5, 'CCI Formation Forbach', '1 rue Jacques Callot', 5);

-- --------------------------------------------------------

--
-- Structure de la table `conseiller`
--

DROP TABLE IF EXISTS `conseiller`;
CREATE TABLE IF NOT EXISTS `conseiller` (
  `utilisateur_ID` int(11) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) NOT NULL,
  `centre_Id` int(11) NOT NULL,
  `role_ID` int(11) NOT NULL,
  PRIMARY KEY (`utilisateur_ID`),
  KEY `centre_Id` (`centre_Id`),
  KEY `role_ID` (`role_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `creer`
--

DROP TABLE IF EXISTS `creer`;
CREATE TABLE IF NOT EXISTS `creer` (
  `utilisateur_ID` int(11) NOT NULL,
  `questionnaire_ID` int(11) NOT NULL,
  PRIMARY KEY (`utilisateur_ID`,`questionnaire_ID`),
  KEY `questionnaire_ID` (`questionnaire_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `diplome`
--

DROP TABLE IF EXISTS `diplome`;
CREATE TABLE IF NOT EXISTS `diplome` (
  `diplome_ID` int(11) NOT NULL AUTO_INCREMENT,
  `diplome_libelle` varchar(255) NOT NULL,
  PRIMARY KEY (`diplome_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `diplome`
--

INSERT INTO `diplome` (`diplome_ID`, `diplome_libelle`) VALUES
(1, 'BEP - Brevet d\'études professionnelles'),
(2, 'CAP - Certificat d\'aptitude professionnelle'),
(3, 'TP niveau V - Titre professionnel'),
(4, 'BP - Brevet professionnel'),
(5, 'BAC - Baccalauréat'),
(6, 'TP niveau IV - Titre professionnel'),
(7, 'BTS - Brevet de technicien supérieur'),
(8, 'DUT - Diplôme universitaire de technologie'),
(9, 'TP niveau III - Titre professionnel'),
(10, 'Licence'),
(11, 'Maîtrise'),
(12, 'Master');

-- --------------------------------------------------------

--
-- Structure de la table `dispenser`
--

DROP TABLE IF EXISTS `dispenser`;
CREATE TABLE IF NOT EXISTS `dispenser` (
  `centre_ID` int(11) NOT NULL,
  `formation_ID` int(11) NOT NULL,
  `dateDebutFormation` date NOT NULL,
  `dateFinFormation` date NOT NULL,
  PRIMARY KEY (`centre_ID`,`formation_ID`,`dateDebutFormation`,`dateFinFormation`),
  KEY `formation_ID` (`formation_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `dispenser`
--

INSERT INTO `dispenser` (`centre_ID`, `formation_ID`, `dateDebutFormation`, `dateFinFormation`) VALUES
(1, 1, '2020-04-01', '2020-06-01'),
(1, 3, '2020-04-15', '2020-10-01'),
(1, 6, '2020-04-23', '2020-05-22'),
(1, 7, '2020-04-01', '2021-02-01'),
(2, 2, '2020-04-13', '2020-05-01'),
(2, 7, '2020-05-01', '2021-03-01'),
(5, 4, '2020-05-05', '2020-05-29'),
(5, 5, '2020-05-12', '2020-05-05'),
(5, 7, '2020-05-18', '2021-03-18');

-- --------------------------------------------------------

--
-- Structure de la table `formation`
--

DROP TABLE IF EXISTS `formation`;
CREATE TABLE IF NOT EXISTS `formation` (
  `formation_ID` int(11) NOT NULL AUTO_INCREMENT,
  `formation_Intitule` varchar(255) NOT NULL,
  PRIMARY KEY (`formation_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `formation`
--

INSERT INTO `formation` (`formation_ID`, `formation_Intitule`) VALUES
(1, 'Administratif / Accueil'),
(2, 'Commercial'),
(3, 'Comptabilité / Gestion'),
(4, 'Bureautique'),
(5, 'Qualité / Sécurité / Environnement'),
(6, 'Communication'),
(7, 'Informatique / Système d\'information');

-- --------------------------------------------------------

--
-- Structure de la table `niveau_etude`
--

DROP TABLE IF EXISTS `niveau_etude`;
CREATE TABLE IF NOT EXISTS `niveau_etude` (
  `niveau_etude_ID` int(11) NOT NULL AUTO_INCREMENT,
  `niveau_etude_Libele` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`niveau_etude_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `niveau_etude`
--

INSERT INTO `niveau_etude` (`niveau_etude_ID`, `niveau_etude_Libele`) VALUES
(1, 'Niveau 3 - BEP, CAP'),
(2, 'Niveau 4 - Baccalauréat'),
(3, 'Niveau 5 - DEUG, BTS, DUT, DEUST'),
(4, 'Niveau 6 - Licence, licence professionnelle'),
(5, 'Niveau 6 - Maîtrise, master 1'),
(6, 'Niveau 7 - Master, diplôme d\'études supérieures spécialisées, diplôme d\'ingénieur');

-- --------------------------------------------------------

--
-- Structure de la table `proposition`
--

DROP TABLE IF EXISTS `proposition`;
CREATE TABLE IF NOT EXISTS `proposition` (
  `proposition_ID` int(11) NOT NULL AUTO_INCREMENT,
  `proposition_libele` varchar(255) NOT NULL,
  `proposition_vrai` tinyint(1) NOT NULL,
  `question_ID` int(11) NOT NULL,
  PRIMARY KEY (`proposition_ID`),
  KEY `question_ID` (`question_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `proposition`
--

INSERT INTO `proposition` (`proposition_ID`, `proposition_libele`, `proposition_vrai`, `question_ID`) VALUES
(1, 'HTML (Hypertext Markup Language)', 1, 1),
(2, 'HTTP (Hypertext Transfer Protocol)', 0, 1),
(3, 'JavaScript', 0, 1),
(4, 'Un numéro qui identifie chaque matériel informatique (ordinateur, routeur, imprimante) connecté à un réseau informatique', 1, 2),
(5, 'Le protocole de communication utilisé sur Internet', 0, 2),
(6, 'L’adresse d’un site web, commençant par \"http://\"', 0, 2),
(7, 'File Transmission Protocol', 0, 3),
(8, 'File Transfer Protocol', 1, 3),
(9, 'Fiber twisted pairs', 0, 3),
(10, 'Ça veut dire World Wide Web Consortium', 1, 4),
(11, 'C’est un nouveau groupe de K-pop', 0, 4),
(12, 'C’est un organisme de standardisation chargé de promouvoir la compatibilité des technologies du World Wide Web', 1, 4),
(13, '\"<\"!DOCTYPE html5\">\"', 0, 5),
(14, '\"<\"!DOCTYPE html\">\"', 1, 5),
(15, '\"<\"!DOCTYPE html PUBLIC \"-//W3C//DTD HTML5.0 Strict//EN\">\"', 0, 5),
(16, 'Cascading Style Sheets', 1, 6),
(17, 'Create Simple Sample', 0, 6),
(18, 'Cascading Simple Style', 0, 6),
(19, 'Pour compliquer notre développement Web', 0, 7),
(20, 'Pour séparer le contenu et la présentation des documents web', 1, 7),
(21, 'Pour faire des dégradés de couleurs', 0, 7),
(22, 'Dans le \"<\"body\">\"', 0, 8),
(23, 'Entre les balises \"<\"head\">\"', 0, 8),
(24, 'Dans un fichier externe utilisable pour plusieurs pages', 1, 8),
(25, 'Dans ton cul tout simplement', 0, 8),
(26, 'Page Helper Process', 0, 9),
(27, 'Programming Home Pages', 0, 9),
(28, 'PHP: Hypertext Preprocessor', 1, 9),
(29, 'elle s\'est vue assigner la constante NULL', 1, 10),
(30, 'elle n\'a pas encore reçu de valeur', 1, 10),
(31, 'La variable a été évalué avec la fonction is_null()', 0, 10),
(32, 'elle a été effacée avec la fonction unset()', 1, 10),
(33, 'Oui', 1, 11),
(34, 'Non', 0, 11),
(35, '\"clic g\" sur un objet ou une sélection ', 0, 12),
(36, '\"clic d\" sur un objet, une sélection ou à la position du pointeur ', 1, 12),
(37, '\"double clic\" dans la sélection', 0, 12),
(38, '\"maj+clic g\" à la position du pointeur requise', 0, 12);

-- --------------------------------------------------------

--
-- Structure de la table `question`
--

DROP TABLE IF EXISTS `question`;
CREATE TABLE IF NOT EXISTS `question` (
  `question_ID` int(11) NOT NULL AUTO_INCREMENT,
  `question_libele` varchar(255) NOT NULL,
  `question_multiple` tinyint(1) NOT NULL,
  `question_create_at` datetime NOT NULL,
  `question_update_ate` datetime DEFAULT NULL,
  `questionnaire_ID` int(11) NOT NULL,
  PRIMARY KEY (`question_ID`),
  KEY `questionnaire_ID` (`questionnaire_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `question`
--

INSERT INTO `question` (`question_ID`, `question_libele`, `question_multiple`, `question_create_at`, `question_update_ate`, `questionnaire_ID`) VALUES
(1, 'Quel est le langage informatique le plus courant utilisé pour écrire les pages web ?', 0, '2020-03-28 14:33:32', NULL, 1),
(2, 'Qu’est-ce qu’une adresse IP ?', 0, '2020-03-28 14:33:32', NULL, 1),
(3, 'Que veut dire FTP ?', 0, '2020-03-28 14:33:32', NULL, 1),
(4, 'W3C ça vous parle ?', 1, '2020-03-28 14:33:32', NULL, 1),
(5, 'Quel est le doctype d\'un document HTML5 ?', 0, '2020-03-28 14:33:32', NULL, 1),
(6, 'Que signifie CSS ?', 0, '2020-03-28 14:33:32', NULL, 1),
(7, 'Pourquoi utilise-t-on généralement du CSS ?', 0, '2020-03-28 14:33:32', NULL, 1),
(8, 'Où est-il conseillé de placer le code CSS ?', 0, '2020-03-28 14:33:32', NULL, 1),
(9, 'Que signifie PHP ?', 0, '2020-03-28 14:33:32', NULL, 1),
(10, 'En PHP une variable est considérée comme null si :', 1, '2020-03-28 14:33:32', NULL, 1),
(11, 'Dans Windows, pouvez-vous travailler sur plusieurs applications à la fois ?', 0, '2020-03-28 14:33:32', NULL, 2),
(12, 'Pour appeler un menu contextuel, vous utilisez :', 0, '2020-03-28 14:33:32', NULL, 2);

-- --------------------------------------------------------

--
-- Structure de la table `questionnaire`
--

DROP TABLE IF EXISTS `questionnaire`;
CREATE TABLE IF NOT EXISTS `questionnaire` (
  `questionnaire_ID` int(11) NOT NULL AUTO_INCREMENT,
  `questionnaire_libele` varchar(100) NOT NULL,
  `questionnaie_cearte_at` datetime NOT NULL,
  `questionnaire_update_at` datetime DEFAULT NULL,
  `formation_ID` int(11) NOT NULL,
  PRIMARY KEY (`questionnaire_ID`),
  KEY `formation_ID` (`formation_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `questionnaire`
--

INSERT INTO `questionnaire` (`questionnaire_ID`, `questionnaire_libele`, `questionnaie_cearte_at`, `questionnaire_update_at`, `formation_ID`) VALUES
(1, 'Test de connaissances Web', '2020-03-28 14:33:32', NULL, 7),
(2, 'Test de connaissnces bureatique', '2020-03-28 14:33:32', NULL, 4);

-- --------------------------------------------------------

--
-- Structure de la table `remplir`
--

DROP TABLE IF EXISTS `remplir`;
CREATE TABLE IF NOT EXISTS `remplir` (
  `utilisateur_ID` int(11) NOT NULL,
  `questionnaire_ID` int(11) NOT NULL,
  `date_debut_questionnaire` datetime DEFAULT NULL,
  `date_fin_questionnaire` datetime DEFAULT NULL,
  PRIMARY KEY (`utilisateur_ID`,`questionnaire_ID`),
  KEY `questionnaire_ID` (`questionnaire_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `remplir`
--

INSERT INTO `remplir` (`utilisateur_ID`, `questionnaire_ID`, `date_debut_questionnaire`, `date_fin_questionnaire`) VALUES
(1, 1, '2020-03-28 13:39:42', '2020-03-28 14:40:28'),
(2, 2, '2020-03-28 15:17:24', '2020-03-28 15:17:31'),
(3, 2, '2020-03-28 15:48:33', '2020-03-28 15:48:48');

-- --------------------------------------------------------

--
-- Structure de la table `repondre`
--

DROP TABLE IF EXISTS `repondre`;
CREATE TABLE IF NOT EXISTS `repondre` (
  `proposition_ID` int(11) NOT NULL,
  `reponse_candidat_ID` int(11) NOT NULL,
  PRIMARY KEY (`proposition_ID`,`reponse_candidat_ID`),
  KEY `reponse_candidat_ID` (`reponse_candidat_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `repondre`
--

INSERT INTO `repondre` (`proposition_ID`, `reponse_candidat_ID`) VALUES
(1, 1),
(4, 2),
(8, 3),
(10, 4),
(12, 4),
(14, 5),
(16, 6),
(20, 7),
(24, 8),
(28, 9),
(29, 10),
(30, 10),
(32, 10),
(33, 11),
(33, 13),
(33, 15),
(36, 12),
(36, 14),
(36, 16);

-- --------------------------------------------------------

--
-- Structure de la table `reponse_candidat`
--

DROP TABLE IF EXISTS `reponse_candidat`;
CREATE TABLE IF NOT EXISTS `reponse_candidat` (
  `reponse_candidat_ID` int(11) NOT NULL AUTO_INCREMENT,
  `utilisateur_ID` int(11) NOT NULL,
  `question_ID` int(11) NOT NULL,
  PRIMARY KEY (`reponse_candidat_ID`),
  KEY `utilisateur_ID` (`utilisateur_ID`),
  KEY `question_ID` (`question_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `reponse_candidat`
--

INSERT INTO `reponse_candidat` (`reponse_candidat_ID`, `utilisateur_ID`, `question_ID`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 1, 9),
(10, 1, 10),
(11, 2, 11),
(12, 2, 12),
(13, 2, 11),
(14, 2, 12),
(15, 3, 11),
(16, 3, 12);

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `role_ID` int(11) NOT NULL AUTO_INCREMENT,
  `role_Name` varchar(50) NOT NULL,
  PRIMARY KEY (`role_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`role_ID`, `role_Name`) VALUES
(1, 'Administrateur'),
(2, 'Formateur');

-- --------------------------------------------------------

--
-- Structure de la table `situation_famille`
--

DROP TABLE IF EXISTS `situation_famille`;
CREATE TABLE IF NOT EXISTS `situation_famille` (
  `situation_famille_ID` int(11) NOT NULL AUTO_INCREMENT,
  `situation_famille_libele` varchar(50) NOT NULL,
  PRIMARY KEY (`situation_famille_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `situation_famille`
--

INSERT INTO `situation_famille` (`situation_famille_ID`, `situation_famille_libele`) VALUES
(1, 'Célibataire'),
(2, 'Marié'),
(3, 'Pacsé'),
(4, 'Divorcé'),
(5, 'Séparé'),
(6, 'Veuf');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `utilisateur_ID` int(11) NOT NULL AUTO_INCREMENT,
  `utilisateur_nom` varchar(50) NOT NULL,
  `utilisateur_prenom` varchar(50) NOT NULL,
  `utilisateur_email` varchar(255) NOT NULL,
  `utilisateur_telFixe` varchar(11) DEFAULT NULL,
  `utilisateur_telMobile` varchar(13) DEFAULT NULL,
  `utilisateurCreated_at` datetime NOT NULL,
  PRIMARY KEY (`utilisateur_ID`),
  UNIQUE KEY `utilisateur_email` (`utilisateur_email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`utilisateur_ID`, `utilisateur_nom`, `utilisateur_prenom`, `utilisateur_email`, `utilisateur_telFixe`, `utilisateur_telMobile`, `utilisateurCreated_at`) VALUES
(1, 'Bla', 'Miss', 'bla@g.fr', '', '0612359575', '2020-03-28 14:37:36'),
(3, 'Bli', 'Mister', 'bli@g.fr', '', '0612359541', '2020-03-28 15:48:29');

-- --------------------------------------------------------

--
-- Structure de la table `ville`
--

DROP TABLE IF EXISTS `ville`;
CREATE TABLE IF NOT EXISTS `ville` (
  `ville_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ville_Name` varchar(100) NOT NULL,
  `ville_ZipCode` varchar(5) NOT NULL,
  PRIMARY KEY (`ville_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `ville`
--

INSERT INTO `ville` (`ville_ID`, `ville_Name`, `ville_ZipCode`) VALUES
(1, 'Metz', '57070'),
(2, 'Yutz', '57970'),
(3, 'Sarrebourg', '57400'),
(4, 'Sarreguemines', '57200'),
(5, 'Forbach', '57600');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `candidat`
--
ALTER TABLE `candidat`
  ADD CONSTRAINT `candidat_ibfk_1` FOREIGN KEY (`utilisateur_ID`) REFERENCES `utilisateur` (`utilisateur_ID`),
  ADD CONSTRAINT `candidat_ibfk_2` FOREIGN KEY (`situation_famille_ID`) REFERENCES `situation_famille` (`situation_famille_ID`),
  ADD CONSTRAINT `candidat_ibfk_3` FOREIGN KEY (`niveau_etude_ID`) REFERENCES `niveau_etude` (`niveau_etude_ID`),
  ADD CONSTRAINT `candidat_ibfk_4` FOREIGN KEY (`diplome_ID`) REFERENCES `diplome` (`diplome_ID`);

--
-- Contraintes pour la table `candidater`
--
ALTER TABLE `candidater`
  ADD CONSTRAINT `candidater_ibfk_1` FOREIGN KEY (`utilisateur_ID`) REFERENCES `candidat` (`utilisateur_ID`),
  ADD CONSTRAINT `candidater_ibfk_2` FOREIGN KEY (`formation_ID`) REFERENCES `formation` (`formation_ID`);

--
-- Contraintes pour la table `centre`
--
ALTER TABLE `centre`
  ADD CONSTRAINT `centre_ibfk_1` FOREIGN KEY (`ville_ID`) REFERENCES `ville` (`ville_ID`);

--
-- Contraintes pour la table `conseiller`
--
ALTER TABLE `conseiller`
  ADD CONSTRAINT `conseiller_ibfk_1` FOREIGN KEY (`utilisateur_ID`) REFERENCES `utilisateur` (`utilisateur_ID`),
  ADD CONSTRAINT `conseiller_ibfk_2` FOREIGN KEY (`centre_Id`) REFERENCES `centre` (`centre_ID`),
  ADD CONSTRAINT `conseiller_ibfk_3` FOREIGN KEY (`role_ID`) REFERENCES `role` (`role_ID`);

--
-- Contraintes pour la table `creer`
--
ALTER TABLE `creer`
  ADD CONSTRAINT `creer_ibfk_1` FOREIGN KEY (`utilisateur_ID`) REFERENCES `conseiller` (`utilisateur_ID`),
  ADD CONSTRAINT `creer_ibfk_2` FOREIGN KEY (`questionnaire_ID`) REFERENCES `questionnaire` (`questionnaire_ID`);

--
-- Contraintes pour la table `dispenser`
--
ALTER TABLE `dispenser`
  ADD CONSTRAINT `dispenser_ibfk_1` FOREIGN KEY (`centre_ID`) REFERENCES `centre` (`centre_ID`),
  ADD CONSTRAINT `dispenser_ibfk_2` FOREIGN KEY (`formation_ID`) REFERENCES `formation` (`formation_ID`);

--
-- Contraintes pour la table `proposition`
--
ALTER TABLE `proposition`
  ADD CONSTRAINT `proposition_ibfk_1` FOREIGN KEY (`question_ID`) REFERENCES `question` (`question_ID`);

--
-- Contraintes pour la table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `question_ibfk_1` FOREIGN KEY (`questionnaire_ID`) REFERENCES `questionnaire` (`questionnaire_ID`);

--
-- Contraintes pour la table `questionnaire`
--
ALTER TABLE `questionnaire`
  ADD CONSTRAINT `questionnaire_ibfk_1` FOREIGN KEY (`formation_ID`) REFERENCES `formation` (`formation_ID`);

--
-- Contraintes pour la table `remplir`
--
ALTER TABLE `remplir`
  ADD CONSTRAINT `remplir_ibfk_1` FOREIGN KEY (`utilisateur_ID`) REFERENCES `candidat` (`utilisateur_ID`),
  ADD CONSTRAINT `remplir_ibfk_2` FOREIGN KEY (`questionnaire_ID`) REFERENCES `questionnaire` (`questionnaire_ID`);

--
-- Contraintes pour la table `repondre`
--
ALTER TABLE `repondre`
  ADD CONSTRAINT `repondre_ibfk_1` FOREIGN KEY (`proposition_ID`) REFERENCES `proposition` (`proposition_ID`),
  ADD CONSTRAINT `repondre_ibfk_2` FOREIGN KEY (`reponse_candidat_ID`) REFERENCES `reponse_candidat` (`reponse_candidat_ID`);

--
-- Contraintes pour la table `reponse_candidat`
--
ALTER TABLE `reponse_candidat`
  ADD CONSTRAINT `reponse_candidat_ibfk_1` FOREIGN KEY (`utilisateur_ID`) REFERENCES `candidat` (`utilisateur_ID`),
  ADD CONSTRAINT `reponse_candidat_ibfk_2` FOREIGN KEY (`question_ID`) REFERENCES `question` (`question_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
