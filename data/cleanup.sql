DELETE FROM warrants
WHERE id IN (SELECT id
              FROM (SELECT id,
                             ROW_NUMBER() OVER (partition BY case_number, issued, reason ORDER BY id) AS rnum
                     FROM warrants) t
              WHERE t.rnum > 1);

DELETE FROM warrants_returned
WHERE id IN (SELECT id
              FROM (SELECT id,
                             ROW_NUMBER() OVER (partition BY case_number, defendant, returned ORDER BY id) AS rnum
                     FROM warrants_retuned) t
              WHERE t.rnum > 1);