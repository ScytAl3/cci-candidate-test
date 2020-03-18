<?php
    // import pdo fonction sur la database
    require '../pdo/pdo_db_functions.php';
    // on demarre une session la session
    session_start(); 
    
    //                      TODO
    //       - controle de la saisie -
    //
    // on  redirige vers la page de selection des formation
    header('location: /../training_test.php');
?>