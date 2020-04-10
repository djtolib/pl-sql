select 
    t.tran_name,
    res.tran_type, 
    res.cnt, 
    (
       select 
            sum(trn.ammount_tran_curr) 
       from 
            transactions trn
       where trn.tran_type = t.id
    )*0.01*t.fee as summa 
from 
    (
        select tran_type, 
            count(tran_type) as cnt 
        from 
            transactions, tran_types 
        where 
            tran_type = tran_types.id 
        group by tran_type
    ) res, 
    tran_types t
where 
    t.id = res.tran_type;