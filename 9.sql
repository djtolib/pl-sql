select (select type||' '||address from terminals where id = terminal_id) as terminal,cnt from (
        select terminal_id, count(*) cnt 
        from transactions group by 
        terminal_id order by cnt desc)
where rownum <= 10