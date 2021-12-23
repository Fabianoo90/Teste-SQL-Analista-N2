/*
5) Conforme item anterior, descrever o retorno esperado dessa consulta
*/

SELECT C.ID_TRANSACAO
 FROM TB_LOTE_CREDITO A WITH(NOLOCK)
 INNER JOIN TB_LOTE_CREDITO_ITEM B WITH(NOLOCK) ON
A.ID_LOTE_CREDITO = B.ID_LOTE_CREDITO
 INNER JOIN TB_LOTE_CREDITO_TRANSACAO C WITH(NOLOCK) ON
B.ID_LOTE_CREDITO_ITEM = C.ID_LOTE_CREDITO_ITEM
 WHERE B.TIPO_TRANSACAO = 'DEBITO'
 AND A.LOTE_CREDITO_STATUS = 'PROCESSADO'
 AND A.PONTOS > 0 
 AND CONVERT(DATE,A.FIM_PROCESSAMENTO,103) BETWEEN GETDATE() - 2 AND
GETDATE() - 1

Serão retornados os IDs das transações de tipo débito, que estejam com o status do lote como processado
com pontos acima de 0 e que o processamento tenha ocorrido entre um ou dois dias atras.