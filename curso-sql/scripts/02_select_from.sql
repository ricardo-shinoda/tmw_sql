select * from transacoes;

select IdProduto, DescNomeProduto from produtos;

-- Ajustando os nomes da tabela PRODUTOS para o padrão minúsculo (snake_case)
alter table produtos rename column "De" to "id_produto";
ALTER TABLE produtos RENAME COLUMN "DescNomeProduto" TO desc_nome_produto;
ALTER TABLE produtos RENAME COLUMN "DescDescricaoProduto" TO desc_descricao_produto;
ALTER TABLE produtos RENAME COLUMN "DescCategoriaProduto" TO desc_categoria_produto;

-- Ajustando os nomes da tabela CLIENTES para o padrão minúsculo (snake_case)
ALTER TABLE clientes RENAME COLUMN "idCliente" TO id_cliente;
ALTER TABLE clientes RENAME COLUMN "flEmail" TO fl_email;
ALTER TABLE clientes RENAME COLUMN "flTwitch" TO fl_twitch;
ALTER TABLE clientes RENAME COLUMN "flYouTube" TO fl_youtube;
ALTER TABLE clientes RENAME COLUMN "flBlueSky" TO fl_bluesky;
ALTER TABLE clientes RENAME COLUMN "flInstagram" TO fl_instagram;
ALTER TABLE clientes RENAME COLUMN "qtdePontos" TO qtde_pontos;
ALTER TABLE clientes RENAME COLUMN "dtCriacao" TO dt_criacao;
ALTER TABLE clientes RENAME COLUMN "dtAtualizacao" TO dt_atualizacao;

-- Padronizando a tabela transacao_produto
ALTER TABLE transacao_produto RENAME COLUMN "idTransacaoProduto" TO id_transacao_produto;
ALTER TABLE transacao_produto RENAME COLUMN "IdTransacao" TO id_transacao;
ALTER TABLE transacao_produto RENAME COLUMN "IdProduto" TO id_produto;
ALTER TABLE transacao_produto RENAME COLUMN "QtdeProduto" TO qtde_produto;
ALTER TABLE transacao_produto RENAME COLUMN "vlProduto" TO vl_produto;

-- Padronizando a tabela transacoes
ALTER TABLE transacoes RENAME COLUMN "IdTransacao" TO id_transacao;
ALTER TABLE transacoes RENAME COLUMN "IdCliente" TO id_cliente;
ALTER TABLE transacoes RENAME COLUMN "DtCriacao" TO dt_criacao;
ALTER TABLE transacoes RENAME COLUMN "QtdePontos" TO qtde_pontos;
ALTER TABLE transacoes RENAME COLUMN "DescSistemaOrigem" TO desc_sistema_origem;