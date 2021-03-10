-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le :  mer. 10 mars 2021 à 16:00
-- Version du serveur :  10.1.38-MariaDB
-- Version de PHP :  7.1.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `Project_Mood`
--

-- --------------------------------------------------------

--
-- Structure de la table `ajoute`
--

CREATE TABLE `ajoute` (
  `Nom_Humeur` varchar(30) NOT NULL,
  `ID_Film` int(20) NOT NULL,
  `ID_Serie` int(20) NOT NULL,
  `ID_Musique` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `Films`
--

CREATE TABLE `Films` (
  `ID_Film` int(20) NOT NULL,
  `Titre_Film` varchar(60) NOT NULL,
  `Type_Film` varchar(30) NOT NULL,
  `Annee_Film` year(4) NOT NULL,
  `Synopsis_Film` varchar(380) NOT NULL,
  `Image_Film` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `Humeur`
--

CREATE TABLE `Humeur` (
  `Nom_Humeur` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `Humeur`
--

INSERT INTO `Humeur` (`Nom_Humeur`) VALUES
('Énervé(e)'),
('Heureux(se)'),
('Rêveur(se)'),
('Romantique'),
('Triste');

-- --------------------------------------------------------

--
-- Structure de la table `Musiques`
--

CREATE TABLE `Musiques` (
  `ID_Musique` int(20) NOT NULL,
  `Titre_Musique` varchar(60) NOT NULL,
  `Artiste` varchar(60) NOT NULL,
  `Album` varchar(60) NOT NULL,
  `Annee_Musique` year(4) NOT NULL,
  `Duree_Musique` time(6) NOT NULL,
  `Genre_Musique` varchar(40) NOT NULL,
  `Image_Musique` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `Series`
--

CREATE TABLE `Series` (
  `ID_Serie` int(20) NOT NULL,
  `Titre_Serie` varchar(60) NOT NULL,
  `Type_Serie` varchar(20) NOT NULL,
  `Saisons` int(2) NOT NULL,
  `Annee_Serie` year(4) NOT NULL,
  `Synopsis_Serie` varchar(380) NOT NULL,
  `Image_Serie` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `Utilisateur`
--

CREATE TABLE `Utilisateur` (
  `ID_Utilisateur` int(10) NOT NULL,
  `Nom` varchar(60) NOT NULL,
  `Prenom` varchar(60) NOT NULL,
  `Pseudonyme` varchar(50) NOT NULL,
  `Email` varchar(60) NOT NULL,
  `Mot_de_Passe` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `ajoute`
--
ALTER TABLE `ajoute`
  ADD PRIMARY KEY (`Nom_Humeur`),
  ADD KEY `ID_Film` (`ID_Film`),
  ADD KEY `ID_Serie` (`ID_Serie`),
  ADD KEY `ID_Musique` (`ID_Musique`);

--
-- Index pour la table `Films`
--
ALTER TABLE `Films`
  ADD PRIMARY KEY (`ID_Film`);

--
-- Index pour la table `Humeur`
--
ALTER TABLE `Humeur`
  ADD PRIMARY KEY (`Nom_Humeur`);

--
-- Index pour la table `Musiques`
--
ALTER TABLE `Musiques`
  ADD PRIMARY KEY (`ID_Musique`);

--
-- Index pour la table `Series`
--
ALTER TABLE `Series`
  ADD PRIMARY KEY (`ID_Serie`);

--
-- Index pour la table `Utilisateur`
--
ALTER TABLE `Utilisateur`
  ADD PRIMARY KEY (`ID_Utilisateur`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `ajoute`
--
ALTER TABLE `ajoute`
  ADD CONSTRAINT `ajoute_ibfk_1` FOREIGN KEY (`ID_Film`) REFERENCES `Films` (`ID_Film`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ajoute_ibfk_2` FOREIGN KEY (`ID_Serie`) REFERENCES `Series` (`ID_Serie`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ajoute_ibfk_3` FOREIGN KEY (`ID_Musique`) REFERENCES `Musiques` (`ID_Musique`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
