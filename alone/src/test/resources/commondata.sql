

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

-- 일반 회원 정보
insert into GENERICMEMBER(id,birth,gender,mileage) 
values('java','0320','여',10);
insert into GENERICMEMBER(id,birth,gender,mileage) 
values('jstl','0613','여',80);

-- 기업 회원 정보
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

-- 카테고리--
insert into INTRODUCE_CATEGORY(category_no,category_name) values('1','음식점');
insert into INTRODUCE_CATEGORY(category_no,category_name) values('2','술');
insert into INTRODUCE_CATEGORY(category_no,category_name) values('3','문화');

--소개글--
insert into introduce(board_no, company_name, region, location, business_hours, tel, category_no) 
values('1', '장도뚝배기', '낙성대', '서울특별시 관악구 봉천로 삼영빌딩', '24시간', '02-877-4171', '1');
insert into introduce(board_no, company_name, region, location, business_hours, tel, category_no) 
values('2', '치치', '혜화', '서울특별시 종로구 대학로 8가길 36', '매일 17:00~05:00', '02-766-6222', '1');

insert into introduce(board_no,company_name,region,location,business_hours,tel,category_no) values('3','장도뚝배기','낙성대','서울특별시 관악구 봉천로 삼영빌딩','24시간','02-877-4171','1');
insert into introduce(board_no,company_name,region,location,business_hours,tel,category_no) values('4','치치','혜화','서울특별시 종로구 대학로 8가길 36','매일 17:00~05:00','02-766-6222','1');


--키워드--
insert into KEYWORD(keyword_no,keyword_name,board_no) values(keyword_seq.nextval, '#알바생존잘(?)','2');
insert into KEYWORD(keyword_no,keyword_name,board_no) values(keyword_seq.nextval, '#뿌잉뿌잉','2');
select * from keyword
--모임글--

insert into meeting(board_no,title,region,location,interest) values('5','식사','판교','유스페이스','코딩');
insert into meeting(board_no,title,region,location,interest) values('6','식사','목동','현대타워','등산');

insert into meeting(board_no,title,region,location,interest) values('24','식사','판교','유스페이스','코딩');


--후기글--
insert into review(board_no,title) values('7','하상현 멍청이1213');
insert into review(board_no,title) values('8','손재만1213');
insert into review(board_no,title) values('9','하후기3');



--사진--
insert into image(image_no, image_name, image_original_name, board_no) 
values('1', sysdate, 'asdf', 1);
insert into image(image_no, image_name, image_original_name, board_no) 
values('2', sysdate, 'asdf', 1);




