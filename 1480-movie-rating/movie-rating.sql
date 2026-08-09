# Write your MySQL query statement below
WITH UserRatings AS (
    SELECT MovieRating.user_id, Users.name, COUNT(MovieRating.movie_id) AS number_of_movies_rated
    FROM MovieRating JOIN Users ON MovieRating.user_id=Users.user_id
    GROUP BY MovieRating.user_id
    ORDER BY COUNT(MovieRating.movie_id) DESC,
    Users.name ASC
    LIMIT 1
),

FebRatings AS (
    SELECT Movies.title, AVG(MovieRating.rating) AS avg_rating
    FROM Movies JOIN MovieRating ON Movies.movie_id=MovieRating.movie_id
    WHERE MONTH(created_at)=2 AND YEAR(created_at)=2020
    GROUP BY Movies.movie_id, Movies.title
    ORDER BY avg_rating DESC, Movies.title ASC
    LIMIT 1
)



SELECT name AS results FROM UserRatings
UNION ALL
SELECT title AS results FROM FebRatings;