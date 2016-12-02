
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



CREATE TABLE IMAGE(
	image_no number primary key,
	image_name varchar2(100) not null,
	image_original_name varchar2(100) not null,
	board_no number not null,
	constraint fk_image foreign key(board_no) references board(board_no)
)

--마일리지 정보
CREATE TABLE MILEAGE(
	mileage_no number primary key,
	deal_money number not null,
	deal_content varchar2(100) not null,
	id varchar2(50) not null,
	constraint fk_mileage foreign key(id) references genericmember(id)
)

-- 댓글 정보
delete from boardcomment;
CREATE TABLE BOARDCOMMENT(
	comment_no number primary key,
	board_no number not null,
	content clob not null,
	time_posted date not null,
	id varchar2(50) not null,
	constraint fk_comment_board foreign key(board_no) references board(board_no),
	constraint fk_comment_id foreign key(id) references member(id)
)