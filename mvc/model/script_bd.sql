CREATE SCHEMA IF NOT EXISTS `mirifa` DEFAULT CHARACTER SET utf8mb4 ;
USE `mirifa` ;

CREATE TABLE `mirifa`.`plan` (
  `id_plan` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_plan`),
  UNIQUE INDEX `titulo_UNIQUE` (`titulo` ASC) VISIBLE);

CREATE TABLE `mirifa`.`usuario` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `login_status` CHAR(1) NULL,
  `id_plan` INT NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  INDEX `id_plan_idx` (`id_plan` ASC) VISIBLE,
  CONSTRAINT `id_plan`
    FOREIGN KEY (`id_plan`)
    REFERENCES `mirifa`.`plan` (`id_plan`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE `mirifa`.`rifador` (
  `id_rifador` INT NOT NULL AUTO_INCREMENT,
  `id_usuario` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `dni` INT NOT NULL,
  `telefono` INT NOT NULL,
  `cbu` INT NOT NULL,
  `redes_sociales` VARCHAR(45) NULL,
  PRIMARY KEY (`id_rifador`),
  UNIQUE INDEX `dni_UNIQUE` (`dni` ASC) VISIBLE,
  UNIQUE INDEX `id_usuario_UNIQUE` (`id_usuario` ASC) VISIBLE,
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
  `id_rifador` INT NOT NULL,
  `id_premio` INT NOT NULL,
  `cant_nros` INT NOT NULL,
  `valor_nro` INT NOT NULL,
  `medio_de_pago` INT NOT NULL,
  `cbu` INT NULL,
  `banco` VARCHAR(45) NULL,
  `fecha_sorteo` DATE NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_rifa`),
  INDEX `id_rifador_idx` (`id_rifador` ASC) VISIBLE,
  INDEX `id_premio_idx` (`id_premio` ASC) VISIBLE,
  INDEX `medio_de_pago_idx` (`medio_de_pago` ASC) VISIBLE,
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
  `nros_comprados` INT NULL,
  `comprobante` VARCHAR(45) NULL,
  PRIMARY KEY (`id_visitante`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE);

CREATE TABLE `mirifa`.`numero` (
  `id_nro` INT NOT NULL AUTO_INCREMENT,
  `id_rifa` INT NOT NULL,
  `id_visitante` INT NOT NULL,
  PRIMARY KEY (`id_nro`),
  INDEX `id_rifa_idx` (`id_rifa` ASC) VISIBLE,
  INDEX `id_visitante_idx` (`id_visitante` ASC) VISIBLE,
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

