-- CRIAR TABELA CLIENTES
CREATE TABLE tb_clientes(
id_cliente      INTEGER,
nome            VARCHAR2(10) NOT NULL,
sobrenome       VARCHAR2(10) NOT NULL,
dt_nascimento   DATE,
telefone        VARCHAR2(12),
fg_ativo        INTEGER,

CONSTRAINT pk_tb_clientes_id_cliente PRIMARY KEY(id_cliente)
);

-- CRIAR TABELA TIPO DE PRODUTOS
CREATE TABLE tb_tipos_produtos(
id_tipo_produto INTEGER,
nm_tipo_produto VARCHAR2(10) NOT NULL,
fg_ativo        INTEGER,

CONSTRAINT pk_tb_tipos_produtos_id_tipo_produto PRIMARY KEY(id_tipo_produto)
);

-- CRIAR TABELA PRODUTOS
CREATE TABLE tb_produtos(
id_produto      INTEGER,
id_tipo_produto INTEGER,
nm_produto      VARCHAR2(30) NOT NULL,
ds_produto      VARCHAR2(50),
preco           NUMBER(5,2),
fg_ativo        INTEGER,

CONSTRAINT pk_tb_produtos_id_produto PRIMARY KEY(id_produto),
CONSTRAINT fk_tb_produtos_id_tipo_produto FOREIGN KEY(id_tipo_produto)
REFERENCES tb_tipos_produtos(id_tipo_produto)
);

-- CRIAR TABELA COMPRAS
CREATE TABLE tb_compras(
id_produto  INTEGER,
id_cliente  INTEGER,
quantidade  INTEGER,
fg_ativo    INTEGER,

CONSTRAINT fk_tb_compras_id_produto FOREIGN KEY(id_produto)
REFERENCES tb_produtos(id_produto),
CONSTRAINT fk_tb_compras_id_cliente FOREIGN KEY(id_cliente)
REFERENCES tb_clientes(id_cliente),
CONSTRAINT pk_tb_compras_id_produto_id_cliente PRIMARY KEY(id_produto, id_cliente)
);

-- CRIAR TABELA FUNCIONARIOS
CREATE TABLE tb_funcionarios(
id_funcionario  INTEGER,
id_gerente      INTEGER,
nome            VARCHAR2(20) NOT NULL,
sobrenome       VARCHAR2(20) NOT NULL,
cargo           VARCHAR2(20),
salario         NUMBER(8,2),
fg_ativo        INTEGER,

CONSTRAINT pk_tb_funcionarios_id_funcionario PRIMARY KEY(id_funcionario),
CONSTRAINT fk_tb_funcionarios_id_gerente FOREIGN KEY(id_gerente)
    REFERENCES tb_funcionarios(id_funcionario)
);

-- CRIAR TABELA SALARIOS
CREATE TABLE tb_grades_salarios(
id_salario      INTEGER,
base_salario    NUMERIC(8,2),
teto_salario    NUMERIC(8,2),
fg_ativo        INTEGER,

CONSTRAINT pk_tb_grades_salarios_id_salario PRIMARY KEY(id_salario)
);

-- ADICIONAR LINHAS NA TB_CLIENTES
-- INSERT INTO tb_clientes(id_cliente, nome, sobrenome, dt_nascimento, telefone, fg_ativo)

INSERT INTO tb_clientes(id_cliente, nome, sobrenome, dt_nascimento, telefone, fg_ativo)
VALUES (1, 'João', 'Marrom', '01/Jan/1965', '800-55-1211', 1);

INSERT INTO tb_clientes(id_cliente, nome, sobrenome, dt_nascimento, telefone, fg_ativo)
VALUES (2, 'Cintia', 'Verde', '05/Fev/1968', '800-55-1212', 1);

INSERT INTO tb_clientes(id_cliente, nome, sobrenome, dt_nascimento, telefone, fg_ativo)
VALUES (3, 'Estevam', 'Branco', '19/Jun/1972', '800-55-1213', 1);

INSERT INTO tb_clientes(id_cliente, nome, sobrenome, dt_nascimento, telefone, fg_ativo)
VALUES (4, 'Gael', 'Preto', '', '800-55-1214', 1);

INSERT INTO tb_clientes(id_cliente, nome, sobrenome, dt_nascimento, telefone, fg_ativo)
VALUES (5, 'Dorinha', 'Azul', '20/Mai/1970', NULL, 1);

