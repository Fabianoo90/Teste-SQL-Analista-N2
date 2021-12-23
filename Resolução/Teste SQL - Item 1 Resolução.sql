/*
A empresa trabalha com campanhas de fidelidade, conectamos campanhas de incentivo com 
parceiro, onde temos os clientes que arrecadam pontos nas campanhas e com esses pontos 
fazem resgate de produtos nas lojas.
Usando como refer�ncia as tabelas no arquivo Excel encaminhado junto, encontre o melhor 
caminho atrav�s de scripts SQL para realizar as tarefas sugeridas.
1) Perdemos todos os registros da nossa tabela de loja (TB_LOJA), precisamos realizar 
uma nova carga de informa��es, seguindo as regras de neg�cio a seguir:
A � S� devemos vincular campanhas que estejam ativas.
B � Clientes n�o podem ter vinculado parceiros que sejam do mesmo segmento que 
ele, por�m concorrentes (Ex. Cliente Samsung n�o pode vincular parceiro Panasonic, 
ambos s�o do segmento de eletr�nicos por�m concorrentes).
C � Campanhas do segmento de constru��o, n�o podem vincular parceiros dos 
segmentos de Alimentos e nem Bebidas.
D � Todas as lojas devem ser vinculadas como ativas e vis�veis, exceto as lojas do 
segmento de Bebidas, que devem ser vinculadas ativas e n�o vis�veis.
E � Na tabela de loja o campo ID_LOJA � um sequencial auto incremental.
F � Os campos ID_PARCEIRO e ID_CAMPANHA s�o chaves estrangeiras.
G � O nome da loja por padr�o leva sempre o nome do parceiro.
H � O campo vis�vel � booleano.
I � O status da loja segue o mesmo padr�o de status das outras tabelas.
*/

--Solu��o

INSERT INTO tb_loja
SELECT p.id_parceiro,
       id_campanha,
       nome_parceiro AS 'Nome Loja',
       CASE
         WHEN segmento = 'Bebidas' THEN 0
         ELSE 1
       END           AS visivel,
       'Ativo'       AS status_loja
FROM   tb_campanha c
       CROSS JOIN tb_parceiro p
WHERE  status = 'ativo'
       AND ( c.segmento_cliente <> p.segmento
              OR ( c.segmento_cliente = p.segmento
                   AND nome_campanha LIKE '%' + nome_parceiro + '%' ) )
       AND ( c.segmento_cliente <> 'constru��o'
              OR ( c.segmento_cliente = 'constru��o'
                   AND p.segmento NOT IN ( 'alimentos', 'bebidas' ) ) ) 

--Exercicio 1 passo a passo no arquivo: Teste SQL - Item 1 Completo.sql

