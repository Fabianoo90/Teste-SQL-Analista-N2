/*
4) Sem ter as tabelas, apenas analisando a query abaixo, me descreva o que é esperado 
do retorno dessa consulta:
*/

SELECT COUNT(DISTINCT A.ID_PRODUTO),
A.ID_PARCEIRO
 FROM TB_PRODUTO A WITH(NOLOCK)
INNER JOIN TB_PARCEIRO B WITH(NOLOCK) ON A.ID_PARCEIRO =
B.ID_PARCEIRO
 LEFT JOIN TB_CATEGORIA_PRODUTO C WITH(NOLOCK) ON A.ID_PRODUTO =
C.ID_PRODUTO
WHERE A.STATUS_PRODUTO = 'ATIVO'
 AND A.PRECO_DE <> 0
 AND C.ID_CATEGORIA_PRODUTO is null
GROUP BY A.ID_PRODUTO

Será retornado o número de produtos distintos por parceiro, onde os produtos estejam ativos,
 o campo "preço de" seja diferente de zero e que não tenham categorias.


