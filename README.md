# Database-Skeleton

[![License: GPL v3](https://img.shields.io/github/license/P-tit-Dom/Database-Skeleton)](https://github.com/P-tit-Dom/Database-Skeleton/blob/main/LICENSE)

Skeleton of the DataBase For ABA tool by P'ti Dom

## Authors

- [Guillaume Arrat](https://github.com/gueillms)
- [Charles Baylet](https://github.com/CBaylet)
- [Iman Clin](https://github.com/iman-clin)
- [Paul Malvaud](https://github.com/orgs/P-tit-Dom/people/PaulMalvaud)
- [Paul Vaillant](https://github.com/pavaillant)


MAMP permet de faire tourner un serveur MySQL en local, qui hébergera la BD. Il inclut également phpMyAdmin qui permet la gestion de la BD.
On utilise phpMyAdmin pour générer la BD, la modifier et la préremplir. On peut importer la BD dans phpMyAdmin à l'aide du fichier SQL p'titdom.sql
Le fichier connexion_base permet la connexion entre le site et la BD sur le serveur My SQL.

Voir ababyptitdom.png

Description générale de la maquette avec vue relationnelle

La base de données a été construite progressivement au fur et à mesure de la compréhension des contraintes en terme de contenu de l'application. La BD a atteint une version qui intègre tous les concepts impliqués dans l'approche ABA et le travail des psychologues et intervenants dont nous avons pris connaissance au cours du stage. La BD pour être agrandie ou ajustée par la suite pour ajouter de nouvelles fonctionnalités.

Table domaines :

Contient tous les domaines définis par l'ABA, identifiés par leur nom

Table competences_domaines :

Table de liaison entre domaines et competences. Il y a une table de liaison entre domaines et competences car selon les sites une compétence peut être associée à un domaine ou à un autre.

Table competences :

Contient toutes les compétences enregistrées identifiées par leur nom.

Table objectifs_competences

Table de liaison entre competences et objectifs. De la même manière que pour les compétences, cette table de liaison permet de laisser la possibilité de ranger un objectif dans plusieurs compétences.

Table objectifs :

Recense tous les objectifs avec leur nom, leur code apparaissant dans les fiches de cotations, et un booléen qui est nul pour un objectif classique, vaut 0 pour un PECS et 1 pour un chaînage.

Table modeles :

Les modeles correspondent à un ensemble de cibles types fréquemment évaluées pour un objectif. Un modèle est identifié par un id dans
la table modeles car plusieurs modeles associés à des objectifs différents pourraient avoir le même nom (ex: Modèle standard). Un modèle
référence l'objectif auquel il appartient et possède un nom.

Table cibles_defaut :

La table cibles par défaut contient les cibles associées à un modèle d'un objectif. Elles référencent le modèle auquel elles appartiennent,
elles ont un nom, et un ordre qui correspond à leur position dans l'ensemble des cibles du modèle. Elles indiquent un format et un critère de revision et d'acquisition. Les concepts de format et de critères seront expliqués dans les tables correspondant.

Table formats :

Un format correspond à la façon dont sera évaluée une cible, c'est à dire à un ensemble de valeurs (ou résultats) possibles, et à un
mode de sélection. Un format est donc associé à un ensemble de valeurs de la table valeur via la table de liaison entre les deux. Et il
contient un booléen tap_select qui indique si l'on choisi la valeur par des cliques successifs (tap : 0) ou en sélectionnant via une liste déroulante (select : 1)

Table valeurs_formats :

Table de liaison entre les formats et la valeurs. Un format contient plusieurs valeurs, et une valeur peut être associée à plusieurs formats.

Table valeurs :

Contient l'ensemble des valeurs contenues dans les différents formats. Elles sont identifiées par leur nom.

Table criteres :

Les critères sont définis par un nombre de séances et un pourcentage. Ainsi lorsqu'un critère est référencé par une cible comme critère d'acquisition, cela signifie que la cible est validée pour ce nombre de séances consécutives avec un pourcentage de réussite supérieur à ce pourcentage. A l'inverse, si le critère est référencé comme un critère de révision, alors pour ce nombre de séances consécutives sous ce pourcentage de réussite, la cible sera revue et potentiellement retirée de l'objectif. Le nom du critère est une chaine de caractère composée du nombre de séance, d'un signe "x" et du pourcentage de réussite (ex: 3x80). Le nom est donc unique. Un critère contient également un booléen qui indique si il est le critère de révision ou d'acquisition par défaut qui sera automatiquement remplie pour une nouvelle cible. NULL si ce n'est pas un critere par défaut, 0 pour le critère d'acquisition par défaut, 1 pour le critère de révision par défaut.

Tables apprenants :

Recense l'ensemble des apprenants avec leur identifiant et un booléen indiquant si ils sont encore actif au sein de l'association.

Table peis :

Contient l'ensemble des peis des enfants. Un pei est identifié par son id, il référence un apprenant, il possède une date de création, une date de validation par les parents, et une date de cloturation lorsqu'il se termine.

Table objectifs_peis :

Elle comporte les objectifs inclus dans un PEI d'un apprenant. Ce sont ces objectifs d'un PEI qui contiennent des cibles qui lui sont propres. Chaque élément de la table est identifié par son id et référence le pei auquel il appartient. Il référence le nom de l'objectif correspondant dans la table objectif. Il définit une stratégie qui est propre à l'apprenant et à la façon d'aborder l'objectif, les moyens ou outils à mettre en place pour aider, ou les éléments auxquels prêter une attention particulière. La remarque correspond au contexte d'évaluation (ITT ou NET ou les deux). Un booléen permet d'indiquer si l'objectif est un avenant ou non au pei. Et un autre permet d'indiquer si l'objectif a été validé.

Table prerequis :

Un objectif d'un pei comprend des prérequis à valider préalablement pour le débuter. Ces prérequis sont d'autres objectifs de ce peis, ou éventuellement de peis antérieurs.

Table cibles_individuelles :

Les cibles individuelles sont les cibles d'un objectif inclu dans un pei, et qui sont propres à un objectif d'un pei d'un apprenant. Elles sont identifiées par un id, elles ont un nom, et elles référencent donc un élément de la table objectifs_peis. Comme les cibles par défaut de la table cibles_defaut, les cibles individuelles référencent un critère en tant que critère d'acquisition, et un autre de révision, elles ont un format et un ordre. Cet ordre peut-être NULL pour éventuellement retirer une cible de l'ensemble des cibles d'un objectif, sans pour autant la supprimer de la table, ce qui entrainerait l'impossibilité de retrouver les cotations qui lui auront éventuellement été attribuées dans la table log_cibles.

Tables validations :

Cette table permet de garder traces des dates, et donc des périodes, de validation et d'invalidation d'une cible. Les validations (ou invalidations) sont identifiées par un id, référencent une cible individuelle, une date, et un booléen qui indique si c'est une validation (0) ou une invalidation (1) de la cible (passage d'un état validé à un état invalidé)

Table cibles_seances :

Table de liaison entre la table cibles individuelles et la table seances.

Tables seances :

Une séance correspond au moment (matin ou après midi) où un apprenant sera encadré par un intervenant qui lui fera passer des activités. Une séance est donc reliée à un ensemble de cibles via la table cibles_seances. Une séance est identifié par son id, référence l'identifiant d'un apprenant et d'un intervenant (càd un utilisateur de la table utilisateurs, dont le rôle est intervenant). Elle correspond à une date et un booléen indique si elle a lieu le matin (0) ou l'aprem (1). Un retour de l'intervenant peut-être rempli après la séance terminée, et au contraire une observation peut-être donnée en amont par le psychologue à destination de l'intervenant.

Table log_cibles :

La table log_cibles contient tous les enregistrements des évaluations des cibles individuelles (cotations). C'est à dire, telle cible individuelle
évaluée lors de telle séance a eu tel résultat (valeur) sur l'occurence n° tant (une même cible individuelle est évaluée plusieurs fois au cours d'une même séance). Une cotation de log_cibles est identifiée par son id, référence une cible et une séance, donc un élément de la table cibles_seances. Elle prend une valeur, et référence donc un élément de la table valeurs, indique le numéro de l'occurence, et contient une remarque qui désigne la façon dont elle a été évaluée (NET, ITT ou les deux).

Table roles :

Recense l'ensemble des rôles que pourront prendre l'ensemble des utilisateurs.

Table utilisateurs :

Comprend l'ensemble des utilisateurs de l'application. Ils sont identifiés par un identifiant qui est le même que celui qui leur permettra de se connecter à la base de donnée et donc au site. Un utilisateur a un rôle, référencé dans la table roles. Un pseudo permettra de le désigner parmi les autres dans les menus de sélections ou sur les affichages des interfaces. Un booléen indique si il est toujours actif dans l'association, ce qui permettra de ne plus le faire apparaitre dans les menus de sélection, tout en conservant trace de son existence pour l'enregistrement des activités effectuées.

Table comportements :

Référence l'ensemble des comportements qui peuvent être suivis et enregistrés chez les apprenants.

Table comportements_apprenants :

Table de liaison entre apprenants et comportements.

Table comportements_seances :

Elle indique quels comportements de quel enfant vont être évalués et apparaitront sur la fiche de cotation pour quelle séance. Elle référence donc un comportement d'un enfant de la table comportements_apprenants, ainsi qu'une séance.

Table log_comportements :

De la même manière que la table log_cibles, elle enregistre toutes les évaluations des comportements des enfants. Chaque évaluation est identifiée par son id. Elle référence un comportement évalué lors d'une séance, donc un élément de la table comportements_seances. Elle peut contenir une durée pour les comportements où cette donnée est pertinente, ou bien avoir une durée NULL. Elle indique l'heure à laquelle le comportement a eu lieu (la date est déjà contenu dans la séance). L'heure peut-être NULL car l'intervenant à la possibilité d'ajouter des occurences des comportements et d'en définir la durée et l'heure qui auront été notées sur papier dans un second temps, si il décide de ne pas utiliser les compteurs et chronomètre de l'interface.

Table classeurs :

Table de liaison entre un apprenant et des valeurs, qui permet de référencer l'ensemble des pictogrammes (enregistrés dans la table valeurs), qui constitue le classeur PECS d'un apprenant.


Description de la BD//Maquette table par table + requetes SQL complexes