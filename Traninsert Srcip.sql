begin
for i in (select id from cards)
    loop
    insert into transactions
        (
            CARD_ID,
            TRAN_TYPE,
            TRAN_CURR,
            AMMOUNT_TRAN_CURR,
            AMMOUNT_BAL_CURR,
            BALANCE_AFTER,
            TRAN_DATE,
            TERMINAL_ID
        )
        values
        (
            i.id,
            mod(i.id,2)+4,
            8,
            mod(i.id,3)*7+5,
            (select mod(i.id,7)*3/iso.sale from cards c, iso_curr iso where c.currency = iso.id and c.id = i.id),
            (select balance - (select mod(i.id,7)*3/iso.sale from cards c, iso_curr iso where c.currency = iso.id and c.id = i.id) 
            from cards where id = i.id),
            sysdate - i.id,
            mod(i.id,8)+1
        );
        update cards set balance = balance - (select mod(i.id,7)*3/iso.sale from cards c, iso_curr iso where c.currency = iso.id and c.id = i.id)
        where id =i.id;        
    end loop;
end;