select to_char(t.tran_date,'dd.mm.yyyy hh24:mm:ss') as tran_date,(select tran_name from tran_types where id = t.tran_type) as tran,
(select address from terminals where id = t.terminal_id) as terminal, t.ammount_tran_curr,
(select code_name from iso_curr where id = t.tran_curr) as tran_curr, 
case t.tran_type
    when 3 then 0
    else (select t.ammount_tran_curr *0.01*fee from tran_types where id = t.tran_type)
    end case 
    from  transactions t  where  t.card_id=:cid and t.tran_date between to_date(:bdate,'yyyy-mm-dd')- interval '1' day  
            and to_date(:edate,'yyyy-mm-dd') + interval '1' day
;
select case 1 when 1 then 'd'  else 'a'   end case from dual;