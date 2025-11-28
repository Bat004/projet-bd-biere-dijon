Prix moyen de la bière par quartier
   SELECT
   q.nom_quartier,
   ROUND(AVG(p.prix), 2) AS prix_moyen
   FROM Quartier q
   JOIN Bar b ON b.id_quartier = q.id_quartier
   JOIN Prix p ON p.id_bar = b.id_bar
   GROUP BY q.nom_quartier
   ORDER BY prix_moyen ASC;

Bars vendant l'IPA la moins chère
    SELECT b.nom AS bar, p.prix
    FROM Prix p
    JOIN Bar b ON p.id_bar = b.id_bar
    JOIN Biere bi ON p.id_biere = bi.id_biere
    WHERE bi.type_biere = 'IPA'
    AND p.prix = (
    SELECT MIN(p2.prix)
    FROM Prix p2
    JOIN Biere bi2 ON p2.id_biere = bi2.id_biere
    WHERE bi2.type_biere = 'IPA'
    );

Bières vendues dans ≥ 5 bars
    SELECT bi.nom_biere, COUNT(p.id_bar) AS nb_bars
    FROM Biere bi
    JOIN Prix p ON bi.id_biere = p.id_biere
    GROUP BY bi.nom_biere
    HAVING COUNT(p.id_bar) >= 5
    ORDER BY nb_bars DESC;

Bars sans bière à moins de 6€
    SELECT b.nom, b.adresse
    FROM Bar b
    WHERE b.id_bar NOT IN (
    SELECT p.id_bar
    FROM Prix p
    WHERE p.prix < 6
    );

Top bar avec panier moyen maximum (bar le + cher en moyenne)
    SELECT
    b.nom AS bar,
    ROUND(AVG(p.prix), 2) AS panier_moyen
    FROM Bar b
    JOIN Prix p ON b.id_bar = p.id_bar
    GROUP BY b.id_bar, b.nom
    ORDER BY panier_moyen DESC
    LIMIT 1;