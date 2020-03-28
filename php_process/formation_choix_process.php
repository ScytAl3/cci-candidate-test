<?php
    // import pdo fonction sur la database
    require '../pdo/pdo_db_functions.php';
    // on demarre une session la session
    session_start(); 

    // si le formulaire a ete soumis (controle de validite realise en HTML5 avec l attribut required)   
    if (isset($_POST['submit'])) {
        // ajoute en variable de session le numero identifiant de la formation selectionnee
        if(empty($_SESSION['test']['id_formation'])) {
            $_SESSION['test']['id_formation'] = $_POST['formationChoix'];
        }
        // appelle de la fonction qui retourne le numero identifiant du questionnaire associe a la formation choisie
        $questionnaire_ID = associatedTest($_POST['formationChoix']);
        //
        //var_dump($questionnaire_ID); die;
        //        
        // ajoute en variable de session le numero identifiant du test qui doit etre affiche
        if(empty($_SESSION['test']['id_questionnaire'])) {
            $_SESSION['test']['id_questionnaire'] = $questionnaire_ID;
        }
        // ajoute en variable de session le numero d identification de la premiere question du test 
        if(empty($_SESSION['test']['id_question'])) {
            array_push($_SESSION['test']['id_question'], (int) firstQuestionId($questionnaire_ID));
        }   
        // ajoute en variable de session le timestamp pour avoir l heure de debut du test
        if(empty($_SESSION['test']['time_debut'])) { 
            $_SESSION['test']['time_debut'] = time();  
        }  
        // passe la variable de session de debut de test a TRUE
        $_SESSION['test']['start'] = true;
        // on  redirige vers la page du test associe a la formation
        header('location: /../formation_questionnaire.php');
    }
   
?>