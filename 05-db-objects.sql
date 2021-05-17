

--system 계정으로 create 권한 부여
grant create view to c##hajinsu;

-- simple view 생성
-- 단일 테이블, 함수나 연산식을 포함한 컬럼이 없는 단순 뷰

drop table emp123;

-- 새로운 테이블 생성
create table emp123
as select * from hr.employees
where department_id in (10,20,30);

select * from emp123;

-- emp123을 기반으로 30번 부서 사람들만 보여주는 view 생성
create or replace view emp10
as select employee_id, first_name, last_name, salary
from emp123
where department_id = 10;

desc emp10;

--view는 테이블처럼 select 가능
-- 실제 데이터는 원본 더이블 내에 있는 데이터를 활용
select * from emp10;

select first_name||' '||last_name "Name"
   FROM emp10;
   
--simple view는 제약 사항에 위배되지 않으면 내용 갱신이 가능
select first_name, salary from emp123;
rollback;

update emp10 set salary = salary*2;
select first_name, salary from emp10;
select first_name, salary from emp123;
rollback;

--view는 가급적 조회 용으로 사용
--삽입, 수정, 삭제 등의 기능은 왠만하면 사용하지 않는 것이 좋음
-- read only 옵셥 부여
create or replace view emp10
as select employee_id, first_name, last_name, salary
        from emp123
        where department_id = 10
        with read only;
        
select * from emp10;

update emp10 set salary = salary*2;

-- read only view에선 DML 명령어 사용 불가

--복합 뷰

desc author;
desc book;

select * from author;
select * from book;

--author과 book을 join하는 복합 뷰 생성
create or replace view book_detail
(book_id, title,author_name, pub_date)
as select book_id, title, author_name, pub_date
from book b, author a
where b.author_id = a.author_id;

desc book_detail;
select * from book_detail;

update book_detail set author_name='Unknown';
-- 복합 뷰에서는 기본적으로 DML 수행 불가능

select * from user_views;
select view_name, text from user_views;

select * from user_objects
where object_type = 'VIEW';

drop view book_detail;
select * from user_views;

--index = 검색 속도 개선
create table s_emp
as select * from HR.employees;

-- s_emp 테이블의 employeed_id 컬럼에 unique index를 생성
create unique index s_emp_id_pk
on s_emp (employee_id);

select * from user_indexes;

--어느 컬럼에 인덱스가 걸려 있는지 확인

select * from user_ind_columns;

select t.index_name, c.column_name, c.column_position
from user_indexes t, user_ind_columns c
where t.index_name = c.index_name
and t.table_name = 'S_EMP';

-- 자주 사용되는 테이블은 인덱스를 계속 갱신해야 하는 단점이 있다
-- 인덱스가 성능 저하를 발생하는 경우도 있어 꼭 필요한 컬럼에만 인덱스 부여

-- 인덱스 제거하기
drop index s_emp_id_pk;
select * from user_indexes;

desc author;
select * from author;

--author 추가
insert into author(author_id, author_name)
values( (select max(author_id) + 1 from author), 'UnKnown');
select * from author;

--유일한 pk를 확보해야 할 경우 sequence를 이용 유일한 정수 값을 확보한다
rollback;

--시퀀스 생성
select max(author_id) +1 from author;

create sequence seq_author_id
start with 3
increment by 1
minvalue 1
maxvalue 10000000
nocache;

-- 시퀀스 이용한 pk의 부여
insert into author (author_id, author_name)
values(seq_author_id.nextval, 'Steven King');

select * from author;

insert into author (author_id, author_name)
values(seq_author_id.nextval, 'Jinsu King');

select * from author;
commit;

-- 새 시퀀스
create sequence my_seq
start with 1
increment by 1
minvalue 1
maxvalue 10
nocache;

--새 시퀀스 생성
select my_seq.nextval from dual;
select my_seq.currval from dual;

--시퀀스 수정하기
alter sequence my_seq
increment by 2
maxvalue 10000;

select my_seq.nextval from dual;
select my_seq.currval from dual;

--시퀀스 딕셔너리
select * from user_sequences;


select max(book_id) from book;

create sequence seq_book_id
start with 3
increment by 1
minvalue 1
maxvalue 10000
nocache;

select * from user_sequences;





