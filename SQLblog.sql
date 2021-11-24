
CREATE DATABASE blogdb
GO

USE blogdb
GO


CREATE TABLE departamentos(
	iddepartamento	INT IDENTITY(1,1) PRIMARY KEY,
	nombre			VARCHAR(30) NOT NULL

	CONSTRAINT uk_nombre_dpt UNIQUE (nombre)
)
GO

INSERT INTO departamentos(nombre) VALUES
			('Ica'),
			('Huancavelica'),
			('Tacna')
GO

CREATE TABLE provincias(
	idprovincia		INT IDENTITY(1,1) PRIMARY KEY,
	iddepartamento	INT NOT NULL,
	nombre			VARCHAR(30) NOT NULL

	CONSTRAINT uk_nombre_prv UNIQUE (nombre)
	CONSTRAINT fk_iddepartamento_prv FOREIGN KEY (iddepartamento) REFERENCES departamentos(iddepartamento)
)
GO

INSERT INTO provincias(iddepartamento,nombre) VALUES
			(1,'Pisco'),
			(1,'Chincha Alta'),
			(2,'Angaraes'),
			(3,'Tarata'),
			(3,'Candarave')
GO

CREATE TABLE distritos(
	iddistrito		INT IDENTITY(1,1) PRIMARY KEY,
	idprovincia		INT NOT NULL,
	nombre			VARCHAR(30) NOT NULL

	CONSTRAINT uk_nombre_dst UNIQUE (nombre)
	CONSTRAINT fk_idprovincia_prv FOREIGN KEY (idprovincia) REFERENCES provincias(idprovincia)

)
GO

INSERT INTO distritos(idprovincia, nombre)	VALUES 
			(2,'Grocio Prado'),
			(2,'Chincha Alta'),
			(2,'Sunampe'),
			(4,'Tarucachi')
GO

CREATE TABLE personas(
	idpersona		INT IDENTITY(1,1) PRIMARY KEY,
	nombres			VARCHAR(50) NOT NULL,
	apellidos		VARCHAR(50) NOT NULL,
	direcccion		VARCHAR(50),
	iddistrito		INT,
	idprovincia		INT,
	iddepartamento	INT

	CONSTRAINT fk_iddepartamento_per FOREIGN KEY (iddepartamento) REFERENCES departamentos(iddepartamento),
	CONSTRAINT fk_idprovincia_per FOREIGN KEY (idprovincia) REFERENCES provincias(idprovincia),
	CONSTRAINT fk_iddistrito_pers FOREIGN KEY (iddistrito) REFERENCES distritos(iddistrito)
)
GO
select * from personas
INSERT INTO personas(nombres,apellidos) VALUES
			('Angel Angel', 'Marcos Castilla'),
			('Luis', 'torres Perez'),
			('Juana', 'Suarez Suaso'),
			('Arturo', 'Munayco Saravia')
GO
INSERT INTO personas(nombres,apellidos,direcccion,iddistrito,idprovincia,iddepartamento) VALUES
			('Martin', 'Tasayco Amoretti', 'Calle los sauces', 1,2,1)
GO

CREATE TABLE numeroscontactos(
	idcontacto		INT IDENTITY(1,1) PRIMARY KEY,
	idpersona		INT NOT NULL,
	numcelular		char(9) NOT NULL,
	descripcion		varchar(100),
	CONSTRAINT uk_idpersona_numc UNIQUE (idpersona),
	CONSTRAINT fk_idpersona_numc FOREIGN KEY (idpersona) REFERENCES personas(idpersona)
)

CREATE TABLE autores(
	idautor		    INT IDENTITY(1,1) PRIMARY KEY,
	idpersona		INT NOT NULL,
	nombreusuario	VARCHAR(30) NOT NULL,
	cuentausuario	VARCHAR(30)	NOT NULL,
	descripcion		VARCHAR(100) NOT NULL

	CONSTRAINT uk_nombreusuario_aut	UNIQUE (nombreusuario),
	CONSTRAINT uk_cuentausuario_aut	UNIQUE (cuentausuario),
	CONSTRAINT fk_idpersona_aut	FOREIGN KEY (idpersona) REFERENCES personas(idpersona)
)

INSERT INTO autores VALUES
			(1,'AngelMarcos','@angelmc', 'desarrollador de apliaciones web'),
			(2,'luisPerez','@perez', 'amantes por las tecnologias'),
			(3,'Juanasuarez','@juanas', 'soy una persona feliz'),
			(4,'Arturito','@art', 'Me gusta la programacion'),
			(5,'MartinTasayco','@mtasayco', 'si puedes imaginarlo puedes programarlo')
GO

CREATE TABLE tags(
	idtag		INT IDENTITY(1,1) PRIMARY KEY,
	nombre		VARCHAR(30) NOT NULL
)

INSERT INTO tags VALUES
		('tecnologias'),
		('comida'),
		('Programacion'),
		('belleza'),
		('deporte'),
		('futbol')
GO

CREATE TABLE noticias(
	idnoticia			INT IDENTITY(1,1) PRIMARY KEY,
	idautor				INT NOT NULL,
	titulo				VARCHAR(50) NOT NULL,
	contenido			VARCHAR(500) NOT NULL,
	fechapublicacion	DATE DEFAULT GETDATE()

	CONSTRAINT fk_idautor_ntc	FOREIGN KEY(idautor) REFERENCES autores(idautor)
)


