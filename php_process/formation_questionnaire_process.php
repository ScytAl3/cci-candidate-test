<?php
    // import pdo fonction sur la database
    require '../pdo/pdo_db_functions.php';
    // on demarre une session la session
    session_start(); 
    var_dump($_POST['checkboxQuestion']); die;
    // si le formulaire a ete soumis (controle de validite realise en HTML5 avec l attribut required)   
    if (isset($_POST['submit'])) {
        // on verifie qu au moins une reponse a ete coche par le candidat
        if(empty($_POST['checkboxQuestion'])) {
            // on renvoie un message d erreur (saisir au moins un numero de telephone)
            $_SESSION['error']['page'] = 'questionnaire';
            $_SESSION['error']['message'] = "Vous devez cocher au moins une réponse!";
            // on redirige vers la page de login
            header('location:/../formation_questionnaire.php');
            exit();
        } else {
            // on ajoute les identifiants des reponses cochees dans le tableau de session des reponses

        }
    }
    
   
    // on  redirige vers la page du test associe a la formation
    header('location: /../formation_questionnaire.php');
?>