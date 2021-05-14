-- System 계정으로 수행

-- 사용자 생성
create user c##hajinsu IDENTIFIED BY 1234;

-- 사용자 비밀번호 변경
alter user c##hajinsu IDENTIFIED BY gk893wlstn;

-- 사용자 삭제
drop user c##hajinsu;

-- 경우에 따라 내부에 테이블 등 데이터베이스 객체가 생성된 사용자
drop user c##hajinsu cascade; --폭포수 원리

-- 사용자 다시 만들기
create user c##hajinsu IDENTIFIED BY 1234;

-- sqlplus로 접속 시도
-- 사용자 생성, 권한이 부여되지 않으면 아무 작업도 할 수 없음

-- 사용자 정보 확인
-- user_users : 현재 사용자 관련 정보
-- all_users : 전체 사용자 관련 정보
-- dba_users : 모든 사용자 관련 정보

desc user_users;
select * from user_users;

desc all_users;
select * from all_users;

desc dba_users;
select * from dba_users;

-- 사용자 계정에게 접속 권한 부여
grant create session to c##hajinsu;

-- 데이트베이스 접속, 테이블 생성을 위해 권한 부여
grant connect, resource to c##hajinsu;

-- 12버전 이상부터 사용자 테이블 스페이스에 공간 부여 필요
alter user c##hajinsu default tablespace users quota unlimited on users;

-- 시스템 권한 부여
-- grand 권한(역할)명 to 사용자
-- 시스템 권한의 박탈
-- revoke 권한(역할)명 from 사용자

-- 스키마 객체에 대한 권한의 부여
-- grant 권한 on 객체 to 사용자
-- 스키마 객체 권한의 박탈
-- revoke 권한 on 객체 from 사용자

grant select on HR.employees to c##hajinsu;
grant select on HR.departments to c##hajinsu;

-- 이하 사용자 계정으로 수행

select * from hr.employees;
select * from hr.departments;

revoke select on HR.departments from c##hajinsu;

create table book(
    book_id number(5),
    title varchar2(50),
    author varchar2(10),
    pub_date date default sysdate -- 날짜 타입 기본값: 현재 날짜와 시간
    );
DESC BOOK;

-- 서브 쿼리를 이용한 테이블 생성
-- hr.employees 테이블에서 일부 데이터를 추출 후 새 테이블 생성
select * from HR.employees where job_id like 'IT_%';

create table it_emp as(
select * from HR.employees where job_id like 'IT_%');

desc it_emp;
select * from it_emp;

-- 내가 가진 테이블의 목록
select * from tab;

-- 테이블의 삭제
drop table it_emp;

select * from tab;

-- 휴지통 비우기
purge RECYCLEBIN;

select * from tab;

-- 테이블 추가
create table author(
    author_id number(10),
    author_name varchar2(100) not null,
    author_desc varchar2(500),
    primary key (author_id)
    );
    
desc book;
desc author;

-- book 테이블의 author 컬럼을 삭제
-- 나중에 author 테이블과 연결

alter table book drop column author;

desc book;

-- author.author_id를 참조하기 위해 author_id 컬럼을 book 테비블에 추가
alter table book add (author_id number(10));

desc book;

-- book.book_id를 number(10)으로 변경
alter table book modify book_id number(10);

desc book;

-- book.author_id -> author.author_id를 참조(FK)

ALTER TABLE book
ADD CONSTRAINT
    fk_author_id FOREIGN KEY(author_id) 
                    REFERENCES author(author_id);
-- book 테이블의 author_id 컬럼에
--      author테이블의 author_id(PK)를 참조하는 외래 키(FK) 추가
DESC book;


-- user  :  현재 로그인한 사용자 레벨의 객체들
-- all : 사용자 전체 대상의 정보
-- dba : 데이터베이스 전체에 관련된 정보들(관리자 전용)

-- 모든 딕셔너리 확인
select * from dictionary;

-- 사용자 스키가 객체
select * from user_objects;

select object_name, object_type from user_objects;

select * from user_constraints;

-- book 테이블에 걸려 있는 제약 조건 확인
select constraint_name, constraint_type, search_condition
from user_constraints
where table_name = 'BOOK';





