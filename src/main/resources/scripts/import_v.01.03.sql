CREATE TABLE `heroku_f0eb8071def7f63`.`usuario` (
  `id` INT(11) NOT NULL,
  `username` VARCHAR(30) NOT NULL,
  `password` VARCHAR(60) NOT NULL,
  `nombre` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC));
  
  ALTER TABLE `heroku_f0eb8071def7f63`.`usuario` 
ADD COLUMN `apellidos` VARCHAR(60) NULL AFTER `nombre`;


  CREATE TABLE `heroku_f0eb8071def7f63`.`pais` (
  `id` INT(11) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `enlace` VARCHAR(60) NOT NULL,
  `bandera` VARCHAR(45) NOT NULL,
  `cancion` VARCHAR(45) NOT NULL,
  `puesto` DECIMAL(10,0) NOT NULL DEFAULT 0,
  `enabled` TINYINT(1) NOT NULL DEFAULT 1,
  `artista` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));
  
  CREATE TABLE `heroku_f0eb8071def7f63`.`authorities` (
  `usuario_id` INT(11) NOT NULL,
  `authority` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`usuario_id`, `authority`));

  
  ALTER TABLE `heroku_f0eb8071def7f63`.`authorities` 
ADD CONSTRAINT `usuario_id`
  FOREIGN KEY (`usuario_id`)
  REFERENCES `heroku_f0eb8071def7f63`.`usuario` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  CREATE TABLE `heroku_f0eb8071def7f63`.`usuario_pais` (
  `id` INT(11) NOT NULL,
  `usuario_id` INT(11) NOT NULL,
  `pais_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`));

  autoincrement id
  
  
/*populate tables*/
INSERT INTO usuario (id,username, password, nombre, apellidos) VALUES (1,'toni','$2a$10$kVtd.9Ymvwzyb1YzEFFoeetuDfj7wIgGknF78zZ6Wq5p1zMFupjI6','Toni','Ferreiro');
INSERT INTO usuario (id,username, password, nombre, apellidos) VALUES (2,'anxela','$2a$10$CzALgJl2/AKJBCqeM/T2L.hIAsoNiYuLXoigVUGnxnF6y/ViTcW/2','Anxela','Estevez');
INSERT INTO usuario (id,username, password, nombre, apellidos) VALUES (3,'nazare','$2a$10$bupR27pZrPTBoIgnXElWC.McMixP/iXAKKIFRiOJT7SWG8ViqCNc6','Nazare','Estevez');
INSERT INTO usuario (id,username, password, nombre, apellidos) VALUES (4,'oli','$2a$10$In.vshHrzKgxajkJi1dAi.RP.ZfNYPskzttCs2GPBPJZPe0XxJBP.','Olaia','Perez');
INSERT INTO usuario (id,username, password, nombre, apellidos) VALUES (5,'tamara','$2a$10$3avexu24EQ579i4fYY.KcO5vHVMS0baPxMfs7qVSlOL6foKf0pjra','Tamara','Fraga');
INSERT INTO usuario (id,username, password, nombre, apellidos) VALUES (6,'andrea','$2a$10$H0.wxJJMonYGRuNxi07rMe5UB8vPVA3.Fn8FNSvsdWJam2B6aKpQC','Andrea','Cao');
INSERT INTO usuario (id,username, password, nombre, apellidos) VALUES (7,'adolfo','$2a$10$WWyRa/37bXo3iVbcD92D5.12pXgFpWrdyIzz9R7aq/fI376aVVBSm','Adolfo','Dominguez');
INSERT INTO usuario (id,username, password, nombre, apellidos) VALUES (8,'dani','$2a$10$HJxa4E/oXalIHJGXK1j5MeUwWaBsdNks1rA4JT05V66/HtZdjRusW','Dani','Rodriguez');
INSERT INTO usuario (id,username, password, nombre, apellidos) VALUES (9,'mariana','$2a$10$M07LslTPPiEQfim.UIkYV.8UpgNDkQdRtuitHU9fI58rpbvrw7YqG','Mariana','Fandiño');
INSERT INTO usuario (id,username, password, nombre, apellidos) VALUES (10,'miguel','$2a$10$rlWsOMq8FxzJ2iBRTic1rusmXiF2IZhV.CHs25k6085FnsngJfcoy','Miguel','Dominguez');
INSERT INTO usuario (id,username, password, nombre, apellidos) VALUES (11,'patri','$2a$10$In.vshHrzKgxajkJi1dAi.RP.ZfNYPskzttCs2GPBPJZPe0XxJBP.','Patri','Sotelo');

