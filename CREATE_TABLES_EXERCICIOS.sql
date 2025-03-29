-- Table: public.enderecos

CREATE TABLE IF NOT EXISTS public.enderecos
(
    id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    cep character varying(9) COLLATE pg_catalog."default" NOT NULL,
    logradouro character varying(64) COLLATE pg_catalog."default" NOT NULL,
    numero character varying(16) COLLATE pg_catalog."default" NOT NULL,
    complemento character varying(64) COLLATE pg_catalog."default",
    bairro character varying(64) COLLATE pg_catalog."default" NOT NULL,
    cidade character varying(64) COLLATE pg_catalog."default" NOT NULL,
    uf character varying(2) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT enderecos_pkey PRIMARY KEY (id)
)

	-- Table: public.professores

CREATE TABLE IF NOT EXISTS public.professores
(
    id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    nome character varying(64) COLLATE pg_catalog."default" NOT NULL,
    sobrenome character varying(64) COLLATE pg_catalog."default" NOT NULL,
    telefone character varying(11) COLLATE pg_catalog."default",
    email character varying(64) COLLATE pg_catalog."default" NOT NULL,
    data_nascimento date NOT NULL,
    nacionalidade character varying(32) COLLATE pg_catalog."default" NOT NULL,
    genero character varying(16) COLLATE pg_catalog."default",
    id_endereco bigint,
    CONSTRAINT professores_pkey PRIMARY KEY (id),
    CONSTRAINT fk_prof_end FOREIGN KEY (id_endereco)
        REFERENCES public.enderecos (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

-- Table: public.cursos

CREATE TABLE IF NOT EXISTS public.cursos
(
    id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    codigo character varying(16) COLLATE pg_catalog."default" NOT NULL,
    ead boolean NOT NULL DEFAULT false,
    id_professor bigint NOT NULL,
    num_max_alunos integer NOT NULL DEFAULT 0,
    CONSTRAINT cursos_pkey PRIMARY KEY (id),
    CONSTRAINT fk_curso_prof FOREIGN KEY (id_professor)
        REFERENCES public.professores (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

-- Table: public.estudantes

CREATE TABLE IF NOT EXISTS public.estudantes
(
    id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    nome character varying(64) COLLATE pg_catalog."default" NOT NULL,
    sobrenome character varying(64) COLLATE pg_catalog."default" NOT NULL,
    data_nascimento date NOT NULL,
    nacionalidade character varying(32) COLLATE pg_catalog."default" NOT NULL,
    cod_matricula integer NOT NULL,
    email character varying(64) COLLATE pg_catalog."default" NOT NULL,
    media_geral numeric(4,2) NOT NULL DEFAULT 0,
    CONSTRAINT pk_estudantes PRIMARY KEY (id)
)

-- Table: public.matriculas

CREATE TABLE IF NOT EXISTS public.matriculas
(
    id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    id_estudante bigint NOT NULL,
    id_curso bigint NOT NULL,
    media numeric(4,2) NOT NULL DEFAULT 0,
    CONSTRAINT matriculas_pkey PRIMARY KEY (id),
    CONSTRAINT fk_matricula_curso FOREIGN KEY (id_curso)
        REFERENCES public.cursos (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT fk_matricula_estudante FOREIGN KEY (id_estudante)
        REFERENCES public.estudantes (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)