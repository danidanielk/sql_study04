--2000 �� ������ ������ �ּҰ����� ������
--��� ������ ��հ���
--������ �̸��� ������ 30% ���ε� �ݾ�
--3500���� ������ ������ �?
--3000�� ������ ������ �̸�,ȸ���̸�
select * from aug30_snack;
select min(s_price) from aug30_snack where s_price <= 2000;
select avg(s_price) from aug30_snack;
select s_name, s_price * 0.7 from aug30_snack;
select count(s_price) from aug30_snack where s_price = 3500;
select s_name,s_maker from aug30_snack where s_price <= 3000;


--��� ���� �̸�, ����, ������� ��ȸ
--��� ���� �̸�, ����, �ΰ��� ��ȸ 10%
--��� ���� �̸�, ����, �ǸŰ� ��ȸ 20%����
--3000�� ���� ū �ݾ��� ���ڵ��� ��հ� ��ȸ
--�ְ�,������,�� ���� ���� ������� ��ȸ
--3000�� �̻��� ������ ��ü ���� ��ȸ
--3000�� �̸��� ������ �̸�, ����, �ǸŰ� ��ȸ 20% ����
--��Ϲ���Ĩ�� ���� ��ȸ
--ũ��� ȸ���� ���� ���� ���� ��ȸ
--9�� ������ �Ծ�� �ϴ� ���� �̸�, ����, ������� ��ȸ
select s_name , s_price , s_date from aug30_snack;
select s_name , s_price , s_price*0.1 as �ΰ��� from aug30_snack;
select s_name , s_price , s_price*0.8 as �ǸŰ� from aug30_snack;
select avg(s_price) as ��հ� from aug30_snack where 3000<s_price;
select max(s_price), min(s_price), count(*) from aug30_snack;
select * from aug30_snack where s_price >= 3000;
select s_name,s_price,s_price*0.8 as �ǸŰ� from aug30_snack where s_price < 3000;
select s_price from aug30_snack where s_name = '����Ŀ��';
select sum(s_price) "ũ��� ���� ���� �հ�" from aug30_snack where s_maker = 'ũ���';
select s_name, s_price, s_date from aug30_snack where s_date < to_date('2022101000000','YYYYMMDDHH24MISS');

--'��'�� ���� ȸ�翡�� ���� ������ �̸� ��ȸ
--'��' ������ ���ڵ� ��հ� ��ȸ
--ũ�����ڰų�,����~�ΰ� �̸�,����ȸ��,���� ��ȸ
select s_name from aug30_snack where s_maker like'%��%';
select avg(s_price) as ��հ��� from aug30_snack where s_name like'%��%'
select s_name , s_maker, s_price from aug30_snack where s_maker ='ũ���' or s_name like'����%';
--������ �̸��� '���޴���'���� �����ϰų� '��' �� ������ ������ �̸�,������ ,���� ��ȸ 
where regexp_like(�÷���,'^���޴������ν����ϴ´ܾ�|�����γ����´ܾ�$');
select s_name , s_maker, s_price from aug30_snack where REGEXP_LIKE(s_name,'^���޴���|����$'); 

--���� ������ �߿��� ȸ�簡 ũ����̰� ������ 1000�� �����̰ų� 3000�� �̻��� ���� ��ü���� ��ȸ
--or > and > not > �񱳿����� > ��ȣ  ���� �������� �켱����
select * from aug30_snack where s_maker = 'ũ���' and (s_price <= 1000 or s_price >= 3000); �𸣰ڴ� ;;
	minus
select * from aug30_snack where s_maker in('��ī�ݶ�','�Ե�');

--�Ե� �Ǵ� ���� ȸ���� ���� ��� ������ 1800 �� �̻��� �� �� ȸ���� ��� ���� ������ �� ����
select s_maker, avg(s_price) from aug30_snack group by s_maker having avg(s_price)>= 1800 order by s_maker desc; 
select avg(s_price) from aug30_snack;
alter table aug30_snack add s_date date;
truncate table aug30_snack;
drop table aug30_snack;

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
insert into aug30_snack values(aug30_snack_seq.nextval,'��¡���','ũ���',1500,sysdate);
insert into aug30_snack values(aug30_snack_seq.nextval,'��Ŭ����','ũ���',1500,sysdate);
insert into aug30_snack values(aug30_snack_seq.nextval,'���޴���','ũ���',1500,sysdate);

