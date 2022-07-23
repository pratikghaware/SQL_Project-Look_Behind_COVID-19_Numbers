
# Looking Behind COVID-19 Numbers
Explore Covid 19 data and retrieve maximum information from it. Not just that using that data I am going to build a tableau interface. To showcase information in an interactive way. In this project, we have shown a relation between covid cases and deaths. And through data, we observed that as cases are increasing deaths are increasing. But as vaccination is started death count and cases started decreasing. 


## Primary Goal

Primary Goal with this project was as it is my first project how i can use my all bacis knowledge 
In any project which can challenge me and push my skills. Also as i got tha data find insides of it and tell some story through it. 


## Learnings - 
1. Use of joins                                                                                               
    ##### a. Ineer join
    b. outer join

2. joins Across Database
3. Inserts 
4. drop columns 
5. creating views 
6. select 
7. convort date format
8. group command 
9. order cammand 


## Detail Explination of commands - 

### Ineer join  - 
Inner Join clause in SQL Server creates a new table (not physical) by combining rows that have matching values in two or more tables. This join is based on a logical relationship (or a common field) between the tables and is used to retrieve data that appears in both tables.

Assume, we have two tables, Table A and Table B, that we would like to join using SQL Inner Join. The result of this join will be a new result set that returns matching rows in both these tables. The intersection part in black below shows the data retrieved using Inner Join in SQL Server.
The INNER JOIN keyword selects records that have matching values in both tables.

    SELECT column_name(s)   
    FROM table1   
    INNER JOIN table2   
    ON table1.column_name = table2.column_name;

##### Example - 

    From covid_project..CovidData dea    .................       //deaths
    Join covid_project..CovidVacc vac    ................ //vaccination   
        On dea.location = vac.location      
        and dea.date = vac.date


### Outer join  - 
The FULL OUTER JOIN (aka OUTER JOIN) is used to return all of the records that have values in either the left or right table.

For example, a full outer join of a table of customers and a table of orders might return all customers, including those without any orders, as well as all of the orders. Customers who have made orders would be united with their orders using their customer id number.

A full outer join can return a lot of data, so before you use it, consider whether a more conservative method might meet your needs.

The FULL OUTER JOIN keyword returns all records when there is a match in left (table1) or right (table2) table records.

Tip: FULL OUTER JOIN and FULL JOIN are the same.

        SELECT column_name(s)    
        FROM table1    
        FULL OUTER JOIN table2   
        ON table1.column_name = table2.column_name    
        WHERE condition;

## INSERT INTO
The SQL INSERT INTO Statement   
The INSERT INTO statement is used to insert new records in a table.

INSERT INTO Syntax  
It is possible to write the INSERT INTO statement in two ways:

1.    Specify both the column names and the values to be inserted:          

        
    INSERT INTO table_name (column1, column2, column3, ...)                                                                                                                                                                                                                                                                                                                 
    VALUES (value1, value2, value3, ...);

2. If you are adding values for all the columns of the table, 
you do not need to specify the column names in the SQL query. 
However, make sure the order of the values is in the same order
 as the columns in the table. Here, the INSERT INTO syntax would
  be as follows:

    INSERT INTO table_name   
    VALUES (value1, value2, value3, ...);


## DROP COLUMN

SQL allows a user to remove one or more columns from a given table in the database if they are no longer needed or become redundant. To do so, the user must have ALTER permission on the object

The DROP COLUMN command is used to delete a column in an existing table.

The following SQL deletes the "ContactName" column from the "Customers" table:

Example -   

        ALTER TABLE Customers  
        DROP COLUMN ContactName;

## CREATE VIEW
SQL CREATE VIEW Statement  
In SQL, a view is a virtual table based on the result-set of an SQL statement.

A view contains rows and columns, just like a real table. The fields in a view are fields from one or more real tables in the database.

You can add SQL statements and functions to a view and present the data as if the data were coming from one single table.

A view is created with the CREATE VIEW statement.     

    CREATE VIEW Syntax
    CREATE VIEW view_name AS
    SELECT column1, column2, ...
    FROM table_name
    WHERE condition;

SQL CREATE VIEW Examples  
The following SQL creates a view that shows all customers from Brazil:

        Example
        CREATE VIEW [Brazil Customers] AS
        SELECT CustomerName, ContactName
        FROM Customers
        WHERE Country = 'Brazil';


## SELECT

The SQL SELECT Statement  
The SELECT statement is used to select data from a database.  
The data returned is stored in a result table, called the result-set.   
SELECT Syntax   

            SELECT column1, column2, ...  
            FROM table_name;   

Here, column1, column2, ... are the field names of the table you want to select data from. If you want to select all the fields available in the table, use the following syntax:

    SELECT * FROM table_name;

## Group by
The SQL GROUP BY Statement   
The GROUP BY statement groups rows that have the same values 
into summary rows, like "find the number of customers in each 
country".   
The GROUP BY statement is often used with aggregate functions 
(COUNT(), MAX(), MIN(), SUM(), AVG()) to group the result-set 
by one or more columns.  

GROUP BY Syntax

    SELECT column_name(s)
    FROM table_name
    WHERE condition
    GROUP BY column_name(s)
    ORDER BY column_name(s);


## ORDER BY 
The SQL ORDER BY Keyword   
The ORDER BY keyword is used to sort the result-set in ascending
 or descending order.
The ORDER BY keyword sorts the records in ascending order by 
default. To sort the records in descending order, use the DESC
keyword.  
ORDER BY Syntax  

    SELECT column1, column2, ...   
    FROM table_name   
    ORDER BY column1, column2, ... ASC|DESC;

