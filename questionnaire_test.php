<?php
// on démarre la session
session_start ();
// import du script pdo des fonctions qui accedent a la base de donnees
require 'pdo/pdo_db_functions.php';
// ----------------------------//---------------------------
//                      variables de session
// ---------------------------------------------------------
//----------------------------//----------------------------s
//                        CURRENT SESSION
// nom de la page en cours
$_SESSION['current']['page'] = 'questionnaire';
// jauge de la barre de progression
$_SESSION['current']['progressbar'] = 100;
//                        CURRENT SESSION
//----------------------------//----------------------------
//----------------------------//----------------------------
//                     ERROR MANAGEMENT
// on efface le message d erreur d une autre page
if ($_SESSION['current']['page'] != $_SESSION['error']['page']) {$_SESSION['error']['message'] = '';}
//                     ERROR MANAGEMENT
//----------------------------//----------------------------
// ----------------------------------------------------------
//                  variables de session
// ----------------------------//-----------------------------
?>
<!DOCTYPE html>
<html lang="fr">
	<head>
		<!-- default Meta -->
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>CCI Formation - Questionnaire de test de vos connaissances pour la formation</title>
		<meta name="author" content="Franck Jakubowski">
		<meta name="description" content="Un site pour que les futurs candidats puissent passer le test correspondant à la formation qu'ils veulent suivre après avoir rempli un formulaire de renseignements">
		<!--  
            favicons 
            -->
		<!-- bootstrap stylesheet -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
            integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <!-- font awesome stylesheet -->
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
		<!-- default stylesheet -->
        <link href="css/global.css" rel="stylesheet" type="text/css">
        <!-- includes stylesheet -->
        <link href="css/header.css" rel="stylesheet" type="text/css">
        <link href="css/footer.css" rel="stylesheet" type="text/css">
    </head>    
    
	<body>   
        <!-- import du header -->
        <?php include 'includes/header.php'; ?>
        <!-- /import du header -->
        
        <div class="container pt-3 mb-5">
            <!-----------------------------------------------//---------------------------------------------------
                                                                    container global 
            ----------------------------------------------------------------------------------------------------->            
            <!-- titre de la page du dossier de candidature -->
            <div class="py-5 text-center">
                <h2 class="font-weight-bold text-uppercase">Veuillez répondre à ce questionnaire</h2>
                <h4 class="font-weight-bold text-uppercase text-muted">(plusieurs réponses peuvent être possibles)</h4>
                <!-- area pour afficher un message d erreur lors de la validation des questions -->
                <div class="alert alert-danger <?=($_SESSION['error']['message'] != '') ? 'd-block' : 'd-none'; ?> mt-5" role="alert">
                    <p class="lead mt-2"><span><?=$_SESSION['error']['message'] ?></span></p>
                </div>
                <!-- /area pour afficher un message d erreur lors de la validation des questions -->
            </div>
            <!-- /titre de la page du dossier de candidature -->     
            <!-------------------- formulaire pour afficher les questions et reponses ----------------------------->
            <form class="" action="php_process/qcm_form_process.php" method="POST">                                               
                <!-------------------------------------------//---------------------------------------------------
                                                                    questionnaire
                ----------------------------------------------------------------------------------------------------->
                <div class="card">
                    <h5 class="card-header text-right">Question 1/20</h5>
                    <!-- passage de l identifiant de la question en parametre cache -->
                    <input type="hidden" id="questionId" name="questionId" value=1>
                    <!-- /passage de l identifiant de la question en parametre cache -->
                    <div class="card-body">
                        <h5 class="card-title">Quel est le prénom de Kev Adams ?</h5>
                        <ul class="form-check pl-5">
                            <li><input class="form-check-input" type="checkbox" id="checkboxQuestion1" name="checkboxQuestion1[]" value=1>
                            <label class="form-check-label" for="checkboxQuestion1">Kevin</label></li>
                            <li><input class="form-check-input" type="checkbox" id="checkboxQuestion1" name="checkboxQuestion1[]" value=2>
                            <label class="form-check-label" for="checkboxLicencseTrue">Jean-Pascal</label></li>
                            <li><input class="form-check-input" type="checkbox" id="checkboxQuestion1" name="checkboxQuestion1[]" value=3>
                            <label class="form-check-label" for="checkboxQuestion1">Damien</label></li>
                        </ul>
                    </div>
                </div>
                <!--------------------------------------------//---------------------------------------------------
                                                                    questionnaire
                ----------------------------------------------------------------------------------------------------->
                <hr class="mb-4">
                <!-- bouton validation du questionnaire -->
                <button class="btn btn-primary btn-lg btn-block" type="submit">Valider</button>
                <!-- /bouton validation du questionnaire -->
            </form>
            <!-------------------- /formulaire pour afficher les questions et reponses ----------------------------->      

            <!-----------------------------------------------------------------------------------------------------
                                                                 /container global
            -------------------------------------------------//---------------------------------------------------->   
        </div>

        <!-- import du header -->
        <?php include 'includes/footer.php'; ?>
        <!-- /import du header -->
        <!------------------------------------------>
            <?=var_dump($_SESSION) ?>
        <!------------------------------------------>
        <!-- import scripts -->
		<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
			integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
			crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
			integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
			crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
			integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
			crossorigin="anonymous"></script>
		<!-- /import scripts -->
	</body>
</html>
