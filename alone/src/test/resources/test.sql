
--소개글 리스트 뽑기------------------------------------------------------


select introduce.board_no, member.nickname, image.image_name, introduce.region 
from member member, board board, image image, introduce introduce ,INTRODUCE_CATEGORY category
where introduce.category_no=1

and member.id=board.id and board.board_no=introduce.board_no and  board.board_no=image.board_no
and introduce.category_no = category.category_no;
--and introduce.category_no = category.category_no;

select introduce.board_no, member.nickname, image.image_name, introduce.region 
from member member, board board, image image, introduce introduce 
where introduce.category_no=1
and member.id=board.id and  board.board_no=image.board_no

select b.board_no, m.nickname, i.image_name, m.name
from member m, board b, image i
where m.id=b.id and b.board_no=i.board_no

--------------요거
select b.board_no, i.image_name
from  board b, image i
where b.board_no=i.board_no AND i.image_no =1;

select * from introduce; 
select * from board;
select * from member;

select count(*) from keyword where board_no=1;
select count(*) from keyword where board_no=2;

		select keyword.keyword_name
		from keyword keyword, introduce introduce
		where keyword.board_no=introduce.board_no and introduce.board_no=1
		
	select companymember.id,member.nickname,authorities.authority,companymember.approval
	from companymember companymember,member member,authorities authorities
	
	where  authorities.id=member.id and companymember.id=member.id
	and companymember.id='spring'
	
	
select board.board_no, board.content, board.id, introduce.region 
from  board board, introduce introduce 
where  board.board_no=introduce.board_no 
and introduce.category_no='1' and i.image_no=1;
	
select * from introduce where category_no=1;
select * from image;


select introduce.board_no, member.nickname, image.image_name, introduce.region 
from member member, board board, image image, introduce introduce 
where introduce.category_no=1 and
member.id=board.id and board.board_no=introduce.board_no 
and board.board_no=image.board_no and image.image_no=1;

--and image.image_no=1;
delete from image;
insert into image(image_no, image_name, image_original_name, board_no) 
values('1', sysdate, 'asdf', 1);
insert into image(image_no, image_name, image_original_name, board_no) 
values('1', sysdate, 'asdf', 2);
select * from image where board_no=1;


-----------------기업회원 마이페이지
	select companymember.id,member.nickname,authorities.authority,companymember.approval,companymember.write
	from companymember companymember,member member,authorities authorities
	where companymember.id=member.id and member.id=authorities.id
	and companymember.id='spring'
	

select *from COMPANYMEMBER;
update COMPANYMEMBER set approval=1 where id='oracle' --승인상태


update COMPANYMEMBER set write=1 where id='spring' --글쓴 상태

--글쓴후 테이블 확인
select * from board;
select * from REVIEW;
select * from introduce;
select * from INTRODUCE;
select * from meeting;
	
delete from introduce where board_no='28';
insert into introduce(board_no, company_name, region, location, business_hours,tel,category_no )
		values('28', '홍콩반점', '건대', '건대 사거리','24시간','01022222828','1')

		
		
select * from BOARDCOMMENT;

select image_seq.nextval from dual
------------image baord_no로 이미지 저장

	select image.image_name
	from image image, board board 
	where image.board_no=board.board_no and board.board_no=61
	;
	
--SELECT * FROM tablename WHERE who LIKE "me%";	

--해당 게시물 번호에 main으로 시작하는 이미지이름 만 출력
SELECT * FROM image WHERE image_name LIKE 'main%' and board_no='67';	

--해당 게시물 번호 main으로 시작하는 이미지 이름만 제외하고 출력
SELECT * FROM image WHERE NOT image_name LIKE 'main%'and board_no='67';


select image.image_name
from image
where image.board_no='67';
		
select image_no from image;
select IMAGE_SEQ.nextval from dual;


select image_name 
from image 
where image_no = (
	select min(image_no) 
	from image
	where board_no='67'
)

--키워드 
select * from keyword;

--키워드 이름에 해당하는 게시물 찾기 
select b.name, m.id, b.content, b.time_posted 
from board b, keyword k, member m
where k.keyword_name='#삼척' and
b.board_no=k.board_no and member.id=board.id;

--기업회원 아이디에 해당하는 게시물 정보가져오기 
select b.board_no
from BOARD b, INTRODUCE intro
where b.board_no=intro.board_no and b.id='companymem';


select * from introduce where board_no='133';
delete from introduce;


insert into KEYWORD(keyword_no,keyword_name,board_no) 
values(keyword_seq.nextval, '#부산','1');

select keyword_name
from keyword
where keyword.board_no='1';


update introduce set company_name='혜진',region='혜진',location='헤진',
business_hours='123',tel='010',category_no='1';

select * from image where board_no='157';
delete from image where image_name='157_1냠냠.jpg';

insert into mileage (mileage_no,deal_money,deal_content,id) values (mileage_seq.nextval,1000,'관리자 입금','java')

select sum(deal_money) as mileage  from mileage where id='java'
select mileage from GENERICMEMBER where id='java'

select gmember.id,sum(mileage.deal_money) as mileage from  G
ENERICMEMBER gmember,mileage mileage  
	where gmember.id='java' and gmember.id=mileage.id
	update genericmember set mileage='3000' where id='java'
	
	select nickName from member where id='spring'
	select * from mileage