INSERT INTO authorities (usuario_id, authority) VALUES (1, 'ROLE_ADMIN');
INSERT INTO authorities (usuario_id, authority) VALUES (1, 'ROLE_USER');
INSERT INTO authorities (usuario_id, authority) VALUES (2, 'ROLE_USER');
INSERT INTO authorities (usuario_id, authority) VALUES (3, 'ROLE_USER');
INSERT INTO authorities (usuario_id, authority) VALUES (4, 'ROLE_USER');
INSERT INTO authorities (usuario_id, authority) VALUES (5, 'ROLE_USER');
INSERT INTO authorities (usuario_id, authority) VALUES (6, 'ROLE_USER');
INSERT INTO authorities (usuario_id, authority) VALUES (7, 'ROLE_USER');
INSERT INTO authorities (usuario_id, authority) VALUES (8, 'ROLE_USER');
INSERT INTO authorities (usuario_id, authority) VALUES (9, 'ROLE_USER');
INSERT INTO authorities (usuario_id, authority) VALUES (10, 'ROLE_USER');
INSERT INTO authorities (usuario_id, authority) VALUES (11, 'ROLE_USER');

INSERT INTO pais (id,nombre, enlace, artista, cancion, puesto, bandera, enabled) VALUES (1,'España','https://www.youtube.com/watch?v=eWEFU2c3tBI','Miki','La venda',0,'espana.png',1);
INSERT INTO pais (id,nombre, enlace, artista, cancion, puesto, bandera, enabled) VALUES (2,'Australia','https://www.youtube.com/watch?v=XoVKpOodlos','Kate Miller-Heidke','Zero gravity',0,'australia.png',1);
INSERT INTO pais (id,nombre, enlace, artista, cancion, puesto, bandera, enabled) VALUES (3,'Austria','https://www.youtube.com/watch?v=S2HFBexHDXk','Paenda','Limits',0,'austria.png',1);
INSERT INTO pais (id,nombre, enlace, artista, cancion, puesto, bandera, enabled) VALUES (4,'Albania','https://www.youtube.com/watch?v=eo4aFzAkQkA','Jonida Maliqi','Ktheju tokës',0,'albania.png',1);
INSERT INTO pais (id,nombre, enlace, artista, cancion, puesto, bandera, enabled) VALUES (5,'Armenia','https://www.youtube.com/watch?v=q_46dy4yJwg','Srbuk','Walking out',0,'armenia.png',1);
INSERT INTO pais (id,nombre, enlace, artista, cancion, puesto, bandera, enabled) VALUES (6,'Azerbaijan','https://www.youtube.com/watch?v=iyZJ_aMw5hY','Chingiz Mustafayev','Truth',0,'azerbaijan.png',1);
INSERT INTO pais (id,nombre, enlace, artista, cancion, puesto, bandera, enabled) VALUES (7,'Bielorrusia','https://www.youtube.com/watch?v=nu4HOjjurdE','Zena','Like it',0,'bielorrusia.png',1);
INSERT INTO pais (id,nombre, enlace, artista, cancion, puesto, bandera, enabled) VALUES (8,'Belgica','https://www.youtube.com/watch?v=17QXkQEckE4','Eliot','Wake up',0,'belgica.png',1);
INSERT INTO pais (id,nombre, enlace, artista, cancion, puesto, bandera, enabled) VALUES (9,'Croacia','https://www.youtube.com/watch?v=-mYYWSEAa9s','Roko Blazevic','The dream',0,'croacia.png',1);
INSERT INTO pais (id,nombre, enlace, artista, cancion, puesto, bandera, enabled) VALUES (10,'Chipre','https://www.youtube.com/watch?v=WPFUZswe_zw','Tamta','replay',0,'chipre.png',1);
INSERT INTO pais (id,nombre, enlace, artista, cancion, puesto, bandera, enabled) VALUES (11,'República checa','https://www.youtube.com/watch?v=yH1-uy9FYKE','Lake Malawi','Friend of a friend',0,'rep-checa.png',1);
INSERT INTO pais (id,nombre, enlace, artista, cancion, puesto, bandera, enabled) VALUES (12,'Dinamarca','https://www.youtube.com/watch?v=qgA2BqvwEcI','Leonora','Love is forever',0,'dinamarca.png',1);
INSERT INTO pais (id,nombre, enlace, artista, cancion, puesto, bandera, enabled) VALUES (13,'Estonia','https://www.youtube.com/watch?v=a4bfC0NPl1I','Victor Crone','Storm',0,'estonia.png',1);
INSERT INTO pais (id,nombre, enlace, artista, cancion, puesto, bandera, enabled) VALUES (14,'Finlandia','https://www.youtube.com/watch?v=d4DPGAJhSac','Darude feat. Sebastian Rejman','look away',0,'finlandia.png',1);
INSERT INTO pais (id,nombre, enlace, artista, cancion, puesto, bandera, enabled) VALUES (15,'Francia','https://www.youtube.com/watch?v=dw7WqoSHtgU','Bilal hassani','Roi',0,'francia.png',1);
INSERT INTO pais (id,nombre, enlace, artista, cancion, puesto, bandera, enabled) VALUES (16,'Georgia','https://www.youtube.com/watch?v=Blvo_Ol4Bzc','Oto nemsadze','Sul tsin lare',0,'georgia.png',1);
INSERT INTO pais (id,nombre, enlace, artista, cancion, puesto, bandera, enabled) VALUES (17,'Alemania','https://www.youtube.com/watch?v=6iNqVzNnhI4','S!sters','Sister',0,'alemania.png',1);
INSERT INTO pais (id,nombre, enlace, artista, cancion, puesto, bandera, enabled) VALUES (18,'Grecia','https://www.youtube.com/watch?v=Lc_b7SlK9js','Katerine Duska','Better love',0,'grecia.png',1);
INSERT INTO pais (id,nombre, enlace, artista, cancion, puesto, bandera, enabled) VALUES (19,'Hungria','https://www.youtube.com/watch?v=2b_vZFUVs_g','Joci pápai','Az én apám',0,'hungria.png',1);
INSERT INTO pais (id,nombre, enlace, artista, cancion, puesto, bandera, enabled) VALUES (20,'Islandia','https://www.youtube.com/watch?v=UGrRhIj4FRw','Hatari','Hatrid mun sigra',0,'islandia.png',1);
INSERT INTO pais (id,nombre, enlace, artista, cancion, puesto, bandera, enabled) VALUES (21,'Irlanda','https://www.youtube.com/watch?v=LXBIDYh_UE4','Sarah Mcternan','22',0,'irlanda.png',1);
INSERT INTO pais (id,nombre, enlace, artista, cancion, puesto, bandera, enabled) VALUES (22,'Israel','https://www.youtube.com/watch?v=7d__XXiVJkE','Kobi Marimi','Home',0,'israel.png',1);
INSERT INTO pais (id,nombre, enlace, artista, cancion, puesto, bandera, enabled) VALUES (23,'Italia','https://www.youtube.com/watch?v=22lISUXgSUw','Mahmood','Soldi',0,'italia.png',1);
INSERT INTO pais (id,nombre, enlace, artista, cancion, puesto, bandera, enabled) VALUES (24,'Letonia','https://www.youtube.com/watch?v=6j61TWsjcJY','Carousel','That night',0,'letonia.png',1);
INSERT INTO pais (id,nombre, enlace, artista, cancion, puesto, bandera, enabled) VALUES (25,'Lituania','https://www.youtube.com/watch?v=ut-0TaybLRE','Jurijus','Run with the lions',0,'lituania.png',1);
INSERT INTO pais (id,nombre, enlace, artista, cancion, puesto, bandera, enabled) VALUES (26,'Malta','https://www.youtube.com/watch?v=tdyQ-ebzFgk','Michela','Chameleon',0,'malta.png',1);
INSERT INTO pais (id,nombre, enlace, artista, cancion, puesto, bandera, enabled) VALUES (27,'Moldovia','https://www.youtube.com/watch?v=p3OC8qhZBWQ','Anna Odobescu','Stay',0,'moldavia.png',1);
INSERT INTO pais (id,nombre, enlace, artista, cancion, puesto, bandera, enabled) VALUES (28,'Montenegro','https://www.youtube.com/watch?v=EXmXfHhLBoQ','D-mol','Heaven',0,'montenegro.png',1);
INSERT INTO pais (id,nombre, enlace, artista, cancion, puesto, bandera, enabled) VALUES (29,'Holanda','https://www.youtube.com/watch?v=Eztx7Wr8PtE','Duncan Laurence','Arcade',0,'holanda.png',1);
INSERT INTO pais (id,nombre, enlace, artista, cancion, puesto, bandera, enabled) VALUES (30,'Macedonia','https://www.youtube.com/watch?v=Sw-NQ1a1zZ0','Tamara Todevska','Proud',0,'macedonia.png',1);
INSERT INTO pais (id,nombre, enlace, artista, cancion, puesto, bandera, enabled) VALUES (31,'Noruega','https://www.youtube.com/watch?v=3EmUmbhDRiY','Keiino','Spirit in the sky',0,'noruega.png',1);
INSERT INTO pais (id,nombre, enlace, artista, cancion, puesto, bandera, enabled) VALUES (32,'Polonia','https://www.youtube.com/watch?v=hVkyOjwpUCQ','Tulia','Pali sie (Fire of love)',0,'polonia.png',1);
INSERT INTO pais (id,nombre, enlace, artista, cancion, puesto, bandera, enabled) VALUES (33,'Portugal','https://www.youtube.com/watch?v=xSbp8lwCQp8','Conan osíris','Telemóveis',0,'portugal.png',1);
INSERT INTO pais (id,nombre, enlace, artista, cancion, puesto, bandera, enabled) VALUES (34,'Rumania','https://www.youtube.com/watch?v=T1dhF0_QyH0','Ester peony','On a sunday',0,'rumania.png',1);
INSERT INTO pais (id,nombre, enlace, artista, cancion, puesto, bandera, enabled) VALUES (35,'Rusia','https://www.youtube.com/watch?v=gEpUgRtXBss','Sergey Lazarev','Scream',0,'rusia.png',1);
INSERT INTO pais (id,nombre, enlace, artista, cancion, puesto, bandera, enabled) VALUES (36,'San marino','https://www.youtube.com/watch?v=eWEFU2c3tBI','Serhat','Say na na na',0,'san-marino.png',1);
INSERT INTO pais (id,nombre, enlace, artista, cancion, puesto, bandera, enabled) VALUES (37,'Serbia','https://www.youtube.com/watch?v=eWEFU2c3tBI','Nevena Bozovic','Kruna',0,'serbia.png',1);
INSERT INTO pais (id,nombre, enlace, artista, cancion, puesto, bandera, enabled) VALUES (38,'Eslovenia','https://www.youtube.com/watch?v=vleF8-gAn_U','Zala Kralj & Gasper Santi','Sebi',0,'eslovenia.png',1);
INSERT INTO pais (id,nombre, enlace, artista, cancion, puesto, bandera, enabled) VALUES (39,'Suecia','https://www.youtube.com/watch?v=eWEFU2c3tBI','John Lundvik','Too late for love',0,'suecia.png',1);
INSERT INTO pais (id,nombre, enlace, artista, cancion, puesto, bandera, enabled) VALUES (40,'Suiza','https://www.youtube.com/watch?v=6PxoMWtAC7M','Luca Hanni','She got me',0,'suiza.png',1);
INSERT INTO pais (id,nombre, enlace, artista, cancion, puesto, bandera, enabled) VALUES (41,'Reino Unido','https://www.youtube.com/watch?v=WOBhTgSrXJQ','Michael Rice','Bigger than us',0,'reino-unido.png',1);
commit;




