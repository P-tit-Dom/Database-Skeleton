-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 14, 2022 at 01:29 PM
-- Server version: 5.7.24
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ababyptitdom`
--

-- --------------------------------------------------------

--
-- Table structure for table `cibles_defaut`
--

CREATE TABLE `cibles_defaut` (
  `id` int(11) NOT NULL,
  `nom` varchar(256) NOT NULL,
  `id_modele` int(11) NOT NULL,
  `nom_format` varchar(255) NOT NULL,
  `critere_revision` varchar(255) NOT NULL DEFAULT '5x20',
  `critere_acquisition` varchar(255) NOT NULL DEFAULT '3x80',
  `ordre` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cibles_defaut`
--

INSERT INTO `cibles_defaut` (`id`, `nom`, `id_modele`, `nom_format`, `critere_revision`, `critere_acquisition`, `ordre`) VALUES
(32, 'Activité', 3, 'Activités', '5x20', '3x80', 1),
(33, 'Image', 3, 'Images', '5x20', '3x80', 2),
(34, 'Saisir', 3, 'IC/IP/+', '5x20', '3x80', 3),
(35, 'Atteindre', 3, 'IC/IP/+', '5x20', '3x80', 4),
(36, 'Relâcher', 3, 'IC/IP/+', '5x20', '3x80', 5),
(37, 'Main ouverte', 3, 'OUI/NON', '5x20', '3x80', 6),
(38, 'Sélectionner 1 item', 4, '+/G', '5x20', '3x80', 1),
(39, 'Sélectionner 2 items', 4, '+/G', '5x20', '3x80', 2),
(40, 'Sélectionner 3 items', 4, '+/G', '5x20', '3x80', 3),
(41, 'Sélectionner 4 items', 4, '+/G', '5x20', '3x80', 4);

-- --------------------------------------------------------

--
-- Table structure for table `cibles_individuelles`
--

