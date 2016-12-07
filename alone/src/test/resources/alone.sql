	select boardcomment.content,member.nickname as "memberVO.nickName",member.id,
	to_char(boardcomment.time_posted,'yyyy.mm.dd') as timePosted 
	from BOARDCOMMENT boardcomment,member member 
	where boardcomment.id=member.id and boardcomment.board_no=23
	ORDER BY boardcomment.comment_no ASC
	
select * from member where id='del'
select * from image
update member set enabled=1 where id='del'
	select companymember.id,member.nickname,authorities.authority,companymember.approval
	from companymember companymember,member member,authorities authorities
	where companymember.id=member.id and member.id=authorities.id
	and companymember.id='company'	
	
	select * from member m, companymember c where m.id=c.id
	id, name, nickname, tel, address, corporate_registration_number, approval, write

	select row_number() over(order by board.board_no) as rnum,board.board_no,member.nickname,
to_char(board.time_posted,'YYYY.MM.DD') as time_posted,review.title,review.hits,review.likes 
from board board,review review,member member 
where board.board_no=review.board_no and board.id=member.id and member.nickname='정신머리'
	
select * from image
drop table genericmember;
-- 일반 회원 정보
CREATE TABLE GENERICMEMBER(
	id varchar2(50) primary key,
	birth varchar2(50) not null,
	gender varchar2(10) not null,
	mileage number default 0,
	constraint fk_genericmember foreign key(id) references member(id)
)

drop table companymember;
-- 기업 회원 정보
CREATE TABLE COMPANYMEMBER( 
	id varchar2(50) primary key,
	address varchar2(50) not null,
	corporate_registration_number varchar2(50) not null,
	approval number default 0, -- 가입승인 여부 : 가입 승인 시 1로 변경
	constraint fk_companymember foreign key(id) references member(id)
)

drop table authorities;
-- 회원 권한
CREATE TABLE AUTHORITIES(
	id varchar2(50) not null,
	authority varchar2(30) not null, -- 권한
	constraint fk_authorities foreign key(id) references member(id),
	constraint fk_member_authorities primary key(id, authority)
)

drop sequence board_seq;
drop table board;
-- 공통 게시판 정보
CREATE SEQUENCE BOARD_SEQ;
CREATE TABLE BOARD(
	board_no number primary key,
	id varchar2(50) not null,
	content clob not null,
	time_posted date not null,
	board_enabled number default 1, -- 게시글 삭제 여부 : 삭제시 0
	constraint fk_board foreign key(id) references member(id)
)
select row_number() over(order by board.board_no) as rnum board.board_no,member.nickname,to_char(board.time_posted,'YYYY.MM.DD') as time_posted,review.title,review.hits,review.likes from board board,review review,member member where board.id=member.id and board.board_no=review.board_no;
drop sequence introduce_category_seq;
drop table introduce_category;
-- 소개글 카테고리
CREATE SEQUENCE INTRODUCE_CATEGORY_SEQ;
CREATE TABLE INTRODUCE_CATEGORY(
	category_no number primary key,
	category_name varchar2(50) not null
)

drop table introduce;
-- 소개글 정보
CREATE TABLE INTRODUCE(
	board_no number primary key,
	company_name varchar2(50) not null,
	region varchar2(50) not null,
	location varchar2(100) not null,
	business_hours varchar2(50) not null,
	tel varchar2(50) not null,
	category_no number not null,
	constraint fk_introduce foreign key(board_no) references board(board_no),
	constraint fk_introduce_category foreign key(category_no) references introduce_category(category_no)
)

drop sequence keyword_seq;
drop table keyword;
-- 소개글 키워드 정보
CREATE SEQUENCE KEYWORD_SEQ;
CREATE TABLE KEYWORD(
	keyword_no number primary key,
	keyword_name varchar2(50) not null,
	board_no number not null,
	constraint fk_keyword_board foreign key(board_no) references introduce(board_no)
)

drop table meeting;
-- 모임글 정보
CREATE TABLE MEETING(
	board_no number primary key,
	title varchar2(100) not null,
	region varchar2(100) not null,
	location varchar2(100) not null,
	interest varchar2(50) not null,
	hits number default 0,
	constraint fk_meeting foreign key(board_no) references board(board_no)
)

