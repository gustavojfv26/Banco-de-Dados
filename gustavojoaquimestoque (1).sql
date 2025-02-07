-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 06/02/2025 às 20:32
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `gustavojoaquimestoque`
--
CREATE DATABASE IF NOT EXISTS `gustavojoaquimestoque` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `gustavojoaquimestoque`;

-- --------------------------------------------------------

--
-- Estrutura para tabela ` cliente`
--

CREATE TABLE ` cliente` (
  ` cod_cliente` int(11) NOT NULL COMMENT 'Esse campo é responsável pela chave primária da tabela Cliente.',
  `nome_cliente` varchar(50) DEFAULT NULL COMMENT 'Esse campo é responsável pelo atributo nome do Cliente.',
  ` endereco` varchar(50) DEFAULT NULL COMMENT 'Esse campo é responsável pelo atributo endereço do Cliente.',
  `cidade` varchar(50) DEFAULT NULL COMMENT 'Esse campo é responsável pelo atributo cidade do Cliente.',
  ` cep` varchar(10) DEFAULT NULL COMMENT 'Esse campo é responsável pelo atributo CEP do Cliente.',
  ` cnpj` varchar(30) DEFAULT NULL COMMENT 'Esse campo é responsável pelo atributo CNPJ do Cliente',
  ` uf` char(2) DEFAULT NULL COMMENT 'Esse campo é responsável pelo atributo Unidade Federativa do Cliente.',
  ` ie` int(10) DEFAULT NULL COMMENT 'Esse campo é responsável pelo atributo inscrição estadual do Cliente.\n'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `cod_cliente` int(11) NOT NULL,
  `nome_cliente` varchar(50) DEFAULT NULL,
  `endereco` varchar(50) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL,
  `cep` varchar(10) DEFAULT NULL,
  `uf` char(2) DEFAULT NULL,
  `cnpj` varchar(30) DEFAULT NULL,
  `ie` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`cod_cliente`, `nome_cliente`, `endereco`, `cidade`, `cep`, `uf`, `cnpj`, `ie`) VALUES
(20, 'Beth', 'Av Climério n. 45', 'São Paulo', '25679300', 'SP', '3248512673268', 9280),
(110, 'Jorge', 'Rua Caiapó 13', 'Curitiba', '30078500', 'PR', '1451276498349', 0),
(130, 'Edmar', 'Rua da Prais s/n', 'Salvador', '30079300', 'BA', '234632842349', 7121),
(157, 'Paulo', 'Tv. Moraes c/3', 'Londrina', 'null', 'PR', '328482233242', 1923),
(180, 'Livio', 'Av. Beira Mar n.1256', 'Florianópolis', '30077500', 'SC', '1273657123474', 0),
(222, 'Lúcia', 'Rua Itabira 123 loja 09', 'Belo Horizonte', '22124391', 'MG', '2831521393488', 2985),
(234, 'José', 'Quadra 3 bl. 3 sl 1003', 'Brasilia', '22841650', 'DF', '2176357612323', 2931),
(260, 'Susana', 'Rua Lopes Mendes 12', 'Niterói', '30046500', 'RJ', '217635712329', 2530),
(290, 'Renato', 'Rua Meireles n. 123 bl.2 sl.345', 'São Paulo', '30225900', 'SP', '1327657112314', 1820),
(390, 'Sebastião', 'Rua da Igreja n. 10', 'Uberaba', '30438700', 'MG', '321765472133', 9071),
(410, 'Rodolfo', 'Largo da Lapa 27 sobrado', 'Rio de Janeiro', '30078900', 'RJ', '1283512823469', 7431),
(720, 'Ana', 'Rua 17 n. 19', 'Niteroi', '24358310', 'RJ', '12113231/0001-34', 2134),
(830, 'Mauricio', 'Av Paulista 1236 sl/2345', 'São Paulo', '3012683', 'SP', '3281698574656', 9343),
(870, 'Flavio', 'Av. Pres Vargas 10', 'São Paulo', '22763931', 'SP', '2253412693879', 4631);

-- --------------------------------------------------------

--
-- Estrutura para tabela `item_de_pedido`
--

