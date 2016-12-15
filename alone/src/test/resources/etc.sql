DROP TABLE image CASCADE CONSTRAINT;
DROP TABLE mileage CASCADE CONSTRAINT;
DROP TABLE likescheck CASCADE CONSTRAINT;
DROP TABLE boardcomment CASCADE CONSTRAINT;
DROP TABLE attendance CASCADE CONSTRAINT;

drop sequence mileage_seq;
drop sequence comment_seq;
drop sequence image_seq;

-- 이미지 정보
CREATE SEQUENCE IMAGE_SEQ;
CREATE TABLE IMAGE(
	image_no number primary key,
	image_name varchar2(100) not null,
	image_originalname varchar2(100) not null,
	board_no number not null,
	constraint fk_image foreign key(board_no) references board(board_no)
)

--마일리지 정보
CREATE SEQUENCE MILEAGE_SEQ;
CREATE TABLE MILEAGE(
	mileage_no number primary key,
	deal_money number not null,
	deal_content varchar2(100) not null,
	id varchar2(50) not null,
	constraint fk_mileage foreign key(id) references genericmember(id)
)

-- 댓글 정보
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

-- 좋아요 체크 
create table likescheck(
	id varchar2(50) not null,
	board_no number not null,
	likecheck number default 0,
	constraint fk_likescheck_board foreign key(board_no) references board(board_no),
	constraint fk_likescheck_id foreign key(id) references member(id),
	constraint pk_likescheck primary key(id,board_no)
)

-- 출석 체크
create table attendance(
   id varchar2(50) not null,
   mydate varchar2(50) not null,
   constraint fk_attendance_id foreign key(id) references GENERICMEMBER(id),
   constraint fk_attendance primary key(id,mydate)
);


update genericmember set mileage=(select sum(deal_money) as mileage from mileage where id='fd')
--	constraint pk_likescheck primary key(board_no, id)
