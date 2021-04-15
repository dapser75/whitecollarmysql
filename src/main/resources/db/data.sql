INSERT INTO tienda (`id_tienda`, `name`, `capacity`) VALUES (1, 'Todo Cuadro', 25);
INSERT INTO tienda (`id_tienda`, `name`, `capacity`) VALUES (2, 'La Cuadreria', 10);
INSERT INTO tienda (`id_tienda`, `name`, `capacity`) VALUES (3, 'Los Mejores Cuadros', 80);

INSERT INTO cuadro (`id_cuadro`, `tittle`, `author`, `prize`) VALUES (1, 'Las Meninas', 'Velazquez', 1200000);
INSERT INTO cuadro (`id_cuadro`, `tittle`, `author`, `prize`) VALUES (2, 'La Gioconda', 'Da Vinci', 1800000);
INSERT INTO cuadro (`id_cuadro`, `tittle`, `author`, `prize`) VALUES (3, 'El amanecer dorado', 'Jose Luis Vazquez', 500);
INSERT INTO cuadro (`id_cuadro`, `tittle`, `author`, `prize`) VALUES (4, 'El Guernika', 'Picasso', 800000);
INSERT INTO cuadro (`id_cuadro`, `tittle`, `author`, `prize`) VALUES (5, 'Bodegon espa�ol', 'Daniel Martinez', 600);
INSERT INTO cuadro (`id_cuadro`, `tittle`, `author`, `prize`) VALUES (6, 'La noche estrellada', 'Van Gogh', 900000);
INSERT INTO cuadro (`id_cuadro`, `tittle`, `author`, `prize`) VALUES (7, 'La �ltima cena ', 'Da Vinci', 5000000);
INSERT INTO cuadro (`id_cuadro`, `tittle`, `author`, `prize`) VALUES (8, 'La creaci�n de Ad�n', 'Miguel �ngel', 2200000);
INSERT INTO cuadro (`id_cuadro`, `tittle`, `author`, `prize`) VALUES (9, 'La Persistencia de la Memoria', 'Dal�', 2000000);
INSERT INTO cuadro (`id_cuadro`, `tittle`, `author`, `prize`) VALUES (10, 'El Grito', 'Munch', 900000);
INSERT INTO cuadro(`id_cuadro`, `tittle`, `author`, `prize`) VALUES (11, 'El Jardin de las delicias', 'Bosco', 850000);
INSERT INTO cuadro (`id_cuadro`, `tittle`, `author`, `prize`) VALUES (12, 'El Nacimiento de Venis', 'Bottichelli', 700000);
INSERT INTO cuadro (`id_cuadro`, `tittle`, `author`, `prize`) VALUES (13, 'La Virgen del Pilar', 'Goya', 800000);
INSERT INTO cuadro (`id_cuadro`, `tittle`, `author`, `prize`) VALUES (14, 'Sue�o causado por el vuelo de una abeja alrededor de una granada un segundo antes de despertar', 'Dali', 1500000);
INSERT INTO cuadro (`id_cuadro`, `tittle`, `author`, `prize`) VALUES (15, 'Figura en una finestra', 'Dali', 1200000);
INSERT INTO cuadro (`id_cuadro`, `tittle`, `author`, `prize`) VALUES (16, 'Arbol Golpeado por el Viento', 'Van Gogh', 750000);
INSERT INTO cuadro (`id_cuadro`, `tittle`, `author`, `prize`) VALUES (17, 'Vaca Acostada', 'Van Gogh', 800000);
INSERT INTO cuadro (`id_cuadro`, `tittle`, `author`, `prize`) VALUES (18, 'El Estrellato', 'Marcos ruiz', 2000);
INSERT INTO cuadro (`id_cuadro`, `tittle`, `author`, `prize`) VALUES (19, 'Las Se�oritas de Avignon', 'Picasso', 400000);
INSERT INTO cuadro (`id_cuadro`, `tittle`, `author`, `prize`) VALUES (20, 'Los Tres Musicos', 'Picasso', 250000);


INSERT INTO cuadros_tiendas (`tienda_id`, `cuadro_id`, `date`) VALUES (1, 1, CURRENT_TIMESTAMP);
INSERT INTO cuadros_tiendas (`tienda_id`, `cuadro_id`, `date`) VALUES (1, 3, CURRENT_TIMESTAMP);
INSERT INTO cuadros_tiendas (`tienda_id`, `cuadro_id`, `date`) VALUES (1, 10, CURRENT_TIMESTAMP);
INSERT INTO cuadros_tiendas (`tienda_id`, `cuadro_id`, `date`) VALUES (2, 2, CURRENT_TIMESTAMP);
INSERT INTO cuadros_tiendas (`tienda_id`, `cuadro_id`, `date`) VALUES (2, 4, CURRENT_TIMESTAMP);
INSERT INTO cuadros_tiendas  (`tienda_id`, `cuadro_id`, `date`) VALUES (2, 5, CURRENT_TIMESTAMP);
INSERT INTO cuadros_tiendas (`tienda_id`, `cuadro_id`, `date`) VALUES (3, 6, CURRENT_TIMESTAMP);
INSERT INTO cuadros_tiendas (`tienda_id`, `cuadro_id`, `date`) VALUES (3, 7, CURRENT_TIMESTAMP);
INSERT INTO cuadros_tiendas (`tienda_id`, `cuadro_id`, `date`) VALUES (3, 8, CURRENT_TIMESTAMP);
INSERT INTO cuadros_tiendas (`tienda_id`, `cuadro_id`, `date`) VALUES (1, 9, CURRENT_TIMESTAMP);
INSERT INTO cuadros_tiendas (`tienda_id`, `cuadro_id`, `date`) VALUES (1, 11, CURRENT_TIMESTAMP);
INSERT INTO cuadros_tiendas (`tienda_id`, `cuadro_id`, `date`) VALUES (2, 12, CURRENT_TIMESTAMP);
INSERT INTO cuadros_tiendas (`tienda_id`, `cuadro_id`, `date`) VALUES (3, 13, CURRENT_TIMESTAMP);
INSERT INTO cuadros_tiendas (`tienda_id`, `cuadro_id`, `date`) VALUES (1, 15, CURRENT_TIMESTAMP);
INSERT INTO cuadros_tiendas (`tienda_id`, `cuadro_id`, `date`) VALUES (1, 16, CURRENT_TIMESTAMP);
INSERT INTO cuadros_tiendas (`tienda_id`, `cuadro_id`, `date`) VALUES (2, 17, CURRENT_TIMESTAMP);
INSERT INTO cuadros_tiendas (`tienda_id`, `cuadro_id`, `date`) VALUES (2, 18, CURRENT_TIMESTAMP);
INSERT INTO cuadros_tiendas (`tienda_id`, `cuadro_id`, `date`) VALUES (3, 19, CURRENT_TIMESTAMP);
INSERT INTO cuadros_tiendas (`tienda_id`, `cuadro_id`, `date`) VALUES (3, 20, CURRENT_TIMESTAMP);