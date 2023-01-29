with
    source_fornecedores as (
        select
            cast (supplier_id as int) as id_fornecedor
            , cast (company_name as string) as nome_do_fornecedor
            , cast (phone as string) as telefone
            --, picture
        from {{ source ('erp', 'suppliers') }}
    )

select *
from source_fornecedores