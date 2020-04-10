 select * from (
 select card_type ,to_char(count(*)) as cnt 
 from (select ct.pay_sys||' '||ct.card_type as card_type from card_types ct, cards c where c.type_id = ct.id) 
 group by card_type order by card_type)
 union
 
 select '?????:', ' ' from dual
 union 
 select 'Visa', to_char(count(*)) from cards c, card_types ct where c.type_id = ct.id and lower(ct.pay_sys)=lower('Visa') 
 