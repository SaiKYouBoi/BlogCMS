--TABLE USER

CREATE TABLE USER(
	id_user INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    email VARCHAR(50),
    password VARCHAR(50),
    date_inscription DATE
)


-- TABLE CATEGORY

CREATE TABLE CATEGORY(
	id_cat INT PRIMARY KEY AUTO_INCREMENT,
    nom_cat VARCHAR(50)
)


-- TABLE ARTICLE

CREATE TABLE ARTICLE(
	id_article INT PRIMARY KEY AUTO_INCREMENT,
    titre VARCHAR(50),
    contenu VARCHAR(50),
    date_creation DATE,
    date_modification DATE,
    id_user INT,
    id_category INT,
    
    FOREIGN KEY (id_user) REFERENCES USER(id_user),
    FOREIGN KEY (id_category) REFERENCES CATEGORY(id_cat)
);


-- TABLE COMMENTAIRE

CREATE TABLE COMMENTAIRE(
	id_commentaire INT PRIMARY KEY AUTO_INCREMENT,
    contenu_commentaire VARCHAR(50),
    id_user INT,
    id_article INT,
    
    FOREIGN KEY (id_user) REFERENCES USER(id_user),
    FOREIGN KEY (id_article) REFERENCES ARTICLE(id_article)
);