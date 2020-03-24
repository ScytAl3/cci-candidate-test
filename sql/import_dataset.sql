#----------------------------------------------------------------------------------------
#                     JEU DE DONNEES
#----------------------------------------------------------------------------------------

#----------------------- DONNEES ASSOCIEES UTLISATEUR -----------------------

#-----------------------------------------------------------
# Table: ROLE - Data
#-----------------------------------------------------------
INSERT INTO 
	`role`(`role_Name`) 
VALUES 
	('Administrateur'),
	('Formateur');

#-----------------------------------------------------------
# Table: DIPLOME - Data
#-----------------------------------------------------------
INSERT INTO 
	`diplome`(`diplome_libelle`) 
VALUES 
	("BEP - Brevet d'études professionnelles"),
	("CAP - Certificat d'aptitude professionnelle"),
	("TP niveau V - Titre professionnel"),
	("BP - Brevet professionnel"),
	("BAC - Baccalauréat"),
	("TP niveau IV - Titre professionnel"),
	("BTS - Brevet de technicien supérieur"),
	("DUT - Diplôme universitaire de technologie"),
	("TP niveau III - Titre professionnel"),
	("Licence"),
	("Maîtrise"),	
	("Master");

#-----------------------------------------------------------
# Table: NIVEAU_ETUDE - Data
#-----------------------------------------------------------
INSERT INTO 
	`niveau_etude`(`niveau_etude_Libele`)
VALUES
	('Niveau 3 - BEP, CAP'),
	('Niveau 4 - Baccalauréat'),
	('Niveau 5 - DEUG, BTS, DUT, DEUST'),
	('Niveau 6 - Licence, licence professionnelle'),
	('Niveau 6 - Maîtrise, master 1'),
	("Niveau 7 - Master, diplôme d'études supérieures spécialisées, diplôme d'ingénieur");
	
#-----------------------------------------------------------
# Table: SITUATION_FAMILLE - Data
#-----------------------------------------------------------
INSERT INTO 
	`situation_famille`(`situation_famille_libele`) 
VALUES
	('Célibataire'),
	('Marié'),
	('Pacsé'),
	('Divorcé'),
	('Séparé'),
	('Veuf');

#----------------------- DONNEES ASSOCIEES CENTRE -----------------------

#-----------------------------------------------------------
# Table: VILLE - Data
#-----------------------------------------------------------
INSERT INTO 
	`ville`(`ville_Name`, `ville_ZipCode`) 
VALUES
	('Metz', '57070'),		-- 1
	('Yutz', '57970'),		-- 2
	('Sarrebourg', '57400'),		-- 3
	('Sarreguemines', '57200'),		-- 4
	('Forbach', '57600');		-- 5

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
	`formation`(`formation_Intitule`)
VALUES
	('Administratif / Accueil'),		-- 1
	('Commercial'),			-- 2
	('Comptabilité / Gestion'),		-- 3
	('Bureautique'),		-- 4
	('Qualité / Sécurité / Environnement'),		-- 5
	('Communication'),		-- 6
	("Informatique / Système d'information");		-- 7

#-----------------------------------------------------------
# Table: dispenser - Data
#-----------------------------------------------------------
INSERT INTO 
	`dispenser`(`centre_Id`, `formation_ID`, `dateDebutFormation`, `dateFinFormation`)
VALUES
	(1, 1, '2020-04-01', '2020-06-01'),
	(1, 3, '2020-04-15', '2020-10-01'),
	(1, 6, '2020-04-23', '2020-05-22'),
	(1, 7, '2020-04-01', '2021-02-01'),
	(2, 2, '2020-04-13', '2020-05-01'),
	(2, 7, '2020-05-01', '2021-03-01'),
	(5, 4, '2020-05-05', '2020-05-29'),
	(5, 5, '2020-05-12', '2020-05-05'),
	(5, 7, '2020-05-18', '2021-03-18');
