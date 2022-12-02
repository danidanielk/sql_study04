웹사이트에서 게시판에 대한 테이블과 이를 참조하는 게시판 댓글 테이블을 만들자
--게시판 테이블에는 작성자 / 게시판 글 내용 / 작성시간 에 대한 부분필요
--댓글 테이블에는 작성자 / 댓글내용 / 작성시간 에 대한 부분 필요.
-- 1. 테이블의 구조를 파악해서 게시판 테이블 만들기
-- 2. 테이블의 구조를 파악해서 댓글 테이블 만들기 [조건 : 참조되는 테이블의 내용이 삭제되면 관련 댓글 내용도 삭제]
-- 3. 각각의 테이블에 값을 2개씩만 넣기

create table blog (
b_name varchar2(20char) default = '조은블로그'
b_writer varchar2(20char) primary key,
b_contents varchar2(50char) not null,
b_date date not null
);

create table comment (
c_no number(4) primary key
c_writer varchar2(20char) not null,
c_comment varchar2(30char) not null,
c_date date not null,
	constraint writer foreign key(c_writer)
	references blog(b_writer)
	on delete cascade
);

create sequence comment_seq;

insert into blog values(default,'다니','게시판1',sysdate);
insert into blog values(default,'세니','게시판2',sysdate);

insert into comment values(comment_seq.nextval,'다니','안녕하세요 다니에요',sysdate)
insert into comment values(comment_seq.nextval,'세니','안녕하세요 세니에요',sysdate)