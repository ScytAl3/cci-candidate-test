<?php
    // import pdo fonction sur la database
    require '../pdo/pdo_db_functions.php';
    // on demarre une session la session
    session_start(); 
    
    
   
    // on  redirige vers la page du test associe a la formation
    header('location: /../formation_questionnaire.php');
?>