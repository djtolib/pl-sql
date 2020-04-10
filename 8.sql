select 
    h.first_name, h.name, h.last_name,h.phone,h.phone_pass,
    (select pay_sys||' '||card_type from card_types where id = c.type_id) as card_type, 
    substr(c.card_num,1,4)||'********'||substr(c.card_num,-4) as card_num,
    c.expire_date
from 
    holders h, card_holder ch, cards c
where 
    h.id = ch.holder_id and ch.card_id = c.id and c.expire_date <= sysdate; 