SELECT
    substr(dt_criacao as data_criacao, 1, 10) as data_criacao,
    qtde_pontos + 10 as new_colyumn
FROM clientes;

select * From produtos;
