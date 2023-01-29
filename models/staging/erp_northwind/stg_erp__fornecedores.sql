
with
    source_fornecedores as (
        select
        cast (supplier_id as int) as id_fornecedor			
        , cast (company_name as	STRING) as nome_do_fornecedor		
        , cast (contact_name as	STRING) as contato_fornecedor
        , cast (contact_title as	STRING) as titulo_de_cortesia_fornecedor
        , cast (address as	STRING) as endereco_fornecedor
        , cast (city as	STRING) as cidade_fornecedor
        , cast (region as	STRING) as regiao_fornecedor	
        , cast (postal_code as	STRING) as cep_fornecedor	
        , cast (country as	STRING) as pais_fornecedor
        , cast (phone as	STRING) as telefone_fornecedor
        , cast (fax as	STRING) as fax_fornecedor
        -- homepage
        from {{ source ('erp', 'suppliers') }}
    )

select *
from source_fornecedores