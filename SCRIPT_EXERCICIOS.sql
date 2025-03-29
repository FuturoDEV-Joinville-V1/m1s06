SELECT * FROM CURSOS;

SELECT * FROM PROFESSORES;

INSERT INTO PROFESSORES (nome, sobrenome, email, data_nascimento, nacionalidade) 
VALUES ('Israel', 'Vieira', 'israel@email.com', '1990-05-10', 'brasileiro');

INSERT INTO PROFESSORES (nome, sobrenome, email, data_nascimento, nacionalidade) 
VALUES ('Leonardo', 'Ribeiro', 'leonardo@email.com', '1993-09-15', 'brasileiro');

INSERT INTO PROFESSORES (nome, sobrenome, email, data_nascimento, nacionalidade, genero) 
VALUES ('Louise', 'Sousa', 'louise@email.com', '1995-10-21', 'brasileira', 'feminino');

INSERT INTO CURSOS (codigo, id_professor, ead, num_max_alunos) 
VALUES ('123', 1, true, 50);
INSERT INTO CURSOS (codigo, id_professor, ead, num_max_alunos) 
VALUES ('456', 2, false, 30);
INSERT INTO CURSOS (codigo, id_professor, ead, num_max_alunos) 
VALUES ('789', 3, false, 25);

ALTER TABLE PROFESSORES ADD genero character varying (16);

UPDATE PROFESSORES SET genero = 'masculino' WHERE id IN (1, 2);

SELECT Cursos.*, professores.*
FROM CURSOS, PROFESSORES
WHERE Cursos.id_professor = Professores.id;

SELECT C.codigo, c.num_max_alunos
FROM CURSOS C, PROFESSORES P
WHERE C.id_professor = P.id
AND p.genero = 'feminino';

INSERT INTO ESTUDANTES (nome, sobrenome, data_nascimento, nacionalidade, email, cod_matricula) 
VALUES ('Lucas', 'Ferreira', '1992-03-28', 'brasileiro', 'lucas@email.com', 34543);
INSERT INTO ESTUDANTES (nome, sobrenome, data_nascimento, nacionalidade, email, cod_matricula) 
VALUES ('Alex', 'Ritzmann', '1991-04-15', 'brasileiro', 'alex@email.com', 6867);
INSERT INTO ESTUDANTES (nome, sobrenome, data_nascimento, nacionalidade, email, cod_matricula) 
VALUES ('Rafael', 'Lanza', '1990-08-30', 'brasileiro', 'rafael@email.com', 23876);
INSERT INTO ESTUDANTES (nome, sobrenome, data_nascimento, nacionalidade, email, cod_matricula) 
VALUES ('Cibeli', 'Gulini', '1994-06-20', 'brasileira', 'cibeli@email.com', 2347896);

SELECT * FROM ESTUDANTES;

INSERT INTO MATRICULAS (id_curso, id_estudante) 
VALUES (1, 1);
INSERT INTO MATRICULAS (id_curso, id_estudante) 
VALUES (1, 2);
INSERT INTO MATRICULAS (id_curso, id_estudante) 
VALUES (2, 3);
INSERT INTO MATRICULAS (id_curso, id_estudante) 
VALUES (2, 4);

SELECT * FROM MATRICULAS;

SELECT E.*, m.*, c.*
FROM MATRICULAS M, ESTUDANTES E, CURSOS C
WHERE M.ID_ESTUDANTE = E.ID
AND M.ID_CURSO = C.ID
AND C.EAD = TRUE;

INSERT INTO ENDERECOS (cep, logradouro, numero, bairro, cidade, uf) 
VALUES ('123', 'asdas', '12341', 'adsa', 'asdas', 'SC');
INSERT INTO ENDERECOS (cep, logradouro, numero, bairro, cidade, uf) 
VALUES ('123', 'asdas', '12341', 'adsa', 'asdas', 'PR');
INSERT INTO ENDERECOS (cep, logradouro, numero, bairro, cidade, uf) 
VALUES ('123', 'asdas', '12341', 'adsa', 'asdas', 'RS');

SELECT * FROM ENDERECOS;

-- EX. 5, CONSULTA 1
UPDATE ESTUDANTES SET MEDIA_GERAL = 7.1 WHERE ID = 1;

-- EX. 5, CONSULTA 2
UPDATE CURSOS SET EAD = TRUE WHERE ID IN (
SELECT P.ID FROM PROFESSORES P, ENDERECOS E WHERE P.ID_ENDERECO = E.ID AND E.UF <> 'SC'
);

-- EX. 5, CONSULTA 3
DELETE FROM CURSOS WHERE ID = 5;
