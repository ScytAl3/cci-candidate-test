<?php
    // import pdo fonction sur la database
    require '../pdo/pdo_db_functions.php';
    // on demarre une session la session
    session_start(); 

    // si le formulaire a ete soumis (controle de validite realise en HTML5 avec l attribut required)   
    if (isset($_POST['submit'])) {
        // on appelle la fonction qui retourne le numero identifiant du questionnaire associe a la formation choisie
        $questionnaire_ID = associatedTest($_POST['formationChoix']);
        //
        //var_dump($questionnaire_ID); die;
        //
        // on ajoute en variable de session le numero d identification du test qui doit etre affiche
        // si retour pour changer de selection
        if(empty($_SESSION['test']['id_questionnaire']) || ($_SESSION['test']['id_questionnaire'] === (int) $questionnaire_ID)) {
            $_SESSION['test']['id_questionnaire'] = (int) $questionnaire_ID;
        } else {
                // on renvoie un message d erreur
                $_SESSION['error']['page'] = 'formation_choix';
                $_SESSION['error']['message'] = "Vous ne pouvez plus selectionner une autre formation le chronomètre du test à débuté!";
                // on redirige vers la page de login
                header('location:/../formation_choix.php');
                exit();
        }
        // on ajoute en variable de session le numero d identification de la premiere question du test   
        // si c est le premier passage
        if(empty($_SESSION['test']['id_question'])) {
            array_push($_SESSION['test']['id_question'], (int) firstQuestionId($questionnaire_ID));
        }   
        // on ajoute en variable de session le un timestamp pour avoir l heure de debut du test
        // si premier passage
        if(empty($_SESSION['test']['time_debut'] = time())) {
            $_SESSION['test']['time_debut'] = time();  
        }  
        // on  redirige vers la page du test associe a la formation
        header('location: /../formation_questionnaire.php');
    }
   
?>