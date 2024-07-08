USE `grupo-18-cac_db`;
CREATE TABLE `Countries` (
    `CountryID` int NOT NULL AUTO_INCREMENT,
    `CountryName` varchar(45) NOT NULL,
    PRIMARY KEY (`CountryID`),
    UNIQUE KEY `idcountries_UNIQUE` (`CountryID`),
    UNIQUE KEY `countryName_UNIQUE` (`CountryName`)
);
CREATE TABLE `Genres` (
    `GenreID` int NOT NULL AUTO_INCREMENT,
    `GenreName` varchar(255) NOT NULL,
    PRIMARY KEY (`GenreID`),
    UNIQUE KEY `idgenres_UNIQUE` (`GenreID`),
    UNIQUE KEY `genreName_UNIQUE` (`GenreName`)
);
CREATE TABLE `Movies` (
    `MovieID` int NOT NULL AUTO_INCREMENT,
    `Title` varchar(255) NOT NULL,
    `Director` varchar(255) NOT NULL,
    `Year` datetime NOT NULL,
    `CoverImage` varchar(255) NOT NULL,
    `Countries_CountryID` int NOT NULL,
    `Genres_GenreID` int NOT NULL,
    PRIMARY KEY (
        `MovieID`,
        `Countries_CountryID`,
        `Genres_GenreID`
    ),
    UNIQUE KEY `idmovies_UNIQUE` (`MovieID`),
    KEY `fk_Movies_Countries1_idx` (`Countries_CountryID`),
    KEY `fk_Movies_Genres1_idx` (`Genres_GenreID`),
    CONSTRAINT `fk_Movies_Countries1` FOREIGN KEY (`Countries_CountryID`) REFERENCES `Countries` (`CountryID`),
    CONSTRAINT `fk_Movies_Genres1` FOREIGN KEY (`Genres_GenreID`) REFERENCES `Genres` (`GenreID`)
);
CREATE TABLE `Users` (
    `UserID` int NOT NULL AUTO_INCREMENT,
    `Name` varchar(45) NOT NULL,
    `Surname` varchar(45) NOT NULL,
    `Email` varchar(255) NOT NULL,
    `Password` varchar(45) NOT NULL,
    `Birthday` datetime NOT NULL,
    `Countries_CountryID` int NOT NULL,
    PRIMARY KEY (`UserID`, `Countries_CountryID`),
    UNIQUE KEY `id_UNIQUE` (`UserID`),
    UNIQUE KEY `email_UNIQUE` (`Email`),
    KEY `fk_Users_Countries_idx` (`Countries_CountryID`),
    CONSTRAINT `fk_Users_Countries` FOREIGN KEY (`Countries_CountryID`) REFERENCES `Countries` (`CountryID`)
);
CREATE TABLE `User_Movie_Watches` (
    `UserMovieWatchID` int NOT NULL AUTO_INCREMENT,
    `WatchDate` datetime NOT NULL,
    `Users_UserID` int NOT NULL,
    `Users_Countries_CountryID` int NOT NULL,
    `Movies_MovieID` int NOT NULL,
    `Movies_Countries_CountryID` int NOT NULL,
    `Movies_Genres_GenreID` int NOT NULL,
    `Rating` int NOT NULL,
    `RatingDate` datetime NOT NULL,
    PRIMARY KEY (
        `UserMovieWatchID`,
        `Users_UserID`,
        `Users_Countries_CountryID`,
        `Movies_MovieID`,
        `Movies_Countries_CountryID`,
        `Movies_Genres_GenreID`
    ),
    UNIQUE KEY `iduser_movie_watch_UNIQUE` (`UserMovieWatchID`),
    KEY `fk_User_Movie_Watches_Users1_idx` (`Users_UserID`, `Users_Countries_CountryID`),
    KEY `fk_User_Movie_Watches_Movies1_idx` (
        `Movies_MovieID`,
        `Movies_Countries_CountryID`,
        `Movies_Genres_GenreID`
    ),
    CONSTRAINT `fk_User_Movie_Watches_Movies1` FOREIGN KEY (
        `Movies_MovieID`,
        `Movies_Countries_CountryID`,
        `Movies_Genres_GenreID`
    ) REFERENCES `Movies` (
        `MovieID`,
        `Countries_CountryID`,
        `Genres_GenreID`
    ),
    CONSTRAINT `fk_User_Movie_Watches_Users1` FOREIGN KEY (`Users_UserID`, `Users_Countries_CountryID`) REFERENCES `Users` (`UserID`, `Countries_CountryID`)
);
INSERT INTO Countries (CountryName)
VALUES ('Alemania'),
    ('Argentina'),
    ('Australia'),
    ('Bolivia'),
    ('Brasil'),
    ('Canada'),
    ('Chile'),
    ('España'),
    ('EstadosUnidos'),
    ('Francia'),
    ('GranBretaña'),
    ('Italia'),
    ('Mexico'),
    ('Peru'),
    ('Uruguay');
