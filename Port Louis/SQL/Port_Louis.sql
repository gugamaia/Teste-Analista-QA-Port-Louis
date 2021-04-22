--==========================================================================
-- Add column template
--
-- This template creates a table, then it adds a new column to the table.
--==========================================================================
USE <database, sysname, AdventureWorks>
GO

--Criar a tabela.
CREATE TABLE WORKERS
	(WORKER_ID INT PRIMARY KEY NOT NULL,
	FIRST_NAME VARCHAR(15),
	LAST_NAME VARCHAR(15),
	SALARY INT,
	JOINING_DATE DATE,
	DEPARTAMENT VARCHAR(15)
	)
	GO

--Inserir as informações dos funcionários

INSERT INTO WORKERS (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
(001, 'Monika', 'Arora', 100000, '2014-02-20 09:00:00', 'HR'), 
(002, 'Niharika', 'Verma', 80000, '2014-06-11 09:00:00', 'Admin'), 
(003, 'Vishal', 'Singhal', 300000, '2014-02-20 09:00:00', 'HR'), 
(004, 'Amitabh', 'Singh', 500000, '2014-02-20 09:00:00', 'Admin'), 
(005, 'Vivek', 'Bhati', 500000, '2014-06-11 09:00:00', 'Admin'), 
(006, 'Vipul', 'Diwan', 200000, '2014-06-11 09:00:00', 'Account'), 
(007, 'Satish', 'Kumar', 75000, '2014-10-20 09:00:00', 'Account'), 
(008, 'Geetika', 'Chauhan', 90000, '2014-04-11 09:00:00', 'Admin');
GO

--1) Para consultar quais funcionários possuem salários entre 100000 e 500000, realizamos um SELECT para todas, * , as colunas da tabela, WORKERS, solicitando o retorno das linhas que estiverem dentro da condição, WHERE, do salário entre, SALARY BETWEEN, os valores de 100000 a 500000.

SELECT * FROM WORKERS
WHERE SALARY BETWEEN 100000 AND 500000
GO

--2) Baseada em sua data de contratação, JOINING_DATE, compreendida entre duas datas, incluindo as mesmas, por isso utilizamos os sinais de >= e <= . Também poderíamos buscar uma solução de consulta utilizando o BETWEEN, como a consulta anterior.

SELECT * FROM WORKERS
WHERE JOINING_DATE >= '2014-02-01'
	AND JOINING_DATE <= '2014-02-28'
GO

--3) Aqui, criamos uma tabela temporária, utilizando o JOIN para obter as informações dos funcionários que possuam salários iguais.

SELECT W1.* FROM WORKERS W1
JOIN WORKERS W2 ON W1.WORKER_ID <> W2.WORKER_ID
AND W1.SALARY = W2.SALARY
GO

--4) Criamos um SELECT dos funcionários com os maiores salários, MAX(W.SALARY), por departamento, criando tabelas temporárias, W1/W2/W, é possível utilizar o JOIN para agrupar as informações finais. Em um dos departamentos, possuímos 2 linhas sendo apresentada, pois, ambos recebem o mesmo salário, conforme observado na QUERY anterior.

SELECT * FROM WORKERS W1
JOIN (SELECT MAX(W.SALARY) AS SALARY, W.DEPARTMENT
FROM WORKERS W
GROUP BY W.DEPARTMENT) W2
ON W1.SALARY = W2.SALARY
AND W1.DEPARTMENT = W2.DEPARTMENT
GO
