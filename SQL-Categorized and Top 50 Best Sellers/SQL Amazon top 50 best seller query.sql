Select * From [dbo].[Amazon$];


			-- Task 2 Categorize the 550 books to fiction and non-fiction. 
Select Count(Genre) as 'Fiction' -- Count how many books are labeled Fiction
	From [dbo].[Amazon$]
	Where Genre = 'Fiction';
	-- Selects all books that are categorised as Fiction
Select * From [dbo].[Amazon$]
	Where Genre = 'Fiction';

Select Count(Genre) as 'Non-Fiction' -- Count how many books are labeled Non-Fiction
	From [dbo].[Amazon$]
	Where Genre = 'Non Fiction' ;
	-- Selects all books that are categorised as Non Fiction
Select * From [dbo].[Amazon$]
	Where Genre = 'Non Fiction';


			-- Task 3 Query the top 50 best sellers and show the following:  
			-- a. Title of Book, b. Author, c. Year, d. Review 

Select	TOP 50-- Selects the columns to be shown
	Name AS 'Title of Book',	-- changing Name to 'title of book'
	Author,
	Year,
	Reviews
From Amazon$
ORDER BY Year, Reviews Desc;

			-- Task 4 Query the books which have a rating greater than 4 released last 2019

Select *	
From Amazon$
Where [User Rating] > 4 AND Year = '2019'
Order By [User Rating] Desc;

			-- Task 5  Query the books which have greater than 10k reviews last 2018
	
Select *	
From Amazon$
Where Reviews > 10000 AND Year = '2018'
Order By Reviews Desc;

			-- Task 6 Create 5 more queries based on your own analysis 
			
			-- Price
Select 
	Name AS 'Title of Book',
	Author,
	Price,
	Year,
	Genre
From Amazon$
Order By Year, Price Desc;

			
			-- Reviews below 4
Select *	
From Amazon$
Where [User Rating] < 4
Order By [User Rating] Desc;

			-- User rating and Review
Select Distinct
	Name AS 'Title of Book',
	Author,
	[User Rating],
	Reviews,
	Price
From Amazon$
Order By Reviews Desc, [User Rating] Desc;


			-- Books appearing in Top 50 multiple years
SELECT Name, Author, COUNT(DISTINCT Year) AS YearsInTop50 -- get Name and author and unique year value
FROM Amazon$
GROUP BY Name, Author
HAVING COUNT(DISTINCT Year) > 1
ORDER BY YearsInTop50 DESC, Name;
			
			-- Authors with the most appearances in the Top 50 across all years:

SELECT Author, COUNT(*) AS TotalAppearances -- counts the times an author appears
FROM Amazon$
GROUP BY Author
ORDER BY TotalAppearances DESC;

--Further analysis

Select 
	Name,
	Author,
	Year
From Amazon$
Where Author = 'Jeff Kinney'
Order by Year Asc;