# Looking Behind COVID-19 Numbers
Explore Covid 19 data and retrieve maximum information from it. Not just that using that data I am going to build a tableau interface. To showcase information in an interactive way. In this project, we have shown a relation between covid cases and deaths. And through data, we observed that as cases are increasing deaths are increasing. But as vaccination is started death count and cases started decreasing. 


## Primary Goal

Primary Goal with this project was as it is my first project how i can use my all bacis knowledge 
In any project which can challenge me and push my skills. Also as i got tha data find insides of it and tell some story through it. 


## Learnings - 
1. Use of joins                                                                                               
    ##### a. Ineer join
    b. outer join

2. joins Across Database
3. Inserts 
4. drop columns 
5. creating views 
6. select 
7. convort date format
8. group command 
9. order cammand 


## Detail Explination of commands - 

### Ineer join  - 
Inner Join clause in SQL Server creates a new table (not physical) by combining rows that have matching values in two or more tables. This join is based on a logical relationship (or a common field) between the tables and is used to retrieve data that appears in both tables.

Assume, we have two tables, Table A and Table B, that we would like to join using SQL Inner Join. The result of this join will be a new result set that returns matching rows in both these tables. The intersection part in black below shows the data retrieved using Inner Join in SQL Server.
The INNER JOIN keyword selects records that have matching values in both tables.

    SELECT column_name(s)   
    FROM table1   
    INNER JOIN table2   
    ON table1.column_name = table2.column_name;

##### Example - 

    From covid_project..CovidData dea    .................       //deaths
    Join covid_project..CovidVacc vac    ................ //vaccination   
        On dea.location = vac.location      
        and dea.date = vac.date


### Outer join  - 
The FULL OUTER JOIN (aka OUTER JOIN) is used to return all of the records that have values in either the left or right table.

For example, a full outer join of a table of customers and a table of orders might return all customers, including those without any orders, as well as all of the orders. Customers who have made orders would be united with their orders using their customer id number.

A full outer join can return a lot of data, so before you use it, consider whether a more conservative method might meet your needs.

The FULL OUTER JOIN keyword returns all records when there is a match in left (table1) or right (table2) table records.

Tip: FULL OUTER JOIN and FULL JOIN are the same.

        SELECT column_name(s)    
        FROM table1    
        FULL OUTER JOIN table2   
        ON table1.column_name = table2.column_name    
        WHERE condition;

## INSERT INTO
The SQL INSERT INTO Statement   
The INSERT INTO statement is used to insert new records in a table.

INSERT INTO Syntax  
It is possible to write the INSERT INTO statement in two ways:

1.    Specify both the column names and the values to be inserted:          

        
    INSERT INTO table_name (column1, column2, column3, ...)                                                                                                                                                                                                                                                                                                                 
    VALUES (value1, value2, value3, ...);

2. If you are adding values for all the columns of the table, 
you do not need to specify the column names in the SQL query. 
However, make sure the order of the values is in the same order
 as the columns in the table. Here, the INSERT INTO syntax would
  be as follows:

    INSERT INTO table_name   
    VALUES (value1, value2, value3, ...);


## DROP COLUMN

SQL allows a user to remove one or more columns from a given table in the database if they are no longer needed or become redundant. To do so, the user must have ALTER permission on the object

The DROP COLUMN command is used to delete a column in an existing table.

The following SQL deletes the "ContactName" column from the "Customers" table:

Example -   

        ALTER TABLE Customers  
        DROP COLUMN ContactName;

## CREATE VIEW
SQL CREATE VIEW Statement  
In SQL, a view is a virtual table based on the result-set of an SQL statement.

A view contains rows and columns, just like a real table. The fields in a view are fields from one or more real tables in the database.

You can add SQL statements and functions to a view and present the data as if the data were coming from one single table.

A view is created with the CREATE VIEW statement.     

    CREATE VIEW Syntax
    CREATE VIEW view_name AS
    SELECT column1, column2, ...
    FROM table_name
    WHERE condition;

SQL CREATE VIEW Examples  
The following SQL creates a view that shows all customers from Brazil:

        Example
        CREATE VIEW [Brazil Customers] AS
        SELECT CustomerName, ContactName
        FROM Customers
        WHERE Country = 'Brazil';


## SELECT

The SQL SELECT Statement  
The SELECT statement is used to select data from a database.  
The data returned is stored in a result table, called the result-set.   
SELECT Syntax   

            SELECT column1, column2, ...  
            FROM table_name;   

Here, column1, column2, ... are the field names of the table you want to select data from. If you want to select all the fields available in the table, use the following syntax:

    SELECT * FROM table_name;

## Group by
The SQL GROUP BY Statement   
The GROUP BY statement groups rows that have the same values 
into summary rows, like "find the number of customers in each 
country".   
The GROUP BY statement is often used with aggregate functions 
(COUNT(), MAX(), MIN(), SUM(), AVG()) to group the result-set 
by one or more columns.  

GROUP BY Syntax

    SELECT column_name(s)
    FROM table_name
    WHERE condition
    GROUP BY column_name(s)
    ORDER BY column_name(s);


## ORDER BY 
The SQL ORDER BY Keyword   
The ORDER BY keyword is used to sort the result-set in ascending
 or descending order.
The ORDER BY keyword sorts the records in ascending order by 
default. To sort the records in descending order, use the DESC
keyword.  
ORDER BY Syntax  

    SELECT column1, column2, ...   
    FROM table_name   
    ORDER BY column1, column2, ... ASC|DESC;
