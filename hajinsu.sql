--테이블 생성
create table author(
author_id number(10),
author_name VARCHAR(100) not null,
author_desc VARCHAR(500),
primary key (author_id));

--시퀀스 생성
create sequence seq_author_id
start with 10
INCREMENT by 1
MAXVALUE 10000000
NOCACHE;

-- test insert
insert into author(author_id, author_name)
values(seq_author_id.nextval, '황순원');
commit;

select * from author;

--test insert
insert into author(author_id, author_name)
values(seq_author_id.nextval,'홍길동');


insert into author(author_id, author_name)
values(seq_author_id.nextval,'고길동');

commit;

select * from author;