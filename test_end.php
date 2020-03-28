<?php
// on démarre la session
session_start ();
// import du script pdo des fonctions qui accedent a la base de donnees
require 'pdo/pdo_db_functions.php';
// verification que l utilisateur ne passe pas par l URL si le dossier de candidature n est pas valide
if (isset($_SESSION['current']) && ($_SESSION['current']['userRole'] == 'Visitor')) {
    header('location: index.php');
}
// verification que l utilisateur ne passe pas par l URL a partir de la page de selection des formation
// dossier valide mais pas selectionne de formation - test
if(isset($_SESSION['test']) && (!$_SESSION['test']['start'])) {
    header('location: formation_choix.php');
}
// verification que l utilisateur ne passe pas par l URL sans termine le test
if(isset($_SESSION['test']) && (!$_SESSION['test']['end'])) {
    header('location: formation_questionnaire.php');
}
// ----------------------------//---------------------------
//                      variables de session
// ---------------------------------------------------------
//----------------------------//----------------------------s
//                        CURRENT SESSION
// nom de la page en cours
$_SESSION['current']['page'] = 'congrat';
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
            <div class="py-5">
                <h2 class="font-weight-bold text-uppercase">Félicitations, vous avez répondu à toutes les questions</h2>
                <h2 class="font-weight-bold text-uppercase">Nous allons prendre contact avec vous pour convenir d'un entretien individuel</h2>
                <!-- area pour afficher un message d erreur lors de la validation des questions -->
                <div class="alert alert-danger <?=($_SESSION['error']['message'] != '') ? 'd-block' : 'd-none'; ?> text-center mt-5" role="alert">
                    <p class="lead mt-2"><span><?=$_SESSION['error']['message'] ?></span></p>
                </div>
                <!-- /area pour afficher un message d erreur lors de la validation des questions -->
            </div>
            <!-- /titre de la page du dossier de candidature -->   

            <!-- bouton pour retourner a la page index et effacer toutes les variables de session --> 
            <div class="row">                
                <a type="submit" class="btn btn-success btn-lg btn-block" href="/logout.php">Terminer votre session</a>
            </div>
            <!-- /bouton pour retourner a la page index et effacer toutes les variables de session --> 

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
