(SELECT Users.Name as results
FROM Users JOIN MovieRating
ON Users.user_id = MovieRating.user_id
GROUP BY MovieRating.user_id
ORDER BY count(MovieRating.user_id) DESC, Users.Name ASC
LIMIT 1)
UNION ALL
(SELECT Movies.title as results
FROM Movies JOIN MovieRating
ON Movies.movie_id = MovieRating.movie_id
WHERE created_at BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY MovieRating.movie_id
ORDER BY avg(MovieRating.rating) DESC, Movies.title ASC
LIMIT 1)