/*DATOS DE PRUEBA*/
INSERT INTO USUARIO_PAIS(ID,USUARIO_ID,PAIS_ID) VALUES (1,1,32);
INSERT INTO USUARIO_PAIS(ID,USUARIO_ID,PAIS_ID) VALUES (2,1,22);
INSERT INTO USUARIO_PAIS(ID,USUARIO_ID,PAIS_ID) VALUES (3,1,11);
INSERT INTO USUARIO_PAIS(ID,USUARIO_ID,PAIS_ID) VALUES (4,2,26);
INSERT INTO USUARIO_PAIS(ID,USUARIO_ID,PAIS_ID) VALUES (5,2,3);
INSERT INTO USUARIO_PAIS(ID,USUARIO_ID,PAIS_ID) VALUES (6,2,2);
INSERT INTO USUARIO_PAIS(ID,USUARIO_ID,PAIS_ID) VALUES (7,3,40);
INSERT INTO USUARIO_PAIS(ID,USUARIO_ID,PAIS_ID) VALUES (8,3,24);
INSERT INTO USUARIO_PAIS(ID,USUARIO_ID,PAIS_ID) VALUES (9,3,17);
INSERT INTO USUARIO_PAIS(ID,USUARIO_ID,PAIS_ID) VALUES (10,4,29);
INSERT INTO USUARIO_PAIS(ID,USUARIO_ID,PAIS_ID) VALUES (11,4,19);
INSERT INTO USUARIO_PAIS(ID,USUARIO_ID,PAIS_ID) VALUES (12,5,40);