select meeting.board_no as boardNo,meeting.title,meeting.region,meeting.interest,meeting.hits,board.time_posted as timePosted,member.nickname as nickName from board board,meeting meeting,member member where board.board_no = meeting.board_no and board.id = member.id;
select meeting.board_no,meeting.region,meeting.title,meeting.interest,meeting.hits,board.time_posted,member.nickname from board board,meeting meeting,member member where board.board_no = meeting.board_no and board.id = member.id;
select meeting.board_no as boardNo,meeting.title,meeting.region,meeting.interest,meeting.hits,board.time_posted as timePosted,
member.nickname as nickName from board board,meeting meeting,member member 
where board.board_no = meeting.board_no and board.id = member.id;

select meeting.board_no,meeting.region,meeting.title,meeting.interest,meeting.hits,
board.time_posted,member.nickname from board board,meeting meeting,member member 
where board.board_no = meeting.board_no and board.id = member.id;

select * from board
select * from meeting;


drop table review;

-- 후기글 정보
CREATE TABLE REVIEW(
	board_no number primary key,
	title varchar2(100) not null,
	hits number default 0,
	likes number default 0,
	constraint fk_review foreign key(board_no) references board(board_no)
)


drop table image;

-- 이미지 정보
CREATE TABLE IMAGE(
	image_no number primary key,
	image_name varchar2(100) not null,
	image_original_name varchar2(100) not null,
	board_no number not null,
	constraint fk_image foreign key(board_no) references board(board_no)
)

drop sequence mileage_seq;
drop table mileage;
-- 마일리지 정보
CREATE SEQUENCE MILEAGE_SEQ;
CREATE TABLE MILEAGE(
	mileage_no number primary key,
	deal_money number not null,
	deal_content varchar2(100) not null,
	id varchar2(50) not null,
	constraint fk_mileage foreign key(id) references genericmember(id)
)

drop table likescheck;
-- 좋아요 상태
CREATE TABLE LIKESCHECK(
	board_no number not null,
	id varchar2(50) not null,
	likes_statement number default 0, -- 좋아요 상태 : 좋아요 누른 상태 1
	constraint fk_likes_board foreign key(board_no) references review(board_no),
	constraint fk_likes_id foreign key(id) references member(id),
	constraint pk_likescheck primary key(board_no, id)
)

drop sequence comment_seq;
drop table boardcomment;
-- 댓글 정보
select * from boardcomment
CREATE SEQUENCE COMMENT_SEQ;
CREATE TABLE BOARDCOMMENT(
	comment_no number primary key,
	board_no number not null,
	content clob not null,
	time_posted date not null,
	id varchar2(50) not null,
	constraint fk_comment_board foreign key(board_no) references board(board_no),
	constraint fk_comment_id foreign key(id) references member(id)
)

-- 공통 회원 정보
insert into MEMBER(id,password,name,nickname,tel) 
values('java','1234','아이유','유','01231231');
insert into MEMBER(id,password,name,nickname,tel) 
values('spring','1234','아이유2','유2','0102525311');
insert into MEMBER(id,password,name,nickname,tel) 
values('oracle','1234','김상혁','혁','010215431');
insert into MEMBER(id,password,name,nickname,tel) 
values('jstl','1234','주혜진','진','0123125131');
insert into MEMBER(id,password,name,nickname,tel) 
values('jquery','1234','송중기','송','01031203251');
insert into MEMBER(id,password,name,nickname,tel) 
values('admin','1234','관리자','admin관리자','01112345678');
insert into MEMBER(id,password,name,nickname,tel) 
values('admin1','1234','관리자','admin관리자관리자1','01112345678');
insert into MEMBER(id,password,name,nickname,tel) 
values('company','1234','관리자','company관리자','0101231678');
insert into MEMBER(id,password,name,nickname,tel) 
values('company1','1234','관리자','company관리자1','011545678');
insert into MEMBER(id,password,name,nickname,tel) 
values('member','1234','관리자','member관리자','0106531678');
insert into MEMBER(id,password,name,nickname,tel) 
values('member1','1234','관리자','member관리자1','0154545678');
insert into MEMBER(id,password,name,nickname,tel) 
values('sss','1234','유1','우리식당','0154545678');
insert into MEMBER(id,password,name,nickname,tel) 
values('ss','1234','유3','새마을식당','0154545678');
insert into MEMBER(id,password,name,nickname,tel) 
values('s','1234','유4','CGV','0154545678');

select * from member;
select * from GENERICMEMBER;
select * from COMPANYMEMBER;

select member.id,member.nickname,authorities.authority 
		from member member,authorities authorities
		where member.id='sss' and member.password='1234' and member.id=authorities.id
		and member.enabled=1
