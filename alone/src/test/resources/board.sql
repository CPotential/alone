drop sequence introduce_category_seq;
drop sequence board_seq;
drop sequence keyword_seq;

DROP TABLE board CASCADE CONSTRAINT;
DROP TABLE introduce CASCADE CONSTRAINT;
DROP TABLE review CASCADE CONSTRAINT;
DROP TABLE meeting CASCADE CONSTRAINT;
DROP TABLE keyword CASCADE CONSTRAINT;
DROP TABLE introduce_category CASCADE CONSTRAINT;

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

-- 소개글 카테고리
CREATE SEQUENCE INTRODUCE_CATEGORY_SEQ;
CREATE TABLE INTRODUCE_CATEGORY(
	category_no number primary key,
	category_name varchar2(50) not null
)

-- 소개글 정보
CREATE TABLE INTRODUCE(
	board_no number primary key,
	company_name varchar2(50) not null,
	region varchar2(50) not null,
	location varchar2(100) not null,
	business_hours varchar2(50) not null,
	tel varchar2(50) not null,
	category_no number not null,
	likes number default 0,
	constraint fk_introduce foreign key(board_no) references board(board_no),
	constraint fk_introduce_category foreign key(category_no) references introduce_category(category_no)
)
alter table introduce add likes number default 0
-- 소개글 키워드 정보
CREATE SEQUENCE KEYWORD_SEQ;
CREATE TABLE KEYWORD(
	keyword_no number primary key,
	keyword_name varchar2(50) not null,
	board_no number not null,
	constraint fk_keyword_board foreign key(board_no) references introduce(board_no)
)

--모임글 정보
CREATE TABLE MEETING(
	board_no number primary key,
	title varchar2(100) not null,
	region varchar2(100) not null,
	location varchar2(100) not null,
	interest varchar2(50) not null,
	hits number default 0,
	constraint fk_meeting foreign key(board_no) references board(board_no)
)

-- 후기글 정보
CREATE TABLE REVIEW(
	board_no number primary key,
	title varchar2(100) not null,
	hits number default 0,
	likes number default 0,
	constraint fk_review foreign key(board_no) references board(board_no)
)



--board sql

--metting 부분
select meeting.board_no as boardNo,meeting.title,meeting.region,meeting.interest,meeting.hits,board.time_posted as timePosted,
member.nickname as nickName from board board,meeting meeting,member member 
where board.board_no = meeting.board_no and board.id = member.id;

select meeting.board_no,meeting.region,meeting.title,meeting.interest,meeting.hits,
board.time_posted,member.nickname from board board,meeting meeting,member member 
where board.board_no = meeting.board_no and board.id = member.id;

select * from board
select * from meeting;

-- review 부분

select board.board_no as boardNo,member.nickname as "memberVO.nickName",
to_char(board.time_posted,'yyyy.mm.dd') as timePosted,review.title,review.hits,review.likes 
from board board,review review,member member where board.board_no=review.board_no and board.id=member.id and
review.title='음식후기'

---- 소개글 리스트 ( board_no 으로 찾아서 )
-- 1) 사진,가게명,지역 뽑아오기
select introduce.board_no, member.nickname, image.image_name, introduce.region 
from member member, board board, image image, introduce introduce 
where introduce.category_no=1 and member.id=board.id and board.board_no=image.board_no 
and board.board_no=image.board_no

-- 2) keyword 뽑아오기
select keyword.keyword_name
from keyword keyword, introduce introduce
where keyword.board_no=introduce.board_no and introduce.board_no=1
