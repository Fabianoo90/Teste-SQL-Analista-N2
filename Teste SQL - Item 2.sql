/*
2) Após termos todas as lojas vinculadas, precisamos de uma consulta que nos retorne 
todos os produtos disponíveis para as campanhas dos segmentos de construção, 
beleza e variedades, e que seu preço em pontos fique entre 100 pontos e 10000 
pontos.
Obs: o Preço em pontos é calculado pelo preço em reais na tabela de produtos 
multiplicado pelo fator conversão da tabela de campanha.
*/


SELECT DISTINCT prod.*,
                ( preco_por * fator_conversao ) AS 'Preço em pontos'
FROM   tb_produto prod
       INNER JOIN tb_parceiro par
               ON prod.id_parceiro = par.id_parceiro
       INNER JOIN tb_loja loj
               ON loj.id_parceiro = par.id_parceiro
       INNER JOIN tb_campanha c
               ON c.id_campanha = loj.id_campanha
WHERE  segmento_cliente IN ( 'CONSTRUÇÃO', 'BELEZA', 'VARIEDADES' )
       AND ( preco_por * fator_conversao ) BETWEEN 100 AND 10000 
