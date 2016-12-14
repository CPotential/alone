

DROP TABLE MEMBER
drop table genericmember
drop table COMPANYMEMBER
drop table authorities;


CREATE TABLE MEMBER( 
	id varchar2(50) primary key,
	password varchar2(50) not null,
	name varchar2(50) not null,
	nickname varchar2(50) not null,
	tel varchar2(50) not null,
	enabled number default 1 -- 탈퇴여부 : 탈퇴시 0 으로 변경
)
alter table member modify(password varchar2(100)) 


CREATE TABLE GENERICMEMBER(
	id varchar2(50) primary key,
	birth varchar2(50) not null,
	gender varchar2(10) not null,
	mileage number default 0,
	constraint fk_genericmember foreign key(id) references member(id)
)


DROP TABLE COMPANYMEMBER
CREATE TABLE COMPANYMEMBER( 
	id varchar2(50) primary key,
	address varchar2(50) not null,
	corporate_registration_number varchar2(50) not null,
	approval number default 0, -- 가입승인 여부 : 가입 승인 시 1로 변경
	write number default 0,
	constraint fk_companymember foreign key(id) references member(id)
)
alter table COMPANYMEMBER add write number default 0
select * from companymember
<<<<<<< HEAD


=======
select * from authorities;
>>>>>>> branch 'master' of https://github.com/CPotential/alone.git
CREATE TABLE AUTHORITIES(
	id varchar2(50) not null,
	authority varchar2(30) not null, -- 권한
	constraint fk_authorities foreign key(id) references member(id),
	constraint fk_member_authorities primary key(id, authority)
)