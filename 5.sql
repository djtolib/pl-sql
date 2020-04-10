select * from(     
    select t.id, t.address, 
        case  
            when not exists(select * from transactions where terminal_id = t.id) 
            then '??? ?????????? ? ??????? ?????????' 
            when  exists(select * from transactions where terminal_id = t.id) and
                  not  exists(select * from transactions where terminal_id = t.id and tran_date > sysdate - interval '2' month)
                  then '???? ????????? ?????????? ' || (select max(tran_date) from transactions where terminal_id = t.id) 
            else 
               'Active'
        end case  
    from terminals t)
    where case <>'Active' order by case;
