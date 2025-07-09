DESCRIBE books;

SELECT *
FROM books;

# Which books have the highest approximate sales?
WITH highest_sales AS (
SELECT Book, `Approximate sales in millions` AS sales
FROM books
)

SELECT *
FROM highest_sales
WHERE sales = (
    SELECT MAX(sales)
    FROM highest_sales
);


# What are the most common genres among best-selling books?
SELECT Genre, Count(*) AS book_count
FROM books
WHERE Genre IS NOT NULL
GROUP BY Genre
ORDER BY book_count DESC
LIMIT 3;

# Which authors have sold the most books collectively?
SELECT `Author(s)` AS author, COUNT(*) AS author_count
FROM books
GROUP BY author
ORDER BY author_count DESC
LIMIT 5;


# Which original languages contributed most to total book sales?
SELECT `Original language` AS language, COUNT(*) AS language_count
FROM books
GROUP BY language
ORDER BY language_count DESC
LIMIT 5;


# How has the number of best-selling books changed over the years?
SELECT `First published` AS publish_year, COUNT(*) AS book_count
FROM books
GROUP BY publish_year
ORDER BY publish_year;

# Which decades produced the most commercially successful books?
SELECT
  FLOOR(`First published` / 10) * 10 AS decade,
  SUM(`Approximate sales in millions`) AS total_sales_decade
FROM books
GROUP BY decade
ORDER BY total_sales_decade DESC
LIMIT 10;

# Do certain genres dominate in certain languages?
SELECT `Original language` AS original_language, Genre, COUNT(*) AS genre_count
FROM books
WHERE Genre IS NOT NULL
GROUP BY original_language, Genre
ORDER BY genre_count DESC
LIMIT 10;


# What is the average sales performance by genre?
SELECT Genre, FLOOR(AVG(`Approximate sales in millions`)) AS total_sales_genre
FROM books
WHERE Genre IS NOT NULL
GROUP BY Genre
ORDER BY total_sales_genre DESC;