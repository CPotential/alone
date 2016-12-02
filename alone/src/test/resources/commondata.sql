--******************회원 이렇게 회원정보에 맞게 같이 만들어 주시면 좋겠습니다*****************************
--******************************************게시판도 마찬가지 입니다********************************************
-- 일반회원 정보
insert into member(id, password, name, nickname, tel)
values('json', '1234', '서현진', '개구리', '01078965412');
insert into genericmember(id, birth, gender, mileage)
values('json', '851201', '여자', 0);
insert into authorities(id,authority)
values('json','ROLE_MEMBER');
-- 기업회원 정보
insert into member(id, password, name, nickname, tel)
values('jquery', '1234', '오해영', '담소', '01081234567');
insert into companymember(id, address, corporate_registration_number)
values('jquery', '판교', '654898123254');
insert into authorities(id,authority)
values('jquery','ROLE_COMPANY');
-- 관리자 정보
insert into member(id, password, name, nickname, tel)
values('administer', '1234', '관리자', '관리자', '01043217894');
insert into authorities(id, authority)
values('administer', 'ROLE_ADMIN');

-- 카테고리--
insert into INTRODUCE_CATEGORY(category_no,category_name) values('1','음식점');
insert into INTRODUCE_CATEGORY(category_no,category_name) values('2','술');
insert into INTRODUCE_CATEGORY(category_no,category_name) values('3','문화');
----- 소개글 정보
--1) board
insert into board(board_no, id, content, time_posted) 
values(board_seq.nextval, 'jquery', '순대국밥 한그릇 어떤가요?', sysdate);
--2) introduce
insert into introduce(board_no, company_name, region, location, business_hours, tel, category_no) 
values('1', '담소', '판교', '경기도 성남시 분당구 판교역로 231 에이치스퀘어 에스동', '24시간', '031-789-3821', '1');
--3) keyword
insert into KEYWORD(keyword_no,keyword_name,board_no) 
values(keyword_seq.nextval, '#싸다','1');
insert into KEYWORD(keyword_no,keyword_name,board_no) 
values(keyword_seq.nextval, '#소문난 맛집','1');
--4) image -- image_name 이건 나중에 파일등록할때 서비스(아마도)에서 이름을 만들어줘서 보내줘야 할거같습니다
insert into image(image_no, image_name, image_original_name, board_no) 
values(image_seq.nextval, sysdate, 'asdfsas', 1);
insert into image(image_no, image_name, image_original_name, board_no) 
values(image_seq.nextval, sysdate, 'asdfsda', 1);
--******************************************************************************************


insert into MEMBER(id,password,name,nickname,tel) 
values('java','1234','아이유','유','01231231');
insert into MEMBER(id,password,name,nickname,tel) 
values('spring','1234','아이유2','유2','0102525311');
insert into MEMBER(id,password,name,nickname,tel) 
values('oracle','1234','김상혁','혁','010215431');
insert into MEMBER(id,password,name,nickname,tel) 
values('jstl','1234','주혜진','진','0123125131');
insert into MEMBER(id,password,name,nickname,tel) 
values('admin','1234','관리자','admin관리자','01112345678');
insert into MEMBER(id,password,name,nickname,tel) 
values('company','1234','관리자','company관리자','0101231678');
insert into MEMBER(id,password,name,nickname,tel) 
values('member','1234','관리자','member관리자','0106531678');

select * from member;

-- 일반 회원 정보
delete from GENERICMEMBER
insert into GENERICMEMBER(id,birth,gender,mileage) 
values('java','0320','여',10);
insert into GENERICMEMBER(id,birth,gender,mileage) 
values('jstl','0613','여',80);

-- 기업 회원 정보
delete from COMPANYMEMBER
insert into COMPANYMEMBER(id,address,corporate_registration_number) 
values('oracle','종로','12315152364');
insert into COMPANYMEMBER(id,address,corporate_registration_number) 
values('spring','판교','12365452364');

-- 회원 권한
insert into AUTHORITIES(id,authority)
values('admin','ROLE_ADMIN');
insert into AUTHORITIES(id,authority)
values('java','ROLE_MEMBER');
insert into AUTHORITIES(id,authority)
values('company','ROLE_COMPANY');
insert into AUTHORITIES(id,authority)
values('spring','ROLE_COMPANY');
insert into AUTHORITIES(id,authority)
values('oracle','ROLE_COMPANY');
insert into AUTHORITIES(id,authority)
values('member','ROLE_MEMBER');


