CREATE DATABASE BLOGCMCV2;
USE BLOGCMCV2;

--COMPATIBLE DATA WITH THE CSV FILE

-- USERS
CREATE TABLE USERS(
    id_user INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,        
    email VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(50) NOT NULL,
    inscription_date DATE DEFAULT CURDATE()
);

-- CATEGORY
CREATE TABLE CATEGORY(
    id_category INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    description TEXT
);

-- POST
CREATE TABLE POST(
    id_post INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    content TEXT,                        
    creation_date DATE NOT NULL DEFAULT CURDATE(),
    update_date   DATE NOT NULL DEFAULT CURDATE() ON UPDATE CURDATE(),
    status ENUM('published','draft','archived') NOT NULL,  
    view_count INT DEFAULT 0,               
    id_user INT NOT NULL,
    id_category INT NOT NULL,
    
    FOREIGN KEY (id_user) REFERENCES USERS(id_user),
    FOREIGN KEY (id_category) REFERENCES CATEGORY(id_category)
);

-- COMMENTS
CREATE TABLE COMMENTS(
    id_comment INT PRIMARY KEY AUTO_INCREMENT,
    contenu_commentaire VARCHAR(255),     
    creation_date DATE NOT NULL DEFAULT CURDATE(),
    status ENUM('spam','pending','approved'), 
    id_user INT DEFAULT NULL,
    id_post INT NOT NULL,                  
    
    FOREIGN KEY (id_user) REFERENCES USERS(id_user),
    FOREIGN KEY (id_post) REFERENCES POST(id_post)
);


--INSERTION IN TABLES

INSERT INTO CATEGORY (id_category, name, description) VALUES
(1, 'Technologie', 'Actualités, tutoriels et analyses sur les nouvelles technologies'),
(2, 'Santé', 'Conseils santé, bien-être et médecine préventive'),
(3, 'Voyage', 'Récits de voyage, guides pratiques et conseils touristiques'),
(4, 'Cuisine', 'Recettes, techniques culinaires et astuces de cuisine'),
(5, 'Sport', 'Actualités sportives, conseils d\'entraînement et nutrition'),
(6, 'Éducation', 'Pédagogie, conseils d\'apprentissage et innovations éducatives'),
(7, 'Finance', 'Gestion budgétaire, investissements et actualités économiques'),
(8, 'Mode', 'Tendances, conseils style et actualités de la mode');

