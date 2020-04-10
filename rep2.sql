select * from 
    (
        select 
            first_name, name,
            (select pay_sys||' '||card_type from card_types where id = c.type_id) as card_type,
            balance 
        from 
            holders h, cards c, card_holder ch 
        where 
            h.id = ch.holder_id and ch.card_id = c.id and balance is not null
        order by balance desc
    )
where rownum<=10;