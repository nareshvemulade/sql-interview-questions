-- Question: Write a query to find whose favorite subject is commerce and geography?'

-- +---------+-----------------+
-- |studentid|favourite_subject|
-- +---------+-----------------+
-- |      123|         commerce|
-- |      354|         commerce|
-- |      232|          science|
-- |      232|          history|
-- |      123|        geography|
-- |      564|          history|
-- +---------+-----------------+

--1st Approach
SELECT * FROM dbo.students WHERE studentid in (
    SELECT studentid FROM dbo.students 
    WHERE favourite_subject = 'commerce'
    )
    AND favourite_subject='geography';

--2nd Approach
SELECT A.studentid,SUM(A.CNT) FROM (
    SELECT *, CASE WHEN favourite_subject in ('commerce','geography') THEN 1 ELSE 0 END AS CNT FROM dbo.students
) as A
GROUP by A.studentid
Having SUM(A.CNT)>1;
