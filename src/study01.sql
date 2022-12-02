--2000 �� ������ ������ �ּҰ����� ������
select min(s_price) from AUG30_SNACK where s_price <=2000;
--��� ������ ��հ���
select avg(s_price) from aug30_snack;
--������ �̸��� ������ 30% ���ε� �ݾ�
select s_name, s_price*0.7 from aug30_snack;
--3500���� ������ ������ �?
select count(s_price) from aug30_snack where s_price = 3500;
--3000�� ������ ������ �̸�,ȸ���̸�
select s_name,s_maker from aug30_snack where s_price <=3000;
--��� ���� �̸�, ����, ������� ��ȸ
select s_name, s_price , s_date from aug30_snack;
--��� ���� �̸�, ����, �ΰ��� ��ȸ 10%
select s_name , s_price , s_price*0.1 as �ΰ��� from aug30_snack;
--��� ���� �̸�, ����, �ǸŰ� ��ȸ 20%����
select s_name , s_price , s_price*0.8 as �ǸŰ� from aug30_snack;
--3000�� ���� ū �ݾ��� ���ڵ��� ��հ� ��ȸ
select avg(s_price) from aug30_snack where s_price > 3000;
--�ְ�,������,�� ���� ���� ������� ��ȸ
select max(s_price),min(s_price),count(s_name)from aug30_snack;
--3000�� �̻��� ������ ��ü ���� ��ȸ
select * from aug30_snack where s_price >= 3000;
--3000�� �̸��� ������ �̸�, ����, �ǸŰ� ��ȸ 20% ����
select s_name ,s_price , s_price*0.8 as �ǸŰ� from aug30_snack where s_price <3000;
--��Ϲ���Ĩ�� ���� ��ȸ
select s_price from aug30_snack where s_name='����Ŀ��';
--ũ��� ȸ���� ���� ���� ���� ��ȸ
select sum(s_price) from aug30_snack where s_maker ='ũ���';
--9�� ������ �Ծ�� �ϴ� ���� �̸�, ����, ������� ��ȸ
select s_name, s_price , s_date from aug30_snack where s_date < to_date('2022-10-01 00:00:00','YYYY-MM-DD HH24-MI-SS');
--'��'�� ���� ȸ�翡�� ���� ������ �̸� ��ȸ
select s_name from aug30_snack where s_maker like'%��%';
--'��' ������ ���ڵ� ��հ� ��ȸ
select avg(s_price) from aug30_snack where s_maker like'%��%';
--ũ�����ڰų�,����~�ΰ� �̸�,����ȸ��,���� ��ȸ
select s_name,s_maker,s_price from aug30_snack where s_maker='ũ���' or s_name like '%����%';
--������ �̸��� '���޴���'���� �����ϰų� '��' �� ������ ������ �̸�,������ ,���� ��ȸ 
select s_name, s_maker, s_price from aug30_snack where s_name like'���޴���%' or s_name like '%��';
--���� ������ �߿��� ȸ�簡 ũ����̰� ������ 1000�� �����̰ų� 3000�� �̻��� ���� ��ü���� ��ȸ
select * from aug30_snack where (s_maker ='ũ���') and (s_price <= 1000 or s_price >=3000);
--�Ե� �Ǵ� ���� ȸ���� ���� ��� ������ 1800 �� �̻��� �� �� ȸ���� ��� ���� ������ �� ����
select s_maker , round(avg(s_price)) from aug30_snack group by s_maker having avg(s_price) >= 1800 order by avg(s_price) desc;
--ȸ�纰�� �׷��� ��� ���� ��հ���, �ּҰ���, �ְ��� �� �˰������
select decode(s_maker,null,'��ü',s_maker)s_maker,sum(s_price)as �հ�,round(avg(s_price)) as ��հ�,min(s_price)as �ּҰ�,max(s_price)as �ְ� from aug30_snack group by rollup(s_maker);
--ȸ�� �̸�, ȸ�纰 ���� �� ���� �հ�� ��� ���ڵ��� �հ�
select decode(s_maker,null,'��ü',s_maker)s_maker,sum(s_price) as �հ� from aug30_snack group by rollup(s_maker);
--ȸ�纰�� ���� ��� ������ 2000�� �̻��� ȸ���� �̸��� ���� ��� ������ ��ȸ.
select decode(s_maker,null,'��ü',s_maker)s_maker,round(avg(s_price)) as ��հ���,count(s_name)as �������� from aug30_snack group by rollup(s_maker) having avg(s_price)>=2000 order by count(s_name)asc;

create table aug30_snack (
s_no number(5) primary key,
s_name varchar(10 char) not null,
s_maker varchar(10 char) not null,
s_price number(10)not null,
s_date date not null
);

create sequence aug30_snack_seq;

insert into aug30_snack values(aug30_snack_seq.nextval,'����Ŀ��','������',2000,sysdate);
insert into aug30_snack values(aug30_snack_seq.nextval,'������','�Ե�',2500,sysdate);
insert into aug30_snack values(aug30_snack_seq.nextval,'������','��ī�ݶ�',500,sysdate);
insert into aug30_snack values(aug30_snack_seq.nextval,'��ĵ��','�Ե�',3500,sysdate);
insert into aug30_snack values(aug30_snack_seq.nextval,'�����','������',1500,sysdate);
insert into aug30_snack values(aug30_snack_seq.nextval,'��������','����',1500,sysdate);
insert into aug30_snack values(aug30_snack_seq.nextval,'��¡���','ũ���',2000,sysdate);
insert into aug30_snack values(aug30_snack_seq.nextval,'��Ŭ����','ũ���',4000,sysdate);
insert into aug30_snack values(aug30_snack_seq.nextval,'���޴���','ũ���',3000,sysdate);
insert into aug30_snack values(aug30_snack_seq.nextval,'����','����',1000,sysdate);
insert into aug30_snack values(aug30_snack_seq.nextval,'�ٰ�Ʈ','ũ���',1000,sysdate);
insert into aug30_snack values(aug30_snack_seq.nextval,'Ŀ�ǻ���','����',5000,sysdate);
insert into aug30_snack values(aug30_snack_seq.nextval,'ġ������ũ','������',4500,sysdate);
insert into aug30_snack values(aug30_snack_seq.nextval,'����','����',2500,sysdate);
insert into aug30_snack values(aug30_snack_seq.nextval,'�Ұ�����','�Ե�',3000,sysdate);

select * from user_sequences;
select * from aug30_snack;
drop table aug30_snack cascade constraint purge;
drop table BIN$Mf6HzF7PSTOue5BiSzmuGg==$0 cascade constraint purge;
drop table bin$nnpnuycwtuev9whw/nbhug==$0 cascade constraint purge;
drop table blog cascade constraint purge;
drop table comments cascade constraint purge;