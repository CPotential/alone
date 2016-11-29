// 공통 회원 정보
DROP TABLE MEMBER;
CREATE TABLE MEMBER( 
	id varchar2(50) primary key,
	password varchar2(50) not null,
	name varchar2(50) not null,
	nickname varchar2(50) not null,
	tel varchar2(50) not null,
	enabled number default 1 // 탈퇴여부 : 탈퇴시 0 으로 변경
)

// 일반 회원 정보
CREATE TABLE GENERICMEMBER(
	id varchar2(50) primary key,
	birth varchar2(50) not null,
	gender varchar2(10) not null,
	mileage number default 0,
	constraint fk_genericmember foreign key(id) references member(id)
)

// 기업 회원 정보
CREATE TABLE COMPANYMEMBER( 
	id varchar2(50) primary key,
	address varchar2(50) not null,
	corporate_registration_number varchar2(50) not null,
	approval number default 0, // 가입승인 여부 : 가입 승인 시 1로 변경
	constraint fk_companymember foreign key(id) references member(id)
)

// 회원 권한
CREATE TABLE AUTHORITIES(
	id varchar2(50) not null,
	authority varchar2(30) not null, // 권한
	constraint fk_authorities foreign key(id) references member(id),
	constraint fk_member_authorities primary key(id, authority)
)

// 공통 게시판 정보
CREATE SEQUENCE BOARD_SEQ;
CREATE TABLE BOARD(
	board_no number primary key,
	id varchar2(50) not null,
	content clob not null,
	time_posted date not null,
	board_enabled default 1, // 게시글 삭제 여부 : 삭제시 0
	constraint fk_board foreign key(id) references member(id)
)

// 소개글 카테고리
CREATE SEQUENCE INTRODUCE_CATEGORY_SEQ;
CREATE TABLE INTRODUCE_CATEGORY(
	category_no number primary key,
	category_name varchar2(50) not null
)

// 소개글 정보
CREATE SEQUENCE KEYWORD_SEQ;
CREATE TABLE INTRODUCE(
	board_no number primary key,
	company_name varchar2(50) not null,
	region varchar2(50) not null,
	location varchar2(100) not null,
	business_hours varchar2(50) not null,
	tel varchar2(50) not null,
	keyword_no number,
	category_no number not null,
	constraint fk_introduce foreign key(board_no) references board(board_no),
	constraint fk_introduce_category foreign key(category_no) references introduce_category(category_no)
)

// 소개글 키워드 정보
CREATE TABLE KEYWORD(
	keyword_no number not null,
	keyword_name varchar2(50) not null,
	constraint fk_keyword foreign key(keyword_no) references introduce(keyword_no),
	constraint pk_keyword primary key(keyword_no, keyword_name)
)

// 모임글 정보
CREATE TABLE MEETING(
	board_no number primary key,
	title varchar2(100) not null,
	region varchar2(100) not null,
	location varchar2(100) not null,
	interest varchar2(50) not null,
	hits number default 0,
	constraint fk_meeting foreign key(board_no) references board(board_no)
)

// 후기글 정보
CREATE TABLE REVIEW(
	board_no number primary key,
	title varchar2(100) not null,
	hits number default 0,
	likes number default 0,
	constraint fk_review foreign key(board_no) references board(board_no)
)

// 이미지 정보
CREATE TABLE IMAGE(
	image_no number primary key,
	image_name varchar2(100) not null,
	image_original_name varchar2(100) not null,
	board_no number not null,
	constraint fk_image foreign key(board_no) references board(board_no)
)

// 마일리지 정보
CREATE SEQUENCE MILEAGE_SEQ;
CREATE TABLE MILEAGE(
	mileage_no number primary key,
	deal_money number not null,
	deal_content varchar2(100) not null,
	id varchar2(50) not null,
	constraint fk_mileage foreign key(id) references genericmember(id)
)

// 좋아요 상태
CREATE TABLE LIKESCHECK(
	board_no number not null,
	id varchar2(50) not null,
	likes_statement number default 0, // 좋아요 상태 : 좋아요 누른 상태 1
	constraint fk_likes_board foreign key(board_no) references review(board_no),
	constraint fk_likes_id foreign key(id) references member(id),
	constraint pk_likescheck(board_no, id)
)

// 댓글 정보
CREATE SEQUENCE COMMENT_SEQ;
CREATE TABLE COMMENT(
	comment_no number primary key,
	board_no number not null,
	content clob not null,
	time_posted date not null,
	id varchar2(50) not null,
	constraint fk_comment_board foreign key(board_no) references board(board_no),
	constraint fk_comment_id foreign key(id) references member(id)
)








