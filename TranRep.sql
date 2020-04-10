select 
    h.emboss_fst, h.emboss_snd, c.card_num, tt.tran_name, t.ammount_tran_curr,iso.code_name, to_char(t.tran_date,'dd.mm.yyy HH:mm:ss') as "TIME"
from 
    holders h, cards c, card_holder ch, transactions t, tran_types tt, iso_curr iso
where 
    h.id = ch.holder_id and ch.card_id = c.id and c.id = t.card_id and t.tran_type = tt.id and 
    t.tran_curr = iso.id and t.tran_date >= to_date('05/01/2017','mm/dd/yyyy') and t.tran_date <=to_date('11/24/2017','mm/dd/yyyy')
order by t.tran_date desc
;

select * from transactions where id > 263;
select * from transactions where tran_type = 4;
commit;