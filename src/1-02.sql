������Ʈ���� �Խ��ǿ� ���� ���̺�� �̸� �����ϴ� �Խ��� ��� ���̺��� ������
--�Խ��� ���̺��� �ۼ��� / �Խ��� �� ���� / �ۼ��ð� �� ���� �κ��ʿ�
--��� ���̺��� �ۼ��� / ��۳��� / �ۼ��ð� �� ���� �κ� �ʿ�.
-- 1. ���̺��� ������ �ľ��ؼ� �Խ��� ���̺� �����
-- 2. ���̺��� ������ �ľ��ؼ� ��� ���̺� ����� [���� : �����Ǵ� ���̺��� ������ �����Ǹ� ���� ��� ���뵵 ����]
-- 3. ������ ���̺� ���� 2������ �ֱ�

create table blog (
b_name varchar2(20char) default = '������α�'
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

insert into blog values(default,'�ٴ�','�Խ���1',sysdate);
insert into blog values(default,'����','�Խ���2',sysdate);

insert into comment values(comment_seq.nextval,'�ٴ�','�ȳ��ϼ��� �ٴϿ���',sysdate)
insert into comment values(comment_seq.nextval,'����','�ȳ��ϼ��� ���Ͽ���',sysdate)