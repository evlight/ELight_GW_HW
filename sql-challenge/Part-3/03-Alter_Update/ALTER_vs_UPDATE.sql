--ALTER vs Update 
--ALter is a DDL (Data Definition Language) statement used to update structureof
--a table meaning add/remove, field/index, etc. 
--UPDATE is a DML (Data Manipulation Language) statement sed to update data. 

--PART 2 
--use the following to rename the column 
ALTER TABLE "table_name"
RENAME COLUMN "department_id" TO "dept_id";
--use the following to add new column
ALTER TABLE table_name
ADD annual_salary VARCHAR;

