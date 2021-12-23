/*
A empresa trabalha com campanhas de fidelidade, conectamos campanhas de incentivo com 
parceiro, onde temos os clientes que arrecadam pontos nas campanhas e com esses pontos 
fazem resgate de produtos nas lojas.
Usando como referência as tabelas no arquivo Excel encaminhado junto, encontre o melhor 
caminho através de scripts SQL para realizar as tarefas sugeridas.
1) Perdemos todos os registros da nossa tabela de loja (TB_LOJA), precisamos realizar 
uma nova carga de informações, seguindo as regras de negócio a seguir:
A – Só devemos vincular campanhas que estejam ativas.
B – Clientes não podem ter vinculado parceiros que sejam do mesmo segmento que 
ele, porém concorrentes (Ex. Cliente Samsung não pode vincular parceiro Panasonic, 
ambos são do segmento de eletrônicos porém concorrentes).
C – Campanhas do segmento de construção, não podem vincular parceiros dos 
segmentos de Alimentos e nem Bebidas.
D – Todas as lojas devem ser vinculadas como ativas e visíveis, exceto as lojas do 
segmento de Bebidas, que devem ser vinculadas ativas e não visíveis.
E – Na tabela de loja o campo ID_LOJA é um sequencial auto incremental.
F – Os campos ID_PARCEIRO e ID_CAMPANHA são chaves estrangeiras.
G – O nome da loja por padrão leva sempre o nome do parceiro.
H – O campo visível é booleano.
I – O status da loja segue o mesmo padrão de status das outras tabelas.
*/

--Solução

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
       AND ( c.segmento_cliente <> 'construção'
              OR ( c.segmento_cliente = 'construção'
                   AND p.segmento NOT IN ( 'alimentos', 'bebidas' ) ) ) 

--Exercicio 1 passo a passo no arquivo: Teste SQL - Item 1 Completo.sql

