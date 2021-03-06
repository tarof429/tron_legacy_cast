CREATE TABLE IF NOT EXISTS cast (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    movie_name VARCHAR(100) NOT NULL,
    PRIMARY KEY ( id ),
    UNIQUE KEY (movie_name)
);

INSERT INTO cast (name, movie_name) VALUES 
('Garrett Hedlund', 'Samuel "Sam" Flynn'), 
('Jeff Bridges', 'Kevin Flynn'),
('Olivia Wilde', 'Quorra'),
('Bruce Boxleitner', 'Alan Bradley'),
('Bruce Boxleitner', 'Rinzler'),
('Michael Sheen', 'Zuse'),
('Michael Sheen', 'Castor'),
('James Frain', 'Jarvis'),
('Beau Garrett', 'Gem'),
('Daft Punk', 'Daft Punk'),
('Serinda Swan','Siren #2') ;