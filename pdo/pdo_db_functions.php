<?php
// -- import du script de connexion a la db
require 'pdo_db_connect.php'; 

///////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                      Les Fonctions candidat                                           //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

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
        $msg = 'ERREUR PDO Liste déroulate $table..' . $ex->getMessage(); 
        die($msg);
    }
    // on retourne le resultat
    return $myReader;
}
