use project;

-- Calculate the average marks of Math, Reading, and Writing. 
-- Identify which subject has the highest average score.
select avg(math_score), avg(reading_score),  
avg(writing_score)
from student;

-- Based on m_per, how many students are in each Math performance category (Fail, Poor, Average, Good, Excellent)?
select m_per, count(*) as 'count'
from student 
GROUP BY m_per
order by count desc;


-- For each gender, count the number of students in each Math performance category.
SELECT gender, m_per, 
count(*) as 'count'
FROM student
GROUP BY gender, m_per
order by count DESC;


-- Based on lunch, count the students in each r_per category.
SELECT  lunch, r_per, 
count(*) as 'count'
FROM student
GROUP BY lunch, r_per
order by count DESC;

-- Compare the average math_score, reading_score, and writing_score of male and female students.
SELECT gender, 
avg(math_score),
avg(reading_score),
avg(writing_score)
from student
group by gender;

-- Calculate the average scores of Math, Reading, and Writing for each ethnicity group. Identify the highest-average group in each subject.
select ethnicity, 
avg(math_score),
avg(reading_score),
avg(writing_score)
from student
group by ethnicity
order by avg(math_score) desc,
avg(reading_score) desc, avg(writing_score) desc;


-- Calculate the average scores of all three subjects based on parental_level_of_education. Check which parental education category has the highest average in which subject.
select parental_level_of_education, 
avg(math_score),
avg(reading_score),
avg(writing_score) 
from student
GROUP BY parental_level_of_education
order by avg(math_score) desc, 
avg(reading_score) desc, avg(writing_score) desc limit 1;


-- Compare the average Math, Reading, and Writing scores of Standard and free/reduced lunch groups.
SELECT lunch,
avg(math_score),
avg(reading_score),
avg(writing_score)  
from student
group by lunch;


-- Compare the average scores of students who completed the course and those who did not. Also calculate the difference in average score for each subject.
select test_preparation_course,
avg(math_score),
avg(reading_score),
avg(writing_score)
from student
GROUP BY test_preparation_course;


SELECT
  AVG(CASE WHEN test_preparation_course = 'completed' THEN math_score END) -
  AVG(CASE WHEN test_preparation_course = 'none' THEN math_score END) AS math_diff,

  AVG(CASE WHEN test_preparation_course = 'completed' THEN reading_score END) -
  AVG(CASE WHEN test_preparation_course = 'none' THEN reading_score END) AS reading_diff,

  AVG(CASE WHEN test_preparation_course = 'completed' THEN writing_score END) -
  AVG(CASE WHEN test_preparation_course = 'none' THEN writing_score END) AS writing_diff
FROM student;


-- What percent of female students are in the Good or Excellent category in m_per?
SELECT 
	gender,
	round(sum(case when m_per in ('Good', 'Excellent') then 1 else 0 end) / count(*) * 100, 2) as math_pct,
	round(sum(case when r_per in ('Good', 'Excellent') then 1 else 0 end) / count(*) * 100, 2) as red_pct,
	round(sum(case when w_per in ('Good', 'Excellent') then 1 else 0 end) / count(*) * 100, 2) as writ_pct
from student
group by gender;


-- Count the students whose Math performance is better than Reading, both subjects are in the same category, or Reading performance is better than Math.
select
	sum(case when math_rank > reading_rank then 1 else 0 end) as maths_better,
    sum(case when reading_rank = math_rank then 1 else 0 end) as both_same,
    sum(case when reading_rank > math_rank then 1 else 0 end) as reading_better
from(
SELECT
    CASE m_per
      WHEN 'Fail' THEN 1 WHEN 'Poor' THEN 2 WHEN 'Average' THEN 3
      WHEN 'Good' THEN 4 WHEN 'Excellent' THEN 5
    END AS math_rank,
	CASE r_per
      WHEN 'Fail' THEN 1 WHEN 'Poor' THEN 2 WHEN 'Average' THEN 3
      WHEN 'Good' THEN 4 WHEN 'Excellent' THEN 5
    END AS reading_rank
from student
) as t;


-- Compare Math and Writing like Q12. Find how many students are stronger in Math and how many in Writing.
select
	sum(case when math_rank > writing_rank then 1 else 0 end) as maths_better,
    sum(case when writing_rank = math_rank then 1 else 0 end) as both_same,
    sum(case when writing_rank > math_rank then 1 else 0 end) as reading_better
from(
SELECT
    CASE m_per
      WHEN 'Fail' THEN 1 WHEN 'Poor' THEN 2 WHEN 'Average' THEN 3
      WHEN 'Good' THEN 4 WHEN 'Excellent' THEN 5
    END AS math_rank,
	CASE w_per
      WHEN 'Fail' THEN 1 WHEN 'Poor' THEN 2 WHEN 'Average' THEN 3
      WHEN 'Good' THEN 4 WHEN 'Excellent' THEN 5
    END AS writing_rank
from student
) as t;


-- Count the students who are in the Fail or Poor category in all three subjects — Math, Reading, and Writing.
select
	math_weak,
    read_weak,
    write_weak,
	math_weak + read_weak + write_weak as all_weak_student
from (
select 
	sum(case when m_per in ('Fail', 'Poor') then 1 else 0 end) as math_weak,
    sum(case when r_per in ('Fail', 'Poor') then 1 else 0 end) as read_weak,
    sum(case when w_per in ('Fail', 'Poor') then 1 else 0 end) as write_weak
from student
) t;
    