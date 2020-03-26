<?php
    // import pdo fonction sur la database
    require '../pdo/pdo_db_functions.php';
    // on demarre une session la session
    session_start(); 
    
   // on ajoute en variable de session le numero d identification du test qui doit etre affiche
   $_SESSION['test']['id_questionnaire'] = $_POST['questionnaire_ID'];
   // on ajoute en variable de session le un timestamp pour avoir l heure de debut du test
   $_SESSION['test']['time_debut'] = time();        

    // on  redirige vers la page du test associe a la formation
    header('location: /../questionnaire_test.php');
?>