CREATE TABLE `item_de_pedido` (
  `Pedido_num_pedido` int(11) NOT NULL,
  `Pedido_cod_produto` int(11) NOT NULL,
  `qtde` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedido`
--

CREATE TABLE `pedido` (
  `num_pedido` int(11) NOT NULL,
  `prazo_entrega` int(10) DEFAULT NULL,
  `Cliente_cod_cliente` int(11) NOT NULL,
  `Vendedor_cod_cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `pedido`
--

INSERT INTO `pedido` (`num_pedido`, `prazo_entrega`, `Cliente_cod_cliente`, `Vendedor_cod_cliente`) VALUES
(91, 20, 260, 11),
(97, 20, 720, 101),
(98, 20, 410, 209),
(101, 15, 720, 101),
(103, 20, 260, 11),
(104, 30, 110, 101),
(105, 15, 180, 240),
(108, 15, 290, 310),
(111, 20, 260, 240),
(119, 30, 390, 250),
(121, 20, 410, 209),
(127, 10, 410, 11),
(137, 20, 720, 720),
(138, 20, 260, 11),
(143, 30, 20, 111),
(148, 20, 720, 101),
(189, 15, 870, 213),
(203, 30, 830, 250);

-- --------------------------------------------------------

--
-- Estrutura para tabela ` produto`
--

CREATE TABLE ` produto` (
  `cod_produto` int(11) NOT NULL COMMENT 'Esse campo é responsável pela chave primária da tabela Produto.',
  ` unid_produto` varchar(10) DEFAULT NULL COMMENT 'Esse campo é responsável pelo atributo unidade de medida  do Produto.',
  `desc_produto` char(2) DEFAULT NULL COMMENT 'Esse campo é responsável pelo atributo descrição do Produto.',
  ` valor_unid` decimal(15,2) DEFAULT NULL COMMENT 'Esse campo é responsável pelo atributo valor do Produto.'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto`
--

CREATE TABLE `produto` (
  `cod_produto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `vendedor`
--

CREATE TABLE `vendedor` (
  `Cod_vendedor` int(11) NOT NULL,
  `nome_vendedor` varchar(50) DEFAULT NULL,
  `sal_fixo` decimal(15,2) DEFAULT NULL,
  `faixa_comissao` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `vendedor`
--

INSERT INTO `vendedor` (`Cod_vendedor`, `nome_vendedor`, `sal_fixo`, `faixa_comissao`) VALUES
(11, 'João', 2780.00, 'C'),
(101, 'João', 2650.32, 'C'),
(111, 'Carlos', 2490.00, 'A'),
(209, 'José', 1800.00, 'C'),
(213, 'Jonas', 2300.50, 'A'),
(240, 'Antonio', 9500.00, 'C'),
(250, 'Mauricío', 2930.00, 'B'),
(310, 'Josias', 870.00, 'B'),
(720, 'Felipe', 4600.00, 'A');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela ` cliente`
--
ALTER TABLE ` cliente`
  ADD PRIMARY KEY (` cod_cliente`);

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cod_cliente`);

--
-- Índices de tabela `item_de_pedido`
--
ALTER TABLE `item_de_pedido`
  ADD KEY `fk_Pedido_num_pedido` (`Pedido_num_pedido`),
  ADD KEY `fk_Pedido_cod_produto` (`Pedido_cod_produto`);

--
-- Índices de tabela `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`num_pedido`),
  ADD KEY `FK_CLIENTE_PEDIDO` (`Cliente_cod_cliente`),
  ADD KEY `FK_VENDEDOR_PEDIDO` (`Vendedor_cod_cliente`);

--
-- Índices de tabela ` produto`
--
ALTER TABLE ` produto`
  ADD PRIMARY KEY (`cod_produto`);

--
-- Índices de tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`cod_produto`);

--
-- Índices de tabela `vendedor`
--
ALTER TABLE `vendedor`
  ADD PRIMARY KEY (`Cod_vendedor`);

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `item_de_pedido`
--
ALTER TABLE `item_de_pedido`
  ADD CONSTRAINT `fk_Pedido_cod_produto` FOREIGN KEY (`Pedido_cod_produto`) REFERENCES `produto` (`cod_produto`),
  ADD CONSTRAINT `fk_Pedido_num_pedido` FOREIGN KEY (`Pedido_num_pedido`) REFERENCES `pedido` (`num_pedido`);

--
-- Restrições para tabelas `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `FK_CLIENTE_PEDIDO` FOREIGN KEY (`Cliente_cod_cliente`) REFERENCES `cliente` (`cod_cliente`),
  ADD CONSTRAINT `FK_VENDEDOR_PEDIDO` FOREIGN KEY (`Vendedor_cod_cliente`) REFERENCES `vendedor` (`Cod_vendedor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
