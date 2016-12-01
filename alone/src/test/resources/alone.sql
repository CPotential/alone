-- 공통 회원 정보
DROP TABLE MEMBER;
CREATE TABLE MEMBER( 
	id varchar2(50) primary key,
	password varchar2(50) not null,
	name varchar2(50) not null,
	nickname varchar2(50) not null,
	tel varchar2(50) not null,
	enabled number default 1 -- 탈퇴여부 : 탈퇴시 0 으로 변경
)

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
where introduce.category_no=1 and member.id=board.id and board.board_no=image.board_no and board.board_no=image.board_no
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
select introduce.board_no, member.nickname, image.image_name, introduce.region 
from member member, board board, image image, introduce introduce 
where introduce.category_no=1
and member.id=board.id and board.board_no=introduce.board_no 
and board.board_no=image.board_no


select member.id,member.nickname,authorities.authority 
from member member,authorities authorities
where member.id='java' and member.password='1234' and member.id=authorities.id
and member.enabled=1

select companymember.id,member.nickname 
from companymember companymember,member member
where companymember.id=member.id and companymember.approval=1

select * from authorities