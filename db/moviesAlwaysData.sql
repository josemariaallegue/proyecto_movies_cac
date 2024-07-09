USE `grupo-18-cac_db`;
CREATE TABLE IF NOT EXISTS `Countries` (
    `CountryID` INT NOT NULL AUTO_INCREMENT,
    `CountryName` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`CountryID`),
    UNIQUE INDEX `idcountries_UNIQUE` (`CountryID` ASC)
);
CREATE TABLE IF NOT EXISTS `Users` (
    `UserID` INT NOT NULL AUTO_INCREMENT,
    `Name` VARCHAR(45) NOT NULL,
    `Surname` VARCHAR(45) NOT NULL,
    `Email` VARCHAR(255) NOT NULL,
    `Password` VARCHAR(255) NOT NULL,
    `Birthday` DATETIME NOT NULL,
    `ProfilePicture` VARCHAR(255) NULL,
    `Countries_CountryID` INT NOT NULL,
    PRIMARY KEY (`UserID`),
    UNIQUE INDEX `id_UNIQUE` (`UserID` ASC),
    UNIQUE INDEX `email_UNIQUE` (`Email` ASC),
    INDEX `fk_Users_Countries_idx` (`Countries_CountryID` ASC),
    CONSTRAINT `fk_Users_Countries` FOREIGN KEY (`Countries_CountryID`) REFERENCES `Countries` (`CountryID`) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE IF NOT EXISTS `Genres` (
    `GenreID` INT NOT NULL AUTO_INCREMENT,
    `GenreName` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`GenreID`),
    UNIQUE INDEX `idgenres_UNIQUE` (`GenreID` ASC)
);
CREATE TABLE IF NOT EXISTS `Movies` (
    `MovieID` INT NOT NULL AUTO_INCREMENT,
    `Title` VARCHAR(255) NOT NULL,
    `Director` VARCHAR(255) NOT NULL,
    `Year` INT NOT NULL,
    `CoverImage` VARCHAR(255) NOT NULL,
    `Countries_CountryID` INT NOT NULL,
    `Genres_GenreID` INT NOT NULL,
    PRIMARY KEY (`MovieID`),
    UNIQUE INDEX `idmovies_UNIQUE` (`MovieID` ASC),
    INDEX `fk_Movies_Countries1_idx` (`Countries_CountryID` ASC),
    INDEX `fk_Movies_Genres1_idx` (`Genres_GenreID` ASC),
    CONSTRAINT `fk_Movies_Countries1` FOREIGN KEY (`Countries_CountryID`) REFERENCES `Countries` (`CountryID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `fk_Movies_Genres1` FOREIGN KEY (`Genres_GenreID`) REFERENCES `Genres` (`GenreID`) ON DELETE NO ACTION ON UPDATE NO ACTION
);
INSERT INTO Countries (CountryName)
VALUES ('Alemania'),
    ('Argentina'),
    ('Bolivia'),
    ('Brasil'),
    ('Canada'),
    ('Chile'),
    ('España'),
    ('Estados Unidos'),
    ('Francia'),
    ('Gran Bretaña'),
    ('Italia'),
    ('Mexico'),
    ('Paraguay'),
    ('Peru'),
    ('Uruguay');
INSERT INTO Genres (GenreName)
VALUES ('Accion'),
    ('Animación'),
    ('Aventura'),
    ('Ciencia Ficción'),
    ('Comedia'),
    ('Documentales'),
    ('Drama'),
    ('Fantasia'),
    ('Infantil'),
    ('Musicales'),
    ('Suspense'),
    ('Terror');
INSERT INTO Movies (
        Title,
        Director,
        `Year`,
        CoverImage,
        Countries_CountryID,
        Genres_GenreID
    )
VALUES (
        'Inside Out 2',
        'Kelsey Mann',
        2024,
        'https://image.tmdb.org/t/p/w500//gMB8vgHu2lcyzv1fyptD6drHmJd.jpg',
        7,
        2
    ),
    (
        'Furiosa a Mad Max Saga',
        'George Miller',
        2024,
        'https://image.tmdb.org/t/p/w500//iADOJ8Zymht2JPMoy3R7xceZprc.jpg',
        4,
        1
    ),
    (
        'Bad Boys Ride or Die',
        'Adil El / ArbiBilall Fallah',
        2024,
        'https://image.tmdb.org/t/p/w500//nP6RliHjxsz4irTKsxe8FRhKZYl.jpg',
        4,
        4
    ),
    (
        'If',
        'John Krasinski',
        2024,
        'https://image.tmdb.org/t/p/w500//xbKFv4KF3sVYuWKllLlwWDmuZP7.jpg',
        4,
        2
    ),
    (
        'Godzilla x Kong The new Impire',
        'Adam Wingard',
        2024,
        'https://image.tmdb.org/t/p/w500//z1p34vh7dEOnLDmyCrlUVLuoDzd.jpg',
        6,
        7
    ),
    (
        'The Godfather',
        'Francis Ford Coppola',
        1972,
        'https://http2.mlstatic.com/D_NQ_NP_2X_849311-MLA52604231932_112022-F.webp',
        7,
        1
    ),
    (
        'Schindler´s List',
        'Steven Spielberg',
        1993,
        'https://image.tmdb.org/t/p/original/xx4JCtIkUj31PJbPFRLhuBc1PRl.jpg',
        7,
        6
    ),
    (
        'Dune',
        'Denis Villeneuve',
        2021,
        'https://image.tmdb.org/t/p/w600_and_h900_bestv2/d5NXSklXo0qyIYkgV94XAgMIckC.jpg',
        7,
        3
    ),
    (
        'Oppenheimer',
        'Christopher Nolan',
        2023,
        'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg',
        7,
        1
    ),
    (
        'Avengers: Endgame',
        'Anthony Russo',
        2019,
        'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/or06FN3Dka5tukK1e9sl16pB3iy.jpg',
        7,
        11
    ),
    (
        'The Terminator',
        'James Cameron',
        1985,
        'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/q8ffBuxQlYOhO3LJJ0VrRb5UbdR.jpg',
        7,
        1
    );
INSERT INTO Users (
        Name,
        Surname,
        Email,
        Password,
        Birthday,
        ProfilePicture,
        Countries_CountryID
    )
VALUES (
        'John',
        'Doe',
        'johndoe@example.com',
        'hashed_password_123',
        '1990-05-15 00:00:00',
        'https://example.com/profile.jpg',
        7
    ),
    (
        'Jane',
        'Smith',
        'janesmith@example.com',
        'hashed_password_456',
        '1985-08-22 00:00:00',
        'https://example.com/profile2.jpg',
        4
    ),
    (
        'Michael',
        'Johnson',
        'michaeljohnson@example.com',
        'hashed_password_789',
        '1988-12-10 00:00:00',
        'https://example.com/profile3.jpg',
        6
    ),
    (
        'Emily',
        'Brown',
        'emilybrown@example.com',
        'hashed_password_abc',
        '1995-03-28 00:00:00',
        'https://example.com/profile4.jpg',
        7
    ),
    (
        'David',
        'Wilson',
        'davidwilson@example.com',
        'hashed_password_xyz',
        '1983-09-18 00:00:00',
        'https://example.com/profile5.jpg',
        7
    ),
    (
        'POst',
        'man',
        'post34@man.com',
        '$2b$10$rY4x478oIzjNo6WuoUFTHuUgtVPkhMkQRnJW7Cbynqf30mGzOp2km',
        '1982-05-12 00:00:00',
        NULL,
        3
    ),
    (
        'POst',
        'man',
        'post134@man.com',
        '$2b$10$euPyHJilrdcRbSp20KXIyebRg5AE6vZIAVDnhA7uI.1.BRSPcsg8G',
        '1982-05-12 00:00:00',
        NULL,
        3
    ),
    (
        'POst',
        'man',
        'post1234@man.com',
        '$2b$10$f18rbvV63W/UxbEUJn2g5e1iFCXkjQ4iBLjzaEHoDaXPOKNZCrdlG',
        '1982-05-12 00:00:00',
        NULL,
        3
    ),
    (
        'El POst',
        'man',
        'post12334@man.com',
        '$2b$10$qwtoP.MM6BVwYQxgtZHsie5QQbcvWfFMwA91OO5a27V5RzaA6MjIa',
        '1982-05-12 00:00:00',
        '1720133726983-imagenPerfil.jpg',
        7
    ),
    (
        'El POst',
        'man',
        'post112334@man.com',
        '$2b$10$Ee9MbdmCO9Ofa6HlTJmcQunjU5AJczTcTC4OXQEoLjB6BPBISgT8G',
        '1982-05-12 00:00:00',
        NULL,
        7
    ),
    (
        'El POst',
        'man',
        'post1122334@man.com',
        '$2b$10$rMwCWd0D7YyxNb5wOxmhDuGQdbfi53drgQ8EwPwbc36adw1mMjF..',
        '1982-05-12 00:00:00',
        NULL,
        7
    ),
    (
        'El POst',
        'okok',
        'elmai@mail.com',
        '$2b$10$5el69FW7.Ogeog/N/lA0Tu2sH0LxFvgqQ4F9H8/41JvkuKFmS3raW',
        '1982-05-12 00:00:00',
        '1720137044914-imagenPerfil.jpg',
        1
    ),
    (
        'codigo',
        'final',
        'codigofinal@mail.com',
        '$2b$10$nTKVe7Yh4n1u.ahuZ1T1KuEZjcFuuwRecFAmKEDsaeFlZrdkApWgW',
        '1982-05-12 00:00:00',
        '1720215357932-imagenPerfil.jpg',
        4
    ),
    (
        'codigo',
        'final',
        'codigofinal2@mail.com',
        '$2b$10$Dz2qekg5TsTGa1Q9MqUZr.1QLIURv8I1mMirMufOqe43b9ac.2xaO',
        '1982-05-12 00:00:00',
        '1720222556559-imagenPerfil.jpg',
        4
    ),
    (
        'El POst',
        'man',
        'post15122334@man.com',
        '159753',
        '1982-05-12 00:00:00',
        NULL,
        7
    ),
    (
        'El-POst',
        'man',
        'post1555122334@man.com',
        '159753',
        '1982-05-12 00:00:00',
        NULL,
        7
    ),
    (
        'codigo',
        'final',
        'codigofinal4@mail.com',
        '123456',
        '1982-05-12 00:00:00',
        '1720322503594-imagenPerfil.jpg',
        9
    ),
    (
        'codigo',
        'final',
        'codigofinal45@mail.com',
        '123456',
        '1982-05-12 00:00:00',
        '1720325999205-imagenPerfil.jpg',
        4
    ),
    (
        'codigo',
        'final',
        'codigofinal145@mail.com',
        '123456',
        '1982-05-12 00:00:00',
        '1720368187933-imagenPerfil.jpg',
        4
    );