INSERT INTO Genres (GenreID, GenreName)
VALUES (1, 'Accion'),
    (11, 'Animacion'),
    (2, 'Aventura'),
    (3, 'Ciencia Ficción'),
    (4, 'Comedia'),
    (5, 'Documentales'),
    (6, 'Drama'),
    (7, 'Fantasia'),
    (12, 'Infantil'),
    (8, 'Musicales'),
    (9, 'Suspense'),
    (10, 'Terror');
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
        '2024-06-13 00:00:00',
        'https://image.tmdb.org/t/p/w500//gMB8vgHu2lcyzv1fyptD6drHmJd.jpg',
        3,
        12
    ),
    (
        'Furiosa a Mad Max Saga',
        'George Miller',
        '2024-05-23 00:00:00',
        ' https://image.tmdb.org/t/p/w500//iADOJ8Zymht2JPMoy3R7xceZprc.jpg',
        3,
        1
    ),
    (
        'Bad Boys Ride or Die',
        'Adil El / ArbiBilall Fallah',
        '2024-06-05 00:00:00',
        ' https://image.tmdb.org/t/p/w500//nP6RliHjxsz4irTKsxe8FRhKZYl.jpg',
        3,
        4
    ),
    (
        'If',
        'John Krasinski',
        '2024-05-08 00:00:00',
        'https://image.tmdb.org/t/p/w500//xbKFv4KF3sVYuWKllLlwWDmuZP7.jpg',
        3,
        12
    ),
    (
        'Godzilla x Kong The new Impire',
        'Adam Wingard',
        '2024-05-15 00:00:00',
        'https://image.tmdb.org/t/p/w500//z1p34vh7dEOnLDmyCrlUVLuoDzd.jpg',
        3,
        7
    ),
    (
        'The Godfather',
        'Francis Ford Coppola',
        '1972-12-20 00:00:00',
        'https://http2.mlstatic.com/D_NQ_NP_2X_849311-MLA52604231932_112022-F.webp',
        3,
        1
    ),
    (
        'Schindler´s List',
        'Steven Spielberg',
        '1994-02-24 00:00:00',
        'https://image.tmdb.org/t/p/original/xx4JCtIkUj31PJbPFRLhuBc1PRl.jpg',
        3,
        6
    ),
    (
        'Dune',
        'Denis Villeneuve',
        '2021-10-21 00:00:00',
        'https://image.tmdb.org/t/p/w600_and_h900_bestv2/d5NXSklXo0qyIYkgV94XAgMIckC.jpg',
        3,
        2
    ),
    (
        'Oppenheimer',
        'Christopher Nolan',
        '2023-06-20 00:00:00',
        'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg',
        3,
        1
    ),
    (
        'Avengers: Endgame',
        'Anthony Russo',
        '2019-05-02 00:00:00',
        'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/or06FN3Dka5tukK1e9sl16pB3iy.jpg',
        3,
        11
    ),
    (
        'The Terminator',
        'James Cameron',
        '1085-04-18 00:00:00',
        'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/qvktm0BHcnmDpul4Hz01GIazWPr.jpg',
        3,
        3
    ),
    (
        'Wonder Woman',
        'Patty Jenkins',
        '2017-06-01 00:00:00',
        'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/imekS7f1OuHyUP2LAiTEM0zBzUz.jpg',
        3,
        7
    ),
    (
        'Joker',
        'Todd Phillips',
        '2019-10-03 00:00:00',
        'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/udDclJoHjfjb8Ekgsd4FDteOkCU.jpg',
        3,
        7
    ),
    (
        'Deadpool',
        'Tim Miller',
        '2016-02-11 00:00:00',
        'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/3E53WEZJqP6aM84D8CckXx4pIHw.jpg',
        3,
        7
    ),
    (
        'The Notebook',
        'Nick Cassavetes',
        '2004-06-25 00:00:00',
        'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/rNzQyW4f8B8cQeg7Dgj3n6eT5k9.jpg',
        3,
        2
    ),
    (
        'The Matrix',
        'Lilly Wachowski',
        '1999-06-10 00:00:00',
        'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/f89U3ADr1oiB1s9GkdPOEpXUk5H.jpg',
        3,
        5
    );
INSERT INTO Users (
        Name,
        Surname,
        Email,
        Password,
        Birthday,
        Countries_CountryID
    )
