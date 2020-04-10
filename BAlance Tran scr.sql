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
            3,
            8,
            0.15,
            (select 0.15/iso.sale from cards c, iso_curr iso where c.currency = iso.id and c.id = i.id),
            (select balance - (select 0.15/iso.sale from cards c, iso_curr iso where c.currency = iso.id and c.id = i.id) 
            from cards where id = i.id),
            sysdate - i.id,
            mod(i.id,8)+1
        );
        update cards set balance = balance - (select 0.15/iso.sale from cards c, iso_curr iso where c.currency = iso.id and c.id = i.id)
        where id =i.id;        
    end loop;
end;