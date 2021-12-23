/*
3) Gerar uma consulta que tragam todos os produtos que tiveram uma queda de preço, 
independente de parceiro ou campanha, ordenado de forma decrescente pela 
diferença entre os preços.
*/

SELECT *,
       ( preco_por - prico_de ) 'DIFERENÇA'
FROM   tb_produto
WHERE  preco_por < prico_de
ORDER  BY ( prico_de - preco_por ) DESC 