

USE ecoloc;


INSERT INTO utilisateur (nom, prenom, email, telephone, adresse, mot_de_passe, role) VALUES
('Dupont',    'Marie',    'marie.dupont@email.fr',    '0612345678', '12 rue des Lilas, Lyon',          '1234', 'abonne'),
('Martin',    'Thomas',   'thomas.martin@email.fr',   '0623456789', '5 avenue Foch, Paris',            '4567', 'abonne'),
('Bernard',   'Sophie',   'sophie.bernard@email.fr',  '0634567890', '8 impasse des Roses, Bordeaux',   'azerty000', 'abonne'),
('Lefevre',   'Lucas',    'lucas.lefevre@email.fr',   '0645678901', '3 chemin du Moulin, Nantes',      'coucou2005', 'abonne'),
('Moreau',    'Isabelle', 'isabelle.moreau@email.fr', '0656789012', '27 boulevard Victor Hugo, Lille', 'Allo2005', 'abonne'),
('Admin',     'Jean',     'admin@ecoloc.fr',          '0600000000', '1 rue de l\'Administration, Paris','faux2026', 'admin');

INSERT INTO abonne (id_abonne, statut) VALUES
(1, 'valide'),      -- Marie Dupont
(2, 'valide'),      -- Thomas Martin
(3, 'valide'),      -- Sophie Bernard
(4, 'en_attente'),  -- Lucas Lefevre (pas encore validé)
(5, 'valide');      -- Isabelle Moreau

INSERT INTO categorie (libelle) VALUES
('Outillage électroportatif'),
('Outillage de jardin'),
('Matériel de bricolage'),
('Électroménager'),
('Sport et loisirs');


INSERT INTO materiel (nom, id_categorie, caracteristique, duree_pret_max, disponible, etat, id_proprietaire) VALUES

('Perceuse visseuse Bosch 18V',      1, 'Perceuse sans fil 18V, 2 batteries, chargeur inclus. Mandrin 13mm, couple max 60Nm.', 7,  1, 'bon',   1),
('Ponceuse orbitale Makita',         1, 'Ponceuse orbitale 125mm, 300W. Livrée avec 5 disques abrasifs grain 80 et 120.',      5,  1, 'bon',   2),
('Scie sauteuse Black & Decker',     1, 'Scie sauteuse 650W, coupe bois jusqu à 65mm et métal jusqu à 6mm.',                  5,  0, 'moyen', 3),


('Tondeuse thermique Honda',         2, 'Tondeuse thermique 4 temps, largeur de coupe 46cm, bac 50L. Démarrage facile.',       10, 1, 'bon',   1),
('Taille-haie électrique Ryobi',     2, 'Taille-haie 550W, lame 60cm, coupe branches jusqu à 25mm.',                          7,  1, 'bon',   5),
('Débroussailleuse à fil Stihl',     2, 'Débroussailleuse thermique 25cc, tête fil et lame disque incluses.',                  7,  0, 'moyen', 2),

('Échelle télescopique 3,8m',        3, 'Échelle en aluminium télescopique, déployée 3,8m, repliée 85cm. Charge max 150kg.',   3,  1, 'bon',   4),
('Pistolet à colle thermique',       3, 'Pistolet à colle 60W, bâtons 11mm. Idéal pour artisanat et réparations légères.',    5,  1, 'bon',   3),
('Niveau laser Leica',               3, 'Niveau laser croix automatique, portée 20m, précision ±0,3mm/m, trépied inclus.',     5,  1, 'bon',   5),

('Nettoyeur haute pression Kärcher', 4, 'Nettoyeur 1800W, pression max 130 bars, débit 400L/h. Lance, jet rotatif inclus.',   5,  1, 'bon',   1),
('Aspirateur eau et poussière',      4, 'Aspirateur multifonction 1250W, cuve 30L. Aspire liquides et solides.',               5,  1, 'moyen', 3),
('Déshumidificateur 20L/jour',       4, 'Déshumidificateur 20L/jour, idéal cave ou sous-sol humide. Réservoir 3L.',            14, 0, 'bon',   2),

('Vélo VTT 29 pouces',              5, 'VTT tout-suspendu, cadre alu, 21 vitesses. Taille M (pour 1m70 à 1m80).',             7,  1, 'bon',   4),
('Kayak 2 places + pagaies',        5, 'Kayak gonflable 2 places, pagaies et pompe incluses. Charge max 180kg.',              3,  1, 'bon',   5),
('Tente de camping 4 places',       5, 'Tente igloo 4 places, double toit, montage rapide. Résistante aux vents.',            7,  1, 'moyen', 1);

INSERT INTO demande_emprunt (date_creation, statut, id_abonne) VALUES
('2025-04-01', TRUE,  1),  
('2025-04-10', TRUE,  2),  
('2025-04-20', FALSE, 3),  
('2025-04-25', FALSE, 5);  

INSERT INTO demande_emprunt_materiel (id_demande, id_materiel) VALUES
(1, 1),   
(1, 10),  
(2, 4),   
(3, 7),   
(3, 9),   
(4, 13);  


INSERT INTO emprunt (id_materiel, id_emprunteur, date_debut, date_fin, statut) VALUES

(1,  1, '2025-04-02', '2025-04-06', 'termine'),  
(10, 1, '2025-04-02', '2025-04-06', 'termine'),  
(4,  2, '2025-04-11', '2025-04-18', 'termine'),  

(3,  3, '2025-04-22', NULL,         'en_cours'), 
(6,  5, '2025-04-26', NULL,         'en_cours'),
(12, 2, '2025-04-28', NULL,         'en_cours'); 