VALUES (
        'Rayshell',
        'Callery',
        'rcallery@phoca.cs',
        'oX2&$MM|{<}J',
        '1976-08-15 00:00:00',
        1
    ),
    (
        'Honoria',
        'Danaher',
        'hdanaher1@who.int',
        'gW5.Jn1Ul',
        '2006-07-15 00:00:00',
        2
    ),
    (
        'Leanna',
        'Hear',
        'lohear2@auda.org.au',
        'aS4{X/0t_Y',
        '1998-11-22 00:00:00',
        3
    ),
    (
        'Barth',
        'Else',
        'belse3@miibeian.gov.cn',
        'U3}.~g#T&E+HOd',
        '2020-12-18 00:00:00',
        1
    ),
    (
        'April',
        'Strowan',
        'astrowan4@sohu.com',
        'bL2%f4b}29x9LD1',
        '1995-01-23 00:00:00',
        5
    ),
    (
        'Davidde',
        'Brimilcome',
        'dbrimilcome5@hubpages.com',
        'yK0/4zf``G',
        '1985-09-11 00:00:00',
        15
    ),
    (
        'Julina',
        'Divisek',
        'jdivisek8@ocn.ne.jp',
        'sm5?xlg_',
        '1957-01-22 00:00:00',
        10
    ),
    (
        'Bartie',
        'Corcoran',
        'bcorcoran9@europa.eu',
        'bc6/+qoiyzss',
        '1989-08-23 00:00:00',
        7
    );
INSERT INTO User_Movie_Watches (
        WatchDate,
        Users_UserID,
        Users_Countries_CountryID,
        Movies_MovieID,
        Movies_Countries_CountryID,
        Movies_Genres_GenreID,
        Rating,
        RatingDate
    )
VALUES (
        '2024-12-01 00:00:00',
        7,
        10,
        14,
        3,
        7,
        4,
        '2024-12-01 00:00:00'
    ),
    (
        '2024-12-12 00:00:00',
        7,
        10,
        15,
        3,
        2,
        8,
        '2024-12-12 00:00:00'
    ),
    (
        '2024-05-20 00:00:00',
        5,
        5,
        2,
        3,
        1,
        5,
        '2024-05-20 00:00:00'
    ),
    (
        '2024-05-04 00:00:00',
        5,
        5,
        12,
        3,
        7,
        7,
        '2024-05-04 00:00:00'
    ),
    (
        '2024-05-06 00:00:00',
        2,
        2,
        3,
        3,
        4,
        5,
        '2024-05-06 00:00:00'
    ),
    (
        '2024-05-10 00:00:00',
        2,
        2,
        11,
        3,
        3,
        7,
        '2024-05-10 00:00:00'
    ),
    (
        '2024-05-16 00:00:00',
        8,
        7,
        15,
        3,
        2,
        5,
        '2024-05-16 00:00:00'
    ),
    (
        '2024-05-24 00:00:00',
        2,
        2,
        6,
        3,
        1,
        6,
        '2024-05-24 00:00:00'
    ),
    (
        '2024-05-12 00:00:00',
        8,
        7,
        3,
        3,
        4,
        6,
        '2024-05-12 00:00:00'
    ),
    (
        '2024-02-20 00:00:00',
        4,
        1,
        4,
        3,
        12,
        8,
        '2024-02-20 00:00:00'
    ),
    (
        '2024-02-05 00:00:00',
        3,
        3,
        8,
        3,
        2,
        6,
        '2024-02-05 00:00:00'
    ),
    (
        '2024-02-25 00:00:00',
        1,
        1,
        10,
        3,
        11,
        7,
        '2024-02-25 00:00:00'
    ),
    (
        '2024-02-02 00:00:00',
        2,
        2,
        4,
        3,
        12,
        10,
        '2024-02-02 00:00:00'
    ),
    (
        '2024-02-05 00:00:00',
        5,
        5,
        13,
        3,
        7,
        9,
        '2024-02-05 00:00:00'
    ),
    (
        '2024-05-04 00:00:00',
        7,
        10,
        12,
        3,
        7,
        10,
        '2024-05-04 00:00:00'
    ),
    (
        '2024-05-06 00:00:00',
        1,
        1,
        11,
        3,
        3,
        6,
        '2024-05-06 00:00:00'
    ),
    (
        '2024-05-08 00:00:00',
        3,
        3,
        8,
        3,
        2,
        7,
        '2024-05-08 00:00:00'
    ),
    (
        '2024-05-09 00:00:00',
        6,
        15,
        16,
        3,
        5,
        4,
        '2024-05-09 00:00:00'
    ),
    (
        '2024-05-11 00:00:00',
        5,
        5,
        5,
        3,
        7,
        8,
        '2024-05-11 00:00:00'
    );