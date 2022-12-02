--2000 원 이하의 과자중 최소가격이 얼마인지
--모든 과자의 평균가격
--과자의 이름과 가격의 30% 할인된 금액
--3500원인 과자의 개수는 몇개?
--3000원 이하인 과자의 이름,회사이름
select * from aug30_snack;
select min(s_price) from aug30_snack where s_price <= 2000;
select avg(s_price) from aug30_snack;
select s_name, s_price * 0.7 from aug30_snack;
select count(s_price) from aug30_snack where s_price = 3500;
select s_name,s_maker from aug30_snack where s_price <= 3000;


--모든 과자 이름, 가격, 유통기한 조회
--모든 과자 이름, 가격, 부가세 조회 10%
--모든 과자 이름, 가격, 판매가 조회 20%할인
--3000원 보다 큰 금액의 과자들의 평균가 조회
--최고가,최저가,총 과자 종류 몇가지인지 조회
--3000원 이상인 과자의 전체 정보 조회
--3000원 미만인 과자의 이름, 가격, 판매가 조회 20% 할인
--허니버터칩의 가격 조회
--크라운 회사의 과자 가격 총합 조회
--9월 안으로 먹어야 하는 과자 이름, 가격, 유통기한 조회
select s_name , s_price , s_date from aug30_snack;
select s_name , s_price , s_price*0.1 as 부가세 from aug30_snack;
select s_name , s_price , s_price*0.8 as 판매가 from aug30_snack;
select avg(s_price) as 평균가 from aug30_snack where 3000<s_price;
select max(s_price), min(s_price), count(*) from aug30_snack;
select * from aug30_snack where s_price >= 3000;
select s_name,s_price,s_price*0.8 as 판매가 from aug30_snack where s_price < 3000;
select s_price from aug30_snack where s_name = '스니커즈';
select sum(s_price) "크라운 과자 가격 합계" from aug30_snack where s_maker = '크라운';
select s_name, s_price, s_date from aug30_snack where s_date < to_date('2022101000000','YYYYMMDDHH24MISS');

--'해'가 들어가는 회사에서 만든 과자의 이름 조회
--'이' 가들어가는 과자들 평균가 조회
--크라운과자거나,몽쉘~인거 이름,제조회사,가격 조회
select s_name from aug30_snack where s_maker like'%해%';
select avg(s_price) as 평균가격 from aug30_snack where s_name like'%이%'
select s_name , s_maker, s_price from aug30_snack where s_maker ='크라운' or s_name like'몽쉘%';
--과자의 이름이 '새콤달콤'으로 시작하거나 '이' 로 끝나는 과자의 이름,제조사 ,가격 조회 
where regexp_like(컬럼명,'^새콤달콤으로시작하는단어|몽쉘로끝나는단어$');
select s_name , s_maker, s_price from aug30_snack where REGEXP_LIKE(s_name,'^새콤달콤|몽쉘$'); 

--과자 데이터 중에서 회사가 크라운이고 가격이 1000원 이하이거나 3000원 이상인 과자 전체정보 조회
--or > and > not > 비교연산자 > 괄호  제일 오른쪽이 우선순위
select * from aug30_snack where s_maker = '크라운' and (s_price <= 1000 or s_price >= 3000); 모르겠다 ;;
	minus
select * from aug30_snack where s_maker in('코카콜라','롯데');

--롯데 또는 해태 회사의 과자 평균 가격이 1800 원 이상일 때 각 회사의 평균 가격 내림차 순 정렬
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

insert into aug30_snack values(aug30_snack_seq.nextval,'스니커즈','오리온',2000,sysdate);
insert into aug30_snack values(aug30_snack_seq.nextval,'오감자','롯데',2500,sysdate);
insert into aug30_snack values(aug30_snack_seq.nextval,'조지아','코카콜라',500,sysdate);
insert into aug30_snack values(aug30_snack_seq.nextval,'목캔디','롯데',3500,sysdate);
insert into aug30_snack values(aug30_snack_seq.nextval,'쿠앤쿠','오리온',1500,sysdate);
insert into aug30_snack values(aug30_snack_seq.nextval,'몽쉘통통','해태',1500,sysdate);
insert into aug30_snack values(aug30_snack_seq.nextval,'오징어땅콩','크라운',1500,sysdate);
insert into aug30_snack values(aug30_snack_seq.nextval,'이클립스','크라운',1500,sysdate);
insert into aug30_snack values(aug30_snack_seq.nextval,'새콤달콤','크라운',1500,sysdate);

