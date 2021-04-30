SELECT authors.au_id AS 'AUTHOR ID', authors.au_lname AS 'LAST NAME', authors.au_fname AS 'FIRST NAME', COUNT(titles.title_id) AS 'TITLE COUNT', publishers.pub_name AS 'PUBLISHER'
FROM authors
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN titles
ON titles.title_id = titleauthor.title_id
INNER JOIN publishers
ON publishers.pub_id =  titles.pub_id
GROUP BY publishers.pub_name, authors.au_id;


SELECT authors.au_id AS 'AUTHOR ID', authors.au_lname AS 'LAST NAME', authors.au_fname AS 'FIRST NAME', SUM(sales.qty) AS TOTAL
FROM authors
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN titles
ON titles.title_id = titleauthor.title_id
INNER JOIN sales
ON sales.title_id =  titleauthor.title_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC
LIMIT 3;

SELECT authors.au_id AS 'AUTHOR ID', authors.au_lname AS 'LAST NAME', authors.au_fname AS 'FIRST NAME', COALESCE(SUM(sales.qty),0) AS TOTAL
FROM authors
LEFT JOIN titleauthor
ON authors.au_id = titleauthor.au_id
LEFT JOIN titles
ON titles.title_id = titleauthor.title_id
LEFT JOIN sales
ON sales.title_id =  titleauthor.title_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC;