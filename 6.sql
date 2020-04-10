select c.card_num as sender,r.receiver, 
   case t.tran_curr 
     when 1 then 'USD' when 2 then 'EUR' else 'TJS' end case,  t.ammount_tran_curr,t.tran_date,t.id as tran_no 
from receivers r, transactions t, cards c where t.id=r.tran_id and c.id = t.card_id and  
t.tran_date between to_date('01.01.2017','dd.mm.yyyy') and to_date('01.11.2017','dd.mm.yyyy') and
t.tran_type = 1;
