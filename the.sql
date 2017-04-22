SELECT "beneficiaries_beneficiary"."payer_slade_code",
       DATA->>'scheme_code' AS "scheme_code",
              DATA->>'scheme' AS "scheme",
                     COUNT("beneficiaries_beneficiarydata"."beneficiary_id") AS "ben_count",
                     COUNT(CASE
                               WHEN CASE
                                        WHEN ("beneficiaries_beneficiarydata"."active" = 'LIVE'
                                              AND (DATA->>'valid_from')::TIMESTAMP WITH TIME ZONE <= (STATEMENT_TIMESTAMP())
                                              AND (DATA->>'valid_to')::TIMESTAMP WITH TIME ZONE >= (STATEMENT_TIMESTAMP())) THEN TRUE
                                        ELSE FALSE
                                    END = TRUE THEN 1
                               ELSE NULL
                           END) AS "active_count",
                     CASE
                         WHEN COUNT(CASE
                                        WHEN CASE
                                                 WHEN ("beneficiaries_beneficiarydata"."active" = 'LIVE'
                                                       AND (DATA->>'valid_from')::TIMESTAMP WITH TIME ZONE <= (STATEMENT_TIMESTAMP())
                                                       AND (DATA->>'valid_to')::TIMESTAMP WITH TIME ZONE >= (STATEMENT_TIMESTAMP())) THEN TRUE
                                                 ELSE FALSE
                                             END = TRUE THEN 1
                                        ELSE NULL
                                    END) > 0 THEN TRUE
                         ELSE FALSE
                     END AS "is_group_active"
FROM "beneficiaries_beneficiarydata"
INNER JOIN "beneficiaries_beneficiary" ON ("beneficiaries_beneficiarydata"."beneficiary_id" = "beneficiaries_beneficiary"."id")
WHERE "beneficiaries_beneficiarydata"."id" IN
        (SELECT DISTINCT ON (U0."beneficiary_id") U0."id"
         FROM "beneficiaries_beneficiarydata" U0
         INNER JOIN "beneficiaries_beneficiary" U1 ON (U0."beneficiary_id" = U1."id")
         LEFT OUTER JOIN "beneficiaries_beneficiary" U2 ON (U0."principal_id" = U2."id")
         ORDER BY U0."beneficiary_id" ASC, U0."timestamp" DESC)
GROUP BY "beneficiaries_beneficiary"."payer_slade_code",
         DATA->>'scheme_code',
                DATA->>'scheme'
ORDER BY "beneficiaries_beneficiary"."payer_slade_code" ASC,
         "scheme_code" ASC,
         "scheme" ASC


-----------the other one

SELECT "beneficiaries_beneficiary"."payer_slade_code",
       "beneficiaries_beneficiarydata"."scheme_code",
       "beneficiaries_beneficiarydata"."scheme",
       COUNT("beneficiaries_beneficiarydata"."beneficiary_id") AS "ben_count",
       COUNT(CASE
                 WHEN CASE
                          WHEN ("beneficiaries_beneficiarydata"."active" = LIVE
                                AND (DATA->>'valid_from')::TIMESTAMP WITH TIME ZONE <= (STATEMENT_TIMESTAMP())
                                AND (DATA->>'valid_to')::TIMESTAMP WITH TIME ZONE >= (STATEMENT_TIMESTAMP())) THEN TRUE
                          ELSE FALSE
                      END = TRUE THEN 1
                 ELSE NULL
             END) AS "active_count",
       CASE
           WHEN COUNT(CASE
                          WHEN CASE
                                   WHEN ("beneficiaries_beneficiarydata"."active" = LIVE
                                         AND (DATA->>'valid_from')::TIMESTAMP WITH TIME ZONE <= (STATEMENT_TIMESTAMP())
                                         AND (DATA->>'valid_to')::TIMESTAMP WITH TIME ZONE >= (STATEMENT_TIMESTAMP())) THEN TRUE
                                   ELSE FALSE
                               END = TRUE THEN 1
                          ELSE NULL
                      END) > 0 THEN TRUE
           ELSE FALSE
       END AS "is_group_active"
FROM "beneficiaries_beneficiarydata"
INNER JOIN "beneficiaries_beneficiary" ON ("beneficiaries_beneficiarydata"."beneficiary_id" = "beneficiaries_beneficiary"."id")
WHERE "beneficiaries_beneficiarydata"."id" IN
        (SELECT DISTINCT ON (U0."beneficiary_id") U0."id"
         FROM "beneficiaries_beneficiarydata" U0
         INNER JOIN "beneficiaries_beneficiary" U1 ON (U0."beneficiary_id" = U1."id")
         LEFT OUTER JOIN "beneficiaries_beneficiary" U2 ON (U0."principal_id" = U2."id")
         ORDER BY U0."beneficiary_id" ASC, U0."timestamp" DESC)
