-- Data analysis for Lending Club. Raw data in file "lc_loan"


-- Verify that the id and member id are unique and not blank

SELECT SUM(count) AS total_non_distinct_count  
FROM (  
    SELECT id, COUNT(*) AS count  
    FROM lc_loan  
    GROUP BY id  
    HAVING COUNT(*) > 1  
) AS subquery;  


SELECT SUM(count) AS total_non_distinct_count  
FROM (  
    SELECT member_id, COUNT(*) AS count  
    FROM lc_loan  
    GROUP BY member_id  
    HAVING COUNT(*) > 1  
) AS subquery; 


SELECT *  
FROM lc_loan
WHERE member_id IS NULL OR member_id = ''; 


SELECT 
    *
FROM
    lc_loan
WHERE
    id IS NULL OR member_id = ''; 

-- Conclusion: id and member id are unique and not blank





-- investigate difference between loan_amnt y funded_amnt

SELECT COUNT(*)   
FROM lc_loan; -- 28907

SELECT COUNT(*) AS different_amounts_count  
FROM lc_loan 
WHERE loan_amnt <> funded_amnt; -- 1334 cases where the client didnt get what they asked for

-- Conclusion: Not in all cases the client get the amount asked







-- Is there errors greater than 1 dollar in the installment calculation?

SELECT   
    loan_amnt,  
    int_rate,  
    term,
    installment,
    ROUND (
    loan_amnt *   
    (int_rate / 100 / 12) *   
    POWER(1 + (int_rate / 100 / 12), term) /   
    (POWER(1 + (int_rate / 100 / 12), term) - 1),2 
    )
    AS monthly_installment  
FROM   
    lc_loan
LIMIT 10;


SELECT   
    COUNT(*) AS different_count  
FROM ( 
SELECT   
    l.loan_amnt,  
    l.int_rate,  
    l.term,  
    l.installment,  
    ROUND(  
        l.loan_amnt *   
        (l.int_rate / 100 / 12) *   
        POWER(1 + (l.int_rate / 100 / 12), l.term) /   
        (POWER(1 + (l.int_rate / 100 / 12), l.term) - 1), 2  
    ) AS monthly_installment,  
    CASE   
        WHEN ABS(  
            ROUND(  
                l.loan_amnt *   
                (l.int_rate / 100 / 12) *   
                POWER(1 + (l.int_rate / 100 / 12), l.term) /   
                (POWER(1 + (l.int_rate / 100 / 12), l.term) - 1), 2  
            ) - l.installment  
        ) <= 100 THEN 'Considered Equal'   
        ELSE 'Different'   
    END AS comparison_result  
FROM   
    lc_loan AS l
  ) AS comparison_results  
WHERE   
    comparison_results.comparison_result = 'Different';  -- 1341 greater than 1 dll, 963 greater than 100 dlls
    
    
    
  -- 963 cases where there is a difference in calculated and real installments of over 100 dlls?  
    
    SELECT   
    l.loan_amnt,  
    l.int_rate,  
    l.term,  
    l.installment,  
    ROUND(  
        l.loan_amnt *   
        (l.int_rate / 100 / 12) *   
        POWER(1 + (l.int_rate / 100 / 12), l.term) /   
        (POWER(1 + (l.int_rate / 100 / 12), l.term) - 1), 2  
    ) AS monthly_installment,  
    CASE   
        WHEN ABS(  
            ROUND(  
                l.loan_amnt *   
                (l.int_rate / 100 / 12) *   
                POWER(1 + (l.int_rate / 100 / 12), l.term) /   
                (POWER(1 + (l.int_rate / 100 / 12), l.term) - 1), 2  
            ) - l.installment  
        ) <= 100 THEN 'Considered Equal'   
        ELSE 'Different'   
    END AS comparison_result  
FROM   
    lc_loan AS l;
    
    	
    SELECT *
    FROM lc_loan
    WHERE loan_amnt = 17500 AND int_rate = 17.27; -- example of a diff. between loan and funded 
    
    -- conclusion: Use funded_amnt for future calculations
    
    
    
    
   -- using the right value:
   
    SELECT   
    COUNT(*) AS different_count  
FROM ( 
SELECT   
    l.funded_amnt,  
    l.int_rate,  
    l.term,  
    l.installment,  
    ROUND(  
        l.funded_amnt *   
        (l.int_rate / 100 / 12) *   
        POWER(1 + (l.int_rate / 100 / 12), l.term) /   
        (POWER(1 + (l.int_rate / 100 / 12), l.term) - 1), 2  
    ) AS monthly_installment,  
    CASE   
        WHEN ABS(  
            ROUND(  
                l.funded_amnt *   
                (l.int_rate / 100 / 12) *   
                POWER(1 + (l.int_rate / 100 / 12), l.term) /   
                (POWER(1 + (l.int_rate / 100 / 12), l.term) - 1), 2  
            ) - l.installment  
        ) <= 1 THEN 'Considered Equal'   
        ELSE 'Different'   
    END AS comparison_result  
FROM   
    lc_loan AS l
  ) AS comparison_results  
WHERE   
    comparison_results.comparison_result = 'Different';  -- for 100 is 1, for 10 is 7 for 1 is 9.
    
    
    -- Conclusion: No substantial errors in installment calculations
    
    
    
    -- Look for outliers
    
    SELECT   
    l.funded_amnt,  
    l.int_rate,  
    l.term,  
    l.installment,  
    ROUND(  
        l.funded_amnt *   
        (l.int_rate / 100 / 12) *   
        POWER(1 + (l.int_rate / 100 / 12), l.term) /   
        (POWER(1 + (l.int_rate / 100 / 12), l.term) - 1), 2  
    ) AS monthly_installment,  
    CASE   
        WHEN ABS(  
            ROUND(  
                l.funded_amnt *   
                (l.int_rate / 100 / 12) *   
                POWER(1 + (l.int_rate / 100 / 12), l.term) /   
                (POWER(1 + (l.int_rate / 100 / 12), l.term) - 1), 2  
            ) - l.installment  
        ) <= 100 THEN 'Considered Equal'   
        ELSE 'Different'   
    END AS comparison_result  
FROM   
    lc_loan AS l
ORDER BY comparison_result DESC;

SELECT *
FROM lc_loan
WHERE funded_amnt = 30000 and int_rate = 17.49;

-- Conclusion: loan status makes a difference. Charged off made the installment lower