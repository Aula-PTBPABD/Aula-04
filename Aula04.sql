/*Selecionando todas os registros da tabela students e takes combinando com base no ID*/
 /*Os registros são mostrados mesmo que não haja correspondência*/
SELECT * FROM student
FULL JOIN takes ON student.id = takes.id;

/*Criando uma view com o nome civil_eng_students*/
/*Selecionando o ID e o nome da tabela student e usando um count na coluna "course_ID" da tabela takes e nomeando como Quantidade_de_cursos*/
/*Usando o join para combinar os campos de ID de student e takes e usando o where para limitar essa combinação aos alunos do dept de Civil Eng.*/
/*Usando o group by para agrupar o ID e o nome da tabela*/
CREATE VIEW civil_eng_students AS
SELECT 
student.ID, 
student.name,
count(takes.course_ID) AS Quantidade_de_cursos
FROM 
student
JOIN 
takes ON student.ID = takes.ID
WHERE
student.dept_name = 'Civil Eng.'
GROUP BY
student.ID,
student.name

/*Mostrando a view criada ordenando a coluna Quantidade_de_cursos em ordem decrescente*/
SELECT * FROM civil_eng_students
ORDER BY Quantidade_de_cursos DESC;