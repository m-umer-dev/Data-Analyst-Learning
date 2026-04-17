SELECT COUNT(*) as total_titles
FROM netflix;

SELECT
	type,
    count(*) as total_count
FROM netflix
group by type
order by total_count DESC;

SELECT DISTINCT rating
from netflix
ORDER by rating;


SELECT
    country,
    COUNT(*) AS title_count
FROM netflix
WHERE country IS NOT NULL
GROUP BY country
ORDER BY title_count DESC
LIMIT 10;