INSERT INTO tb_clientes(id_cliente, nome, sobrenome, dt_nascimento, telefone, fg_ativo)
VALUES (6, 'Frederico', 'Marrom', '01/Jan/1970', '800-55-1215', 1);

COMMIT;

-- ADICIONAR LINHA NA TABELA TB_TIPOS_PRODUTOS
-- INSERT INTO tb_tipos_produtos(id_tipo_produto, nm_tipo_produto, fg_ativo)

INSERT INTO tb_tipos_produtos (id_tipo_produto, nm_tipo_produto, fg_ativo)
VALUES (1, 'Book', 1);

INSERT INTO tb_tipos_produtos (id_tipo_produto, nm_tipo_produto, fg_ativo)
VALUES (2, 'Video', 1);

INSERT INTO tb_tipos_produtos (id_tipo_produto, nm_tipo_produto, fg_ativo)
VALUES (3, 'DVD', 1);

INSERT INTO tb_tipos_produtos (id_tipo_produto, nm_tipo_produto, fg_ativo)
VALUES (4, 'CD', 1);

INSERT INTO tb_tipos_produtos (id_tipo_produto, nm_tipo_produto, fg_ativo)
VALUES (5, 'Magazine', 1);

COMMIT;

-- ADICIONAR LINHAS NA TABELA TB_PRODUTO
-- INSERT INTO tb_produtos(id_produto, id_tipo_produto, nm_produto, ds_produto, preco, fg_ativo)

INSERT INTO tb_produtos(id_produto, id_tipo_produto, nm_produto, ds_produto, preco, fg_ativo)
VALUES (1, 1, 'Modern Science', 'A description of modern science', 19.95, 1);

INSERT INTO tb_produtos(id_produto, id_tipo_produto, nm_produto, ds_produto, preco, fg_ativo)
VALUES (2, 1, 'Chemistry', 'Introduction to Chemistry', 30, 1);

INSERT INTO tb_produtos(id_produto, id_tipo_produto, nm_produto, ds_produto, preco, fg_ativo)
VALUES (3, 2, 'Supernova', 'A star explodes', 25.99, 1);

INSERT INTO tb_produtos(id_produto, id_tipo_produto, nm_produto, ds_produto, preco, fg_ativo)
VALUES (4, 2, 'Tank War', 'Action movie about a future war', 13.95, 1);

COMMIT;

-- ADICIONAR LINHAS NA TABELA TB_COMPRAS
-- INSERT INTO tb_compras(id_produto, id_cliente, quantidade, fg_ativo)

INSERT INTO tb_compras(id_cliente, id_produto, quantidade, fg_ativo)
VALUES (1, 1, 1, 1);

INSERT INTO tb_compras(id_cliente, id_produto, quantidade, fg_ativo)
VALUES (2, 1, 3, 1);

INSERT INTO tb_compras(id_cliente, id_produto, quantidade, fg_ativo)
VALUES (1, 4, 1, 1);

INSERT INTO tb_compras(id_cliente, id_produto, quantidade, fg_ativo)
VALUES (2, 2, 1, 1);

INSERT INTO tb_compras(id_cliente, id_produto, quantidade, fg_ativo)
VALUES (1, 3, 1, 1);

COMMIT;

-- ADICIONAR LINHA NA TABELA TB_FUNCIONARIO
-- INSERT INTO tb_funcionarios(id_funcionario, id_gerente, nome, sobrenome, cargo, salario, fg_ativo)

INSERT INTO tb_funcionarios(id_funcionario, id_gerente, nome, sobrenome, cargo, salario, fg_ativo)
VALUES (1, NULL, 'James', 'Smith', 'CEO', 8000.00, 1);

INSERT INTO tb_funcionarios(id_funcionario, id_gerente, nome, sobrenome, cargo, salario, fg_ativo)
VALUES (2, 1, 'Ron', 'Johnson', 'Sales Manager', 6000.00, 1);

-- Data (20/08/2024)

INSERT INTO tb_grades_salarios(id_salario, base_salario, teto_salario, fg_ativo)
VALUES
(1, 1, 2500.00, 1);

INSERT INTO tb_grades_salarios(id_salario, base_salario, teto_salario, fg_ativo)
VALUES
(2, 2500.01, 5000.00, 1);

INSERT INTO tb_grades_salarios(id_salario, base_salario, teto_salario, fg_ativo)
VALUES
(3, 5000.01, 7500.00, 1);