-- 일반 회원 정보
insert into GENERICMEMBER(id,birth,gender,mileage) 
values('java','0320','여',10);
insert into GENERICMEMBER(id,birth,gender,mileage) 
values('jstl','0613','여',80);
insert into GENERICMEMBER(id,birth,gender,mileage) 
values('jquery','0910','남',130);


-- 기업 회원 정보
insert into COMPANYMEMBER(id,address,corporate_registration_number) 
values('oracle','종로','12315152364');
insert into COMPANYMEMBER(id,address,corporate_registration_number) 
values('spring','판교','12365452364');
insert into COMPANYMEMBER(id,address,corporate_registration_number) 
values('sss','판교','12365452364');
insert into COMPANYMEMBER(id,address,corporate_registration_number) 
values('ss','판교','12365452364');
insert into COMPANYMEMBER(id,address,corporate_registration_number) 
values('s','판교','12365452364');
insert into COMPANYMEMBER(id,address,corporate_registration_number) 
values('company','판교','12365452364');

-- 회원 권한
insert into AUTHORITIES(id,authority)
values('admin','ROLE_ADMIN');
insert into AUTHORITIES(id,authority)
values('admin1','ROLE_ADMIN');
insert into AUTHORITIES(id,authority)
values('company','ROLE_COMPANY');
insert into AUTHORITIES(id,authority)
values('spring','ROLE_COMPANY');
insert into AUTHORITIES(id,authority)
values('member','ROLE_MEMBER');
insert into AUTHORITIES(id,authority)
values('member1','ROLE_MEMBER');
insert into AUTHORITIES(id,authority)
values('java','ROLE_MEMBER')
insert into AUTHORITIES(id,authority)
values('java','ROLE_COMPANY'); 
insert into AUTHORITIES(id,authority)
values('sss','ROLE_COMPANY');
insert into AUTHORITIES(id,authority)
values('s','ROLE_COMPANY');
insert into AUTHORITIES(id,authority)
values('ss','ROLE_COMPANY');

--board--
insert into board(board_no,id,content,time_posted) values(board_seq.nextval,'java','싫다 싫어',sysdate);
insert into board(board_no,id,content,time_posted) values(board_seq.nextval,'spring','dsds',sysdate);
insert into board(board_no,id,content,time_posted) values(board_seq.nextval,'oracle','ds',sysdate);
insert into board(board_no,id,content,time_posted) values(board_seq.nextval,'java','어려웡',sysdate);
insert into board(board_no,id,content,time_posted) values(board_seq.nextval,'sql','dsds',sysdate);
insert into board(board_no,id,content,time_posted) values(board_seq.nextval,'spring','ds',sysdate);
insert into board(board_no,id,content,time_posted) values(board_seq.nextval,'oracle','ds',sysdate);
insert into board(board_no,id,content,time_posted) values(board_seq.nextval,'oracle','ds',sysdate);

insert into board(board_no,id,content,time_posted) values(board_seq.nextval,'spring','os',sysdate);

select * from board
select * from introduce

-- 카테고리--
insert into INTRODUCE_CATEGORY(category_no,category_name) values('1','음식점');
insert into INTRODUCE_CATEGORY(category_no,category_name) values('2','술');
insert into INTRODUCE_CATEGORY(category_no,category_name) values('3','문화');

--소개글--
insert into introduce(board_no, company_name, region, location, business_hours, tel, category_no) 
values('1', '장도뚝배기', '낙성대', '서울특별시 관악구 봉천로 삼영빌딩', '24시간', '02-877-4171', '1');
insert into introduce(board_no, company_name, region, location, business_hours, tel, category_no) 
values('2', '치치', '혜화', '서울특별시 종로구 대학로 8가길 36', '매일 17:00~05:00', '02-766-6222', '1');

insert into introduce(board_no,company_name,region,location,business_hours,tel,keyword_no,category_no) values('3','장도뚝배기','낙성대','서울특별시 관악구 봉천로 삼영빌딩','24시간','02-877-4171','1','1');
insert into introduce(board_no,company_name,region,location,business_hours,tel,keyword_no,category_no) values('6','치치','혜화','서울특별시 종로구 대학로 8가길 36','매일 17:00~05:00','02-766-6222','2','1');


--키워드--
insert into KEYWORD(keyword_no,keyword_name,board_no) values(keyword_seq.nextval, '#알바생존잘(?)','2');
insert into KEYWORD(keyword_no,keyword_name,board_no) values(keyword_seq.nextval, '#뿌잉뿌잉','2');
select * from keyword
--모임글--

