
CREATE SEQUENCE MILEAGE_SEQ;
CREATE SEQUENCE COMMENT_SEQ;
CREATE SEQUENCE IMAGE_SEQ;

drop table image;
drop table mileage;
drop table likescheck;
drop table boardcomment;

drop sequence mileage_seq;
drop sequence comment_seq;
drop sequence image_seq;

update member set enabled=1 where id='admin'
select * from member where id='rl2'
select * from  image;

DROP TABLE IMAGE
CREATE TABLE IMAGE(
	image_no number primary key,
	image_name varchar2(100) not null,
	image_originalname varchar(100) not null,
	board_no number not null,
	constraint fk_image foreign key(board_no) references board(board_no)
)
select * from image
--마일리지 정보
CREATE TABLE MILEAGE(
	mileage_no number primary key,
	deal_money number not null,
	deal_content varchar2(100) not null,
	id varchar2(50) not null,
	constraint fk_mileage foreign key(id) references genericmember(id)
)
 select * from mileage
 insert into mileage(mileage_no, deal_money, deal_content, id) values(mileage_seq.nextval, 500, '좋아요', 'fd')
 select * from genericmember where id='fd'
 update genericmember set mileage=0
 update genericmember set mileage=(select sum(deal_money) as mileage from mileage where id='fd')
--	constraint pk_likescheck primary key(board_no, id)
-- 댓글 정보

drop table BOARDCOMMENT
delete from BOARDCOMMENT;
CREATE TABLE BOARDCOMMENT(
	comment_no number primary key,
	board_no number not null,
	content clob not null,
	time_posted date not null,
	id varchar2(50) not null,
	constraint fk_comment_board foreign key(board_no) references board(board_no),
	constraint fk_comment_id foreign key(id) references member(id)
)

create table likescheck(
	id varchar2(50) not null,
	board_no number not null,
	likecheck number default 0,
	constraint fk_likescheck_board foreign key(board_no) references board(board_no),
	constraint fk_likescheck_id foreign key(id) references member(id),
	constraint fk_likescheck primary key(id,board_no)
)



drop table attendance;
create table attendance(
   id varchar2(50) not null,
   mydate varchar2(50) not null,
   constraint fk_attendance_id foreign key(id) references GENERICMEMBER(id),
   constraint fk_attendance primary key(id,mydate)

);



