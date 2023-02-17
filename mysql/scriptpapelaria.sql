CREATE SCHEMA `bancopapelaria` ;

CREATE TABLE `bancopapelaria`.`tb_usuario` (
  `idfuncionario` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `funcao` VARCHAR(45) NOT NULL DEFAULT 'Vendedor',
  `telefone` VARCHAR(11) NOT NULL,
  `endereco` VARCHAR(45) NOT NULL,
  `status` VARCHAR(45) NOT NULL DEFAULT 'Ativo',
  `dataAdmissao` DATETIME NOT NULL,
  PRIMARY KEY (`idfuncionario`));
  
ALTER TABLE `bancopapelaria`.`tb_cliente` 
ADD INDEX `fkFuncionario_idx` (`idfuncionario` ASC) VISIBLE;
;
ALTER TABLE `bancopapelaria`.`tb_cliente` 
ADD CONSTRAINT `fkFuncionario`
  FOREIGN KEY (`idfuncionario`)
  REFERENCES `bancopapelaria`.`tb_usuario` (`idfuncionario`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

CREATE TABLE `bancopapelaria`.`tb_compra` (
  `idCompra` INT NOT NULL,
  `idFuncionario` INT NOT NULL,
  `idCliente` VARCHAR(11) NOT NULL,
  `idProduto` INT NOT NULL,
  `quantidade` INT NOT NULL DEFAULT 1,
  `dataCompra` DATETIME NOT NULL,
  `pagamento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCompra`),
  INDEX `fkCliente_idx` (`idCliente` ASC) VISIBLE,
  INDEX `fkProduto_idx` (`idProduto` ASC) VISIBLE,
  INDEX `fkFuncionarioCompra_idx` (`idFuncionario` ASC) VISIBLE,
  CONSTRAINT `fkFuncionarioCompra`
    FOREIGN KEY (`idFuncionario`)
    REFERENCES `bancopapelaria`.`tb_usuario` (`idfuncionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fkCliente`
    FOREIGN KEY (`idCliente`)
    REFERENCES `bancopapelaria`.`tb_cliente` (`CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fkProduto`
    FOREIGN KEY (`idProduto`)
    REFERENCES `bancopapelaria`.`tb_estoque` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
