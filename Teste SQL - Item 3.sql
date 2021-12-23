/*
3) Gerar uma consulta que tragam todos os produtos que tiveram uma queda de pre�o, 
independente de parceiro ou campanha, ordenado de forma decrescente pela 
diferen�a entre os pre�os.
*/

SELECT *,
       ( preco_por - prico_de ) 'DIFEREN�A'
FROM   tb_produto
WHERE  preco_por < prico_de
ORDER  BY ( prico_de - preco_por ) DESC 