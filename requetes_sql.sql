-- I-REQUETES ACCUEIL

-- 1-Sélection des apprenants actifs pour choisir l'apprenant

SELECT apprenants.identifiant FROM apprenants WHERE actif=1 

-- 2-Sélection des deux prochaines séances associées à l'utilisateur connecté

SELECT seances.id, seances.date, seances.matin_aprem, seances.apprenant 
FROM seances 
WHERE seances.identifiant_intervenant="idjustine"
AND seances.date>"2022-06-10"
ORDER BY seances.date 
LIMIT 2

-- 3-Récupération du rôle de l'utilisateur connecté

SELECT nom_role FROM utilisateurs WHERE utilisateur.identifiant="idayova"

-- II-REQUETES PEI

-- 1-Recupérer l'id du PEI de l'apprenant

SELECT peis.id FROM peis WHERE peis.identifiant_apprenant="apprenant1" AND peis.cloture IS NULL

-- 2-Requête sélectionnant le contenu du PEI de l'apprenant sélectionné par ordre alphabétique, si il y a un PEI en cours. 

SELECT domaines.nom, competences.nom, objectifs.nom FROM domaines, competences_domaines, competences, objectifs_competences, objectifs, objectifs_peis, peis
WHERE peis.identifiant_apprenant="apprenant1"
AND peis.cloture IS NULL
AND peis.id=objectifs_peis.id_pei
AND objectifs_peis.nom_objectif=objectifs.nom
AND objectifs.nom=objectifs_competences.nom_objectif
AND objectifs_competences.nom_competence=competences.nom
AND competences.nom=competences_domaines.nom_competence
AND competences_domaines.nom_domaine=domaines.nom
ORDER BY domaines.nom, competences.nom, objectifs.nom

-- 3-Requêtes récupérant l'ensembles des domaines, des compétences et des objectifs pour les afficher dans les sélecteurs

SELECT * FROM `domaines`  

SELECT domaines.nom, competences.nom, objectifs.nom FROM domaines, competences_domaines, competences, objectifs_competences, objectifs
WHERE domaines.nom=competences_domaines.nom_domaine
AND competences_domaines.nom_competence=competences.nom
AND competences.nom=objectifs_competences.nom_competence
AND objectifs_competences.nom_objectif=objectifs.nom
ORDER BY domaines.nom, competences.nom, objectifs.nom

-- 4-Insérer un objectif dans le PEI
-- Si le PEI n'est pas encore validé :

INSERT INTO `objectifs_peis` (`id_pei`, `nom_objectif`) VALUES
( 5, 'Phase 1')

-- Si il est validé :

INSERT INTO `objectifs_peis` (`id_pei`, `nom_objectif`, 'avenant') VALUES
(5, 'Phase 1', b'1')

-- 5-Renseignement du constat, des priorités et de la stratégie

UPDATE objectifs_peis
SET objectifs_peis.constat ="Tend la main ouverte pour faire des demandes", objectifs_peis.strategie="Cf. classeur. Utiliser guidance si nécessaire", objectifs_peis.remarque="ITT"
WHERE objectifs_peis.id=1

-- 6-Supprimer un objectif du PEI
--Requête si le PEI n'est pas encore validé: supprime la ligne

DELETE FROM objectifs_peis WHERE id=12 

--Requête si le PEI est validé: désactive l'objectif

UPDATE objectifs_peis
SET objectifs_peis.actif=b'1'
WHERE objectifs_peis.id=1


-- 7-Recherche de tous les objectifs inclus dans le PEI pour choisir les objectifs prérequis d'un objectif

SELECT objectifs_peis.nom_objectif FROM objectifs_peis, peis WHERE peis.id=5 AND objectifs_peis.id_pei=5

-- 8-Insérer les prérequis de cet objectif dans la table prerequis

INSERT INTO `prerequis` (id_objectif_pei, id_objectif_pei_requis) VALUES
(2, 4)

-- 9-Valider les PEI

UPDATE peis
SET peis.validation='2022-06-16'
WHERE peis.id=5

-- 9-Cloturer le PEI

UPDATE peis
SET peis.cloture ='2022-06-15'
WHERE peis.id=5

-- 10-Historique des PEIs d'un apprenant 

SELECT peis.creation, peis.cloture FROM peis WHERE identifiant_apprenant="apprenant1" AND peis.cloture IS NOT NULL

-- Utiliser la requête II-1 pour afficher le contenu d'un PEI en historique

-- III-REQUETES PARAMETRAGES CIBLES

