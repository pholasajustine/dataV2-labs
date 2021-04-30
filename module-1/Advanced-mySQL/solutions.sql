USE publications;

CREATE TEMPORARY TABLE step1
SELECT titles.title_id, titleauthor.au_id, (titles.advance * titleauthor.royaltyper / 100) as advance,
(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) as sales_royalty
FROM titleauthor
INNER JOIN titles
ON titles.title_id = titleauthor.title_id
INNER JOIN sales
ON titles.title_id = sales.title_id;

SELECT * FROM step1;

CREATE TEMPORARY TABLE step2
SELECT step1.title_id, step1.au_id, SUM(step1.sales_royalty) as royalties, step1.advance
FROM step1
GROUP BY step1.title_id, step1.au_id;

SELECT step2.au_id, (SUM(step2.royalties) + SUM(step2.advance)) as profit
FROM step2
GROUP BY step2.au_id
ORDER BY profit DESC
LIMIT 3;