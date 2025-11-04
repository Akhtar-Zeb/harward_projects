SELECT "schools"."name" FROM "schools"
JOIN "districts" ON "districts"."id" = "schools"."district_id"
WHERE "schools"."city" = 'Cambridge' AND "districts"."name" = 'Cambridge';
