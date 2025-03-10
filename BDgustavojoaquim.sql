-- MySQL Script generated by MySQL Workbench
-- Tue Feb  4 15:54:39 2025
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.` Cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.` Cliente` ;

CREATE TABLE IF NOT EXISTS `mydb`.` Cliente` (
  ` cod_cliente` INT NOT NULL COMMENT 'Esse campo é responsável pela chave primária da tabela Cliente.',
  `nome_cliente` VARCHAR(50) NULL COMMENT 'Esse campo é responsável pelo atributo nome do Cliente.',
  ` endereco` VARCHAR(50) NULL COMMENT 'Esse campo é responsável pelo atributo endereço do Cliente.',
  `cidade` VARCHAR(50) NULL COMMENT 'Esse campo é responsável pelo atributo cidade do Cliente.',
  ` cep` VARCHAR(10) NULL COMMENT 'Esse campo é responsável pelo atributo CEP do Cliente.',
  ` cnpj` VARCHAR(30) NULL COMMENT 'Esse campo é responsável pelo atributo CNPJ do Cliente',
  ` uf` CHAR(2) NULL COMMENT 'Esse campo é responsável pelo atributo Unidade Federativa do Cliente.',
  ` ie` INT(10) NULL COMMENT 'Esse campo é responsável pelo atributo inscrição estadual do Cliente.\n',
  PRIMARY KEY (` cod_cliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.` Vendedor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.` Vendedor` ;

CREATE TABLE IF NOT EXISTS `mydb`.` Vendedor` (
  `cod_vendedor` INT NOT NULL COMMENT 'Esse campo é responsável pela chave primária da tabela Vendedor.',
  ` nome_vendedor` VARCHAR(50) NULL COMMENT 'Esse campo é responsável pelo atributo nome do Vendedor.',
  ` sal_fixo` DECIMAL(15,2) NULL COMMENT 'Esse campo é responsável pelo atributo salário fixo do Vendedor.',
  ` faixa_comissao` CHAR(2) NULL COMMENT 'Esse campo é responsável pelo atributo faixa de comissão do Vendedor.',
  PRIMARY KEY (`cod_vendedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.` Pedido`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.` Pedido` ;

CREATE TABLE IF NOT EXISTS `mydb`.` Pedido` (
  `num_pedido` INT NOT NULL COMMENT 'Esse campo é responsável pela chave primária da tabela Pedido.',
  ` prazo_entrega` INT(10) NULL COMMENT 'Esse campo é responsável pelo atributo prazo de entrega do Pedido.',
  ` Cliente_ cod_cliente` INT NOT NULL COMMENT 'Esse campo é responsável pela chave estrangeira, ela é chave primária da tabela Cliente.',
  ` Vendedor_cod_vendedor` INT NOT NULL COMMENT 'Esse campo é responsável pela chave estrangeira, ela é chave primária da tabela Vendedor.',
  PRIMARY KEY (`num_pedido`),
  INDEX `fk_ Pedido_ Cliente_idx` (` Cliente_ cod_cliente` ASC) VISIBLE,
  INDEX `fk_ Pedido_ Vendedor1_idx` (` Vendedor_cod_vendedor` ASC) VISIBLE,
  CONSTRAINT `fk_ Pedido_ Cliente`
    FOREIGN KEY (` Cliente_ cod_cliente`)
    REFERENCES `mydb`.` Cliente` (` cod_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ Pedido_ Vendedor1`
    FOREIGN KEY (` Vendedor_cod_vendedor`)
    REFERENCES `mydb`.` Vendedor` (`cod_vendedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.` Produto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.` Produto` ;

CREATE TABLE IF NOT EXISTS `mydb`.` Produto` (
  `cod_produto` INT NOT NULL COMMENT 'Esse campo é responsável pela chave primária da tabela Produto.',
  ` unid_produto` VARCHAR(10) NULL COMMENT 'Esse campo é responsável pelo atributo unidade de medida  do Produto.',
  `desc_produto` VARCHAR(50) NULL COMMENT 'Esse campo é responsável pelo atributo descrição do Produto.',
  ` valor_unid` DECIMAL(15,2) NULL COMMENT 'Esse campo é responsável pelo atributo valor do Produto.',
  PRIMARY KEY (`cod_produto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`table4`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`table4` ;

CREATE TABLE IF NOT EXISTS `mydb`.`table4` (
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`  Item de Pedido`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`  Item de Pedido` ;

CREATE TABLE IF NOT EXISTS `mydb`.`  Item de Pedido` (
  ` Pedido_num_pedido` INT NOT NULL COMMENT 'Esse campo é responsável pela chave primária da tabela Pedido.',
  ` Produto_cod_produto` INT NOT NULL COMMENT 'Esse campo é responsável pela  chave primária da tabela Produto.',
  ` qtde` INT NOT NULL COMMENT 'Esse campo é responsável pelo atributo quantidade.',
  PRIMARY KEY (` Pedido_num_pedido`, ` Produto_cod_produto`),
  INDEX `fk_ Pedido_has_ Produto_ Produto1_idx` (` Produto_cod_produto` ASC) VISIBLE,
  INDEX `fk_ Pedido_has_ Produto_ Pedido1_idx` (` Pedido_num_pedido` ASC) VISIBLE,
  CONSTRAINT `fk_ Pedido_has_ Produto_ Pedido1`
    FOREIGN KEY (` Pedido_num_pedido`)
    REFERENCES `mydb`.` Pedido` (`num_pedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ Pedido_has_ Produto_ Produto1`
    FOREIGN KEY (` Produto_cod_produto`)
    REFERENCES `mydb`.` Produto` (`cod_produto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
