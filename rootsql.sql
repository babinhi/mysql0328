-- 주석 (띄어쓰기를 해야함)
-- 계정생성
-- 사용자 이름: user1, 비밀번호 :1234
create user user1@localhost identified by '1234'; 
-- database 생성
create database database1;
-- 권한 부여
grant all privileges on database1.* to user1@localhost;
-- 현재 생성된 계정 목록 확인
use mysql; -- mysql이라는 데이터 베이스를 사용하겠다
select user from user;

drop user user1@localhost;

-- 계정 : user2, 비밀번호: 9999 로 계정을 만들고 
-- database999에 대한 접속권한을 부여하고 
-- 해당 계정으로 접속해서 database999 사용되는지 확인

create user user2@localhost identified by '9999';
create database database999;
grant all privileges on database999.* to user2@localhost;

use mysql;
select user from user;
