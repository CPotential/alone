
DROP TABLE member CASCADE CONSTRAINT;
DROP TABLE genericmember CASCADE CONSTRAINT;
DROP TABLE companymember CASCADE CONSTRAINT;
DROP TABLE authorities CASCADE CONSTRAINT;

-- 공통 회원 정보
CREATE TABLE MEMBER( 
	id varchar2(50) primary key,
	password varchar2(100) not null,
	name varchar2(50) not null,
	nickname varchar2(50) not null,
	tel varchar2(50) not null,
	enabled number default 1 -- 탈퇴여부 : 탈퇴시 0 으로 변경
)
alter table member MODIFY(password varchar2(100))
-- 일반 회원 정보
CREATE TABLE GENERICMEMBER(
	id varchar2(50) primary key,
	birth varchar2(50) not null,
	gender varchar2(10) not null,
	mileage number default 0,
	constraint fk_genericmember foreign key(id) references member(id)
)

-- 기업 회원 정보
CREATE TABLE COMPANYMEMBER( 
	id varchar2(50) primary key,
	address varchar2(50) not null,
	corporate_registration_number varchar2(50) not null,
	write number default 0,
	constraint fk_companymember foreign key(id) references member(id)
)

alter table COMPANYMEMBER drop COLUMN  approval


update AUTHORITIES set authority='ROLE_ADMIN' where id='admin2'

-- 회원 권한 
CREATE TABLE AUTHORITIES(
	id varchar2(50) not null,
	authority varchar2(30) not null, -- 권한
	constraint fk_authorities foreign key(id) references member(id),
	constraint pk_authorities primary key(id, authority)
)