insert into meeting(board_no,title,region,location,interest) values('4','식사','판교','유스페이스','코딩');
insert into meeting(board_no,title,region,location,interest) values('22','식사','목동','현대타워','등산');

insert into meeting(board_no,title,region,location,interest) values('24','식사','판교','유스페이스','코딩');

insert into board(board_no,id,content,time_posted) values(board_seq.nextval,'json','qw',sysdate);
insert into board(board_no,id,content,time_posted) values(board_seq.nextval,'json','re1',sysdate);
insert into board(board_no,id,content,time_posted) values(board_seq.nextval,'json','323qs',sysdate);
insert into board(board_no,id,content,time_posted) values(board_seq.nextval,'json','qwe53',sysdate);
insert into board(board_no,id,content,time_posted) values(board_seq.nextval,'json','sgwy1',sysdate);
insert into board(board_no,id,content,time_posted) values(board_seq.nextval,'json','sd',sysdate);
insert into board(board_no,id,content,time_posted) values(board_seq.nextval,'json','15asd',sysdate);
insert into board(board_no,id,content,time_posted) values(board_seq.nextval,'json','12',sysdate);
insert into board(board_no,id,content,time_posted) values(board_seq.nextval,'json','524',sysdate);
insert into board(board_no,id,content,time_posted) values(board_seq.nextval,'json','ge5sgg',sysdate);

insert into meeting(board_no,title,region,location,interest) values('21','식사','판교','유스페이스','코딩');
insert into meeting(board_no,title,region,location,interest) values('22','닭발번개','판교','유스페이스','코딩');
insert into meeting(board_no,title,region,location,interest) values('23','식사','목동','국밥집','독서');
insert into meeting(board_no,title,region,location,interest) values('24','식사','수원','수원역','코딩');
insert into meeting(board_no,title,region,location,interest) values('25','식사','용인','.','코딩');
insert into meeting(board_no,title,region,location,interest) values('26','라멘','건대','우마이도','라멘맛집');
insert into meeting(board_no,title,region,location,interest) values('27','칵테일','건대','건대입구','코딩');
insert into meeting(board_no,title,region,location,interest) values('28','식사','판교','유스페이스','코딩');
insert into meeting(board_no,title,region,location,interest) values('29','식사~','판교','유스페이스','코딩');
insert into meeting(board_no,title,region,location,interest) values('30','식사!!','판교','유스페이스','코딩');

select *from board
--후기글--
insert into review(board_no,title) values('29','하상현 멍청이1213');


--사진--
insert into image(image_no, image_name, image_original_name, board_no) 
values('1', sysdate, 'asdf', 1);
insert into image(image_no, image_name, image_original_name, board_no) 
values('2', sysdate, 'asdf', 1);
select * from image
select * from keyword

---- 소개글 리스트 ( board_no 으로 찾아서 )
-- 1) 사진,가게명,지역 뽑아오기
select introduce.board_no, member.nickname, image.image_name, introduce.region 
from member member, board board, image image, introduce introduce 
where introduce.category_no=1 and member.id=board.id 
and board.board_no=image.board_no and board.board_no=image.board_no
-- 2) keyword 뽑아오기
select keyword.keyword_name
from keyword keyword, introduce introduce
where keyword.board_no=introduce.board_no and introduce.board_no=1

-----------------------여기서 막쓰세요 
--확실한것만 board,member xml로 이동하여 저장시켜주세요.
select * from board
select * from introduce
select * from image
select introduce.board_no, member.id from member member,introduce introduce,board board
where board.board_no = introduce.board_no and member.id=board.id

-- 이미지 무조건 넣고 하세요
select introduce.board_no, member.nickname, introduce.region 
from member member, board board, introduce introduce 
where introduce.category_no=2
and member.id=board.id and board.board_no=introduce.board_no 



select member.id,member.nickname,authorities.authority 
from member member,authorities authorities
where member.id='java' and member.password='1234' and member.id=authorities.id
and member.enabled=1

select companymember.id,member.nickname,authorities.authority
from companymember companymember,member member,authorities authorities
where companymember.id=member.id and companymember.approval=1 and member.id=authorities.id


