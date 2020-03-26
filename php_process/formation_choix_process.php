<?php
    // import pdo fonction sur la database
    require '../pdo/pdo_db_functions.php';
    // on demarre une session la session
    session_start(); 
    
   // on ajoute en variable de session le numero d identification du test qui doit etre affiche
   // si retour pour changer de selection
   if(empty($_SESSION['test']['id_questionnaire']) || ($_SESSION['test']['id_questionnaire'] === $_POST['questionnaire_ID'])) {
       $_SESSION['test']['id_questionnaire'] = $_POST['questionnaire_ID'];
   } else {
        // on renvoie un message d erreur (saisir au moins un numero de telephone)
        $_SESSION['error']['page'] = 'training_choice';
        $_SESSION['error']['message'] = "Vous ne pouvez plus selectionner une autre formation le chronomètre du test à débuté!";
        // on redirige vers la page de login
        header('location:/../formation_choix.php');
        exit();
   }
   // on ajoute en variable de session le numero d identification de la premiere question du test   
   // si c est le premier passage
   if(empty($_SESSION['test']['id_question'])) {
       array_push($_SESSION['test']['id_question'], (int) firstQuestionId());
   }   
   // on ajoute en variable de session le un timestamp pour avoir l heure de debut du test
   // si premier passage
   if(empty($_SESSION['test']['time_debut'] = time())) {
       $_SESSION['test']['time_debut'] = time();  
   }  

    // on  redirige vers la page du test associe a la formation
    header('location: /../formation_questionnaire.php');
?>