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

#----------------------- DONNEES ASSOCIEES TEST -----------------------

#-----------------------------------------------------------
# Table: QUESTIONNAIRE - Data
#-----------------------------------------------------------
INSERT INTO 
	`questionnaire`(`questionnaire_libele`, `questionnaie_cearte_at`, `questionnaire_update_at`, `formation_ID`) 
VALUES
	('Test de connaissances Web', now(), NULL, 7),		-- 01
	('Test de connaissnces bureatique', now(), NULL, 4);		-- 02

#-----------------------------------------------------------
# Table: QUESTION - Data
#-----------------------------------------------------------
INSERT INTO 
	`question`(`question_libele`, `question_multiple`, `question_create_at`, `question_update_ate`, `questionnaire_ID`) 
VALUES
	('Quel est le langage informatique le plus courant utilisé pour écrire les pages web ?', 0, now(), NULL, 1),		-- 1
	('Qu’est-ce qu’une adresse IP ?', 0, now(), NULL, 1),		-- 2
	('Que veut dire FTP ?', 0, now(), NULL, 1),		-- 3
	('W3C ça vous parle ?', 1, now(), NULL, 1),		-- 4
	("Quel est le doctype d'un document HTML5 ?", 0, now(), NULL, 1),		-- 5
	('Que signifie CSS ?', 0, now(), NULL, 1),		-- 6
	('Pourquoi utilise-t-on généralement du CSS ?', 0, now(), NULL, 1),		-- 7
	('Où est-il conseillé de placer le code CSS ?', 0, now(), NULL, 1),		-- 8
	('Que signifie PHP ?', 0, now(), NULL, 1),		-- 9
	('En PHP une variable est considérée comme null si :', 1, now(), NULL, 1),		-- 10
	('Dans Windows, pouvez-vous travailler sur plusieurs applications à la fois ?', 0, now(), NULL, 2),		-- 11
	('Pour appeler un menu contextuel, vous utilisez :', 0, now(), NULL, 2);		-- 12

#-----------------------------------------------------------
# Table: PROPOSITION - Data
#-----------------------------------------------------------
INSERT INTO 
	`proposition`(`proposition_libele`, `proposition_vrai`, `question_ID`) 
VALUES
	('HTML (Hypertext Markup Language)', 1, 1),		-- 01
	('HTTP (Hypertext Transfer Protocol)', 0, 1),		-- 02
	('JavaScript', 0, 1),		-- 03
	('Un numéro qui identifie chaque matériel informatique (ordinateur, routeur, imprimante) connecté à un réseau informatique', 1, 2),		-- 04
	('Le protocole de communication utilisé sur Internet', 0, 2),		-- 05
	('L’adresse d’un site web, commençant par "http://"', 0, 2),		-- 06
	('File Transmission Protocol', 0, 3),		-- 07
	('File Transfer Protocol', 1, 3),		-- 08
	('Fiber twisted pairs', 0, 3),		-- 09
	('Ça veut dire World Wide Web Consortium', 1, 4),		-- 10
	("C’est un nouveau groupe de K-pop", 0, 4),		-- 11
	("C’est un organisme de standardisation chargé de promouvoir la compatibilité des technologies du World Wide Web", 1, 4),		-- 12
	('"<"!DOCTYPE html5">"', 0, 5),		-- 13
	('"<"!DOCTYPE html">"', 1, 5),		-- 14
	('"<"!DOCTYPE html PUBLIC "-//W3C//DTD HTML5.0 Strict//EN">"', 0, 5),		-- 15
	('Cascading Style Sheets', 1, 6),		-- 16
	('Create Simple Sample', 0, 6),		-- 17
	('Cascading Simple Style', 0, 6),			-- 18
	('Pour compliquer notre développement Web', 0, 7),		-- 19
	('Pour séparer le contenu et la présentation des documents web', 1, 7),		-- 20
	('Pour faire des dégradés de couleurs', 0, 7),		-- 21
	('Dans le "<"body">"', 0, 8),		-- 22
	('Entre les balises "<"head">"', 0, 8),		-- 23
	('Dans un fichier externe utilisable pour plusieurs pages', 1, 8),		-- 24
	('Dans ton cul tout simplement', 0, 8),		-- 25
	('Page Helper Process', 0, 9),		-- 26
	('Programming Home Pages', 0, 9),		-- 27
	('PHP: Hypertext Preprocessor', 1, 9),		-- 28
	("elle s'est vue assigner la constante NULL", 1, 10),		-- 29
	("elle n'a pas encore reçu de valeur", 1, 10),		-- 30
	('La variable a été évalué avec la fonction is_null()', 0, 10),		-- 31
	('elle a été effacée avec la fonction unset()', 1, 10),		-- 32
	('Oui', 1, 11),
	('Non', 0, 11),
	('"clic g" sur un objet ou une sélection ', 0, 12),
	('"clic d" sur un objet, une sélection ou à la position du pointeur ', 1, 12),
	('"double clic" dans la sélection', 0, 12),
	('"maj+clic g" à la position du pointeur requise', 0, 12);
