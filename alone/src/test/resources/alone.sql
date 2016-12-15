update member set enabled=1 where id='dlfqks'

SELECT image_name FROM image WHERE NOT image_name LIKE 'main%'and board_no=143

select * from image where board_no=143


select board_no, likes, nickname 
		from (
			select introduce.board_no, introduce.likes, member.nickname, RANK() OVER(order by introduce.likes desc) as rank 
			from introduce introduce, member member, board board 
			where board.id=member.id and introduce.board_no=board.board_no and board.board_enabled=1) 
		where rank between 1 and 8 order by likes desc
		
select * from introduce

select introduce.board_no, introduce.likes, member.nickname, RANK() OVER(order by introduce.likes desc) as rank 
			from introduce introduce, member member, board board 
			where board.id=member.id and introduce.board_no=board.board_no and board.board_enabled=1

select board_no, likes, nickname, RANK() OVER(order by likes desc) as rank

select * from board where id='rldjq' // 138 , 154
select * from introduce
select * from introduce i, board b where b.board_no=i.board_no and id='rldjq'
update board set board_enabled=0 where board_no=138
update board set board_enabled=1 where board_no=154
delete from board where board_no=138


select b.board_no
from BOARD b, INTRODUCE intro
where b.board_no=intro.board_no and b.board_enabled=1 and b.id='rldjq'

select b.board_no
from BOARD b, INTRODUCE intro
where b.board_no=intro.board_no and b.id='rldjq'