update pais set puesto=3 where id=32;
update pais set puesto=34 where id=22;
update pais set puesto=22 where id=11;
update pais set puesto=23 where id=26;
update pais set puesto=6 where id=3;
update pais set puesto=22 where id=2;
update pais set puesto=11 where id=40;
update pais set puesto=10 where id=24;
update pais set puesto=4 where id=17;

CREATE TABLE `configuracion` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `descripcion` VARCHAR(60) NULL,
  `valor` VARCHAR(45) NOT NULL,
  `codigo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `codigo_UNIQUE` (`codigo` ASC));
  
  
  INSERT INTO configuracion (id, nombre, descripcion, codigo, valor) VALUES (1, 'Muestra Apuesta', 'Variable que muestra apuestas en la clasificacion', 'COD_MUESTRA_VALOR', 'true');
  INSERT INTO configuracion (id, nombre, descripcion, codigo, valor) VALUES (2, 'Permite apostar', 'Variable que permite realizar las apuestas', 'COD_PERMITE_APUESTA', 'true');

  update pais set puesto=22 where id=1 ;
update pais set puesto=9 where id=2 ;
update pais set puesto=0 where id=3 ;
update pais set puesto=18 where id=4 ;
update pais set puesto=0 where id=5 ;
update pais set puesto=7 where id=6 ;
update pais set puesto=25 where id=7 ;
update pais set puesto=0 where id=8 ;
update pais set puesto=0 where id=9 ;
update pais set puesto=15 where id=10 ;
update pais set puesto=11 where id=11 ;
update pais set puesto=12 where id=12 ;
update pais set puesto=19 where id=13 ;
update pais set puesto=0 where id=14 ;
update pais set puesto=14 where id=15 ;
update pais set puesto=0 where id=16 ;
update pais set puesto=24 where id=17 ;
update pais set puesto=21 where id=18 ;
update pais set puesto=0 where id=19 ;
update pais set puesto=10 where id=20 ;
update pais set puesto=0 where id=21 ;
update pais set puesto=23 where id=22 ;
update pais set puesto=2 where id=23 ;
update pais set puesto=0 where id=24 ;
update pais set puesto=0 where id=25 ;
update pais set puesto=16 where id=26 ;
update pais set puesto=0 where id=27 ;
update pais set puesto=0 where id=28 ;
update pais set puesto=1 where id=29 ;
update pais set puesto=8 where id=30 ;
update pais set puesto=5 where id=31 ;
update pais set puesto=0 where id=32 ;
update pais set puesto=0 where id=33 ;
update pais set puesto=0 where id=34 ;
update pais set puesto=3 where id=35 ;
update pais set puesto=20 where id=36 ;
update pais set puesto=17 where id=37 ;
update pais set puesto=13 where id=38 ;
update pais set puesto=6 where id=39 ;
update pais set puesto=4 where id=40 ;
update pais set puesto=26 where id=41 ;
  
update configuracion set codigo='COD_MUESTRA_APUESTA' where id=2;

INSERT INTO usuario_pais (id, usuario_id, pais_id) VALUES(101, 1, 1);
INSERT INTO usuario_pais (id, usuario_id, pais_id) VALUES(111, 1, 23);
INSERT INTO usuario_pais (id, usuario_id, pais_id) VALUES(121, 1, 10);
INSERT INTO usuario_pais (id, usuario_id, pais_id) VALUES(161, 12, 39);
INSERT INTO usuario_pais (id, usuario_id, pais_id) VALUES(171, 12, 29);
INSERT INTO usuario_pais (id, usuario_id, pais_id) VALUES(181, 12, 2);
INSERT INTO usuario_pais (id, usuario_id, pais_id) VALUES(191, 6, 15);
INSERT INTO usuario_pais (id, usuario_id, pais_id) VALUES(201, 6, 40);
INSERT INTO usuario_pais (id, usuario_id, pais_id) VALUES(211, 6, 1);
INSERT INTO usuario_pais (id, usuario_id, pais_id) VALUES(221, 5, 1);
INSERT INTO usuario_pais (id, usuario_id, pais_id) VALUES(241, 9, 23);
INSERT INTO usuario_pais (id, usuario_id, pais_id) VALUES(251, 5, 23);
INSERT INTO usuario_pais (id, usuario_id, pais_id) VALUES(261, 5, 31);
INSERT INTO usuario_pais (id, usuario_id, pais_id) VALUES(271, 9, 39);
INSERT INTO usuario_pais (id, usuario_id, pais_id) VALUES(301, 4, 1);
INSERT INTO usuario_pais( id, usuario_id, pais_id) VALUES(311, 4, 40);
INSERT INTO usuario_pais (id, usuario_id, pais_id) VALUES(351, 4, 29);
INSERT INTO usuario_pais (id, usuario_id, pais_id) VALUES(361, 9, 40);
INSERT INTO usuario_pais (id, usuario_id, pais_id) VALUES(401, 10, 1);
INSERT INTO usuario_pais (id, usuario_id, pais_id) VALUES(411, 7, 31);
INSERT INTO usuario_pais (id, usuario_id, pais_id) VALUES(421, 7, 40);
INSERT INTO usuario_pais (id, usuario_id, pais_id) VALUES(431, 7, 15);
INSERT INTO usuario_pais (id, usuario_id, pais_id) VALUES(591, 2, 36);
INSERT INTO usuario_pais (id, usuario_id, pais_id) VALUES(601, 2, 1);
INSERT INTO usuario_pais (id, usuario_id, pais_id) VALUES(611, 2, 23);
INSERT INTO usuario_pais (id, usuario_id, pais_id) VALUES(621, 10, 15);
INSERT INTO usuario_pais (id, usuario_id, pais_id) VALUES(631, 10, 2);

ALTER TABLE eurosnovos.usuario_pais MODIFY COLUMN id int(11) auto_increment NOT NULL;
commit;