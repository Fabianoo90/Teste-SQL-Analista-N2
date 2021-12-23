
/* CREATE TABLE */
CREATE TABLE TB_PARCEIRO(
ID_PARCEIRO INT NOT NULL PRIMARY KEY,
NOME_PARCEIRO VARCHAR(100),
STATUS_PARCEIRO VARCHAR(100),
SEGMENTO VARCHAR(100)
);

/* INSERT QUERY NO: 1 */
INSERT INTO TB_PARCEIRO(ID_PARCEIRO, NOME_PARCEIRO, STATUS_PARCEIRO, SEGMENTO)
VALUES
(
46, 'Polishop', 'ATIVO', 'VARIEDADES'
);

/* INSERT QUERY NO: 2 */
INSERT INTO TB_PARCEIRO(ID_PARCEIRO, NOME_PARCEIRO, STATUS_PARCEIRO, SEGMENTO)
VALUES
(
21271, 'Natura', 'ATIVO', 'BELEZA'
);

/* INSERT QUERY NO: 3 */
INSERT INTO TB_PARCEIRO(ID_PARCEIRO, NOME_PARCEIRO, STATUS_PARCEIRO, SEGMENTO)
VALUES
(
41431, 'Spezziale', 'ATIVO', 'VARIEDADES'
);

/* INSERT QUERY NO: 4 */
INSERT INTO TB_PARCEIRO(ID_PARCEIRO, NOME_PARCEIRO, STATUS_PARCEIRO, SEGMENTO)
VALUES
(
61783, 'Diageo', 'ATIVO', 'BEBIDAS'
);

/* INSERT QUERY NO: 5 */
INSERT INTO TB_PARCEIRO(ID_PARCEIRO, NOME_PARCEIRO, STATUS_PARCEIRO, SEGMENTO)
VALUES
(
61827, 'Loja JBL', 'ATIVO', 'ELETRONICOS'
);