CREATE TABLE `cibles_individuelles` (
  `id` int(11) NOT NULL,
  `id_objectif_pei` int(11) NOT NULL,
  `nom` varchar(256) NOT NULL,
  `nom_format` varchar(255) NOT NULL,
  `probe` bit(1) NOT NULL DEFAULT b'0',
  `ordre` int(11) DEFAULT NULL,
  `maintien` bit(1) NOT NULL DEFAULT b'0',
  `critere_acquisition` varchar(255) NOT NULL DEFAULT '3x80',
  `critere_revision` varchar(255) NOT NULL DEFAULT '5x20'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cibles_individuelles`
--

INSERT INTO `cibles_individuelles` (`id`, `id_objectif_pei`, `nom`, `nom_format`, `probe`, `ordre`, `maintien`, `critere_acquisition`, `critere_revision`) VALUES
(1, 1, 'Activité', 'Activités', b'0', 1, b'0', '3x80', '5x20'),
(3, 1, 'Image', 'Images', b'0', 2, b'0', '3x80', '5x20'),
(4, 1, 'Saisir', 'IC/IP/+', b'0', 3, b'0', '3x80', '5x20'),
(5, 1, 'Atteindre', 'IC/IP/+', b'0', 4, b'0', '3x80', '5x20'),
(6, 1, 'Relâcher', 'IC/IP/+', b'0', 5, b'0', '3x80', '5x20'),
(7, 1, 'Main ouverte', 'OUI/NON', b'0', 6, b'0', '3x80', '5x20'),
(8, 4, 'Sélectionner 2 items', '+/G', b'0', 1, b'0', '3x80', '5x20'),
(9, 4, 'Sélectionner 3 items', '+/G', b'0', 2, b'0', '3x80', '5x20'),
(10, 4, 'Sélectionner 4 items', '+/G', b'0', 3, b'0', '3x80', '5x20');

-- --------------------------------------------------------

--
-- Table structure for table `cibles_seances`
--

CREATE TABLE `cibles_seances` (
  `id` int(11) NOT NULL,
  `id_seance` int(11) NOT NULL,
  `id_cible_individuelle` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cibles_seances`
--

INSERT INTO `cibles_seances` (`id`, `id_seance`, `id_cible_individuelle`) VALUES
(1, 1, 1),
(2, 1, 3),
(3, 1, 4),
(4, 1, 5),
(5, 1, 6),
(6, 1, 7),
(7, 1, 8),
(8, 2, 1),
(9, 2, 3),
(10, 2, 4),
(11, 2, 5),
(12, 2, 6),
(13, 2, 7),
(14, 2, 9);

-- --------------------------------------------------------

--
-- Table structure for table `classeurs`
--

CREATE TABLE `classeurs` (
  `id` int(11) NOT NULL,
  `identifiant_enfant` varchar(256) NOT NULL,
  `nom_valeur` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `classeurs`
--

INSERT INTO `classeurs` (`id`, `identifiant_enfant`, `nom_valeur`) VALUES
(1, 'enfant1', 'picto bulle'),
(2, 'enfant1', 'picto je veux'),
(3, 'enfant2', 'picto je veux'),
(4, 'enfant2', 'picto verre d\'eau'),
(5, 'enfant3', 'picto verre d\'eau'),
(6, 'enfant3', 'picto bulle');

-- --------------------------------------------------------

--
-- Table structure for table `competences`
--

CREATE TABLE `competences` (
  `nom` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `competences`
--

INSERT INTO `competences` (`nom`) VALUES
('Echoïque'),
('Hygiène'),
('MAND'),
('PECS'),
('RA');

-- --------------------------------------------------------

--
-- Table structure for table `competences_domaines`
--

CREATE TABLE `competences_domaines` (
  `id` int(11) NOT NULL,
  `nom_domaine` varchar(256) NOT NULL,
  `nom_competence` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `competences_domaines`
--

INSERT INTO `competences_domaines` (`id`, `nom_domaine`, `nom_competence`) VALUES
(1, 'Autonomie', 'Hygiène'),
(2, 'Communication', 'Echoïque'),
(3, 'Communication', 'MAND'),
(4, 'Communication', 'PECS'),
(5, 'Communication', 'RA');

-- --------------------------------------------------------

--
-- Table structure for table `comportements`
--

CREATE TABLE `comportements` (
  `nom` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comportements`
--

INSERT INTO `comportements` (`nom`) VALUES
('Crachat'),
('Cri'),
('Pleurs'),
('Se balance');

-- --------------------------------------------------------

--
-- Table structure for table `comportements_enfants`
--

CREATE TABLE `comportements_enfants` (
  `id` int(11) NOT NULL,
  `identifiant_enfant` varchar(256) NOT NULL,
  `nom_comportement` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comportements_enfants`
--

INSERT INTO `comportements_enfants` (`id`, `identifiant_enfant`, `nom_comportement`) VALUES
(1, 'enfant1', 'Cri'),
(2, 'enfant1', 'Pleurs'),
(3, 'enfant2', 'Crachat'),
(4, 'enfant2', 'Se balance'),
(5, 'enfant3', 'Cri');

-- --------------------------------------------------------

--
-- Table structure for table `comportements_seances`
--

CREATE TABLE `comportements_seances` (
  `id` int(11) NOT NULL,
  `id_seance` int(11) NOT NULL,
  `id_comportement_enfant` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comportements_seances`
--

INSERT INTO `comportements_seances` (`id`, `id_seance`, `id_comportement_enfant`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `criteres`
--

CREATE TABLE `criteres` (
  `nom` varchar(255) NOT NULL,
  `nb_seances` int(11) NOT NULL,
  `pourcentage` int(11) NOT NULL,
  `defaut_acquisition_revision` tinyint(1) DEFAULT NULL COMMENT 'NULL pour un critere quelconque\r\n0 pour le critere d''acquisition par defaut\r\n1 pour le critere de revision par defaut'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `criteres`
--

INSERT INTO `criteres` (`nom`, `nb_seances`, `pourcentage`, `defaut_acquisition_revision`) VALUES
('3x80', 3, 80, 0),
('5x20', 5, 20, 1),
('8x20', 8, 20, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `domaines`
--

CREATE TABLE `domaines` (
  `nom` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `domaines`
--

INSERT INTO `domaines` (`nom`) VALUES
('Autonomie'),
('Communication');

-- --------------------------------------------------------

--
-- Table structure for table `enfants`
--

CREATE TABLE `enfants` (
  `identifiant` varchar(256) NOT NULL,
  `actif` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `enfants`
--

INSERT INTO `enfants` (`identifiant`, `actif`) VALUES
('enfant1', b'1'),
('enfant2', b'1'),
('enfant3', b'0');

-- --------------------------------------------------------

--
-- Table structure for table `formats`
--

CREATE TABLE `formats` (
  `nom` varchar(255) NOT NULL,
  `tap_select` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `formats`
--

INSERT INTO `formats` (`nom`, `tap_select`) VALUES
('+/G', b'0'),
('+/G/vide', b'0'),
('Activités', b'1'),
('IC/IP/+', b'0'),
('Images', b'1'),
('OUI/NON', b'0'),
('Pictos', b'1'),
('YES/NO', b'0');

-- --------------------------------------------------------

--
-- Table structure for table `log_cibles`
--

CREATE TABLE `log_cibles` (
  `id` int(11) NOT NULL,
  `id_cible_seance` int(11) NOT NULL,
  `nom_valeur` varchar(256) NOT NULL,
  `occurrence` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `log_cibles`
--

INSERT INTO `log_cibles` (`id`, `id_cible_seance`, `nom_valeur`, `occurrence`) VALUES
(1, 7, '+', 1),
(2, 7, 'G', 2),
(3, 7, '+', 3),
(4, 7, '+', 4),
(5, 7, 'G', 5);

-- --------------------------------------------------------

--
-- Table structure for table `log_comportements`
--

CREATE TABLE `log_comportements` (
  `id` int(11) NOT NULL,
  `id_comportement_seance` int(11) NOT NULL,
  `duree` int(11) DEFAULT NULL,
  `heure` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `log_comportements`
--

INSERT INTO `log_comportements` (`id`, `id_comportement_seance`, `duree`, `heure`) VALUES
(1, 2, 72, '11:09:08'),
(2, 2, 43, '12:09:09');

-- --------------------------------------------------------

--
-- Table structure for table `modeles`
--

CREATE TABLE `modeles` (
  `id` int(11) NOT NULL,
  `nom_objectif` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `modeles`
--

INSERT INTO `modeles` (`id`, `nom_objectif`) VALUES
(3, 'Phase 1'),
(2, 'Se brosser les dents'),
(4, 'Sélectionner 4 items');

-- --------------------------------------------------------

--
-- Table structure for table `objectifs`
--

CREATE TABLE `objectifs` (
  `nom` varchar(256) NOT NULL,
  `code` varchar(256) DEFAULT NULL,
  `PECS_chainage` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `objectifs`
--

INSERT INTO `objectifs` (`nom`, `code`, `PECS_chainage`) VALUES
('Phase 1', NULL, b'0'),
('Reconnaître 8 mots ou symboles', NULL, NULL),
('Se brosser les dents', NULL, b'1'),
('Sélectionner 4 items', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `objectifs_competences`
--

CREATE TABLE `objectifs_competences` (
  `id` int(11) NOT NULL,
  `nom_competence` varchar(256) NOT NULL,
  `nom_objectif` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `objectifs_competences`
--

INSERT INTO `objectifs_competences` (`id`, `nom_competence`, `nom_objectif`) VALUES
(1, 'PECS', 'Phase 1'),
(2, 'Hygiène', 'Se brosser les dents'),
(3, 'RA', 'Sélectionner 4 items'),
(4, 'RA', 'Reconnaître 8 mots ou symboles');

-- --------------------------------------------------------

--
-- Table structure for table `objectifs_peis`
--

CREATE TABLE `objectifs_peis` (
  `id` int(11) NOT NULL,
  `id_pei` int(11) NOT NULL,
  `nom_objectif` varchar(256) NOT NULL,
  `observation` text,
  `remarque` varchar(256) NOT NULL,
  `valide` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `objectifs_peis`
--

INSERT INTO `objectifs_peis` (`id`, `id_pei`, `nom_objectif`, `observation`, `remarque`, `valide`) VALUES
(1, 5, 'Phase 1', 'L\'enfant progresse vite mais a des difficultés dans un environnement bruyant', 'ITT', b'0'),
(2, 5, 'Reconnaître 8 mots ou symboles', NULL, 'ITT', b'0'),
(3, 5, 'Se brosser les dents', NULL, 'NET', b'0'),
(4, 5, 'Sélectionner 4 items', NULL, 'ITT', b'1'),
(5, 6, 'Phase 1', NULL, 'ITT', b'1'),
(6, 6, 'Reconnaître 8 mots ou symboles', NULL, 'ITT', b'1'),
(7, 7, 'Phase 1', NULL, 'ITT', b'0'),
(8, 7, 'Reconnaître 8 mots ou symboles', NULL, 'ITT', b'0'),
(9, 7, 'Se brosser les dents', NULL, 'NET', b'0'),
(10, 8, 'Se brosser les dents', NULL, 'NET', b'1'),
(11, 8, 'Sélectionner 4 items', NULL, 'ITT', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `peis`
--

CREATE TABLE `peis` (
  `id` int(11) NOT NULL,
  `identifiant_enfant` varchar(256) NOT NULL,
  `creation` date NOT NULL,
  `cloture` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `peis`
--

INSERT INTO `peis` (`id`, `identifiant_enfant`, `creation`, `cloture`) VALUES
(5, 'enfant1', '2022-06-14', NULL),
(6, 'enfant1', '2021-06-14', '2022-06-14'),
(7, 'enfant2', '2022-04-05', NULL),
(8, 'enfant3', '2021-06-01', '2022-06-01');

-- --------------------------------------------------------

--
-- Table structure for table `prerequis`
--

CREATE TABLE `prerequis` (
  `id` int(11) NOT NULL,
  `id_objectif_pei` int(11) NOT NULL,
  `id_objectif_pei_requis` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `remarques`
--

CREATE TABLE `remarques` (
  `nom` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `remarques`
--

INSERT INTO `remarques` (`nom`) VALUES
('ITT'),
('NET'),
('NET ou ITT');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `nom` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`nom`) VALUES
('Intervenant'),
('Psychologue');

-- --------------------------------------------------------

--
-- Table structure for table `seances`
--

CREATE TABLE `seances` (
  `id` int(11) NOT NULL,
  `identifiant_intervenant` varchar(256) NOT NULL,
  `date` date NOT NULL,
  `matin_aprem` tinyint(1) NOT NULL,
  `retour_intervenant` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `seances`
--

INSERT INTO `seances` (`id`, `identifiant_intervenant`, `date`, `matin_aprem`, `retour_intervenant`) VALUES
(1, 'idjustine', '2022-06-14', 0, 'A vite progressé'),
(2, 'idvalentine', '2022-06-15', 1, 'Beaucoup de comportements');

-- --------------------------------------------------------

--
-- Table structure for table `utilisateurs`
--

CREATE TABLE `utilisateurs` (
  `identifiant` varchar(256) NOT NULL,
  `nom_role` varchar(256) NOT NULL,
  `pseudo` varchar(256) NOT NULL,
  `actif` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `utilisateurs`
--

INSERT INTO `utilisateurs` (`identifiant`, `nom_role`, `pseudo`, `actif`) VALUES
('idayova', 'Psychologue', 'Ayova', b'1'),
('idjustine', 'Intervenant', 'Justine', b'1'),
('idvalentine', 'Intervenant', 'Valentine A.', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `valeurs`
--

CREATE TABLE `valeurs` (
  `nom` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `valeurs`
--

INSERT INTO `valeurs` (`nom`) VALUES
('+'),
('G'),
('Goûter'),
('IC'),
('IP'),
('Jeux'),
('NO'),
('NON'),
('OUI'),
('picto bulle'),
('picto je veux'),
('picto verre d\'eau'),
('vide'),
('YES');

-- --------------------------------------------------------

--
-- Table structure for table `valeurs_formats`
--

CREATE TABLE `valeurs_formats` (
  `id` int(11) NOT NULL,
  `nom_format` varchar(255) NOT NULL,
  `nom_valeur` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `valeurs_formats`
--

INSERT INTO `valeurs_formats` (`id`, `nom_format`, `nom_valeur`) VALUES
(1, '+/G', '+'),
(2, '+/G', 'G'),
(3, '+/G/vide', '+'),
(4, '+/G/vide', 'G'),
(5, '+/G/vide', 'vide'),
(6, 'Pictos', 'picto bulle'),
(7, 'Pictos', 'picto je veux'),
(8, 'Pictos', 'picto verre d\'eau'),
(9, 'YES/NO', 'YES'),
(10, 'YES/NO', 'NO'),
(11, 'Activités', 'Goûter'),
(12, 'Activités', 'Jeux');

-- --------------------------------------------------------

--
-- Table structure for table `validations`
--

CREATE TABLE `validations` (
  `id` int(11) NOT NULL,
  `id_cible_individuelle` int(11) NOT NULL,
  `date` date NOT NULL,
  `validation_invalidation` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cibles_defaut`
--
ALTER TABLE `cibles_defaut`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_cibles_defaut_formats` (`nom_format`) USING BTREE,
  ADD KEY `FK_cibles_defaut_modeles` (`id_modele`),
  ADD KEY `FK_cibles_defaut_criteres_acquisition` (`critere_acquisition`) USING BTREE,
  ADD KEY `FK_cibles_defaut_criteres_revision` (`critere_revision`) USING BTREE;

--
-- Indexes for table `cibles_individuelles`
--
ALTER TABLE `cibles_individuelles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_cibles_indiv_peis_objectifs` (`id_objectif_pei`) USING BTREE,
  ADD KEY `FK_cibles_indiv_criteres_acquisition` (`critere_acquisition`) USING BTREE,
  ADD KEY `FK_cibles_indiv_criteres_revision` (`critere_revision`) USING BTREE,
  ADD KEY `FK_cibles_indiv_formats` (`nom_format`);

--
-- Indexes for table `cibles_seances`
--
ALTER TABLE `cibles_seances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_cibles_seances_seances` (`id_seance`) USING BTREE,
  ADD KEY `FK_cibles_seances_cibles_individuelles` (`id_cible_individuelle`) USING BTREE;

--
-- Indexes for table `classeurs`
--
ALTER TABLE `classeurs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_classeurs_enfants` (`identifiant_enfant`) USING BTREE,
  ADD KEY `FK_classeurs_valeurs` (`nom_valeur`) USING BTREE;

--
-- Indexes for table `competences`
--
ALTER TABLE `competences`
  ADD PRIMARY KEY (`nom`);

--
-- Indexes for table `competences_domaines`
--
ALTER TABLE `competences_domaines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_comp_dom_domaines` (`nom_domaine`) USING BTREE,
  ADD KEY `FK_comp_dom_competences` (`nom_competence`) USING BTREE;

--
-- Indexes for table `comportements`
--
ALTER TABLE `comportements`
  ADD PRIMARY KEY (`nom`);

--
-- Indexes for table `comportements_enfants`
--
ALTER TABLE `comportements_enfants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_comport_enf_enfants` (`identifiant_enfant`) USING BTREE,
  ADD KEY `FK_comport_enf_comportements` (`nom_comportement`) USING BTREE;

--
-- Indexes for table `comportements_seances`
--
ALTER TABLE `comportements_seances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_comport_seances_comport_enfants` (`id_comportement_enfant`) USING BTREE,
  ADD KEY `FK_comport_seances_seances` (`id_seance`) USING BTREE;

--
-- Indexes for table `criteres`
--
ALTER TABLE `criteres`
  ADD PRIMARY KEY (`nom`);

--
-- Indexes for table `domaines`
--
ALTER TABLE `domaines`
  ADD PRIMARY KEY (`nom`);

--
-- Indexes for table `enfants`
--
ALTER TABLE `enfants`
  ADD PRIMARY KEY (`identifiant`);

--
-- Indexes for table `formats`
--
ALTER TABLE `formats`
  ADD PRIMARY KEY (`nom`);

--
-- Indexes for table `log_cibles`
--
ALTER TABLE `log_cibles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_log_cibles_valeurs` (`nom_valeur`) USING BTREE,
  ADD KEY `FK_log_cibles_cibles_seances` (`id_cible_seance`) USING BTREE;

--
-- Indexes for table `log_comportements`
--
ALTER TABLE `log_comportements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_log_comport_comport_seances` (`id_comportement_seance`) USING BTREE;

--
-- Indexes for table `modeles`
--
ALTER TABLE `modeles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_modeles_objectifs` (`nom_objectif`);

--
-- Indexes for table `objectifs`
--
ALTER TABLE `objectifs`
  ADD PRIMARY KEY (`nom`);

--
-- Indexes for table `objectifs_competences`
--
ALTER TABLE `objectifs_competences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_obj_comp_competences` (`nom_competence`) USING BTREE,
  ADD KEY `FK_obj_comp_objectifs` (`nom_objectif`) USING BTREE;

--
-- Indexes for table `objectifs_peis`
--
ALTER TABLE `objectifs_peis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_obj_peis_objectifs` (`nom_objectif`) USING BTREE,
  ADD KEY `FK_obj_peis_peis` (`id_pei`) USING BTREE,
  ADD KEY `FK_obj_peis_remarques` (`remarque`) USING BTREE;

--
-- Indexes for table `peis`
--
ALTER TABLE `peis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_peis_enfants` (`identifiant_enfant`) USING BTREE;

--
-- Indexes for table `prerequis`
--
ALTER TABLE `prerequis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_prerequis_objectifs_peis` (`id_objectif_pei`) USING BTREE,
  ADD KEY `FK_prerequis_objectifs_peis_requis` (`id_objectif_pei_requis`) USING BTREE;

--
-- Indexes for table `remarques`
--
ALTER TABLE `remarques`
  ADD PRIMARY KEY (`nom`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`nom`);

--
-- Indexes for table `seances`
--
ALTER TABLE `seances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_seances_intervenants` (`identifiant_intervenant`) USING BTREE;

--
-- Indexes for table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD PRIMARY KEY (`identifiant`),
  ADD KEY `FK_utilisateurs_roles` (`nom_role`) USING BTREE;

--
-- Indexes for table `valeurs`
--
ALTER TABLE `valeurs`
  ADD PRIMARY KEY (`nom`);

--
-- Indexes for table `valeurs_formats`
--
ALTER TABLE `valeurs_formats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_val_form_formats` (`nom_format`),
  ADD KEY `FK_val_form_valeurs` (`nom_valeur`) USING BTREE;

--
-- Indexes for table `validations`
--
ALTER TABLE `validations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_validations_cibles_indiv` (`id_cible_individuelle`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cibles_defaut`
--
ALTER TABLE `cibles_defaut`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `cibles_individuelles`
--
ALTER TABLE `cibles_individuelles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `cibles_seances`
--
ALTER TABLE `cibles_seances`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `classeurs`
--
ALTER TABLE `classeurs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `competences_domaines`
--
ALTER TABLE `competences_domaines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `comportements_enfants`
--
ALTER TABLE `comportements_enfants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `comportements_seances`
--
ALTER TABLE `comportements_seances`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `log_cibles`
--
ALTER TABLE `log_cibles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `log_comportements`
--
ALTER TABLE `log_comportements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `modeles`
--
ALTER TABLE `modeles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `objectifs_competences`
--
ALTER TABLE `objectifs_competences`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `objectifs_peis`
--
ALTER TABLE `objectifs_peis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `peis`
--
ALTER TABLE `peis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `prerequis`
--
ALTER TABLE `prerequis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seances`
--
ALTER TABLE `seances`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `valeurs_formats`
--
ALTER TABLE `valeurs_formats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `validations`
--
ALTER TABLE `validations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cibles_defaut`
--
ALTER TABLE `cibles_defaut`
  ADD CONSTRAINT `FK_cibles_defaut_criteres_acquisition` FOREIGN KEY (`critere_acquisition`) REFERENCES `criteres` (`nom`),
  ADD CONSTRAINT `FK_cibles_defaut_criteres_revision` FOREIGN KEY (`critere_revision`) REFERENCES `criteres` (`nom`),
  ADD CONSTRAINT `FK_cibles_defaut_formats` FOREIGN KEY (`nom_format`) REFERENCES `formats` (`nom`),
  ADD CONSTRAINT `FK_cibles_defaut_modeles` FOREIGN KEY (`id_modele`) REFERENCES `modeles` (`id`);

--
-- Constraints for table `cibles_individuelles`
--
ALTER TABLE `cibles_individuelles`
  ADD CONSTRAINT `FK_cibles_indiv_criteres_acquisition` FOREIGN KEY (`critere_acquisition`) REFERENCES `criteres` (`nom`),
  ADD CONSTRAINT `FK_cibles_indiv_criteres_revision` FOREIGN KEY (`critere_revision`) REFERENCES `criteres` (`nom`),
  ADD CONSTRAINT `FK_cibles_indiv_formats` FOREIGN KEY (`nom_format`) REFERENCES `formats` (`nom`),
  ADD CONSTRAINT `FK_cibles_indiv_peis_objectifs` FOREIGN KEY (`id_objectif_pei`) REFERENCES `objectifs_peis` (`id`);

--
-- Constraints for table `cibles_seances`
--
ALTER TABLE `cibles_seances`
  ADD CONSTRAINT `FK_cibles_seances_cibles_individuelles` FOREIGN KEY (`id_cible_individuelle`) REFERENCES `cibles_individuelles` (`id`),
  ADD CONSTRAINT `FK_cibles_seances_seances` FOREIGN KEY (`id_seance`) REFERENCES `seances` (`id`);

--
-- Constraints for table `classeurs`
--
ALTER TABLE `classeurs`
  ADD CONSTRAINT `FK_classeurs_enfants` FOREIGN KEY (`identifiant_enfant`) REFERENCES `enfants` (`identifiant`),
  ADD CONSTRAINT `FK_classeurs_valeurs` FOREIGN KEY (`nom_valeur`) REFERENCES `valeurs` (`nom`);

--
-- Constraints for table `competences_domaines`
--
ALTER TABLE `competences_domaines`
  ADD CONSTRAINT `FK_comp_dom_competences` FOREIGN KEY (`nom_competence`) REFERENCES `competences` (`nom`),
  ADD CONSTRAINT `FK_comp_dom_domaines` FOREIGN KEY (`nom_domaine`) REFERENCES `domaines` (`nom`);

--
-- Constraints for table `comportements_enfants`
--
ALTER TABLE `comportements_enfants`
  ADD CONSTRAINT `FK_comport_enf_comportements` FOREIGN KEY (`nom_comportement`) REFERENCES `comportements` (`nom`),
  ADD CONSTRAINT `FK_comport_enf_enfants` FOREIGN KEY (`identifiant_enfant`) REFERENCES `enfants` (`identifiant`);

--
-- Constraints for table `comportements_seances`
--
ALTER TABLE `comportements_seances`
  ADD CONSTRAINT `FK_comport_seances_comport_enfants` FOREIGN KEY (`id_comportement_enfant`) REFERENCES `comportements_enfants` (`id`),
  ADD CONSTRAINT `FK_comport_seances_seances` FOREIGN KEY (`id_seance`) REFERENCES `seances` (`id`);

--
-- Constraints for table `log_cibles`
--
ALTER TABLE `log_cibles`
  ADD CONSTRAINT `FK_log_cibles_cibles_seances` FOREIGN KEY (`id_cible_seance`) REFERENCES `cibles_seances` (`id`),
  ADD CONSTRAINT `FK_log_cibles_valeurs` FOREIGN KEY (`nom_valeur`) REFERENCES `valeurs` (`nom`);

--
-- Constraints for table `log_comportements`
--
ALTER TABLE `log_comportements`
  ADD CONSTRAINT `FK_log_comport_comport_seances` FOREIGN KEY (`id_comportement_seance`) REFERENCES `comportements_seances` (`id`);

--
-- Constraints for table `modeles`
--
ALTER TABLE `modeles`
  ADD CONSTRAINT `FK_modeles_objectifs` FOREIGN KEY (`nom_objectif`) REFERENCES `objectifs` (`nom`);

--
-- Constraints for table `objectifs_competences`
--
ALTER TABLE `objectifs_competences`
  ADD CONSTRAINT `FK_obj_comp_competences` FOREIGN KEY (`nom_competence`) REFERENCES `competences` (`nom`),
  ADD CONSTRAINT `FK_obj_comp_objectifs` FOREIGN KEY (`nom_objectif`) REFERENCES `objectifs` (`nom`);

--
-- Constraints for table `objectifs_peis`
--
ALTER TABLE `objectifs_peis`
  ADD CONSTRAINT `FK_obj_peis_objectifs` FOREIGN KEY (`nom_objectif`) REFERENCES `objectifs` (`nom`),
  ADD CONSTRAINT `FK_obj_peis_peis` FOREIGN KEY (`id_pei`) REFERENCES `peis` (`id`),
  ADD CONSTRAINT `FK_obj_peis_remarques` FOREIGN KEY (`remarque`) REFERENCES `remarques` (`nom`);

--
-- Constraints for table `peis`
--
ALTER TABLE `peis`
  ADD CONSTRAINT `FK_peis_enfants` FOREIGN KEY (`identifiant_enfant`) REFERENCES `enfants` (`identifiant`);

--
-- Constraints for table `prerequis`
--
ALTER TABLE `prerequis`
  ADD CONSTRAINT `FK_prerequis_objectifs_peis` FOREIGN KEY (`id_objectif_pei`) REFERENCES `objectifs_peis` (`id`),
  ADD CONSTRAINT `FK_prerequis_objectifs_peis_requis` FOREIGN KEY (`id_objectif_pei_requis`) REFERENCES `objectifs_peis` (`id`);

--
-- Constraints for table `seances`
--
ALTER TABLE `seances`
  ADD CONSTRAINT `FK_seances_intervenants` FOREIGN KEY (`identifiant_intervenant`) REFERENCES `utilisateurs` (`identifiant`);

--
-- Constraints for table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD CONSTRAINT `FK_utilisateurs_roles` FOREIGN KEY (`nom_role`) REFERENCES `roles` (`nom`);

--
-- Constraints for table `valeurs_formats`
--
ALTER TABLE `valeurs_formats`
  ADD CONSTRAINT `FK_val_form_formats` FOREIGN KEY (`nom_format`) REFERENCES `formats` (`nom`),
  ADD CONSTRAINT `FK_val_form_valeurs` FOREIGN KEY (`nom_valeur`) REFERENCES `valeurs` (`nom`);

--
-- Constraints for table `validations`
--
ALTER TABLE `validations`
  ADD CONSTRAINT `FK_validations_cibles_indiv` FOREIGN KEY (`id_cible_individuelle`) REFERENCES `cibles_individuelles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
