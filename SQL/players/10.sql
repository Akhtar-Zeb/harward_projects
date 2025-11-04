SELECT "first_name", "last_name", "height" AS "Cubin Height"
FROM players
WHERE "birth_country" = 'Cuba'
ORDER BY "first_name" ASC;
