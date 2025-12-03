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


--COMPATIBLE DATA WITH THE CSV FILE

CREATE TABLE USER(
	id_user INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NO NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(50) NOT NULL,
    inscription_date DATE
)

CREATE TABLE CATEGORY(
	id_category INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    description TEXT
)

CREATE TABLE POST(
	id_post INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(50) NOT NULL,
    content TEXT),
    creation_date DATE NOT NULL,
    update_date DATE,
    status VARCHAR(50) NOT NULL,
    view_count VARCHAR(50) NOT NULL,
    id_user INT NOT NULL,
    id_category INT NOT NULL,
    
    FOREIGN KEY (id_user) REFERENCES USER(id_user),
    FOREIGN KEY (id_category) REFERENCES CATEGORY(id_category)
);


CREATE TABLE COMMENTS(
	id_comment INT PRIMARY KEY AUTO_INCREMENT,
    contenu_commentaire VARCHAR(50),
    creation_date DATE NOT NULL,
    status VARCHAR(50) NOT NULL,
    id_user INT NOT NULL,
    id_post INT NOT NULL,
    
    FOREIGN KEY (id_user) REFERENCES USER(id_user),
    FOREIGN KEY (id_article) REFERENCES POST(id_post)
);