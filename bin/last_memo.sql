--between , and 
--between 	: ~��~�ǻ��� ������ �ʰ� �̸��� ǥ���� ��Ŵ�.
--and		: �̻� ,����, �ʰ�,�̸� ǥ���� �����ؼ� ���ϴ�



--or , in 
--or: ��� or�� ��������Ѵ�.
--in: where s_price in (1000,2000,3000) �̷��� ���� ���ϴ�. ����� �ݴ백�� �������� �ʹٸ� not in ���� �ȴ� ��� ���ϴ�.



--���� ������.
--like : �ڿ��� �����ϴ� �˻� : like '����' �� ���� �̶� ���Ͽ��� '%'�� �ִµ� ���� ���� �𸥴ٴ� ��.
like '%��' 	: ���� �����°�
like '��%'	: ���� �����ϴ�
like '%��%'	: ���� ����
--regexp_like
where regexp_like(�÷���,'^���޴������ν����ϴ´ܾ�|�����γ����´ܾ�$');
select s_name , s_maker, s_price from aug30_snack where REGEXP_LIKE(s_name,'^���޴���|����$'); 


--���տ�����.
--������ 
union : �ߺ��Ǵ� ���� �����ϰ� ���
--������
intersect : �������� ����Ǵ� �� ���
--������
minus : ù��° ������ �� �ι�° ���� ���� ���� ���� ���



--Group by : �׷����� ���� �����ؼ� �ϳ��� ����� ��Ÿ���°�
--ȸ�纰�� �׷��� ��� ���� ��հ���, �ּҰ���, �ְ��� �� �˰������
select s_maker, avg(s_price), min(s_price), max(s_price) from aug30_snack group by s_maker;



--rollup : 
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



--or > and > not > �񱳿����� > ��ȣ  ���� �������� �켱����