INSERT INTO noticias(idautor,titulo,contenido) VALUES 
			(1,'Como programar','para empezar a programar se deberia empezar a desarrollar la logica de la programacion'),
			(2,'entranar para ser campeon','Desarrolla una rutina estricta de entrenamiento. Si quieres ser un campeón, ser absolutamente el mejor en lo que haces, es importante dedicar tiempo a entrenar para ese campeonato todos los días. Necesitas trabajar activamente para desarrollar habilidades, estudiar el juego y volverte el mejor. Entrena como un campeón y serás un campeón.n'),
			(4,'¿Que es windows?','Windows es el nombre de una familia de distribuciones de software para PC, servidores, sistemas empotrados y antiguamente teléfonos inteligentes desarrollados y vendidos por Microsoft y disponiblespara empezar a programar se deberia empezar a desarrollar la logica de la programacion'),
			(3,' preparar comiad','orem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas commodo sem a lectus elementum, a te'),
			(1,'peru rumbo al mundial',' sit amet, pa sit amet, se deberia empezar a desarrollar la logica de la programacion')
INSERT INTO noticias(idautor,titulo,contenido,fechapublicacion) VALUES 
			(3,'como usar use effect','para empezar a programar se deberia empezar a desarrollar la logica de la programacion','2019-11-13'),
			(2,'dedicar tiempo a entrenar',' para ese campeonato todos los días. Necesitas trabajar activamente para desarrollar habilidades, estudiar el juego y volverte el mejor. Entrena como un campeón y serás un campeón.n','2016-1-23'),
			(1,'lucha por ti','Windows es el nombre de una familia de distribuciones de software para PC, servidores, sistemas empotrados y antiguamente teléfonos inteligentes desarrollados y vendidos por Microsoft y disponiblespara empezar a programar se deberia empezar a desarrollar la logica de la programacion','2018-06-23'),
			(2,' lorem','orem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas commodo sem a lectus elementum, a te','2021-06-23'),
			(1,'ipsom some',' sit amet, pa sit amet, se deberia empezar a desarrollar la logica de la programacion','2018-06-23'),
			(1,' the ipsom some',' sit amet, pa sit amet, se deberia empezar a desarrollar la logica de la programacion','2018-06-23'),
			(3,'ipso loremm some',' sit amet, pa sit amet, se deberia empezar a desarrollar la logica de la programacion','2018-06-23'),
			(1,'jugar voley',' sit amet, pa sit amet, se deberia empezar a desarrollar la logica de la programacion','2018-06-23'),
			(1,'plantar',' sit amet, pa sit amet, se deberia empezar a desarrollar la logica de la programacion','2018-06-23')
GO
CREATE TABLE tags_noticias (
	idtagnoticia		INT IDENTITY(1,1) PRIMARY KEY,
	idnoticia			INT NOT NULL, 
	idtag				INT NOT NULL

	CONSTRAINT fk_idnoticia_tgn	FOREIGN KEY(idnoticia) REFERENCES noticias(idnoticia),
	CONSTRAINT fk_idtag_tgn	FOREIGN KEY(idtag) REFERENCES tags(idtag)
)

INSERT INTO tags_noticias VALUES
			(1,1),
			(1,3),
			(2,5),
			(2,6),
			(3,2)
GO

CREATE TABLE comentarios(
	idcomentario		INT IDENTITY(1,1) PRIMARY KEY,
	idnoticia			INT NOT NULL,
	idautor				INT NOT NULL,
	comentario			VARCHAR(200) NOT NULL,
	fechacomentario		DATE DEFAULT GETDATE()

	CONSTRAINT fk_idnoticia_cmtr FOREIGN KEY(idnoticia) REFERENCES noticias(idnoticia),
	CONSTRAINT fk_idautor_cmtr	 FOREIGN KEY(idautor) REFERENCES autores(idautor)
)


INSERT INTO comentarios(idnoticia,idautor,comentario) VALUES
	(1,2,'esta buena la publicacion'),
	(1,3,'psum sed tellus volutpat, quis sodales quam suscipit. Mauris ultricies ex urna, sit amet porttitor nulla finibus et.'),
	(1,4,'odio libero. Phasellus vitae euismod risus, at suscipit eros. Cras felis leo, sollicitudin et condimentum eget, elementum ut lectus. Aliquam id viverra dui.'),
	(4,1,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas'),
	(4,2,'eu dolor dictum sodales. Morbi laoreet velit a nunc sodales pretium. Proin imperdiet consequat orci sit'),
	(4,3,'bus vel facilisis et, blandit condimentum nisl. Vestibulum tempor condimentum velit, eget faucibus purus maximus vel. Nullam nisl tellus, di'),
	(3,1,'tum nisl. Vestibulum tempor condimentum velit, eget faucibus purus maximus vel. Nullam nisl tellus, di'),
	(3,2,'asi es amigo'),
	(2,1,'felicitaciones por tu contenido, me ha servido'),
	(2,2,'esta buena genial'),	
	(2,3,'gracias por tu publicacion me ah ayudado mucho')


--1. Realizar la siguiente consulta: Número de noticias publicadas por usuario.

SELECT COUNT(*) as 'cantNoticia' FROM noticias WHERE idautor=1

--2. Realizar la siguiente consulta: 10 últimas noticias publicadas.
SELECT  TOP 10 * FROM noticias ORDER BY fechapublicacion  DESC

--3. Realizar la siguiente consulta: Noticias que no tienen el campo tag.

SELECT * FROM noticias
	LEFT JOIN tags_noticias ON noticias.idnoticia = tags_noticias.idnoticia 
	WHERE tags_noticias.idtag IS NULL
	
--. Realizar la siguiente consulta: Noticias publicadas en un periodo de fechasSELECT * FROM noticias WHERE fechapublicacion BETWEEN '2019-06-23' AND '2021-12-23'
SELECT * FROM noticias WHERE YEAR(fechapublicacion ) = 2018

SELECT idautor , COUNT(idnoticia) AS 'Cantdad' FROM noticias
		GROUP BY idautor
GO