--between , and 
--between 	: ~��~�ǻ��� ������ �ʰ� �̸��� ǥ���� ��Ŵ�.
--and		: �̻� ,����, �ʰ�,�̸� ǥ���� �����ؼ� ���ϴ�

--or , in 
--or: ��� or�� ��������Ѵ�.
--in: where s_price in (1000,2000,3000) �̷��� ���� ���ϴ�. ����� �ݴ백�� �������� �ʹٸ� not in ���� �ȴ� ��� ���ϴ�.

--���� ������.
--���ڿ��� �����ϴ� �˻� : like '����' �� ���� �̶� ���Ͽ��� '%'�� �ִµ� ���� ���� �𸥴ٴ� ��.
--ex
like '%��' 	: ���� �����°�
like '��%'	: ���� �����ϴ�
like '%��%'	: ���� ����

--���տ�����.
--������ 
union : �ߺ��Ǵ� ���� �����ϰ� ���
union all : �ߺ��ǵ� �����
select 1 id, '����' subject, 90 score from dual
	union all
select 1 id, '����' subject, 90 score from dual
	union all
select 1 id, '����' subject, 90 score from dual;
--������
intersect : �������� ����Ǵ� �� ���
select 2 id, '����' subject, 90 score from dual
	union
select 2 id, '����' subject, 90 score from dual
	intersect
select 2 id, '����' subject, 90 score from dual;
--������
minus : ù��° ������ �� �ι�° ���� ���� ���� ���� ���
select 1 id, '����' subject, 90 score from dual
	minus
select 1 id, '����' subject, 80 score from dual
	minus
select 1 id, '����' subject, 90 score from dual;


--Group by : �׷����� ���� �����ؼ� �ϳ��� ����� ��Ÿ���°�
--ȸ�纰�� �׷��� ��� ���� ��հ���, �ּҰ���, �ְ��� �� �˰������
select s_maker, avg(s_price), min(s_price), max(s_price) from aug30_snack group by s_maker;

--rollu : 
--group by lollup(�׷���)
--�÷��� ���� �Ұ� �� ������� group by ���� �÷� ������ n ����� rollup�� ���� ���� �÷� ������ n+1��
--ȸ�� �̸�, ȸ�纰 ���� �� ���� �հ�� ��� ���ڵ��� �հ�
select s_maker, sum(s_price) from aug30_snack group by rollup (s_maker);
--�Ұ� �̸��� null �γ����µ� �׶� 
--decode(�÷���,����,���ǿ� �´� �����,���ǿ� ���������� �����) �� ��� : s_maker �� null ���̸� ��ü �װԾƴϸ� s_maker��
--decode ���� ���� �ڸ����� �񱳿����� �ȸ���, ��������ڴ� ����
select decode(s_maker , null, '��ü',s_maker) s_maker, sum(s_price) from aug30_snack group by rollup (s_maker);
select nvl2(s_maker , s_maker, '��ü') s_maker, sum(s_price) from aug30_snack group by rollup (s_maker); -- �̰͵� �����ѵ� ������ null�� ������ ������ �� ����.

--having : group by ���� ���� ������ ��� �� ���ϴ� ���ǿ� �����ϴ� �ڷḸ ã���� �� �� ����Ѵ�.
-- 			where �� ���� ��� ������ �̿��ؼ� ���ϴ� ���ǿ� �´� �����͸� �����Ѵٴ� �������� �ִµ�,,
--			having �� �׷��� ����� �����ϰ� 
--			where �� ����� �����Ѵ�.... �� .. .�Ҹ���; ;
--ȸ�纰�� ���� ��� ������ 2000�� �̻��� ȸ���� �̸��� ���� ��� ������ ��ȸ.
select s_maker, avg(s_price) as ��հ� from aug30_snack group by s_maker having avg(s_price) >2000;


