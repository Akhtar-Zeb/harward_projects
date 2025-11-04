SELECT "players"."first_name", "players"."last_name" FROM "players"
WHERE "players"."id" IN (
    SELECT "salaries"."player_id" FROM "salaries"
    JOIN "performances" ON "salaries"."player_id" = "performances"."player_id"
    WHERE "salaries"."year" = 2001 AND "performances"."year" = 2001 AND "performances"."H" > 0
    ORDER BY ("salaries"."salary" / "performances"."H") ASC, "salaries"."player_id" ASC
    LIMIT 10
  ) AND "players"."id" IN (
    SELECT "salaries"."player_id" FROM "salaries"
    JOIN "performances" ON "salaries"."player_id" = "performances"."player_id"
    WHERE "salaries"."year" = 2001 AND "performances"."year" = 2001 AND "performances"."RBI" > 0
    ORDER BY ("salaries"."salary" / "performances"."RBI") ASC, "salaries"."player_id" ASC
    LIMIT 10
  )
ORDER BY
  "players"."id" ASC;
