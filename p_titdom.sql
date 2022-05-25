-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 25, 2022 at 07:36 AM
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
-- Database: `p'titdom`
--

-- --------------------------------------------------------

--
-- Table structure for table `cibles`
--

CREATE TABLE `cibles` (
  `id` int(11) NOT NULL,
  `id_peis_objectifs` int(11) NOT NULL,
  `intitule` varchar(255) NOT NULL,
  `ordre` int(11) NOT NULL,
  `valide` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cibles`
--

INSERT INTO `cibles` (`id`, `id_peis_objectifs`, `intitule`, `ordre`, `valide`) VALUES
(1, 1, 'saisir', 3, 1),
(2, 2, 'Attraper la brosse à dent', 3, 0),
(3, 2, 'Mettre du dentifrice sur la brosse', 4, 1),
(4, 5, 'selectionner un item', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cibles_default`
--

CREATE TABLE `cibles_default` (
  `id` int(11) NOT NULL,
  `id_objectif` int(255) NOT NULL,
  `intitule` varchar(255) NOT NULL,
  `ordre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cibles_default`
--

INSERT INTO `cibles_default` (`id`, `id_objectif`, `intitule`, `ordre`) VALUES
(1, 3, 'Attraper la brosse à dents', 3),
(2, 3, 'Mettre du dentifrice sur la brosse', 4),
(3, 2, 'saisir', 2);

-- --------------------------------------------------------

--
-- Table structure for table `competences`
--

CREATE TABLE `competences` (
  `id` int(11) NOT NULL,
  `competence` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `competences`
--

INSERT INTO `competences` (`id`, `competence`) VALUES
(1, 'PECS'),
(2, 'Echoïque'),
(3, 'MAND'),
(4, 'Hygiène'),
(5, 'RA');

-- --------------------------------------------------------

--
-- Table structure for table `competences_objectifs`
--

CREATE TABLE `competences_objectifs` (
  `id` int(11) NOT NULL,
  `id_competence` int(11) NOT NULL,
  `id_objectif` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `competences_objectifs`
--

INSERT INTO `competences_objectifs` (`id`, `id_competence`, `id_objectif`) VALUES
(1, 1, 2),
(2, 4, 3),
(3, 5, 1),
(4, 5, 4);

-- --------------------------------------------------------

--
-- Table structure for table `comportements`
--

CREATE TABLE `comportements` (
  `id` int(11) NOT NULL,
  `identifiant_enfant` varchar(255) NOT NULL,
  `intitule` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comportements`
--

INSERT INTO `comportements` (`id`, `identifiant_enfant`, `intitule`) VALUES
(1, 'enfant#1', 'cri'),
(2, 'enfant#1', 'pleurs'),
(3, 'enfant#2', 'crache'),
(4, 'enfant#2', 'se balance');

-- --------------------------------------------------------

--
-- Table structure for table `cotations`
--

CREATE TABLE `cotations` (
  `id` int(11) NOT NULL,
  `id_pei` int(11) NOT NULL,
  `nom_intervenant` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `commentaire` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cotations`
--

INSERT INTO `cotations` (`id`, `id_pei`, `nom_intervenant`, `date`, `commentaire`) VALUES
(1, 1, 'Aiova', '2022-05-23 09:32:40', 'utiliser la voiture comme recompense'),
(2, 2, 'camille', '2022-05-23 09:32:40', 'utiliser un gâteau comme récompense');

-- --------------------------------------------------------

--
-- Table structure for table `domaines`
--

CREATE TABLE `domaines` (
  `domaine` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `domaines`
--

INSERT INTO `domaines` (`domaine`) VALUES
('Autonomie'),
('Communication');

-- --------------------------------------------------------

--
-- Table structure for table `domaine_competence`
--

CREATE TABLE `domaine_competence` (
  `id` int(11) NOT NULL,
  `intitule_domaine` varchar(255) NOT NULL,
  `id_competence` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `domaine_competence`
--

INSERT INTO `domaine_competence` (`id`, `intitule_domaine`, `id_competence`) VALUES
(1, 'Autonomie', 4),
(2, 'Communication', 3),
(3, 'Communication', 2),
(4, 'Communication', 1),
(5, 'Communication', 5);

-- --------------------------------------------------------

--
-- Table structure for table `enfants`
--

CREATE TABLE `enfants` (
  `identifiant` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `enfants`
--

INSERT INTO `enfants` (`identifiant`) VALUES
('enfant#1'),
('enfant#2');

-- --------------------------------------------------------

--
-- Table structure for table `enfants_objectifs`
--

CREATE TABLE `enfants_objectifs` (
  `id` int(11) NOT NULL,
  `identifiant_enfant` varchar(255) NOT NULL,
  `id_objectif` int(11) NOT NULL,
  `validation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `enfants_objectifs`
--

INSERT INTO `enfants_objectifs` (`id`, `identifiant_enfant`, `id_objectif`, `validation`) VALUES
(1, 'enfant#1', 2, '2022-05-23 07:37:12'),
(2, 'enfant#1', 3, '2022-05-23 07:37:12'),
(3, 'enfant#1', 1, '2022-05-23 07:37:12'),
(4, 'enfant#2', 2, '2022-05-23 07:37:12'),
(5, 'enfant#2', 3, '2022-05-23 07:37:12'),
(6, 'enfant#2', 1, '2022-05-23 07:37:12'),
(7, 'enfant#1', 4, NULL),
(8, 'enfant#2', 4, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `intervenants`
--

CREATE TABLE `intervenants` (
  `nom` varchar(255) NOT NULL,
  `mdp` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `intervenants`
--

INSERT INTO `intervenants` (`nom`, `mdp`) VALUES
('Aiova', 'mdpaiova'),
('camille', 'mdpcamille');

-- --------------------------------------------------------

--
-- Table structure for table `log_cibles`
--

CREATE TABLE `log_cibles` (
  `id` int(11) NOT NULL,
  `id_cible` int(11) NOT NULL,
  `nom_intervenant` varchar(255) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `occurence` int(11) NOT NULL,
  `valeur` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `log_cibles`
--

INSERT INTO `log_cibles` (`id`, `id_cible`, `nom_intervenant`, `date`, `occurence`, `valeur`) VALUES
(5, 2, 'Aiova', '2022-05-23 10:53:18', 1, '+'),
(6, 2, 'Aiova', '2022-05-23 10:57:44', 2, 'G'),
(7, 4, 'Aiova', '2022-05-23 10:57:44', 1, 'G'),
(8, 1, 'Aiova', '2022-05-23 10:58:47', 1, 'IC'),
(9, 1, 'Aiova', '2022-05-23 10:58:47', 2, 'IP'),
(10, 1, 'Aiova', '2022-05-23 10:59:04', 3, '+');

-- --------------------------------------------------------

--
-- Table structure for table `log_comportements`
--

CREATE TABLE `log_comportements` (
  `id` int(11) NOT NULL,
  `id_comportement` int(11) NOT NULL,
  `nom_intervenant` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `nombre` int(11) NOT NULL DEFAULT '1',
  `duree` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `log_comportements`
--

INSERT INTO `log_comportements` (`id`, `id_comportement`, `nom_intervenant`, `date`, `nombre`, `duree`) VALUES
(7, 1, 'Aiova', '2022-05-23 10:59:32', 1, '00:01:32'),
(8, 1, 'Aiova', '2022-05-23 11:02:49', 1, '00:01:56'),
(9, 3, 'camille', '2022-05-23 11:01:54', 6, '00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `objectifs`
--

CREATE TABLE `objectifs` (
  `id` int(11) NOT NULL,
  `objectif` varchar(255) NOT NULL,
  `PECS_chainage` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `objectifs`
--

INSERT INTO `objectifs` (`id`, `objectif`, `PECS_chainage`) VALUES
(1, 'selectionner 4 items', 0),
(2, 'phase 1', 1),
(3, 'Se brosser les dents', 1),
(4, 'reconnaître 8 mots ou symboles', 0);

-- --------------------------------------------------------

--
-- Table structure for table `peis`
--

CREATE TABLE `peis` (
  `id` int(11) NOT NULL,
  `creation` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cloturation` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `peis`
--

INSERT INTO `peis` (`id`, `creation`, `cloturation`) VALUES
(1, '2022-05-20 16:35:07', NULL),
(2, '2022-05-20 16:35:58', NULL),
(3, '2022-05-24 14:54:36', '2022-05-24 14:54:30');

-- --------------------------------------------------------

--
-- Table structure for table `peis_objectifs`
--

CREATE TABLE `peis_objectifs` (
  `id` int(11) NOT NULL,
  `id_pei` int(11) NOT NULL,
  `id_enf_obj` int(11) NOT NULL,
  `indice_cible_fc` int(11) DEFAULT NULL,
  `observation` text,
  `valide` tinyint(1) NOT NULL,
  `remarque` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `peis_objectifs`
--

INSERT INTO `peis_objectifs` (`id`, `id_pei`, `id_enf_obj`, `indice_cible_fc`, `observation`, `valide`, `remarque`) VALUES
(1, 1, 1, 1, 'blablabla', 0, 'blabla'),
(2, 1, 2, 2, NULL, 1, ''),
(3, 2, 4, 1, NULL, 0, ''),
(4, 2, 5, 2, NULL, 1, ''),
(5, 1, 3, 3, NULL, 0, ''),
(6, 2, 6, 3, NULL, 0, ''),
(7, 1, 7, 4, NULL, 0, ''),
(8, 3, 1, 1, 'blablabla', 0, 'ITT'),
(9, 3, 2, 2, 'blablabla', 1, 'NET'),
(10, 3, 3, 3, 'blablabla', 0, 'ITT'),
(11, 3, 7, 4, 'blablabla', 1, 'NET');

-- --------------------------------------------------------

--
-- Table structure for table `valeurs`
--

CREATE TABLE `valeurs` (
  `intitule` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `valeurs`
--

INSERT INTO `valeurs` (`intitule`) VALUES
('+'),
('G'),
('IC'),
('IP');

-- --------------------------------------------------------

--
-- Table structure for table `valeurs_default`
--

CREATE TABLE `valeurs_default` (
  `id` int(11) NOT NULL,
  `id_cib_def` int(11) NOT NULL,
  `intitule_valeur` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `valeurs_default`
--

INSERT INTO `valeurs_default` (`id`, `id_cib_def`, `intitule_valeur`) VALUES
(1, 3, 'IC'),
(2, 3, 'IP'),
(3, 3, '+'),
(4, 1, '+'),
(5, 1, 'G');

-- --------------------------------------------------------

--
-- Table structure for table `valeurs_individuelles`
--

CREATE TABLE `valeurs_individuelles` (
  `id` int(11) NOT NULL,
  `id_cible` int(11) NOT NULL,
  `intitule_valeur` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `valeurs_individuelles`
--

INSERT INTO `valeurs_individuelles` (`id`, `id_cible`, `intitule_valeur`) VALUES
(1, 4, '+'),
(2, 4, 'G');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cibles`
--
ALTER TABLE `cibles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_cibles_peis_obj` (`id_peis_objectifs`);

--
-- Indexes for table `cibles_default`
--
ALTER TABLE `cibles_default`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_cibles_def_objectifs` (`id_objectif`);

--
-- Indexes for table `competences`
--
ALTER TABLE `competences`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `competences_objectifs`
--
ALTER TABLE `competences_objectifs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_obj_comp_objectifs` (`id_objectif`),
  ADD KEY `FK_obj_comp_competences` (`id_competence`);

--
-- Indexes for table `comportements`
--
ALTER TABLE `comportements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_comportements_enfants` (`identifiant_enfant`);

--
-- Indexes for table `cotations`
--
ALTER TABLE `cotations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_cotations_peis` (`id_pei`),
  ADD KEY `FK_cotations_intervenants` (`nom_intervenant`);

--
-- Indexes for table `domaines`
--
ALTER TABLE `domaines`
  ADD PRIMARY KEY (`domaine`);

--
-- Indexes for table `domaine_competence`
--
ALTER TABLE `domaine_competence`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_dom_comp_competences` (`id_competence`),
  ADD KEY `FK_dom_comp_domaines` (`intitule_domaine`);

--
-- Indexes for table `enfants`
--
ALTER TABLE `enfants`
  ADD PRIMARY KEY (`identifiant`);

--
-- Indexes for table `enfants_objectifs`
--
ALTER TABLE `enfants_objectifs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_enf_obj_objectifs` (`id_objectif`),
  ADD KEY `FK_enf_obj_enfants` (`identifiant_enfant`);

--
-- Indexes for table `intervenants`
--
ALTER TABLE `intervenants`
  ADD PRIMARY KEY (`nom`);

--
-- Indexes for table `log_cibles`
--
ALTER TABLE `log_cibles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_log_cibles_cibles` (`id_cible`),
  ADD KEY `FK_log_cibles_intervenants` (`nom_intervenant`);

--
-- Indexes for table `log_comportements`
--
ALTER TABLE `log_comportements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_log_comp_comportements` (`id_comportement`),
  ADD KEY `FK_log_comp_intervenants` (`nom_intervenant`);

--
-- Indexes for table `objectifs`
--
ALTER TABLE `objectifs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `peis`
--
ALTER TABLE `peis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `peis_objectifs`
--
ALTER TABLE `peis_objectifs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_peis_obj_peis` (`id_pei`),
  ADD KEY `FK_peis_obj_enf_obj` (`id_enf_obj`);

--
-- Indexes for table `valeurs`
--
ALTER TABLE `valeurs`
  ADD PRIMARY KEY (`intitule`);

--
-- Indexes for table `valeurs_default`
--
ALTER TABLE `valeurs_default`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_val_def_cib_def` (`id_cib_def`),
  ADD KEY `FK_val_def_valeurs` (`intitule_valeur`);

--
-- Indexes for table `valeurs_individuelles`
--
ALTER TABLE `valeurs_individuelles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_val_indiv_cibles` (`id_cible`),
  ADD KEY `FK_val_indiv_valeurs` (`intitule_valeur`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cibles`
--
ALTER TABLE `cibles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cibles_default`
--
ALTER TABLE `cibles_default`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `competences`
--
ALTER TABLE `competences`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `competences_objectifs`
--
ALTER TABLE `competences_objectifs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `comportements`
--
ALTER TABLE `comportements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cotations`
--
ALTER TABLE `cotations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `domaine_competence`
--
ALTER TABLE `domaine_competence`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `enfants_objectifs`
--
ALTER TABLE `enfants_objectifs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `log_cibles`
--
ALTER TABLE `log_cibles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `log_comportements`
--
ALTER TABLE `log_comportements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `objectifs`
--
ALTER TABLE `objectifs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `peis`
--
ALTER TABLE `peis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `peis_objectifs`
--
ALTER TABLE `peis_objectifs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `valeurs_default`
--
ALTER TABLE `valeurs_default`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `valeurs_individuelles`
--
ALTER TABLE `valeurs_individuelles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cibles`
--
ALTER TABLE `cibles`
  ADD CONSTRAINT `FK_cibles_peis_obj` FOREIGN KEY (`id_peis_objectifs`) REFERENCES `peis_objectifs` (`id`);

--
-- Constraints for table `cibles_default`
--
ALTER TABLE `cibles_default`
  ADD CONSTRAINT `FK_cibles_def_objectifs` FOREIGN KEY (`id_objectif`) REFERENCES `objectifs` (`id`);

--
-- Constraints for table `competences_objectifs`
--
ALTER TABLE `competences_objectifs`
  ADD CONSTRAINT `FK_obj_comp_competences` FOREIGN KEY (`id_competence`) REFERENCES `competences` (`id`),
  ADD CONSTRAINT `FK_obj_comp_objectifs` FOREIGN KEY (`id_objectif`) REFERENCES `objectifs` (`id`);

--
-- Constraints for table `comportements`
--
ALTER TABLE `comportements`
  ADD CONSTRAINT `FK_comportements_enfants` FOREIGN KEY (`identifiant_enfant`) REFERENCES `enfants` (`identifiant`);

--
-- Constraints for table `cotations`
--
ALTER TABLE `cotations`
  ADD CONSTRAINT `FK_cotations_intervenants` FOREIGN KEY (`nom_intervenant`) REFERENCES `intervenants` (`nom`),
  ADD CONSTRAINT `FK_cotations_peis` FOREIGN KEY (`id_pei`) REFERENCES `peis` (`id`);

--
-- Constraints for table `domaine_competence`
--
ALTER TABLE `domaine_competence`
  ADD CONSTRAINT `FK_dom_comp_competences` FOREIGN KEY (`id_competence`) REFERENCES `competences` (`id`),
  ADD CONSTRAINT `FK_dom_comp_domaines` FOREIGN KEY (`intitule_domaine`) REFERENCES `domaines` (`domaine`);

--
-- Constraints for table `enfants_objectifs`
--
ALTER TABLE `enfants_objectifs`
  ADD CONSTRAINT `FK_enf_obj_enfants` FOREIGN KEY (`identifiant_enfant`) REFERENCES `enfants` (`identifiant`),
  ADD CONSTRAINT `FK_enf_obj_objectifs` FOREIGN KEY (`id_objectif`) REFERENCES `objectifs` (`id`);

--
-- Constraints for table `log_cibles`
--
ALTER TABLE `log_cibles`
  ADD CONSTRAINT `FK_log_cibles_cibles` FOREIGN KEY (`id_cible`) REFERENCES `cibles` (`id`),
  ADD CONSTRAINT `FK_log_cibles_intervenants` FOREIGN KEY (`nom_intervenant`) REFERENCES `intervenants` (`nom`);

--
-- Constraints for table `log_comportements`
--
ALTER TABLE `log_comportements`
  ADD CONSTRAINT `FK_log_comp_comportements` FOREIGN KEY (`id_comportement`) REFERENCES `comportements` (`id`),
  ADD CONSTRAINT `FK_log_comp_intervenants` FOREIGN KEY (`nom_intervenant`) REFERENCES `intervenants` (`nom`);

--
-- Constraints for table `peis_objectifs`
--
ALTER TABLE `peis_objectifs`
  ADD CONSTRAINT `FK_peis_obj_enf_obj` FOREIGN KEY (`id_enf_obj`) REFERENCES `enfants_objectifs` (`id`),
  ADD CONSTRAINT `FK_peis_obj_peis` FOREIGN KEY (`id_pei`) REFERENCES `peis` (`id`);

--
-- Constraints for table `valeurs_default`
--
ALTER TABLE `valeurs_default`
  ADD CONSTRAINT `FK_val_def_cib_def` FOREIGN KEY (`id_cib_def`) REFERENCES `cibles_default` (`id`),
  ADD CONSTRAINT `FK_val_def_valeurs` FOREIGN KEY (`intitule_valeur`) REFERENCES `valeurs` (`intitule`);

--
-- Constraints for table `valeurs_individuelles`
--
ALTER TABLE `valeurs_individuelles`
  ADD CONSTRAINT `FK_val_indiv_cibles` FOREIGN KEY (`id_cible`) REFERENCES `cibles` (`id`),
  ADD CONSTRAINT `FK_val_indiv_valeurs` FOREIGN KEY (`intitule_valeur`) REFERENCES `valeurs` (`intitule`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
