----Basic SQL Concepts:

	---SELECT Statements
--The SELECT statement is the most fundamental SQL command used to query data from a database. 
--It specifies which columns you want to retrieve and from which table.

--#We can also select a specific number of columns based on our requirement
	--1. Selecting All Columns

		SELECT *
		FROM Orders

--#Let's try selecting a specific column
	--2. Selecting Specified Columns

		SELECT Product
		FROM Orders

 --As you can see from the output,we only have the one column here and now we don't see the others

-- Ok, let's add more columns to display. You do that by separating the columns with a comma(,)

		SELECT Product, Quantity_Ordered, Price_Each
		FROM Orders


--In cases where you want to specify the number of rows to return, the 'TOP' Clause is used
   --3. Using Top 

	 SELECT TOP 5 Product, Quantity_Ordered, Price_Each
	 FROM Orders

	 --This query retrieves the first 5 rows from the Orders table.

	 --Sometimes, you would like to give a temporary name a column or table, making the results easier to read, its quite easy to use an "ALIAS"
	--4. Using ALiases

		SELECT Product AS Item, Quantity_Ordered AS Quantity, Price_Each AS Price
		FROM Orders

	  --In the scenerio above, the query renmaes the columns in the result set to 'item', 'Quantity' and 'Price' respectively.
   
   --5 Selecting Distinct Items
	--The DISTINCT keyword in SQL is used to return only unique (distinct) values from a column. It removes duplicate values in the result set.

		SELECT DISTINCT Purchase_Address
		FROM Orders;
		---This query retrieves All Unique Purchase Addresses
		
		SELECT DISTINCT Product, Order_Date
		FROM Orders

	--This query retrieves all unique combinations of product names and order dates from the Orders table.


  --- Basic Filtering (THE 'WHERE' CLAUSE)
	 
  --#To filter the rows based on certain conditions, use the WHERE clause.  The where clause is used with comparisons operators to filter data based on specific conditions.
  
  --For example, to select orders where the product is 'USB-C Charging Cable'
	--5a.	Using a where clause with '=' (Equal to)

		SELECT Order_ID,Product, Quantity_Ordered, Price_Each
		FROM Orders
		WHERE Product = 'USB-C Charging Cable'

	--5b.	Using a where clause with Not equal to (<> or !=)

		SELECT *
		FROM Orders
		WHERE Product <> 'USB-C Charging Cable';
		   --The query above selected all orders where the product is not 'USB-C Charging Cable':

	--5c.   Using a where clause with Greater than (>)
		SELECT *
		FROM Orders
		WHERE Quantity_Ordered > 2
		--The query Selected all orders where the quantity ordered is greater than 2:

	--5d.  Using a where clause with less than (>)
		SELECT *
		FROM Orders
		WHERE Price_Each < 100
		--The query Selected all orders where the price each is less than 100:
	
	--5e.   Using a where clause with Greater than or equal to (>=)
		SELECT *
		FROM Orders
		WHERE Quantity_Ordered >= 5
		--The query Selected all orders where the quantity ordered is greater than or equal to 5

	--5f.  Using a where clause with less than or equal to (<=)
		SELECT *
		FROM Orders
		WHERE Price_Each <=50
		--The query Selected all orders where the price each is less than 100:

	----5f.  Using a where clause with between
	   SELECT *
		FROM Orders
		WHERE Order_Date BETWEEN '2019-08-28' AND '2019-11-09'
		--The query Selected all orders where the order_date is BETWEEN '2019-08-28' AND '2019-11-09'


 ---THE 'IN SYNTHAX

	--THere are scenerios to selct more than one products or items, the 'IN' function comes in quite hnady
	--The IN operator in SQL is used to filter data by checking if a value matches any value in a specified list.

		SELECT *
		FROM Orders
		WHERE Product IN ('Wired Headphones', 'USB-C Charging Cable')

		--This query retrieves all columns and rows from the Orders table where the product is either 'Wired Headphones' or 'USB-C Charging Cable'.


 --- USING THE 'AND' SYNTHX
 --The AND operator in SQL is used to combine multiple conditions from different columns in a WHERE clause. All conditions must be true for the rows to be included in the result set.
  
		SELECT *
		FROM Orders
		WHERE Product = 'USB-C Charging Cable' AND Quantity_Ordered > 2;
		  --The query above Selected all orders where the product is 'USB-C Charging Cable' and the quantity ordered is greater than 2:
  


--- USING THE 'LIKE' SYNTHAX
	--The LIKE operator in SQL is used to search for a specified pattern in a column. It's particularly useful for filtering text data based on partial matches.

	-- two special characters a % and a _


	-- % means anything

		SELECT *
		FROM Orders
		WHERE Product LIKE 'Wired%';

	 -- _ means a specific value
	 
	 --Examples
		 SELECT *
		FROM Orders
		WHERE Product LIKE '_a%'

		--This query retrieves all columns and rows from the Orders table where the product name has 'a' as the second character.

		SELECT *
		FROM Orders
		WHERE Product LIKE '__h___'
		
		--This query retrieves all columns and rows from the Orders table where the product name has exactly 5 characters and the third character is 'h'

		SELECT *
		FROM Orders
		WHERE Product LIKE 'Go_________e'

		-- This query retrieves all columns and rows from the Orders table where the product name starts with 'G', has 'o' as the second character, and has exactly 12 characters.

