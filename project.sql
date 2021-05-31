

create user c##bituser IDENTIFIED BY bituser;

-- 사용자 계정에게 접속 권한 부여
grant create session to c##bituser;

-- 데이트베이스 접속, 테이블 생성을 위해 권한 부여
grant connect, resource to c##bituser;

alter user c##bituser default tablespace users quota unlimited on users;



create table phoneBooKList(
    id number(10) PRIMARY KEY,
    name varchar(20) not null,
    hp varchar(30) not null,
    tel varchar(30) not null -- 날짜 타입 기본값: 현재 날짜와 시간
    );
    
drop sequence SEQ_PHONE_BOOK_PK;
create sequence SEQ_PHONE_BOOK_PK
start with 1
increment by 1
minvalue 1
maxvalue 10000000
nocache;


insert into phoneBooKList (id, name, hp, tel)
values(SEQ_PHONE_BOOK_PK.nextval, '고길동','010-2632-2615','02-345-6895');

insert into phoneBooKList (id, name, hp, tel)
values(SEQ_PHONE_BOOK_PK.nextval, '도우너','010-2167-9530','02-347-5195');

insert into phoneBooKList (id, name, hp, tel)
values(SEQ_PHONE_BOOK_PK.nextval, '마이콜','010-1594-2209','02-348-4975');

insert into phoneBooKList (id, name, hp, tel)
values(SEQ_PHONE_BOOK_PK.nextval, '또치','010-4059-4930','02-345-6819');

insert into phoneBooKList (id, name, hp, tel)
values(SEQ_PHONE_BOOK_PK.nextval, '남승균','010-3363-9969','02-359-6479');


select id, name, hp, tel from phoneBooKList;

COMMIT;


insert into phoneBooKList values(7,'냥ㅇㅇ','0400404040','ㅇㄹㄴㅇㄹㄴㅇ');








