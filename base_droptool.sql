-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 31-Maio-2023 às 00:50
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `base_droptool`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `itens`
--
CREATE DATABASE base_droptool;

USE base_droptool;

CREATE TABLE `itens` (
  `id` int(11) UNSIGNED NOT NULL,
  `nome` varchar(100) NOT NULL,
  `qtdVendas` int(11) UNSIGNED NOT NULL,
  `dtRegistro` datetime NOT NULL DEFAULT current_timestamp(),
  `numDenuncias` int(11) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL COMMENT '10 - Analisado\r\n20 - Em análise\r\n90 - Suspeito'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `itens`
--

INSERT INTO `itens` (`id`, `nome`, `qtdVendas`, `dtRegistro`, `numDenuncias`, `status`) VALUES
(1, 'Relógio Inteligente', 10, '2023-01-01 00:00:00', 0, 90),
(2, 'Máscara Facial', 5, '2023-02-03 00:00:00', 2, 20),
(3, 'Camiseta Branca', 15, '2023-03-10 00:00:00', 1, 20),
(4, 'Fones de Ouvido Bluetooth', 8, '2023-04-15 00:00:00', 0, 20),
(5, 'Bolsa de Couro', 20, '2023-05-20 00:00:00', 0, 20),
(6, 'Óculos de Sol', 2, '2023-01-02 00:00:00', 0, 20),
(7, 'Sapato Social', 12, '2023-02-04 00:00:00', 1, 20),
(8, 'Vestido de Festa', 7, '2023-03-11 00:00:00', 0, 20),
(9, 'Mochila Esportiva', 18, '2023-04-16 00:00:00', 0, 20),
(10, 'Câmera Digital', 3, '2023-05-21 00:00:00', 3, 20),
(11, 'Chapéu de Praia', 6, '2023-01-03 00:00:00', 0, 20),
(12, 'Colar de Prata', 14, '2023-02-05 00:00:00', 2, 20),
(13, 'Jaqueta de Couro', 9, '2023-03-12 00:00:00', 1, 20),
(14, 'Celular Smartphone', 22, '2023-04-17 00:00:00', 0, 20),
(15, 'Perfume Importado', 1, '2023-05-22 00:00:00', 0, 20),
(16, 'Calça Jeans', 11, '2023-01-04 00:00:00', 0, 20),
(17, 'Notebook', 4, '2023-02-06 00:00:00', 1, 20),
(18, 'Tênis Esportivo', 17, '2023-03-13 00:00:00', 0, 20),
(19, 'Relógio de Pulso', 13, '2023-04-18 00:00:00', 0, 90),
(20, 'Cadeira de Escritório', 8, '2023-05-23 00:00:00', 2, 20),
(21, 'Mouse sem Fio', 5, '2023-01-05 00:00:00', 0, 20),
(22, 'Teclado Mecânico', 19, '2023-02-07 00:00:00', 3, 20),
(23, 'Caneca de Porcelana', 2, '2023-03-14 00:00:00', 0, 20),
(24, 'Livro de Suspense', 16, '2023-04-19 00:00:00', 1, 20),
(25, 'Capa para Celular', 6, '2023-05-24 00:00:00', 0, 20),
(26, 'Carregador Portátil', 21, '2023-01-06 00:00:00', 0, 20),
(27, 'Cortador de Cabelo', 3, '2023-02-08 00:00:00', 0, 20),
(28, 'Bicicleta Dobrável', 10, '2023-03-15 00:00:00', 2, 20),
(29, 'Mala de Viagem', 7, '2023-04-20 00:00:00', 1, 20),
(30, 'Ventilador de Mesa', 25, '2023-05-25 00:00:00', 0, 20);

-- --------------------------------------------------------

--
-- Estrutura da tabela `itens_suspeitos`
--

CREATE TABLE `itens_suspeitos` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `data_suspeito` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `itens_suspeitos`
--

INSERT INTO `itens_suspeitos` (`id`, `nome`, `item_id`, `data_suspeito`) VALUES
(1, 'Relógio Inteligente', 1, '2023-05-31 00:44:16'),
(2, 'Relógio de Pulso', 19, '2023-05-31 00:44:16');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `itens`
--
ALTER TABLE `itens`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `itens_suspeitos`
--
ALTER TABLE `itens_suspeitos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `itens`
--
ALTER TABLE `itens`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de tabela `itens_suspeitos`
--
ALTER TABLE `itens_suspeitos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
