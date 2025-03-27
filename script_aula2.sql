-- exemplos de ALTER TABLE

ALTER TABLE public.clientes
ADD COLUMN nome_da_mae character varying(128) NOT NULL DEFAULT 'A PREENCHER';

ALTER TABLE public.clientes ALTER COLUMN nome_da_mae DROP DEFAULT;

ALTER TABLE public.contas_corrente ADD ativa boolean NOT NULL DEFAULT true;

ALTER TABLE public.clientes ADD CONSTRAINT unique_cpf UNIQUE (cpf);

-- EXEMPLOS DE INSERT

INSERT INTO public.enderecos (cep, logradouro, numero, complemento, bairro, cidade, uf) 
VALUES ('123', 'rua fulano de tal', '130', 'apto 102', 'centro', 'joinville', 'sc');

INSERT INTO public.enderecos (cep, logradouro, numero, bairro, cidade, uf) 
VALUES ('003450000', 'rua xyz', '530', 'centro', 'joinville', 'sc');

SELECT * FROM public.enderecos;

INSERT INTO public.clientes (nome, sobrenome, cpf, data_nascimento, nome_da_mae, id_endereco) 
VALUES ('Wellington', 'Souza', '123', '1990-03-26', 'Mãe do Wellington', 2);

INSERT INTO public.clientes (nome, sobrenome, cpf, data_nascimento, nome_da_mae, id_endereco) 
VALUES ('Leonardo', 'Ribeiro', '456', '26/03/1990', 'Mãe do José', 2);

INSERT INTO public.clientes (nome, sobrenome, cpf, data_nascimento, nome_da_mae, id_endereco) 
VALUES ('José', 'López', '457', '05/03/1990', 'Mãe do Allan', 2);

INSERT INTO public.clientes (nome, sobrenome, cpf, data_nascimento, nome_da_mae, id_endereco) 
VALUES ('Allan', 'Fuck', '458', '05-03-1990', 'Mãe do Allan', 2);

INSERT INTO public.clientes (nome, sobrenome, cpf, data_nascimento, nome_da_mae, id_endereco) 
VALUES ('Allan', 'Silva', '459', '05-06-1990', 'Mãe do Allan', 2);

SELECT * FROM public.clientes ORDER BY nome DESC, sobrenome DESC;

SELECT nome, sobrenome, cpf 
FROM public.clientes 
WHERE id_endereco = 2
AND data_nascimento < '26/03/1995'
AND (nome LIKE '%L%' OR nome LIKE '%l%')
ORDER BY nome ASC;

SELECT nome, sobrenome, cpf 
FROM public.clientes 
WHERE id_endereco = 2
AND data_nascimento < '26/03/1995'
AND nome LIKE '%n'
ORDER BY nome ASC;

SELECT * 
FROM public.clientes 
WHERE nome = 'José Manuel' 
AND sobrenome = 'López';

SELECT * 
FROM public.clientes 
WHERE sobrenome IN ('Silva', 'Souza');

SELECT *
FROM public.clientes
WHERE data_nascimento BETWEEN '01/01/1990' AND '31/12/1999';

SELECT * 
FROM public.clientes 
WHERE sobrenome = 'Silva'
OR sobrenome = 'Souza';

UPDATE public.clientes SET cpf = '457' WHERE id = 6;

UPDATE public.clientes 
SET nome = 'José Manuel', sobrenome = 'López' 
WHERE id = 6;

DELETE FROM public.clientes WHERE id = 10;
DELETE FROM public.enderecos WHERE id = 1;

SELECT * FROM public.clientes WHERE data_nascimento < '01/01/1900';
DELETE FROM public.clientes WHERE data_nascimento < '01/01/1900';