--between , and 
--between 	: ~와~의사이 하지만 초과 미만의 표현이 어렴다.
--and		: 이상 ,이하, 초과,미만 표현이 가능해서 편하다

--or , in 
--or: 계속 or를 붙혀줘야한다.
--in: where s_price in (1000,2000,3000) 이렇게 쓰면 편하다. 결과의 반대갚을 가져오고 싶다면 not in 쓰면 된다 우와 편하다.

--패턴 연선자.
--문자열을 포함하는 검색 : like '패턴' 의 형태 이때 패턴에는 '%'를 넣는데 뭐가 들어갈지 모른다는 뜻.
--ex
like '%ㅋ' 	: ㅋ로 끝나는거
like 'ㅋ%'	: ㅋ로 시작하는
like '%ㅋ%'	: ㅋ가 포함

--집합연산자.
--합집합 
union : 중복되는 값을 제외하고 출력
union all : 중복되도 다출력
select 1 id, '수학' subject, 90 score from dual
	union all
select 1 id, '수학' subject, 90 score from dual
	union all
select 1 id, '수학' subject, 90 score from dual;
--교집합
intersect : 두집합의 공통되는 값 출력
select 2 id, '수학' subject, 90 score from dual
	union
select 2 id, '수학' subject, 90 score from dual
	intersect
select 2 id, '수학' subject, 90 score from dual;
--차집합
minus : 첫번째 셀렉문 중 두번째 셀렉 문에 없는 값을 출력
select 1 id, '수학' subject, 90 score from dual
	minus
select 1 id, '수학' subject, 80 score from dual
	minus
select 1 id, '수학' subject, 90 score from dual;


--Group by : 그룹으로 묶어 연산해서 하나의 결과를 나타내는것
--회사별로 그룹을 지어서 과자 평균가격, 최소가격, 최고가격 을 알고싶을때
select s_maker, avg(s_price), min(s_price), max(s_price) from aug30_snack group by s_maker;

--rollu : 
--group by lollup(그룹대상)
--컬럼에 대한 소계 를 만들어줌 group by 절의 컬럼 개수가 n 개라면 rollup를 썼을 때는 컬럼 개수가 n+1개
--회사 이름, 회사별 과자 총 가격 합계와 모든 과자들의 합계
select s_maker, sum(s_price) from aug30_snack group by rollup (s_maker);
--소계 이름이 null 로나오는데 그때 
--decode(컬럼명,조건,조건에 맞는 결과값,조건에 맞지않을때 결과값) 을 사용 : s_maker 가 null 값이면 전체 그게아니면 s_maker값
--decode 사용시 조건 자리에는 비교연산자 안먹힘, 산술연산자는 먹힘
select decode(s_maker , null, '전체',s_maker) s_maker, sum(s_price) from aug30_snack group by rollup (s_maker);
select nvl2(s_maker , s_maker, '전체') s_maker, sum(s_price) from aug30_snack group by rollup (s_maker); -- 이것도 가능한데 들어오는 null값 같은걸 지정할 수 없다.

--having : group by 절에 의해 생성된 결과 중 원하는 조건에 부합하는 자료만 찾고자 할 때 사용한다.
-- 			where 와 같이 모두 조건을 이용해서 원하는 조건에 맞는 데이터만 산출한다는 공통점이 있는데,,
--			having 은 그룹의 결과를 제한하고 
--			where 는 결과를 제한한다.... 뭔 .. .소리지; ;
--회사별로 과자 평균 가격이 2000원 이상인 회사의 이름과 과자 평균 가격을 조회.
select s_maker, avg(s_price) as 평균가 from aug30_snack group by s_maker having avg(s_price) >2000;


