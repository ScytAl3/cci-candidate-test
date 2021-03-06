<?php
    // import pdo fonction sur la database
    require '../pdo/pdo_db_functions.php';
    // on demarre une session la session
    session_start(); 
    
    // si le formulaire a ete soumis (controle de validite realise en HTML5 avec l attribut required)   
    if (isset($_POST['submit'])) {
        // verification qu au moins une reponse a ete coche par le candidat
        if(empty($_POST['checkboxQuestion'])) {
            // renvoie un message d erreur (saisir au moins un numero de telephone)
            $_SESSION['error']['page'] = 'questionnaire';
            $_SESSION['error']['message'] = "Vous devez cocher au moins une réponse!";
            // redirection vers la question en cours a la page du questionnaire
            header('location:/../formation_questionnaire.php');
            exit();
        } 
        // met le message d erreur a vide
        $_SESSION['error']['message'] = '';
        //-----------------------------------------------------------------------------------------------------------
        //      ajoute dans le tableau de session des reponses les identifiants des reponses cochees
        //-----------------------------------------------------------------------------------------------------------
        array_push($_SESSION['test']['reponse'], $_POST['checkboxQuestion']);
        $currentId = $_POST['currentQuestion_ID'];
        $questionnaire_ID = $_SESSION['test']['id_questionnaire'];
        // recupere le  numero identifiant de la prochaine question
        $nextQuestionId = nextQuestionId($currentId, $questionnaire_ID);
        //echo $nextQuestionId; die;
        // tant qu il reste un identifiant question - candidat n est pas arrive a la fin du questionnaire
        if ($nextQuestionId != 0) {
            //---------------------------------------------------------------------------------------------------------------------
            //      ajoute le numero identifiant de la prochaine question dans la tableau de session des question
            //---------------------------------------------------------------------------------------------------------------------
            array_push($_SESSION['test']['id_question'], (int) $nextQuestionId);
            // redirection vers la question suivant sur la page du questionnaire
            header('location: /../formation_questionnaire.php');
        } else {
            // sinon le candidat est arrive a la fin du questionnaire
            //
            // traitement des reponses au questionnaire du candidat dans la base de donnees
            // besoin 
            //          |   du numero identifiant du questionnaire
            //          |   du numero identifiant du candidat
            //                  >   table remplir + date de debut et fin
            //          |   du numero identifiant des questions
            //                  >   table REPONSE_CANDIDAT iteration tableau de session des questions
            //                              |   numero identifiant des reponses
            //                                      >   table repondre iteration tableau de session des reponses
            //
            // recuperation numero identifiant du questionnaire
            $questionnaire_id = $_SESSION['test']['id_questionnaire'];
            // recuperation numero identifiant du candidat
            $candidat_id = $_SESSION['current']['userId'];
            //recuperation numero identifiant de la formation
            $formation_id = $_SESSION['test']['id_formation'];
            // recuperation du timestamp de debut du questionnaire
            // set the timezone
            date_default_timezone_set("Europe/Paris");
            $questionnaire_begin = date('Y-m-d H:i:s', $_SESSION['test']['time_debut']);
            // recperation du tableau des numeros identifiants des questions
            $questionArray = $_SESSION['test']['id_question'];
            // recperation du tableau des numeros identifiants des reponses
            $answersArray = $_SESSION['test']['reponse'];
            //--------------------------------------------------------------------------------------------------------------------------------------
            //                                      CREATION DES REPONSES AU QUESTIONNAIRE DU CANDIDAT
            //--------------------------------------------------------------------------------------------------------------------------------------
            // passage de toutes les variables a la fonction qui va creer les inserts dans la base de donnees lors d une transaction
            $answersCandidat = createAnswersCandidat($candidat_id, $questionArray, $answersArray);
            // si la creation c est bien derouler on peut mettre a jour la date de debut et de fin du test associe au candidat et au questionnaire
            if($answersCandidat) {
                $questionaireTime = testDuration($candidat_id, $questionnaire_id, $questionnaire_begin);
                // creation d une entree dans la table candidater avec l identifiant candidat et identifiant de la formation correspondant au questionnaire
                $candidaterA = candidatFormation($candidat_id, $formation_id);
                // passe la variable de session de fin de test a TRUE
                $_SESSION['test']['end'] = true;
                // redirection vers la page de fin du test associe a la formation
                header('location: /../test_end.php');
            }
        }          
    }         
?>