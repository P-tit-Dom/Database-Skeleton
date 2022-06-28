<?php require_once("connexion_base.php"); ?>
<!DOCTYPE html>
<html lang="fr">

<head>
	<meta charset="utf-8" />
	<title>Création PEI</title>
</head>

<body>
	<h1>Création du PEI</h1>

	<h2>Choisir le PEI d'un enfant et afficher son contenu si il n'est pas vide</h2>

	<form action="creation_pei.php" method="get">
		<select name="enfant">
			<option value="1">Enfant 1</option>
			<option value="2">Enfant 2</option>
			<input type="submit" value="Soumettre" />
		</select>
	</form>

	<?php
	$id_enfant = $_GET['enfant'];

	if (isset($id_enfant)) {
		// requete MySQL permettant de recueillir les domaines, compétences et objectifs d'un PEI en cours pour un enfant.
		// Rajouter la contrainte de ne selectionner que les infos du dernier PEI si plusieurs PEI sont en cours car un n'est pas cloturé par erreur
		// même si cela devrait être impossible de créer un nouveau PEI si le dernier n'est pas cloturé.

		$requete = "SELECT domaine, competence, objectif, remarque, observation 
				FROM `domaines`, competences, objectifs, domaine_competence, competences_objectifs, enfants_objectifs, enfants, peis_objectifs, peis 
				WHERE enfants.identifiant='enfant#$id_enfant' 
				AND enfants.identifiant=enfants_objectifs.identifiant_enfant 
				AND enfants_objectifs.id_objectif=objectifs.id 
				AND enfants_objectifs.id=peis_objectifs.id_enf_obj 
				AND competences_objectifs.id_objectif=objectifs.id 
				AND competences_objectifs.id_competence=competences.id 
				AND domaine_competence.id_competence=competences.id 
				AND domaine_competence.intitule_domaine=domaines.domaine
				AND peis_objectifs.id_pei=peis.id
				AND peis.cloturation IS NULL";
		$reponse = $pdo->prepare($requete);
		$reponse->execute();

		// récupérer tous les enregistrements dans un tableau
		$enregistrements = $reponse->fetchAll();
		$nb_enregistrements = count($enregistrements);
	}
	?>

	<table>
		<tr>
			<td><strong>Domaines</strong></td>
			<td><strong>Compétences</strong></td>
			<td><strong>Objectifs</strong></td>
			<td><strong>Observations</strong></td>
			<td><strong>Remarques</strong></td>
		</tr>

		<?php

		foreach ($enregistrements as $value) {
			echo    "<tr>
						<td>" . $value["domaine"] . "</td>
						<td>" . $value["competence"] . "</td>
						<td>" . $value["objectif"] . "</td>
						<td>" . $value["observation"] . "</td>
						<td>" . $value["remarque"] . "</td>
					</tr>";
		}

		?>
	</table>

	<h2>Ajouter des objectifs au PEI</h2>

	<?php
	if (isset($id_enfant)) {
		$requete = "SELECT domaine FROM domaines";
		$reponse = $pdo->prepare($requete);
		$reponse->execute();

		// récupérer tous les enregistrements dans un tableau
		$domaines = $reponse->fetchAll();

		$requete = "SELECT competence FROM competences";
		$reponse = $pdo->prepare($requete);
		$reponse->execute();

		// récupérer tous les enregistrements dans un tableau
		$competences = $reponse->fetchAll();

		$requete = "SELECT id, objectif FROM objectifs";
		$reponse = $pdo->prepare($requete);
		$reponse->execute();

		// récupérer tous les enregistrements dans un tableau
		$objectifs = $reponse->fetchAll();

		$domaine = $_POST['domaine'];
		echo $domaine;
		$competence = $_POST['competence'];
		echo $competence;
		$objectif = $_POST['objectif'];
		echo $objectif;

		if (!empty($domaine) and !empty($competence) and !empty($objectif)) {

			// exécuter une requete MySQL de type INSERT
			$requete = "INSERT INTO commentaire (nom, texte, date, id_article) VALUES (?,?,NOW(),?)";
			$reponse = $pdo->prepare($requete);
			$reponse->execute(array($nom, $texte, $_POST['id']));
		}

		echo    '<form action="creation_pei.php?enfant=' . $id_enfant . '" method="post">
								<select name="domaine">';
		foreach ($domaines as $value) {
			echo '<option value="' . $value[0] . '">' . $value[0] . '</option>';
		}
		echo    '</select><select name="competence">';
		foreach ($competences as $value) {
			echo '<option value="' . $value[0] . '">' . $value[0] . '</option>';
		}
		echo    '</select><select name="objectif">';
		foreach ($objectifs as $value) {
			echo '<option value="' . $value[0] . '">' . $value[1] . '</option>';
		}
		echo    '<input type="submit" value="Soumettre" />
							</form>';
	}
	?>

</body>

</html>