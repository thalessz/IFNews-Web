-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 19-Mar-2024 às 15:51
-- Versão do servidor: 8.0.27
-- versão do PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `ifnews`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `autor`
--

DROP TABLE IF EXISTS `autor`;
CREATE TABLE IF NOT EXISTS `autor` (
  `prontuario` varchar(10) NOT NULL,
  `nome` varchar(128) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `senha` varchar(63) DEFAULT NULL,
  `img_dir` varchar(1024) DEFAULT NULL,
  `is_root` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`prontuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `autor_noticia`
--

DROP TABLE IF EXISTS `autor_noticia`;
CREATE TABLE IF NOT EXISTS `autor_noticia` (
  `prontuario_autor` varchar(10) NOT NULL,
  `id_noticia` int NOT NULL,
  KEY `prontuario_autor` (`prontuario_autor`),
  KEY `id_noticia` (`id_noticia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `noticia`
--

DROP TABLE IF EXISTS `noticia`;
CREATE TABLE IF NOT EXISTS `noticia` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(128) DEFAULT NULL,
  `lide` text,
  `corpo` text,
  `img_dir` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `noticia_tag`
--

DROP TABLE IF EXISTS `noticia_tag`;
CREATE TABLE IF NOT EXISTS `noticia_tag` (
  `id_noticia` int DEFAULT NULL,
  `id_tag` varchar(8) DEFAULT NULL,
  KEY `id_noticia` (`id_noticia`),
  KEY `id_tag` (`id_tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tag`
--

DROP TABLE IF EXISTS `tag`;
CREATE TABLE IF NOT EXISTS `tag` (
  `id` varchar(8) NOT NULL,
  `nome` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `autor_noticia`
--
ALTER TABLE `autor_noticia`
  ADD CONSTRAINT `autor_noticia_ibfk_1` FOREIGN KEY (`prontuario_autor`) REFERENCES `autor` (`prontuario`),
  ADD CONSTRAINT `autor_noticia_ibfk_2` FOREIGN KEY (`id_noticia`) REFERENCES `noticia` (`id`);

--
-- Limitadores para a tabela `noticia_tag`
--
ALTER TABLE `noticia_tag`
  ADD CONSTRAINT `noticia_tag_ibfk_1` FOREIGN KEY (`id_noticia`) REFERENCES `noticia` (`id`),
  ADD CONSTRAINT `noticia_tag_ibfk_2` FOREIGN KEY (`id_tag`) REFERENCES `tag` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
