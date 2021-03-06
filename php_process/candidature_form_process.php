<?php
    // import pdo fonction sur la database
    require '../pdo/pdo_db_functions.php';
    // on demarre une session la session
    session_start(); 

    //===============================================================
    //                                                         TODO
    //     >   verification de l' email de connexion (unicité)
    //              | si existe -> user_ID
    //                     >  verification du numero insee (unicité)
    //                     >   verification identifiant pole emploi (unicité)
    //                              | si probleme apres creation du candidat choisir la formation - test 
    //                              | choix d autres formations - tests possible ?
    //              | sinon
    //                     >  verification du numero insee (unicité)
    //                     >   verification identifiant pole emploi (unicité)
    //===============================================================     
    // si le formulaire a ete soumis (controle de validite realise en HTML5 avec l attribut required)   
    if (isset($_POST['submit'])) {
        // verification que l utilisateur a saisie au moins un numero de telephone
        if (empty($_POST['landlinePhone']) && empty($_POST['cellPhone'])) {
            // on renvoie un message d erreur (saisir au moins un numero de telephone)
            $_SESSION['error']['page'] = 'index';
            $_SESSION['error']['message'] = "Veuillez indiquez au moins un numero de téléphone!";
            // on redirige vers la page de login
            header('location:/../index.php');
            exit();
        }
        // ----------------------------------------------------------------------------------------------------------------------------------------
        //          on creer prepare le tableau avec les informations qui seront envoyees a la fonction qui creera le candidat
        // ----------------------------------------------------------------------------------------------------------------------------------------
        // valeur par defaut du bouton radio pour le type de remuneration facultatif
        $_POST['radioTypeCompensation'] = is_null($_POST['radioTypeCompensation']) ? NULL : $_POST['radioTypeCompensation'];

        $userData = [
            'nom' => $_POST['lastName'],
            'prenom' => $_POST['firstName'],
            'email' => $_POST['email'],
            'telFixe' => $_POST['landlinePhone'],
            'telMobile' => $_POST['cellPhone']
        ];
        //
        //var_dump($userData); die;
        //

        $candidatData = [
            'nomJeuneFille' => $_POST['maidenSurname'],
            'dateNaissance'  => $_POST['birthDate'],
            'numeroSecu'  => $_POST['socialSecurityNumber'],
            'lieuNaissance'  => $_POST['birthPlace'],
            'departementNaissance'  => $_POST['birthDepartment'],
            'nationnalite'  => $_POST['nationality'],
            'voiturePermis'  => $_POST['radioLicencse'],
            'voiturePersonnelle'  => $_POST['radioPersonalCar'],
            'nomUrgence'  => $_POST['emergency'],
            'telUrgence'  => $_POST['emergencyPhone'],
            'derniereClasse'  => $_POST['lastClass'],
            'adresse'  => $_POST['address'],
            'adresseSuite'  => $_POST['address2'],
            'codePostal'  => $_POST['zip'],
            'ville'  => $_POST['ville'],
            'NbEnfants'  => $_POST['numDependentChild'],
            'dateInscPoleEmploi'  => $_POST['dateRegistration'],
            'identiantPoleEmploi'  => $_POST['IDnumber'],
            'agencePoleEmploi'  => $_POST['agencyOf'],
            'nomConseiller'  => $_POST['consultant'],
            'indemnisation'  => $_POST['radioCompensation'],
            'typeIndemnisation'  => $_POST['radioTypeCompensation'],
            'rsa'  => $_POST['radioBeneficiaryRSA'],
            'ayantDroit' => $_POST['radioRightfulClaimant'],
            'situation_famille_ID'  => $_POST['maritalStatus'],
            'niveau_etude_ID'  => $_POST['gradeLevel'],
            'diplome_ID'  => $_POST['degreeObtained'],
        ];
        //
        //var_dump($candidatData); die;
        //
        // ---------------------------------------------------------------------------
        //                                  on creer l utilisateur
        // ---------------------------------------------------------------------------
        $newUser = createUser($userData, $candidatData);
        // enregistre comme variable de session - le role 
        $_SESSION['current']['userRole'] = 'Candidat'; 
        // enregistre comme variable de session - le numero d identifiant
        $_SESSION['current']['userId'] = $newUser;   
        // passe la variable de session login a TRUE
        $_SESSION['current']['login'] = true;
        // on  redirige vers la page de selection des formation
        header('location: /../formation_choix.php');
    }

?>