INSERT INTO tb_grades_salarios(id_salario, base_salario, teto_salario, fg_ativo)
VALUES
(4, 7500.01, 9999.99, 1);

COMMIT;


SELECT *
FROM tb_grades_salarios;


UPDATE tb_clientes
  SET sobrenome = 'Orange'
WHERE id_cliente = 2;

SELECT *
FROM tb_clientes;

ROLLBACK;


DELETE
FROM tb_clientes
WHERE id_cliente = 2;
-- RA-02292: restrição de integridade (LOJA.FK_TB_COMPRAS_ID_CLIENTE) violada - registro filho localizado


CREATE OR REPLACE PROCEDURE get_cliente(p_id_cliente IN tb_clientes.id_cliente%TYPE)
AS
 v_nome         tb_clientes.nome%TYPE;
 v_sobrenome    tb_clientes.sobrenome%TYPE;
 v_controle     INTEGER;
BEGIN
 SELECT COUNT(1) INTO v_controle
 FROM tb_clientes
 WHERE id_cliente = p_id_cliente;
 
 	IF (v_controle = 1) THEN
   SELECT nome, sobrenome INTO v_nome, v_sobrenome
   FROM tb_clientes
   WHERE id_cliente = p_id_cliente;
   
   DBMS_OUTPUT.PUT_LINE('Cliente localizado: ' || v_nome || ' ' || v_sobrenome);
 ELSE
   DBMS_OUTPUT.PUT_LINE('Cliente NÃO localizado');   
 END IF;
 
EXCEPTION 
  WHEN others THEN
    DBMS_OUTPUT.PUT_LINE('Erro!!!'); 
END get_cliente;

-- Invocando o objeto "get_cliente" por meio da saída DBMS OUTPUT
-- Menu: Exibir > Saída Dbms
CALL get_cliente(1);

CALL get_cliente(90);

-- Invocando o objeto "get_cliente" por meio de um bloco anônimo
SET serveroutput ON
BEGIN
  get_cliente(3);
END;

SET serveroutput ON
BEGIN
  get_cliente(99);
END;

-- 27/08
 
SELECT *
FROM tb_clientes
WHERE nome LIKE '_o%';

SELECT *
FROM tb_clientes
WHERE nome LIKE '%a';

SELECT *
FROM tb_clientes
WHERE nome LIKE 'J%';

SELECT *
FROM tb_clientes
WHERE nome LIKE '____';


SELECT *
FROM tb_promocao
WHERE nome LIKE '%*%%' ESCAPE '*';

SELECT *
FROM tb_clientes
WHERE id_cliente NOT IN (2, 3, 5);

SELECT *
FROM tb_clientes
WHERE id_cliente NOT IN (2, 3, 5, NULL);

SELECT *
FROM tb_clientes
WHERE id_cliente NOT IN (2, 3, 5, NVL(NULL, 0));

SELECT *
FROM tb_clientes
WHERE id_cliente BETWEEN 1 AND 3;

SELECT *
FROM tb_clientes
WHERE id_cliente NOT BETWEEN 1 AND 3;


SELECT *
FROM tb_clientes
WHERE dt_nascimento > '01/JAN/1970' AND
      id_cliente > 3;

SELECT *
FROM tb_clientes
WHERE dt_nascimento > '01/JAN/1970' OR
      id_cliente > 3;


SELECT *
FROM tb_clientes
WHERE dt_nascimento > '01/JAN/1970' OR
      id_cliente < 2 AND
      telefone LIKE '%1211';



SELECT *
FROM tb_clientes
ORDER BY sobrenome;


SELECT *
FROM tb_clientes
ORDER BY nome ASC, sobrenome DESC;


SELECT id_cliente, nome, sobrenome
FROM tb_clientes
ORDER BY 1;

SELECT tb_produtos.nm_produto, tb_tipos_produtos.nm_tipo_produto
FROM tb_produtos, tb_tipos_produtos
WHERE tb_produtos.id_tipo_produto = tb_tipos_produtos.id_tipo_produto
AND tb_produtos.id_produto = 3;

SELECT p.id_produto, p.nm_produto, tp.nm_tipo_produto
FROM tb_produtos p, tb_tipos_produtos tp
WHERE p.id_tipo_produto = tp.id_tipo_produto ORDER BY p.nm_produto;
