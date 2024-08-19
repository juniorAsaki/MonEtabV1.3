-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mar. 13 août 2024 à 18:36
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `etab_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `Eleve`
--

CREATE TABLE `Eleve` (
  `id_Eleve` int(11) NOT NULL,
  `matricule` varchar(100) NOT NULL,
  `classe` varchar(100) NOT NULL,
  `id_Personne` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `Eleve`
--

INSERT INTO `Eleve` (`id_Eleve`, `matricule`, `classe`, `id_Personne`) VALUES
(3, '111122222S', 'java', 5);

-- --------------------------------------------------------

--
-- Structure de la table `Personne`
--

CREATE TABLE `Personne` (
  `id_Personne` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `ville` varchar(100) NOT NULL,
  `telephone` varchar(100) NOT NULL,
  `dateNaissance` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `Personne`
--

INSERT INTO `Personne` (`id_Personne`, `nom`, `prenom`, `ville`, `telephone`, `dateNaissance`) VALUES
(5, 'junior', 'nch', 'Babi', '0704817000', '1999-09-21');

-- --------------------------------------------------------

--
-- Structure de la table `Professeur`
--

CREATE TABLE `Professeur` (
  `id_Professeur` int(11) NOT NULL,
  `vacant` tinyint(1) NOT NULL,
  `matiereEnseigne` varchar(100) NOT NULL,
  `prochainCour` varchar(100) NOT NULL,
  `sujetProchaineReunion` varchar(100) NOT NULL,
  `id_Personne` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id_Utilisateur` int(11) NOT NULL,
  `pseudo` varchar(50) NOT NULL,
  `motDePasse` varchar(50) NOT NULL,
  `dateCreation` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id_Utilisateur`, `pseudo`, `motDePasse`, `dateCreation`) VALUES
(1, 'admin', 'admin', '2024-08-10 13:13:23');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Eleve`
--
ALTER TABLE `Eleve`
  ADD PRIMARY KEY (`id_Eleve`),
  ADD KEY `id_Personne` (`id_Personne`);

--
-- Index pour la table `Personne`
--
ALTER TABLE `Personne`
  ADD PRIMARY KEY (`id_Personne`);

--
-- Index pour la table `Professeur`
--
ALTER TABLE `Professeur`
  ADD PRIMARY KEY (`id_Professeur`),
  ADD KEY `id_Personne` (`id_Personne`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id_Utilisateur`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Eleve`
--
ALTER TABLE `Eleve`
  MODIFY `id_Eleve` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `Personne`
--
ALTER TABLE `Personne`
  MODIFY `id_Personne` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `Professeur`
--
ALTER TABLE `Professeur`
  MODIFY `id_Professeur` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id_Utilisateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Eleve`
--
ALTER TABLE `Eleve`
  ADD CONSTRAINT `Eleve_ibfk_1` FOREIGN KEY (`id_Personne`) REFERENCES `Personne` (`id_Personne`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `Professeur`
--
ALTER TABLE `Professeur`
  ADD CONSTRAINT `Professeur_ibfk_1` FOREIGN KEY (`id_Personne`) REFERENCES `Personne` (`id_Personne`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