--board--
delete from board;
insert into board(board_no,id,content,time_posted) 
values(board_seq.nextval,'java','싫다 싫어',sysdate);
insert into board(board_no,id,content,time_posted) 
values(board_seq.nextval,'spring','dsds',sysdate);
insert into board(board_no,id,content,time_posted) 
values(board_seq.nextval,'oracle','ds',sysdate);
insert into board(board_no,id,content,time_posted) 
values(board_seq.nextval,'java','어려웡',sysdate);
insert into board(board_no,id,content,time_posted) 
values(board_seq.nextval,'jstl','dsds',sysdate);
insert into board(board_no,id,content,time_posted) 
values(board_seq.nextval,'spring','123',sysdate);
insert into board(board_no,id,content,time_posted) 
values(board_seq.nextval,'oracle','뭐야 진짜',sysdate);
insert into board(board_no,id,content,time_posted) 
values(board_seq.nextval,'oracle','졸린다 자자',sysdate);

select * from board;
-- 카테고리--

insert into INTRODUCE_CATEGORY(category_no,category_name) values(1,'음식점');
insert into INTRODUCE_CATEGORY(category_no,category_name) values(2,'술');
insert into INTRODUCE_CATEGORY(category_no,category_name) values(3,'문화');
delete INTRODUCE_CATEGORY;
select * from INTRODUCE_CATEGORY;
--소개글--
delete from introduce;
select * from introduce;
insert into introduce(board_no, company_name, region, location, business_hours, tel, category_no) 
values('1', '장도뚝배기', '낙성대', '서울특별시 관악구 봉천로 삼영빌딩', '24시간', '02-877-4171', '1');
insert into introduce(board_no, company_name, region, location, business_hours, tel, category_no) 
values('2', '치치', '혜화', '서울특별시 종로구 대학로 8가길 36', '매일 17:00~05:00', '02-766-6222', '1');


insert into introduce(board_no,company_name,region,location,business_hours,tel,category_no) values('3','장도뚝배기','낙성대','서울특별시 관악구 봉천로 삼영빌딩','24시간','02-877-4171','1');
insert into introduce(board_no,company_name,region,location,business_hours,tel,category_no) values('4','치치','혜화','서울특별시 종로구 대학로 8가길 36','매일 17:00~05:00','02-766-6222','1');

insert into introduce(board_no,company_name,region,location,business_hours,tel,category_no) 
values('3','장도뚝배기','낙성대','서울특별시 관악구 봉천로 삼영빌딩','24시간','02-877-4171','1');
insert into introduce(board_no,company_name,region,location,business_hours,tel,category_no) 
values('4','치치','혜화','서울특별시 종로구 대학로 8가길 36','매일 17:00~05:00','02-766-6222','1');

delete from introduce where board_no='4';

--키워드--
insert into KEYWORD(keyword_no,keyword_name,board_no) values(keyword_seq.nextval, '#알바생존잘(?)','2');
insert into KEYWORD(keyword_no,keyword_name,board_no) values(keyword_seq.nextval, '#뿌잉뿌잉','2');
select * from keyword

--모임글--

delete from meeting;
insert into meeting(board_no,title,region,location,interest) values('5','식사','판교','유스페이스','코딩');
insert into meeting(board_no,title,region,location,interest) values('6','식사','목동','현대타워','등산');
insert into meeting(board_no,title,region,location,interest) values('24','식사','판교','유스페이스','코딩');


select *from meeting;

--후기글--
delete from review;
insert into review(board_no,title) values('7','하상현 멍청이1213');
insert into review(board_no,title) values('8','손재만1213');
insert into review(board_no,title) values('9','하후기3');
select * from review;


--사진--
delete from image;
insert into image(image_no, image_name, image_original_name, board_no) 
values('1', sysdate, 'asdf', 1);
insert into image(image_no, image_name, image_original_name, board_no) 
values('2', sysdate, 'asdf', 1);
insert into image(image_no, image_name, image_original_name, board_no) 
values('3', sysdate, 'asdf', 2);
select * from image;

select * from member
--기업회원 확인
update COMPANYMEMBER set approval=1 where id='spring' --승인상태