select * from authorities 
select * from member
select * from companymember

	select companymember.id,member.nickname,authorities.authority,companymember.approval
	from companymember companymember,member member,authorities authorities
	where companymember.id=member.id and member.id=authorities.id
	and companymember.id='abcd'

	select gmember.id,member.name,member.nickname,gmember.gender,gmember.birth,member.tel
	from member member, genericmember gmember
	where member.id=gmember.id
	
	select * from board
	select image.image_name
		from image image, board board 
		where image.board_no=board.board_no and board.board_no=18 and image.image_no=(select min(image_no) from image)
	--해당 게시물의 이미지중에서
	select image.image_no
		from image image, board board 
		where image.board_no=board.board_no and board.board_no=18 --7,8
		
  --가장 이미지 번호가 작은것 --7
  select min(	select image.image_no
		from image image, board board 
		where image.board_no=board.board_no and board.board_no=18) from image
	
		-- sub
	select min(image.image_no) from image image, board board where board.board_no=17 and board.board_no=image.board_no
	
	-- image name
	select image.image_name from (select min(image.image_no) from image image, board board where board.board_no=17 and board.board_no=image.board_no)
	
	
	select image_name from image where image_no =(	select min(image.image_no) from image image, board board where board.board_no=1 and board.board_no=image.board_no);
	

	select meeting.board_no,meeting.title,meeting.region,meeting.interest,
	meeting.hits,board.time_posted,member.nickname 
	from board board,meeting meeting,member member where board.board_no = meeting.board_no 

	and board.id = member.id and meeting.board_no= 5

select meeting.board_no,meeting.region,meeting.title,meeting.interest,meeting.hits,
board.time_posted,member.nickname from board board,meeting meeting,member member 
where board.board_no = meeting.board_no and board.id = member.id;

select gmember.id,member.name,member.nickname,gmember.gender,gmember.birth,member.tel
from member member, genericmember gmember
where member.id=gmember.id and gmember.id='json'

	and board.id = member.id and meeting.board_no= 5
	
	
	select * from auth
	select * from AUTHORITIES
	
--후기상세정보 조회
select
r.board_no,b.id,m.nickname,to_char(b.time_posted,'YYYY.MM.DD HH:mm:ss') as time_posted,
r.hits,r.likes,b.content
from board b,review r,member m
where b.id=m.id and b.board_no=r.board_no  and r.board_no='10'
	

	select boardcomment.comment_no,boardcomment.content,member.nickname as "memberVO.nickName",
	to_char(boardcomment.time_posted,'yyyy.mm.dd') as timePosted from BOARDCOMMENT boardcomment,member member 
	where boardcomment.id=member.id and boardcomment.board_no=5
	ORDER BY boardcomment.comment_no ASC
	
	COMPANYMEMBER set approval=1 where id='abcd' --승인상태
	update boardcomment set content = '트레이서' where comment_no='47'
	
	
select board_no as boardNo,nickname as "memberVO.nickName",
time_posted as timePosted,title,hits,likes from
(select row_number() over(order by board.board_no) as rnum,board.board_no,member.nickname,
to_char(board.time_posted,'YYYY.MM.DD') as time_posted,review.title,review.hits,review.likes 
from board board,review review,member member 
where board.board_no=review.board_no and board.id=member.id) 
where rnum between 1 and 5 

select companymember.id,member.nickname,authorities.authority,companymember.approval,companymember.write
	from companymember companymember,member member,authorities authorities
	where companymember.id=member.id and member.id=authorities.id


select row_number() over(order by board.board_no) as rnum,board.board_no,member.nickname,
to_char(board.time_posted,'YYYY.MM.DD') as time_posted,review.title,review.hits,review.likes 
from board board,review review,member member 
where board.board_no=review.board_no and board.id=member.id

select board_no, title, region, 
		interest, hits, time_posted, nickname from
		(select row_number() over(order by board.board_no) as rnum,
		board.board_no,meeting.title,meeting.region, 
		meeting.interest, meeting.hits,to_char(board.time_posted,'YYYY.MM.DD') as time_posted,
		member.nickname
		from board board, meeting meeting, member member
		where board.board_no = meeting.board_no and board.id = member.id)
		where rnum between 1 and 5
	

alter table COMPANYMEMBER add write number default 0

select
b.no,b.title,to_char(b.time_posted,'YYYY.MM.DD HH:mm:ss') 
as time_posted,b.content,b.hits,m.id,m.name 
from spring_board_inst b,spring_member m 
where
b.id=m.id and b.board no=#{value}	

	
select
r.board_no,b.id,m.nickname,to_char(b.time_posted,'YYYY.MM.DD HH:mm:ss') as time_posted,
r.hits,r.likes,b.content
from board b,review r,member m
where b.id=m.id and b.board_no=r.board_no  and r.board_no=10

select count(*) from board board,review review
where board.board_no=review.board_no and review.title='손재만1213'

select * from MEETING 
update MEETING set hits=hits+1 where board_no=5