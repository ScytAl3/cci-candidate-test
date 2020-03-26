<?php
// -- import du script de connexion a la db
require 'pdo_db_connect.php'; 

///////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                      Les Fonctions candidat                                           //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ---------------------------------------------------------------------------
//              fonction pour remplir les listes deroulantes
// ---------------------------------------------------------------------------
/**
 * renvoie le numero d identification et le libele des tables servant a remplir les listes deroulantes
 * 
 * @param String    nom de la table sur lequel porte le select
 * 
 * @return Array    retourne un tableau avec la liste demandee
 */
function dropDownListReader($table) {
    // on instancie une connexion
    $pdo = my_pdo_connexxion();   
    // preparation de la requete preparee 
    $queryList = "SELECT * 
                            FROM $table";   
    // preparation de la requete pour execution
    try {
        $statement = $pdo -> prepare($queryList, array(PDO::ATTR_CURSOR => PDO::CURSOR_FWDONLY));
        // execution de la requete
        $statement -> execute();
        // on verifie s il y a des resultats
        // --------------------------------------------------------
        //var_dump($statement->fetchColumn()); die; 
        // --------------------------------------------------------
        if ($statement->rowCount() > 0) {
            $myReader = $statement->fetchAll();            
        } else {
            $myReader = false;
        }   
        $statement -> closeCursor();
    } catch(PDOException $ex) {         
        $statement = null;
        $pdo = null;
        $msg = "ERREUR PDO Liste déroulate $table.." . $ex->getMessage(); 
        die($msg);
    }
    // on retourne le resultat
    return $myReader;
}

// -----------------------------------------------------------------------------------------------------------------------
//              fonction pour creer un utilisateur - candidat avec une transaction  pour rollback au cas ou
// -----------------------------------------------------------------------------------------------------------------------
/**
 * creer un utilisateur dans la base de donnees puis un candidat en recuperant le numero de l'utilisateur qui vient d etre cree
 * 
 * @param Array tableau contenant les informations saisies necessaires pour creer l utilisateur
 * @param Array tableau contenant les informations saisies necessaires pour creer le candidat
 * 
 * @return Int  retourne le numero d identification qui vient d etre cree
 */
