<?php
    // import pdo fonction sur la database
    require '../pdo/pdo_db_functions.php';
    // on demarre une session la session
    session_start(); 

    //var_dump($_POST); die;

    // verification que la reponse existe
    if(!isset($_POST['checkboxQuestion1'])) {
       // on renvoie un message d erreur (aucune case cochée)
        $_SESSION['error']['page'] = 'questionnaire';
        $_SESSION['error']['message'] = "Veuillez coché une réponse avant de valider!";
        // on redirige vers la page de login
        header('location:/../training_test.php');
        exit();
    }

    // on compte le nombre de reponse a la question
    $nb_reponse = count($_POST['checkboxQuestion1']);

    //echo $nb_reponse; die;

    // si plus de 1 reponse 
    if ($nb_reponse > 1) {
        // on renvoie un message d erreur (trop de cases cochées)
        $_SESSION['error']['page'] = 'questionnaire';
        $_SESSION['error']['message'] = "Il n'y a q'une seule réponse à cette question!";
        // on redirige vers la page de login
        header('location:/../training_test.php');
        exit();
    }

    // si choix Jean-Pascal
    if ($_POST['checkboxQuestion1'][0] == '2') {
        // on renvoie un message d erreur
        $_SESSION['error']['page'] = 'questionnaire';
        $_SESSION['error']['message'] = "Non ce n'est pas Jean-Pascal!";
        // on redirige vers la page de login
        header('location:/../training_test.php');
        exit();
    }

    // si choix Damien
    if ($_POST['checkboxQuestion1'][0] == '3') {
        // on renvoie un message d erreur
        $_SESSION['error']['page'] = 'questionnaire';
        $_SESSION['error']['message'] = "Non ce n'est pas Damien!";
        // on redirige vers la page de login
        header('location:/../training_test.php');
        exit();
    }

    // on  redirige vers la page de congratulations
    $_SESSION['error']['page'] = 'congrat';
    $_SESSION['error']['message'] = "Vous n'êtes pas tombé dans le piège à Kevin!";
    // on redirige vers la page de login
    header('location:/../test_end.php');
    exit();
?>