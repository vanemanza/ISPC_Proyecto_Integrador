CREATE SCHEMA IF NOT EXISTS `mirifa` DEFAULT CHARACTER SET utf8mb4 ;
USE `mirifa` ;

CREATE TABLE `mirifa`.`plan` (
  `id_plan` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(70) NOT NULL,
  PRIMARY KEY (`id_plan`),
  UNIQUE INDEX `titulo_UNIQUE` (`titulo` ASC));

CREATE TABLE `mirifa`.`usuario` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `login_status` CHAR(1) NULL,
  `id_plan` INT NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) ,
  INDEX `id_plan_idx` (`id_plan` ASC),
  CONSTRAINT `id_plan`
    FOREIGN KEY (`id_plan`)
    REFERENCES `mirifa`.`plan` (`id_plan`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE `mirifa`.`rifador` (
  `id_rifador` VARCHAR(45) NOT NULL,
  `id_usuario` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `dni` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `cbu` VARCHAR(45) NOT NULL,
  `redes_sociales` VARCHAR(45) NULL,
  PRIMARY KEY (`id_rifador`),
  UNIQUE INDEX `dni_UNIQUE` (`dni` ASC),
  UNIQUE INDEX `id_usuario_UNIQUE` (`id_usuario` ASC),
  CONSTRAINT `id_usuario`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `mirifa`.`usuario` (`id_usuario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
    
CREATE TABLE `mirifa`.`medio_de_pago` (
  `id_medio_pago` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_medio_pago`));
  
CREATE TABLE `mirifa`.`emprendedor` (
  `id_emprendedor` INT NOT NULL AUTO_INCREMENT,
  `marca` VARCHAR(45) NULL,
  PRIMARY KEY (`id_emprendedor`));
  
CREATE TABLE `mirifa`.`premio` (
  `id_premio` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(45) NOT NULL,
  `foto` VARCHAR(45) NULL,
  PRIMARY KEY (`id_premio`));

CREATE TABLE `mirifa`.`rifa` (
  `id_rifa` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NOT NULL,
  `id_rifador` VARCHAR(45) NOT NULL,
  `id_premio` INT NOT NULL,
  `cant_nros` INT NOT NULL,
  `valor_nro` INT NOT NULL,
  `medio_de_pago` INT NOT NULL,
  `cbu` VARCHAR(45) NULL,
  `banco` VARCHAR(45) NULL,
  `fecha_sorteo` DATE NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_rifa`),
  INDEX `id_rifador_idx` (`id_rifador` ASC),
  INDEX `id_premio_idx` (`id_premio` ASC),
  INDEX `medio_de_pago_idx` (`medio_de_pago` ASC),
  CONSTRAINT `id_rifador`
    FOREIGN KEY (`id_rifador`)
    REFERENCES `mirifa`.`rifador` (`id_rifador`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `id_premio`
    FOREIGN KEY (`id_premio`)
    REFERENCES `mirifa`.`premio` (`id_premio`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `medio_de_pago`
    FOREIGN KEY (`medio_de_pago`)
    REFERENCES `mirifa`.`medio_de_pago` (`id_medio_pago`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
CREATE TABLE `mirifa`.`visitante` (
  `id_visitante` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `nros_comprados` VARCHAR(45) NULL,
  `comprobante` VARCHAR(45) NULL,
  PRIMARY KEY (`id_visitante`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC));

CREATE TABLE `mirifa`.`numero` (
  `id_nro` INT NOT NULL AUTO_INCREMENT,
  `id_rifa` INT NOT NULL,
  `id_visitante` INT NOT NULL,
  PRIMARY KEY (`id_nro`),
  INDEX `id_rifa_idx` (`id_rifa` ASC),
  INDEX `id_visitante_idx` (`id_visitante` ASC),
  CONSTRAINT `id_rifa`
    FOREIGN KEY (`id_rifa`)
    REFERENCES `mirifa`.`rifa` (`id_rifa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_visitante`
    FOREIGN KEY (`id_visitante`)
    REFERENCES `mirifa`.`visitante` (`id_visitante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

#Consultas : Insert - Select - Update - JOIN
/*INSERT INTO plan(titulo, descripcion) 
VALUES('Plan Básico','Panel Administrador, rifas ilimitadas y sorteador de ganadores');
INSERT INTO plan(titulo, descripcion) 
VALUES('Plan Empresa','Todos lo Basico, múlti-admins y soporte 24/7');
INSERT INTO plan(titulo, descripcion) 
VALUES('Plan Gratis','Crea tu causa, numeros infinitos y a rifar!');

INSERT INTO usuario(email, password, login_status, id_plan)
VALUES('email@email.com', '1234', 'A', 3);
INSERT INTO usuario(email, password, login_status, id_plan)
VALUES('empresa@soporte.com', 'asdf', 'A', 2);
INSERT INTO usuario(email, password, login_status, id_plan)
VALUES('email@gmail.com', 'asd123', 'A', 1);
SELECT * FROM usuario;
UPDATE usuario SET password= '123456789' WHERE id_usuario = '1';
SELECT Usuario.id_usuario, Usuario.email, Usuario.id_plan, Plan.id_plan, Plan.titulo from usuario 
INNER JOIN plan on Usuario.id_usuario = Plan.id_plan;

INSERT INTO rifador(id_rifador, id_usuario, nombre, dni, telefono, cbu, redes_sociales)
VALUES('1_r', 1, 'Jose', '22333444', '3517778899', '1234567890', '@jose.jose');
INSERT INTO rifador(id_rifador, id_usuario, nombre, dni, telefono, cbu, redes_sociales)
VALUES('2_r', 2, 'Hogar de perros', '99888777', '3513334455', '10987654321', '@tuhogardog');

INSERT INTO medio_de_pago(tipo) 
VALUES('Tarjeta de credito');
INSERT INTO medio_de_pago(tipo) 
VALUES('Tarjeta de debito');
INSERT INTO medio_de_pago(tipo) 
VALUES('Transferencia');
INSERT INTO medio_de_pago(tipo) 
VALUES('Mercado pago');

INSERT INTO premio(descripcion)
VALUES('Cordero de 5kg');
INSERT INTO premio(descripcion)
VALUES('Costillar de 5kg');

INSERT INTO rifa(titulo,id_rifador,id_premio,cant_nros,valor_nro,medio_de_pago,cbu,banco,fecha_sorteo,telefono)
VALUES('Compra de alimento', '2_r', 1, 300, 100, 3, '10987654321', 'Santander', '2022-12-10', '3513334455');
INSERT INTO rifa(titulo,id_rifador,id_premio,cant_nros,valor_nro,medio_de_pago,cbu,banco,fecha_sorteo,telefono)
VALUES('Viaje de egresados', '1_r', 2, 250, 150, 4, '1234567890', 'Mercado Pago', '2022-11-30', '3517778899');
SELECT * FROM rifa;
UPDATE rifa SET cant_nros = 500 WHERE id_rifa = '2';
SELECT Rifa.titulo, Rifa.id_rifador, Rifador.id_rifador, Rifador.nombre
FROM rifa INNER JOIN rifador ON Rifa.id_rifador = Rifador.id_rifador;*/