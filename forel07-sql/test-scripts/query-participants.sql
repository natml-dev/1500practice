SELECT COUNT(*) FROM participants; 
-- counts all the rows regardless of the content of the columns

SELECT COUNT(qualified) FROM participants;
-- only counts the rows where 'qualified' column is not NULL (both true and false)

SELECT AVG(score) FROM participants;
-- ignores NULL values in its calculation

SELECT COALESCE(score, 0)
FROM participants;
-- replace all NULL values in the score column with 0. this can then be used to calculate an average for scores, where even those that have NULL are now included in the calculation. However, in some cases it is desirable to distinguish between 0 and NULL. For example, if you have tryed to do the weightlift and couldn't do any, it can be reprasented by 0, but if you haven't tried att all, then it logically to represent it by NULL.

SELECT AVG(age + score) 
FROM participants;
-- this calculates the average of (age+score), but if either age or score is NULL, the entire expression(age+score) = NULL;
-- AVG ignores NULL values, so only rows where both values exist are included. 
-- it may lead to an incorrect result because some of participants are excluded
-- to get the correct result we must use COALESCE(score, 0) and COALESCE(age, 0):

SELECT AVG(COALESCE(age, 0) + COALESCE(score, 0))
FROM participants;