-- para cruzar as tabelas de orders e orders details, visto que para cada NF podemos ter 1 ou mais produtos vendidos
-- 1 id_pedido = +1 id_produto

with
    pedido as (
        select
            id_pedido
            , id_funcionario
            , id_cliente
            , id_transportadora
            , data_do_pedido
            , frete
            , destinatario
            , endereco_destinatario
            , cep_destinatario
            , cidade_destinatario
            , regiao_destinatario
            , pais_destinatario
            , data_do_envio
            , data_requerida
        from {{ ref('stg_erp__ordens') }}
    )

    , pedido_item as (
        select
           id_pedido 
            , id_produto
            , desconto
            , preco_da_unidade
            , quantidade
        from {{ ref('stg_erp__ordem_detalhes') }}
    )

    , joined as (
        select
            pedido_item.id_pedido 
            , pedido_item.id_produto
            , pedido.id_funcionario
            , pedido.id_cliente
            , pedido.id_transportadora
            , pedido_item.desconto
            , pedido_item.preco_da_unidade
            , pedido_item.quantidade
            , pedido.data_do_pedido
            , pedido.frete
            , pedido.destinatario
            , pedido.endereco_destinatario
            , pedido.cep_destinatario
            , pedido.cidade_destinatario
            , pedido.regiao_destinatario
            , pedido.pais_destinatario
            , pedido.data_do_envio
            , pedido.data_requerida
        from pedido_item
        inner join pedido on
            pedido_item.id_pedido = pedido.id_pedido
    )

select *
from joined