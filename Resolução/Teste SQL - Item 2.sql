/*
2) Ap�s termos todas as lojas vinculadas, precisamos de uma consulta que nos retorne 
todos os produtos dispon�veis para as campanhas dos segmentos de constru��o, 
beleza e variedades, e que seu pre�o em pontos fique entre 100 pontos e 10000 
pontos.
Obs: o Pre�o em pontos � calculado pelo pre�o em reais na tabela de produtos 
multiplicado pelo fator convers�o da tabela de campanha.
*/


SELECT DISTINCT prod.*,
                ( preco_por * fator_conversao ) AS 'Pre�o em pontos'
FROM   tb_produto prod
       INNER JOIN tb_parceiro par
               ON prod.id_parceiro = par.id_parceiro
       INNER JOIN tb_loja loj
               ON loj.id_parceiro = par.id_parceiro
       INNER JOIN tb_campanha c
               ON c.id_campanha = loj.id_campanha
WHERE  segmento_cliente IN ( 'CONSTRU��O', 'BELEZA', 'VARIEDADES' )
       AND ( preco_por * fator_conversao ) BETWEEN 100 AND 10000 