INSERT INTO USERS (id_user, username, email, password, role, inscription_date) VALUES
(1, 'admin_blog', 'admin@blogcms.com', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31tW', 'admin', '2024-02-15'),
(2, 'marie_dubois', 'marie.dubois@gmail.com', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31tW', 'editor', '2024-02-10'),
(3, 'pierre_leroy', 'pierre.leroy@gmail.com', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31tW', 'author', '2024-02-15'),
(4, 'sophie_martin', 'sophie.martin@protonmail.com', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31tW', 'author', '2024-03-01'),
(5, 'jean_dupont', 'jean.dupont@yahoo.fr', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31tW', 'author', '2024-03-10'),
(6, 'lucie_bernard', 'lucie.bernard@email.com', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31tW', 'author', '2024-03-15'),
(7, 'thomas_petit', 'thomas.petit@gmail.com', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31tW', 'subscriber', '2024-03-20'),
(8, 'julie_roux', 'julie.roux@protonmail.com', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31tW', 'subscriber', '2024-04-01'),
(9, 'marc_vincent', 'marc.vincent@yandex.fr', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31tW', 'author', '2024-04-05'),
(10, 'isabelle_leroy', 'isabelle.leroy@gmail.com', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31tW', 'subscriber', '2024-04-10'),
(11, 'david_morel', 'david.colin@email.com', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31tW', 'author', '2024-04-15'),
(12, 'caroline_duval', 'caroline.duval@protonmail.com', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31tW', 'editor', '2024-05-02'),
(13, 'nicolas_lambert', 'nicolas.lambert@gmail.com', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31tW', 'author', '2024-05-10'),
(14, 'elodie_garnier', 'elodie.garnier@email.com', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31tW', 'subscriber', '2024-05-20'),
(15, 'antoine_chevalier', 'antoine.chevalier@yahoo.fr', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31tW', 'author', '2024-06-01'),
(16, 'clara_royer', 'clara.royer@protonmail.com', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31tW', 'author', '2024-06-10'),
(17, 'quentin_menard', 'quentin.menard@gmail.com', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31tW', 'subscriber', '2024-06-15'),
(18, 'amelie_colin', 'amelie.colin@email.com', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31tW', 'author', '2024-07-03'),
(19, 'vincent_gauthier', 'vincent.gauthier@protonmail.com', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31tW', 'editor', '2024-07-12'),
(20, 'marine_lebrun', 'marine.lebrun@gmail.com', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31tW', 'subscriber', '2024-07-20');

INSERT INTO POST (id_post, title, content, creation_date, update_date, status, view_count, id_user, id_category) VALUES
(1, 'Les Nouvelles Tensions Technologiques en 2024', 'Explorez les technologies émergentes qui vont transformer notre quotidien cette année...', '2024-02-20', '2024-02-21', 'published', 1245, 3, 1),
(2, 'Comment Maintenir une Bonne Santé au Travail', 'Des conseils pratiques pour prendre soin de votre santé physique et mentale...', '2024-02-25', '2024-02-25', 'published', 876, 4, 2),
(3, 'Les 10 Destinations à Visiter Absolument en 2024', 'Découvrez les destinations qui vont marquer l\'année 2024...', '2024-03-05', '2024-03-06', 'draft', 0, 5, 3),
(4, 'Recette du Gâteau au Chocolat Parfait', 'Une recette simple et rapide pour un gâteau au chocolat irrésistible...', '2024-03-10', '2024-03-11', 'published', 2345, 6, 4),
(5, 'Préparation Marathon : Guide Complet du Débutant', 'Tout ce qu\'il faut savoir pour préparer son premier marathon...', '2024-03-15', '2024-03-16', 'published', 1567, 9, 5),
(6, 'Apprendre à Coder en 6 Mois : Mon Parcours', 'Comment j\'ai appris la programmation web en moins de 6 mois...', '2024-03-20', '2024-03-21', 'published', 3210, 11, 6),
(7, 'Investir dans la Cryptomonnaie en 2024', 'Guide pour débutants sur les opportunités et risques...', '2024-04-01', '2024-04-02', 'published', 1890, 13, 7),
(8, 'Les Tendances Mode Printemps-Été 2024', 'Découvrez les must-have de la saison prochaine...', '2024-04-05', '2024-04-06', 'published', 943, 15, 8),
(9, 'Les Défis de l\'IA : Distance et Productivité', 'Comment le travail à distance peut booster vos performances...', '2024-04-10', '2024-04-11', 'published', 1123, 18, 1),
(10, 'Les Superaliments pour Renforcer l\'Immunité', '10 aliments à intégrer dans votre alimentation pour être en forme...', '2024-04-15', '2024-04-16', 'published', 765, 16, 2),
(11, 'Voyager en Solo : Mes Conseils Sécurité', 'Guide pratique pour voyager seul en toute sécurité...', '2024-04-20', '2024-04-21', 'published', 890, 19, 3),
(12, 'Les Basiques de la Cuisine Française', 'Apprenez les techniques fondamentales de la pâtisserie...', '2024-05-02', '2024-05-03', 'draft', 0, 20, 4),
(13, 'Yoga pour Débutants : Programme sur 30 Jours', 'Un programme progressif pour découvrir le yoga...', '2024-05-10', '2024-05-11', 'published', 654, 5, 5),
(14, 'Les Méthodes d\'Apprentissage des Langues Efficaces', 'Comparatif des différentes approches pour apprendre une langue...', '2024-05-20', '2024-05-21', 'published', 432, 6, 6),
(15, 'Économiser pour Son Premier Achat Immobilier', 'Stratégies pour constituer son apport personnel...', '2024-06-01', '2024-06-02', 'published', 987, 9, 7),
(16, 'Le Style Minimaliste : Less is More', 'Comment adopter une garde-robe minimaliste et élégante...', '2024-06-10', '2024-06-11', 'published', 543, 11, 8),
(17, 'Introduction à l\'Intelligence Artificielle', 'Comprendre les bases de l\'IA et ses applications...', '2024-06-15', '2024-06-15', 'published', 1876, 13, 1),
(18, 'La Méditation pour Réduire le Stress', 'Techniques de méditation accessibles à tous...', '2024-07-03', '2024-07-04', 'draft', 0, 15, 2),
(19, 'Voyager avec un Petit Budget', 'Astuces pour voyager dans se ruiner...', '2024-07-12', '2024-07-13', 'published', 765, 16, 3),
(20, 'Les Plats Typiques de la Cuisine Marocaine', 'Découverte des saveurs et traditions culinaires du Maroc...', '2024-07-20', '2024-07-21', 'published', 1098, 18, 4),
(21, 'Préparation Physique pour le Ski', 'Conseils pour se préparer avant la saison de ski...', '2024-08-01', '2024-08-02', 'draft', 0, 19, 5),
(22, 'Les Outils Numériques pour l\'Éducation', 'Les meilleures applications pour apprendre et enseigner...', '2024-08-10', '2024-08-11', 'published', 876, 20, 6),
(23, 'Comprendre les Marchés Boursiers', 'Guide pour débutants en bourse...', '2024-08-20', '2024-08-21', 'published', '654', 3, 7),
(24, 'Le Style Casual Chic au Bureau', 'Comment être élégant tout en restant confortable...', '2024-09-01', '2024-09-02', 'published', 432, 4, 8),
(25, 'La Sécurité Informatique pour les Particuliers', 'Protégez vos données et votre vie privée en ligne...', '2024-09-10', '2024-09-11', 'published', 1567, 5, 1),
(26, 'L\'Importance du Sommeil pour la Santé', 'Comment améliorer la qualité de son sommeil...', '2024-09-20', '2024-09-21', 'published', 765, 6, 2),
(27, 'Les Plus Beaux Villages de France', 'Découverte des villages classés les plus beaux de France...', '2024-10-01', '2024-10-02', 'published', 987, 9, 3),
(28, 'Les Techniques de Cuisson Santé', 'Cuire ses aliments tout en préservant les nutriments...', '2024-10-10', '2024-10-11', 'published', 543, 11, 4),
(29, 'Le CrossFit : Avantages et Risques', 'Analyse complète de cette discipline sportive...', '2024-10-20', '2024-10-21', 'published', 876, 13, 5),
(30, 'Apprendre le Jeu comme outil d\'apprentissage', 'Utiliser le jeu comme outil d\'apprentissage...', '2024-11-01', '2024-11-02', 'published', 654, 15, 6);

INSERT INTO COMMENTS (id_comment, contenu_commentaire, creation_date, status, id_user, id_post) VALUES
(1, 'Excellent article, très bien documenté !', '2024-02-21', 'approved', 1, 1),
(2, 'Je ne suis pas tout à fait d\'accord sur certains points.', '2024-02-22', 'approved', 2, 1),
(3, 'Cela m\'a beaucoup aidé, merci pour ces conseils.', '2024-02-25', 'approved', 3, 2),
(4, 'Très bel article, les photos sont magnifiques !', '2024-02-26', 'pending', 4, 3),
(5, 'Je trouve que certains conseils sont dangereux.', '2024-02-27', 'spam', 5, 4),
(6, 'Parfait pour les débutants comme moi, merci !', '2024-02-28', 'approved', 6, 5),
(7, 'Très détaillé, j\'ai appris beaucoup de choses.', '2024-02-29', 'approved', 7, 6),
(8, 'C\'est exactement ce que je cherchais, merci !', '2024-03-01', 'approved', 8, 7),
(9, 'Je ne comprends pas la partie sur les investissements.', '2024-03-02', 'pending', 9, 8),
(10, 'Super article, j\'ai hâte de lire la suite !', '2024-03-03', 'approved', 10, 9),
(11, 'Les tendances présentées sont déjà dépassées.', '2024-03-04', 'spam', 11, 10),
(12, 'Je vais essayer la recette ce week-end !', '2024-03-05', 'approved', 12, 11),
(13, 'Bonnes astuces pour économiser, merci.', '2024-03-06', 'approved', 13, 12),
(14, 'Le style minimaliste n\'est pas pour tout le monde.', '2024-03-07', 'pending', 14, 13),
(15, 'Très bon tutoriel sur l\'IA pour débutants.', '2024-03-08', 'approved', 15, 14),
(16, 'La méditation a changé ma vie, merci pour l\'article.', '2024-03-09', 'approved', 16, 15),
(17, 'Voyager avec un petit budget c\'est possible !', '2024-03-10', 'approved', 17, 16),
(18, 'Les plats marocains sont délicieux, merci.', '2024-03-11', 'pending', 18, 17),
(19, 'Je me prépare pour le ski, merci pour les conseils.', '2024-03-12', 'approved', 19, 18),
(20, 'Quelles applications recommandez-vous pour les enfants?', '2024-03-13', 'approved', 20, 19),
(21, 'La bourse me fait peur, merci pour les explications.', '2024-03-14', 'approved', 1, 20),
(22, 'Je cherche justement un style casual chic, merci !', '2024-03-15', 'pending', 2, 21),
(23, 'Important de parler de sécurité informatique.', '2024-03-16', 'approved', 3, 22),
(24, 'Je dors mal, merci pour ces conseils.', '2024-03-17', 'approved', 4, 23),
(25, 'J\'ai visité certains villages, ils sont magnifiques !', '2024-03-18', 'approved', 5, 24);