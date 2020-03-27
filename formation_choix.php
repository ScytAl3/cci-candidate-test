<?php
// on démarre la session
session_start ();
// import du script pdo des fonctions qui accedent a la base de donnees
require 'pdo/pdo_db_functions.php';
// ----------------------------//---------------------------
//                      variables de session
// ---------------------------------------------------------
//----------------------------//----------------------------s
//                       CURRENT SESSION
// nom de la page en cours
$_SESSION['current']['page'] = 'formation_choix';
// jauge de la barre de progression
$_SESSION['current']['progressbar'] = 75;
//                       CURRENT SESSION
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
		<title>CCI Formation - Choix de la formation</title>
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
            <!-- titre de la page du choix de la formation -->
            <div class="py-5 text-center">
                <h2 class="font-weight-bold text-uppercase">Pour quelle formation postulez-vous</h2>
                <!-- area pour prevenir que toutes les fomations n ont pas encore de test -->
                <div class="alert alert-info text-center" role="alert">
                    <p class="lead mt-2"><span>Les formations qui n'ont pas encore de tests sont désactivées</span></p>
                </div>
                <!-- /area pour prevenir que toutes les fomations n ont pas encore de test -->  
                <!-- area pour afficher un message d erreur en rapport avec la liste deroulante -->
                <div class="alert alert-danger <?=($_SESSION['error']['message'] != '') ? 'd-block' : 'd-none'; ?> mt-5" role="alert">
                    <p class="lead mt-2"><span><?=$_SESSION['error']['message'] ?></span></p>
                </div>
                <!-- /area pour afficher un message d erreur en rapport avec la liste deroulante -->
            </div>
            <!-- /titre de la page du choix de la formation -->           
            <!-------------------- formulaire du choix de la formation ----------------------------->
            <form class="" action="php_process/formation_choix_process.php" method="POST">                                               
                <!-------------------------------------------//---------------------------------------------------
                                                                    liste deroulante
                ----------------------------------------------------------------------------------------------------->
                <?php 
                    //-------------------------------------------------------------------------------------------------------------------
                    //      appelle de la fonction pour remplir la liste deroulante et desactiver les formation sans test
                    //-------------------------------------------------------------------------------------------------------------------
                    $formationList = joinDropDownListReader('formation', 'questionnaire');
                    //var_dump($formationList); die;     
                ?>
                <div class="card">
                    <label for="formationChoix" class="card-header bg-info text-white text-uppercase"><h5>Intitulé de la formation</h5></label>
                    <div class="card-body">
                        <!-- Liste des formations -->
                        <select class="custom-select d-block w-100" id="formationChoix" name="formationChoix" required>
                            <option value="">Sélectionnez...</option>
                            <!---------------------------------//-------------------------------------------
                                                    boucle pour remplir la liste deroulante-->
                            <?php
                                foreach ($formationList as $key => $column) {
                            ?>
                            <option value="<?=$column['formation_ID'] ?>" <?=is_null($column['questionnaire_ID']) ? 'disabled' : '' ?>><?=$column['formation_Intitule'] ?></option>
                            <?php
                                }
                            ?>
                            <!--                 boucle pour remplir la liste deroulante
                            ---------------------------------//------------------------------------------->
                        </select>
                        <!-- /Liste des formations -->    
                    </div>
                </div>
                <!--------------------------------------------//---------------------------------------------------
                                                                    liste deroulante
                ----------------------------------------------------------------------------------------------------->
                <hr class="mb-4">
                <!-- bouton validation du choix de la formation -->
                <button class="btn btn-primary btn-lg btn-block" type="submit" name="submit">Valider</button>
                <!-- /bouton validation du choix de la formation -->
            </form>
            <!-------------------- /formulaire du choix de la formation ----------------------------->      
            <!-----------------------------------------------------------------------------------------------------
                                                                 /container global
            -------------------------------------------------//---------------------------------------------------->   
            <!--********************************************************************************
                                                    TODO
                            Afficher dynamiquement les informations concernant la formation choisie
                                    > les centres qui dispensent cette formation 
                                    > les dates de debut et fin
            *********************************************************************************-->
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
