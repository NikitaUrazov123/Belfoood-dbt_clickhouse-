{{ config(
    materialized='view',
    tags=["dim"]
) }}

with
source as 
(
   select * from {{ ref("stg_Д_РеализТовУслугТовары") }} 
),

renamed as
(
    select 
    	--`Ссылка`,
	`НомерСтроки` as "Номер строки товара реализации",
	--`ЕдиницаИзмерения`,
	--`ЕдиницаИзмеренияМест`,
	`Качество` as "Качество товара реализации",
	`Количество` as "Количество товара реализации",
	`КоличествоМест` as "Количество мест товара реализации",
	`Коэффициент` as "Коэффициент товара реализации",
	`Номенклатура` as "Номенклатура товара реализации",
	--`ПереданныеПринятыеБУ`,
	--`ПереданныеПринятыеНУ`,
	--`ПереданныеСобственныеБУ`,
	--`ПереданныеСобственныеНУ`,
	--`ПринятыеСчетУчетаБУ`,
	--`ПринятыеСчетУчетаНУ`,
	`ПроцентАвтоматическихСкидок` as "Процент авто. скидки товара реализации",
	`ПроцентСкидкиНаценки` as "Процент скидки или наценки товара реализации",
	`СерияНоменклатуры` as "Серии номенклатуры товара реализации",
	`Склад` as "Склад товара реализации",
	`СпособСписанияОстаткаТоваров` as "Способ списания товара реализации",
	`СтавкаНДС` as "Ставка НДС товара реализации",
	--`СубконтоБУ`,
	--`СубконтоНУ`,
	`Сумма` as "Сумма товара реализации",
	`СуммаНДС` as "Сумма НДС товара реализации",
	--`СчетДоходовБУ`,
	--`СчетДоходовНУ`,
	--`СчетРасходовБУ`,
	--`СчетРасходовНУ`,
	--`СчетУчетаБУ`,
	--`СчетУчетаНУ`,
	--`УсловиеАвтоматическойСкидки`,
	--`ХарактеристикаНоменклатуры`,
	`Цена` as "Цена товара реализации",
	`ЗаказПокупателя` as "Заказ товара реализации",
	--`КлючСвязи`,
	--`КлючСтроки`,
	--`ПринадлежностьНоменклатуры`,
	`КороткиеСроки` as "Короткие сроки товара реализации",
	`Дата` as "Дата товара реализации",
	--`ПараметрДата`,
	`СсылкаГуид`,
	--`ЕдиницаИзмеренияГуид`,
	--`ЕдиницаИзмеренияМестГуид`,
	--`КачествоГуид`,
	`НоменклатураГуид`,
	--`ПереданныеПринятыеБУГуид`,
	--`ПереданныеПринятыеНУГуид`,
	--`ПринятыеСчетУчетаБУГуид`,
	--`ПринятыеСчетУчетаНУГуид`,
	`СерияНоменклатурыГуид`,
	`СкладГуид`,
	--`СубконтоБУГуид`,
	--`СубконтоНУГуид`,
	--`СчетДоходовБУГуид`,
	--`СчетДоходовНУГуид`,
	--`СчетРасходовБУГуид`,
	--`СчетРасходовНУГуид`,
	--`СчетУчетаБУГуид`,
	--`СчетУчетаНУГуид`,
	`ЗаказПокупателяГуид`,
	--`__Partition`
	concat(toString(`СсылкаГуид`), toString("Номер строки товара реализации")) as key_record
    from source
)
select * from renamed