--Récupérer tous les modèles et toutes leurs cibles pour un objectif

SELECT modeles.nom, modeles.id, cibles_defaut.nom, cibles_defaut.nom_format, cibles_defaut.critere_acquisition, cibles_defaut.critere_revision, cibles_defaut.ordre
FROM cibles_defaut, modeles 
WHERE modeles.nom_objectif="Phase 1"
AND modeles.id=cibles_defaut.id_modele
ORDER BY modeles.nom_objectif, cibles_defaut.ordre

-- 1-Pour afficher l'ensemble des domaines, compétences et objectifs parmi lesquels choisir dans les sélecteurs, utiliser les
--deux premières requêtes du PEI récupérant l'ensemble des objectifs du PEI en cours. On récupère également l'id des objectifs_peis
--car il sera utilisé pour les requêtes suivantes.

SELECT domaines.nom, competences.nom, objectifs.nom, objectifs_peis.id FROM domaines, competences_domaines, competences, objectifs_competences, objectifs, objectifs_peis, peis
WHERE peis.identifiant_apprenant="apprenant1"
AND peis.cloture IS NULL
AND peis.id=objectifs_peis.id_pei
AND objectifs_peis.nom_objectif=objectifs.nom
AND objectifs.nom=objectifs_competences.nom_objectif
AND objectifs_competences.nom_competence=competences.nom
AND competences.nom=competences_domaines.nom_competence
AND competences_domaines.nom_domaine=domaines.nom
ORDER BY domaines.nom, competences.nom, objectifs.nom

-- 2-Récupérer les noms de l'ensemble des modèles associés à l'objectif dont on veut déterminer les cibles

SELECT modeles.nom, modeles.id
FROM objectifs_peis, objectifs, modeles 
WHERE objectifs_peis.id=1 
AND objectifs_peis.nom_objectif=objectifs.nom 
AND modeles.nom_objectif=objectifs.nom

-- 3-Récupérer l'ensembles des cibles en cours et leurs paramètres pour l'objectif choisi

SELECT cibles_individuelles.id, cibles_individuelles.nom, cibles_individuelles.nom_format, cibles_individuelles.critere_acquisition, cibles_individuelles.critere_revision, cibles_individuelles.ordre 
FROM objectifs_peis, cibles_individuelles
WHERE objectifs_peis.id=1 
AND cibles_individuelles.id_objectif_pei=objectifs_peis.id
ORDER BY cibles_individuelles.nom

-- 4-Récupérer l'ensemble des cibles et leurs paramètres pour un modèle de l'objectif

SELECT cibles_defaut.nom, cibles_defaut.nom_format, cibles_defaut.critere_acquisition, cibles_defaut.critere_revision, cibles_defaut.ordre
FROM cibles_defaut
WHERE cibles_defaut.id_modele=3
ORDER BY cibles_defaut.nom

-- 5-Modifier la valeur d'un paramètre pour une cible déjà en cours

UPDATE cibles_individuelles
SET cibles_individuelles.nom='blabla', 
cibles_individuelles.nom_format ='OUI/NON',
cibles_individuelles.critere_acquisition='5x80' 
cibles_individuelles.critere_revision ='8x20',
cibles_individuelles.ordre=5
WHERE cibles_individuelles.id=7

-- 6-Sélectionner tous les noms des cibles en cours d'un objectif pour regarder si le nom est déjà utilisé à l'ajout d'une cible

SELECT cibles_individuelles.nom FROM `cibles_individuelles` WHERE id_objectif_pei=1 

-- 7-Ajouter une cible à un objectif

INSERT INTO cibles_individuelles (id_objectif_pei, nom, nom_format, critere_acquisition, critere_revision, ordre) VALUES
(1, 'Prendre', 'IC/IP/+', '3x80', '5x20', 2)

-- 8-Récupérer l'ensemble des logs d'une cible pour voir si une cible a des logs

SELECT log_cibles.id FROM `log_cibles`, cibles_seances
WHERE log_cibles.id_cible_seance=cibles_seances.id
AND cibles_seances.id_cible_individuelle=8
LIMIT 1

-- 9-Supprimer une cible sans log : la retirer de la liste des cibles en cours dans la table cibles_individuelles

DELETE FROM cibles_individuelles WHERE id=11

-- 10-Supprimer une cible avec des logs : la désactiver dans la table cibles_individuelles

UPDATE cibles_individuelles
SET cibles_individuelles.ordre = NULL
WHERE cibles_individuelles.id=10








