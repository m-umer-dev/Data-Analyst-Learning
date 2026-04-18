-- QUERY 1: Overall Content Distribution
SELECT
    type AS content_type,
    COUNT(*) AS total_titles,
    ROUND(COUNT(*) * 100.0 /
    (SELECT COUNT(*) FROM netflix), 2)
    AS percentage
FROM netflix
GROUP BY type
ORDER BY total_titles DESC;

-- QUERY 2: Top 10 Content Producing Countries
SELECT
    country,
    COUNT(*) AS total_titles,
    ROUND(COUNT(*) * 100.0 /
    (SELECT COUNT(*) FROM netflix), 2)
    AS market_share_percent
FROM netflix
WHERE country IS NOT NULL
GROUP BY country
ORDER BY total_titles DESC
LIMIT 10;

-- QUERY 3: Netflix Content Growth Since 2015
SELECT
    release_year,
    COUNT(*) AS new_titles,
    SUM(COUNT(*)) OVER (ORDER BY release_year)
    AS cumulative_titles
FROM netflix
WHERE release_year >= 2015
GROUP BY release_year
ORDER BY release_year;

-- QUERY 4: Content Rating Distribution
SELECT
    rating,
    COUNT(*) AS title_count,
    ROUND(COUNT(*) * 100.0 /
    (SELECT COUNT(*) FROM netflix
     WHERE rating IS NOT NULL), 2)
    AS percentage
FROM netflix
WHERE rating IS NOT NULL
GROUP BY rating
ORDER BY title_count DESC;

-- QUERY 5: Most Prolific Netflix Directors
SELECT
    director,
    COUNT(*) AS total_titles,
    SUM(CASE WHEN type = 'Movie'
        THEN 1 ELSE 0 END) AS movies,
    SUM(CASE WHEN type = 'TV Show'
        THEN 1 ELSE 0 END) AS tv_shows
FROM netflix
WHERE director IS NOT NULL
GROUP BY director
HAVING COUNT(*) >= 3
ORDER BY total_titles DESC
LIMIT 10;

-- QUERY 6: Data Completeness Report
SELECT
    'Director' AS field,
    COUNT(*) - COUNT(director) AS missing_values,
    ROUND((COUNT(*) - COUNT(director)) * 100.0 /
    COUNT(*), 2) AS missing_percent
FROM netflix
UNION ALL
SELECT
    'Country',
    COUNT(*) - COUNT(country),
    ROUND((COUNT(*) - COUNT(country)) * 100.0 /
    COUNT(*), 2)
FROM netflix
UNION ALL
SELECT
    'Rating',
    COUNT(*) - COUNT(rating),
    ROUND((COUNT(*) - COUNT(rating)) * 100.0 /
    COUNT(*), 2)
FROM netflix;

-- QUERY 7: Movies vs TV Shows by Top Countries
SELECT
    country,
    SUM(CASE WHEN type = 'Movie'
        THEN 1 ELSE 0 END) AS movies,
    SUM(CASE WHEN type = 'TV Show'
        THEN 1 ELSE 0 END) AS tv_shows,
    COUNT(*) AS total
FROM netflix
WHERE country IN (
    SELECT country
    FROM netflix
    WHERE country IS NOT NULL
    GROUP BY country
    ORDER BY COUNT(*) DESC
    LIMIT 5
)
GROUP BY country
ORDER BY total DESC;

-- QUERY 8: Content Added in Last 3 Years
SELECT
    type,
    rating,
    COUNT(*) AS count
FROM netflix
WHERE release_year >= 2020
AND rating IS NOT NULL
GROUP BY type, rating
ORDER BY type, count DESC;

-- QUERY 9: TV Show Season Distribution
SELECT
    duration,
    COUNT(*) AS show_count
FROM netflix
WHERE type = 'TV Show'
AND duration IS NOT NULL
GROUP BY duration
ORDER BY show_count DESC
LIMIT 10;

-- QUERY 10: Most Popular Genres
SELECT
    listed_in AS genre,
    COUNT(*) AS title_count,
    SUM(CASE WHEN type = 'Movie'
        THEN 1 ELSE 0 END) AS movies,
    SUM(CASE WHEN type = 'TV Show'
        THEN 1 ELSE 0 END) AS tv_shows
FROM netflix
WHERE listed_in IS NOT NULL
GROUP BY listed_in
ORDER BY title_count DESC
LIMIT 15;