function createUser($userData, $candidatData) {
    // on instancie une connexion
    $pdo = my_pdo_connexxion();
    // PDO pour creer une exception en cas d'erreur afin de faciliter le traitement des erreurs
    $pdo ->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    // on place les requetes dans le bloc TRY/CATCH pour annuler la tansaction en cas de probleme
    try {
        // debut de la transaction
        $pdo -> beginTransaction();

        //-----------------------------------//-------------------------------------
        //                               debut creation utilisteur
        //--------------------------------------------------------------------------
        // preparation de la requete pour creer un utilisateur
        $userInsert = "INSERT INTO 
                                    `utilisateur` (`utilisateur_nom`, `utilisateur_prenom`, `utilisateur_email`, `utilisateur_telFixe`, `utilisateur_telMobile`, `utilisateurCreated_at`) 
                                VALUES (
                                    :bp_nom,
                                    :bp_prenom,
                                    :bp_email,
                                    :bp_telFixe,
                                    :bp_telMobile,
                                    now()
                                    )";
        // preparation de la requete pour execution
        $statement = $pdo -> prepare($userInsert, array(PDO::ATTR_CURSOR => PDO::CURSOR_FWDONLY));
        // passage des paremetres
        $statement -> bindParam('bp_nom', $userData['nom'], PDO::PARAM_STR);
        $statement -> bindParam('bp_prenom', $userData['prenom'], PDO::PARAM_STR);
        $statement -> bindParam('bp_email', $userData['email'], PDO::PARAM_STR);
        $statement -> bindParam('bp_telFixe', $userData['telFixe'], PDO::PARAM_STR);
        $statement -> bindParam('bp_telMobile', $userData['telMobile'], PDO::PARAM_STR);
        // execution de la requete
        $statement -> execute();
        $statement -> closeCursor();
        // recupere le le numero utilisateur genere
        $newUserId = $pdo -> lastInsertId();
        //--------------------------------------------------------------------------
        //                                  fin creation utilisteur
        //-----------------------------------//-------------------------------------

        //-----------------------------------//-------------------------------------
        //                               debut creation candidat
        //--------------------------------------------------------------------------
        // preparation de la requete pour creer le candidat
        $candidatInsert = "INSERT INTO 
                                            `candidat`(`utilisateur_ID`, `nomJeuneFille`, `dateNaissance`, `numeroSecu`, `lieuNaissance`, `departementNaissance`, `nationnalite`, `voiturePermis`, `voiturePersonnelle`, `nomUrgence`, `telUrgence`, `derniereClasse`, `adresse`, `adresseSuite`, `codePostal`, `ville`, `NbEnfants`, `dateInscPoleEmploi`, `identiantPoleEmploi`, `agencePoleEmploi`, `nomConseiller`, `indemnisation`, `typeIndemnisation`, `rsa`, `ayantDroit`, `situation_famille_ID`, `niveau_etude_ID`, `diplome_ID`)
                                        VALUES (
                                            :bp_utilisateur_ID,
                                            :bp_nomJeuneFille,
                                            :bp_dateNaissance,
                                            :bp_numeroSecu,
                                            :bp_lieuNaissance,
                                            :bp_departementNaissance,
                                            :bp_nationnalite,
                                            :bp_voiturePermis,
                                            :bp_voiturePersonnelle,
                                            :bp_nomUrgence,
                                            :bp_telUrgence,
                                            :bp_derniereClasse,
                                            :bp_adresse,
                                            :bp_adresseSuite,
                                            :bp_codePostal,
                                            :bp_ville,
                                            :bp_NbEnfants,
                                            :bp_dateInscPoleEmploi,
                                            :bp_identiantPoleEmploi,
                                            :bp_agencePoleEmploi,
                                            :bp_nomConseiller,
                                            :bp_indemnisation,
                                            :bp_typeIndemnisation,
                                            :bp_rsa,
                                            :bp_ayantDroit,
                                            :bp_situation_famille_ID,
                                            :bp_niveau_etude_ID,
                                            :bp_diplome_ID
                                            )";
         // preparation de la requete pour execution
        $statement = $pdo -> prepare($candidatInsert, array(PDO::ATTR_CURSOR => PDO::CURSOR_FWDONLY));
        // passage des paremetres
        $statement -> bindParam('bp_utilisateur_ID', $newUserId, PDO::PARAM_INT);
        $statement -> bindParam('bp_nomJeuneFille', $candidatData['nomJeuneFille'], PDO::PARAM_STR);
        $statement -> bindParam('bp_dateNaissance', $candidatData['dateNaissance'], PDO::PARAM_STR);
        $statement -> bindParam('bp_numeroSecu', $candidatData['numeroSecu'], PDO::PARAM_STR);
        $statement -> bindParam('bp_lieuNaissance', $candidatData['lieuNaissance'], PDO::PARAM_STR);
        $statement -> bindParam('bp_departementNaissance', $candidatData['departementNaissance'], PDO::PARAM_STR);
        $statement -> bindParam('bp_nationnalite', $candidatData['nationnalite'], PDO::PARAM_STR);
        $statement -> bindParam('bp_voiturePermis', $candidatData['voiturePermis'], PDO::PARAM_BOOL);
        $statement -> bindParam('bp_voiturePersonnelle', $candidatData['voiturePersonnelle'], PDO::PARAM_BOOL);
        $statement -> bindParam('bp_nomUrgence', $candidatData['nomUrgence'], PDO::PARAM_STR);
        $statement -> bindParam('bp_telUrgence', $candidatData['telUrgence'], PDO::PARAM_STR);
        $statement -> bindParam('bp_derniereClasse', $candidatData['derniereClasse'], PDO::PARAM_STR);
        $statement -> bindParam('bp_adresse', $candidatData['adresse'], PDO::PARAM_STR);
        $statement -> bindParam('bp_adresseSuite', $candidatData['adresseSuite'], PDO::PARAM_STR);
        $statement -> bindParam('bp_codePostal', $candidatData['codePostal'], PDO::PARAM_STR);
        $statement -> bindParam('bp_ville', $candidatData['ville'], PDO::PARAM_STR);
        $statement -> bindParam('bp_NbEnfants', $candidatData['NbEnfants'], PDO::PARAM_STR);
        $statement -> bindParam('bp_dateInscPoleEmploi', $candidatData['dateInscPoleEmploi'], PDO::PARAM_STR);
        $statement -> bindParam('bp_identiantPoleEmploi', $candidatData['identiantPoleEmploi'], PDO::PARAM_STR);
        $statement -> bindParam('bp_agencePoleEmploi', $candidatData['agencePoleEmploi'], PDO::PARAM_STR);
        $statement -> bindParam('bp_nomConseiller', $candidatData['nomConseiller'], PDO::PARAM_STR);
        $statement -> bindParam('bp_indemnisation', $candidatData['indemnisation'], PDO::PARAM_BOOL);
        $statement -> bindParam('bp_typeIndemnisation', $candidatData['typeIndemnisation'], PDO::PARAM_INT);
        $statement -> bindParam('bp_rsa', $candidatData['rsa'], PDO::PARAM_BOOL);
        $statement -> bindParam('bp_ayantDroit', $candidatData['ayantDroit'], PDO::PARAM_BOOL);
        $statement -> bindParam('bp_situation_famille_ID', $candidatData['situation_famille_ID'], PDO::PARAM_INT);
        $statement -> bindParam('bp_niveau_etude_ID', $candidatData['niveau_etude_ID'], PDO::PARAM_INT);
        $statement -> bindParam('bp_diplome_ID', $candidatData['diplome_ID'], PDO::PARAM_INT);
        // execution de la requete
        $statement -> execute();
        $statement -> closeCursor();
        //--------------------------------------------------------------------------
        //                                  fin creation candidat
        //-----------------------------------//-------------------------------------

        // on rend les modifications en base de donnees permanentes si tout c est bien deroule
        $pdo -> commit();

    } catch(PDOException $ex) {         
        // les inserts n ont pas ete realises on annule toutes les modification
        $pdo -> rollback();
        $statement = null;
        $pdo = null;
        $msg = 'ERREUR PDO create user...' . $ex->getMessage();
        die($msg); 
    }
    // on retourne le dernier Id cree
    return $newUserId;
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                      Les Fonctions formation                                         //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ----------------------------------------------------------------------------------------------------------------------------------------
//          fonction pour remplir la liste deroulante et permettre de desactiver la selection des formations sans tests
// ----------------------------------------------------------------------------------------------------------------------------------------
/**
 * renvoie le numero d identification et le libele des tables servant a remplir les listes deroulantes
 * 
 * @param String    nom de la table premiere table
 * @param String    nom de la table sur lequel porte la jointure
 * 
 * @return Array    retourne un tableau avec la liste demandee
 */
function joinDropDownListReader($leftTable, $rightTable) {
    // on instancie une connexion
    $pdo = my_pdo_connexxion();   
    // preparation de la requete preparee 
    $queryList = "SELECT f.formation_ID,  f.formation_Intitule,  q.questionnaire_ID
                            FROM $leftTable f
                            LEFT OUTER JOIN $rightTable q ON f.formation_ID = q.formation_ID";   
    // preparation de la requete pour execution
    try {
        $statement = $pdo -> prepare($queryList, array(PDO::ATTR_CURSOR => PDO::CURSOR_FWDONLY));
        // execution de la requete
        $statement -> execute();
        // on verifie s il y a des resultats
        // --------------------------------------------------------
        //var_dump($statement->fetchColumn()); die; 
        // --------------------------------------------------------
        if ($statement->rowCount() > 0) {
            $myReader = $statement->fetchAll();            
        } else {
            $myReader = false;
        }   
        $statement -> closeCursor();
    } catch(PDOException $ex) {         
        $statement = null;
        $pdo = null;
        $msg = "ERREUR PDO Liste déroulate $leftTable et $rightTable..." . $ex->getMessage(); 
        die($msg);
    }
    // on retourne le resultat
    return $myReader;
}

// ----------------------------------------------------------------------------------------------------------------------------------------
//                      fonction pour renvoyer le numero d identification de la premiere question
// ----------------------------------------------------------------------------------------------------------------------------------------
function firstQuestionId() {
    // on instancie une connexion
    $pdo = my_pdo_connexxion();   
    // preparation de la requete preparee 
    $selecttId = "SELECT question_ID
                            FROM `question`
                            ORDER BY question_ID ASC
                            LIMIT 1";
    // preparation de la requete pour execution
    try {
        $statement = $pdo -> prepare($selecttId, array(PDO::ATTR_CURSOR => PDO::CURSOR_FWDONLY));
        // execution de la requete
        $statement -> execute();
        // on verifie s il y a des resultats
        // --------------------------------------------------------
        //var_dump($statement->fetchColumn()); die; 
        // --------------------------------------------------------
        if ($statement->rowCount() > 0) {
            $firstId = $statement->fetch();            
        } else {
            $firstId = false;
        }   
        $statement -> closeCursor();
    } catch(PDOException $ex) {         
        $statement = null;
        $pdo = null;
        $msg = 'ERREUR PDO Récupération identifaint première question...' . $ex->getMessage(); 
        die($msg);
    }
    // on retourne le resultat
    return $firstId;
}

// ----------------------------------------------------------------------------------------------------------------------------------------
//                      fonction pour renvoyer le numero d identification de la prochaine question
// ----------------------------------------------------------------------------------------------------------------------------------------
function nextQuestionId($currentId) {
    // on instancie une connexion
    $pdo = my_pdo_connexxion();   
    // preparation de la requete preparee 
    $selecttId = "SELECT `question_ID`
                            FROM `question`
                            WHERE `question_ID` > :bp_current_ID
                            ORDER BY `question_ID` ASC
                            LIMIT 1";
    // preparation de la requete pour execution
    try {
        $statement = $pdo -> prepare($selecttId, array(PDO::ATTR_CURSOR => PDO::CURSOR_FWDONLY));
        // passage de l identifiant de la question en  parametre
        $statement->bindParam(':bp_current_ID', $currentId, PDO::PARAM_INT);
        // execution de la requete
        $statement -> execute();
        // on verifie s il y a des resultats
        // --------------------------------------------------------
        //var_dump($statement->fetchColumn()); die; 
        // --------------------------------------------------------
        if ($statement->rowCount() > 0) {
            $nextd = $statement->fetch();            
        } else {
            $nextd = false;
        }   
        $statement -> closeCursor();
    } catch(PDOException $ex) {         
        $statement = null;
        $pdo = null;
        $msg = 'ERREUR PDO Récupération identifaint prochaine question...' . $ex->getMessage(); 
        die($msg);
    }
    // on retourne le resultat
    return $nextd;
}

// ----------------------------------------------------------------------------------------------------------------------------------------
//                      fonction pour renvoier une question et les reponses possible d un questionnaire
// ----------------------------------------------------------------------------------------------------------------------------------------
function displayQuestion($questionnaireId, $questionId) {
    // on instancie une connexion
    $pdo = my_pdo_connexxion();   
    // preparation de la requete preparee 
    $queryList = "SELECT `question_libele`
                            FROM `question`
                            WHERE `questionnaire_ID` = :bp_questionnaire_ID
                            AND `question_ID` = :bp_question_ID";   
    // preparation de la requete pour execution
    try {
        $statement = $pdo -> prepare($queryList, array(PDO::ATTR_CURSOR => PDO::CURSOR_FWDONLY));
        // passage des  parametres
        $statement->bindParam(':bp_questionnaire_ID', $questionnaireId, PDO::PARAM_INT);
        $statement->bindParam(':bp_question_ID', $questionId, PDO::PARAM_INT);
        // execution de la requete
        $statement -> execute();
        // on verifie s il y a des resultats
        // --------------------------------------------------------
        //var_dump($statement->fetchColumn()); die; 
        // --------------------------------------------------------
        if ($statement->rowCount() > 0) {
            $myReader = $statement->fetch();            
        } else {
            $myReader = false;
        }   
        $statement -> closeCursor();
    } catch(PDOException $ex) {         
        $statement = null;
        $pdo = null;
        $msg = 'ERREUR PDO Récupération énoncé question..' . $ex->getMessage(); 
        die($msg);
    }
    // on retourne le resultat
    return $myReader;
}

function displayAnswers($questionId) {
    // on instancie une connexion
    $pdo = my_pdo_connexxion();   
    // preparation de la requete preparee 
    $queryList = "SELECT `proposition_ID`, `proposition_libele`
                            FROM `proposition`
                            WHERE `question_ID` = :bp_question_ID";   
    // preparation de la requete pour execution
    try {
        $statement = $pdo -> prepare($queryList, array(PDO::ATTR_CURSOR => PDO::CURSOR_FWDONLY));
        // passage de l identifiant de la question en  parametre
        $statement->bindParam(':bp_question_ID', $questionId, PDO::PARAM_INT);
        // execution de la requete
        $statement -> execute();
        // on verifie s il y a des resultats
        // --------------------------------------------------------
        //var_dump($statement->fetchColumn()); die; 
        // --------------------------------------------------------
        if ($statement->rowCount() > 0) {
            $myReader = $statement->fetchAll();            
        } else {
            $myReader = false;
        }   
        $statement -> closeCursor();
    } catch(PDOException $ex) {         
        $statement = null;
        $pdo = null;
        $msg = "ERREUR PDO Récupération réponses question $questionId..." . $ex->getMessage(); 
        die($msg);
    }
    // on retourne le resultat
    return $myReader;
}