GROUP BY "beneficiaries_beneficiary"."payer_slade_code",
         "beneficiaries_beneficiarydata"."scheme_code",
         "beneficiaries_beneficiarydata"."scheme"
ORDER BY "beneficiaries_beneficiary"."payer_slade_code" ASC,
         "beneficiaries_beneficiarydata"."scheme_code" ASC,
         "beneficiaries_beneficiarydata"."scheme" ASC

EXPLAIN ANALYSE SELECT "beneficiaries_beneficiary"."payer_slade_code", "beneficiaries_beneficiarydata"."scheme_code", "beneficiaries_beneficiarydata"."scheme", COUNT("beneficiaries_beneficiarydata"."beneficiary_id") AS "ben_count", COUNT(CASE WHEN CASE WHEN ("beneficiaries_beneficiarydata"."active" = 'LIVE' AND (data->>'valid_from')::timestamp with time zone <= (STATEMENT_TIMESTAMP()) AND (data->>'valid_to')::timestamp with time zone >= (STATEMENT_TIMESTAMP())) THEN True ELSE False END = True THEN 1 ELSE NULL END) AS "active_count", CASE WHEN COUNT(CASE WHEN CASE WHEN ("beneficiaries_beneficiarydata"."active" = 'LIVE' AND (data->>'valid_from')::timestamp with time zone <= (STATEMENT_TIMESTAMP()) AND (data->>'valid_to')::timestamp with time zone >= (STATEMENT_TIMESTAMP())) THEN True ELSE False END = True THEN 1 ELSE NULL END) > 0 THEN True ELSE False END AS "is_group_active" FROM "beneficiaries_beneficiarydata" INNER JOIN "beneficiaries_beneficiary" ON ("beneficiaries_beneficiarydata"."beneficiary_id" = "beneficiaries_beneficiary"."id") WHERE "beneficiaries_beneficiarydata"."id" IN (SELECT DISTINCT ON (U0."beneficiary_id") U0."id" FROM "beneficiaries_beneficiarydata" U0 INNER JOIN "beneficiaries_beneficiary" U1 ON (U0."beneficiary_id" = U1."id") LEFT OUTER JOIN "beneficiaries_beneficiary" U2 ON (U0."principal_id" = U2."id") ORDER BY U0."beneficiary_id" ASC, U0."timestamp" DESC) GROUP BY "beneficiaries_beneficiary"."payer_slade_code", "beneficiaries_beneficiarydata"."scheme_code", "beneficiaries_beneficiarydata"."scheme" ORDER BY "beneficiaries_beneficiary"."payer_slade_code" ASC, "beneficiaries_beneficiarydata"."scheme_code" ASC, "beneficiaries_beneficiarydata"."scheme" ASC;

EXPLAIN ANALYSE SELECT "beneficiaries_beneficiary"."payer_slade_code", "beneficiaries_beneficiarydata"."scheme_code", "beneficiaries_beneficiarydata"."scheme", COUNT("beneficiaries_beneficiarydata"."beneficiary_id") AS "ben_count", COUNT(CASE WHEN CASE WHEN ("beneficiaries_beneficiarydata"."active" = 'LIVE' AND (data->>'valid_from')::timestamp with time zone <= (STATEMENT_TIMESTAMP()) AND (data->>'valid_to')::timestamp with time zone >= (STATEMENT_TIMESTAMP())) THEN True ELSE False END = True THEN 1 ELSE NULL END) AS "active_count", CASE WHEN COUNT(CASE WHEN CASE WHEN ("beneficiaries_beneficiarydata"."active" = 'LIVE' AND (data->>'valid_from')::timestamp with time zone <= (STATEMENT_TIMESTAMP()) AND (data->>'valid_to')::timestamp with time zone >= (STATEMENT_TIMESTAMP())) THEN True ELSE False END = True THEN 1 ELSE NULL END) > 0 THEN True ELSE False END AS "is_group_active" FROM "beneficiaries_beneficiarydata" INNER JOIN "beneficiaries_beneficiary" ON ("beneficiaries_beneficiarydata"."beneficiary_id" = "beneficiaries_beneficiary"."id") WHERE "beneficiaries_beneficiarydata"."id" IN (SELECT DISTINCT ON (U0."beneficiary_id") U0."id" FROM "beneficiaries_beneficiarydata" U0 INNER JOIN "beneficiaries_beneficiary" U1 ON (U0."beneficiary_id" = U1."id") LEFT OUTER JOIN "beneficiaries_beneficiary" U2 ON (U0."principal_id" = U2."id") ORDER BY U0."beneficiary_id" ASC, U0."timestamp" DESC) GROUP BY "beneficiaries_beneficiary"."payer_slade_code", "beneficiaries_beneficiarydata"."scheme_code", "beneficiaries_beneficiarydata"."scheme" ORDER BY "beneficiaries_beneficiary"."payer_slade_code" ASC, "beneficiaries_beneficiarydata"."scheme_code" ASC, "beneficiaries_beneficiarydata"."scheme" ASC;