-- Data exploration

SELECT DISTINCT grade
FROM lc_loan
ORDER BY grade;


SELECT DISTINCT sub_grade
FROM lc_loan
ORDER BY sub_grade;


SELECT   
    sub_grade,   
    COUNT(sub_grade) AS count   
FROM   
    lc_loan   
GROUP BY   
    sub_grade   
ORDER BY   
    sub_grade;
    
 
-- number of clients in each grade:  
  SELECT   
    grade,   
    COUNT(grade) AS count   
FROM   
    lc_loan   
GROUP BY   
    grade   
ORDER BY   
    grade;   
    
-- 22607, out of the total 28907
    
-- Conclusion: There seems to be an error when importing the dataset, perhaps with limits in rows in MySQL
-- continue in python  
    
-- unsuccesful tries to see why there is a discrepancy:   
    SELECT   
    COUNT(*) AS null_count  
FROM   
    lc_loan  
WHERE   
    grade IS NULL;  
    
    
SELECT   
    COUNT(*) 
FROM   
    lc_loan; 
    
    SELECT DISTINCT grade   
FROM lc_loan   
ORDER BY grade;  


SELECT *   
FROM lc_loan   
WHERE grade IS NULL OR grade = '';  


SELECT DISTINCT grade   
FROM lc_loan   
WHERE grade IS NULL OR TRIM(grade) = '' OR grade NOT IN ('A', 'B', 'C', 'D', 'E', 'F', 'G');  


SELECT grade, LENGTH(grade) AS length_of_grade  
FROM lc_loan   
WHERE TRIM(grade) = '' OR grade IS NULL   
   OR LENGTH(grade) = 0;  