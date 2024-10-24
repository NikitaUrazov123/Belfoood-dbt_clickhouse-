{{ config(
    materialized='incremental',
    tags=["subdim"]
) }}

with fact as 
(select * from {{ ref("fact_sales") }}),

dim_nomenclature as 
(select * from {{ ref("dim_nomenclature") }}),

dim_calendar as
(select* from {{ ref("dim_calendar") }}),

dim_purchase_returns as 
(select * from {{ ref("dim_purchase_returns") }}),

dim_orders as
(select * from {{ ref("dim_orders") }}),

dim_sale_docs as
(select * from {{ ref("dim_sale_docs") }}),

dim_shops as 
(select * from {{ ref("dim_shops") }}),

dim_client as 
(select * from {{ ref("dim_client") }}),

dim_nbrb_exrates as 
(select * from {{ ref("dim_nbrb_exrates") }}),

joined as
(
select * 
from fact
left join dim_nomenclature on dim_nomenclature."СсылкаГуид" = fact.`НоменклатураГуид`
left join dim_calendar on dim_calendar.date=toDate(fact."Период")
left join dim_sale_docs on dim_sale_docs."СсылкаГуид" = fact."ДокументПродажиГуид"
--left join dim_purchase_returns on 
left join dim_orders on dim_orders."СсылкаГуид" = dim_sale_docs."СделкаГуид"
left join dim_shops as sale_docs_shops on sale_docs_shops."СсылкаГуид" = dim_sale_docs."ТорговыйОбъектГуид"
left join dim_shops as order_docs_shops on order_docs_shops."СсылкаГуид" = dim_orders."ТорговыйОбъектГуид"
left join dim_client on dim_client."СсылкаГуид" = fact.`КонтрагентГуид`
left join dim_nbrb_exrates on dim_nbrb_exrates.date = toDate(fact."Период")
)

select * from joined