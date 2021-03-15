CREATE TABLE `heroku_f0eb8071def7f63`.`concursante` (
  `id` INT(11) NOT NULL,
  `enlace` VARCHAR(60) NOT NULL,
  `cancion` VARCHAR(45) NOT NULL,
  `puesto` DECIMAL(10,0) NOT NULL DEFAULT 0,
  `enabled` TINYINT(1) NOT NULL DEFAULT 1,
  `artista` VARCHAR(45) NOT NULL,
  `pais_id` INT(11) NOT NULL,
  `ano_edicion` VARCHAR(10) DEFAULT '2019',
  `edicion_actual` TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`));
  
ALTER TABLE `heroku_f0eb8071def7f63`.`concursante` 
  ADD CONSTRAINT `pais_id`
  FOREIGN KEY (`pais_id`)
  REFERENCES `heroku_f0eb8071def7f63`.`pais` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
CREATE TABLE `heroku_f0eb8071def7f63`.`liga` (
  `id` INT(11) NOT NULL,
  `nombre` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC));
  
CREATE TABLE `heroku_f0eb8071def7f63`.`jugador` (
  `id` INT(11) NOT NULL,
  `invitacion_aceptada` TINYINT(1) NOT NULL DEFAULT 0,
  `usuario_id` INT(11) NOT NULL,
  `liga_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`));
  
  --no funciona--
  ALTER TABLE `heroku_f0eb8071def7f63`.`jugador` 
ADD CONSTRAINT `usuario_id`
  FOREIGN KEY (`usuario_id`)
  REFERENCES `heroku_f0eb8071def7f63`.`usuario` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  --no funciona--
  
ALTER TABLE `heroku_f0eb8071def7f63`.`jugador` 
  ADD CONSTRAINT `liga_id`
  FOREIGN KEY (`liga_id`)
  REFERENCES `heroku_f0eb8071def7f63`.`liga` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
CREATE TABLE `heroku_f0eb8071def7f63`.`jugador_concursante` (
  `id` INT(11) NOT NULL,
  `jugador_id` INT(11) NOT NULL,
  `concursante_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`));
  
ALTER TABLE `heroku_f0eb8071def7f63`.`jugador_concursante` 
  ADD CONSTRAINT `jugador_id`
  FOREIGN KEY (`jugador_id`)
  REFERENCES `heroku_f0eb8071def7f63`.`jugador` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  
ALTER TABLE `heroku_f0eb8071def7f63`.`jugador_concursante` 
  ADD CONSTRAINT `concursante_id`
  FOREIGN KEY (`concursante_id`)
  REFERENCES `heroku_f0eb8071def7f63`.`concursante` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  alter table `heroku_f0eb8071def7f63`.`pais´ drop column enlace;
  alter table `heroku_f0eb8071def7f63`.`pais´ drop column cancion;
  alter table `heroku_f0eb8071def7f63`.`pais´ drop column artista;
  alter table `heroku_f0eb8071def7f63`.`pais´ drop column enabled;
  alter table `heroku_f0eb8071def7f63`.`pais´ drop column puesto;
  
commit;