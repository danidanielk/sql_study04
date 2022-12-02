--2000 원 이하의 과자중 최소가격이 얼마인지
select min(s_price) from AUG30_SNACK where s_price <=2000;
--모든 과자의 평균가격
select avg(s_price) from aug30_snack;
--과자의 이름과 가격의 30% 할인된 금액
select s_name, s_price*0.7 from aug30_snack;
--3500원인 과자의 개수는 몇개?
select count(s_price) from aug30_snack where s_price = 3500;
--3000원 이하인 과자의 이름,회사이름
select s_name,s_maker from aug30_snack where s_price <=3000;
--모든 과자 이름, 가격, 유통기한 조회
select s_name, s_price , s_date from aug30_snack;
--모든 과자 이름, 가격, 부가세 조회 10%
select s_name , s_price , s_price*0.1 as 부가세 from aug30_snack;
--모든 과자 이름, 가격, 판매가 조회 20%할인
select s_name , s_price , s_price*0.8 as 판매가 from aug30_snack;
--3000원 보다 큰 금액의 과자들의 평균가 조회
select avg(s_price) from aug30_snack where s_price > 3000;
--최고가,최저가,총 과자 종류 몇가지인지 조회
select max(s_price),min(s_price),count(s_name)from aug30_snack;
--3000원 이상인 과자의 전체 정보 조회
select * from aug30_snack where s_price >= 3000;
--3000원 미만인 과자의 이름, 가격, 판매가 조회 20% 할인
select s_name ,s_price , s_price*0.8 as 판매가 from aug30_snack where s_price <3000;
--허니버터칩의 가격 조회
select s_price from aug30_snack where s_name='스니커즈';
--크라운 회사의 과자 가격 총합 조회
select sum(s_price) from aug30_snack where s_maker ='크라운';
--9월 안으로 먹어야 하는 과자 이름, 가격, 유통기한 조회
select s_name, s_price , s_date from aug30_snack where s_date < to_date('2022-10-01 00:00:00','YYYY-MM-DD HH24-MI-SS');
--'해'가 들어가는 회사에서 만든 과자의 이름 조회
select s_name from aug30_snack where s_maker like'%해%';
--'이' 가들어가는 과자들 평균가 조회
select avg(s_price) from aug30_snack where s_maker like'%이%';
--크라운과자거나,몽쉘~인거 이름,제조회사,가격 조회
select s_name,s_maker,s_price from aug30_snack where s_maker='크라운' or s_name like '%몽쉘%';
--과자의 이름이 '새콤달콤'으로 시작하거나 '이' 로 끝나는 과자의 이름,제조사 ,가격 조회 
select s_name, s_maker, s_price from aug30_snack where s_name like'새콤달콤%' or s_name like '%이';
--과자 데이터 중에서 회사가 크라운이고 가격이 1000원 이하이거나 3000원 이상인 과자 전체정보 조회
select * from aug30_snack where (s_maker ='크라운') and (s_price <= 1000 or s_price >=3000);
--롯데 또는 해태 회사의 과자 평균 가격이 1800 원 이상일 때 각 회사의 평균 가격 내림차 순 정렬
select s_maker , round(avg(s_price)) from aug30_snack group by s_maker having avg(s_price) >= 1800 order by avg(s_price) desc;
--회사별로 그룹을 지어서 과자 평균가격, 최소가격, 최고가격 을 알고싶을때
select decode(s_maker,null,'전체',s_maker)s_maker,sum(s_price)as 합계,round(avg(s_price)) as 평균가,min(s_price)as 최소가,max(s_price)as 최고가 from aug30_snack group by rollup(s_maker);
--회사 이름, 회사별 과자 총 가격 합계와 모든 과자들의 합계
select decode(s_maker,null,'전체',s_maker)s_maker,sum(s_price) as 합계 from aug30_snack group by rollup(s_maker);
--회사별로 과자 평균 가격이 2000원 이상인 회사의 이름과 과자 평균 가격을 조회.
select decode(s_maker,null,'전체',s_maker)s_maker,round(avg(s_price)) as 평균가격,count(s_name)as 과자종류 from aug30_snack group by rollup(s_maker) having avg(s_price)>=2000 order by count(s_name)asc;

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
insert into aug30_snack values(aug30_snack_seq.nextval,'오징어땅콩','크라운',2000,sysdate);
insert into aug30_snack values(aug30_snack_seq.nextval,'이클립스','크라운',4000,sysdate);
insert into aug30_snack values(aug30_snack_seq.nextval,'새콤달콤','크라운',3000,sysdate);
insert into aug30_snack values(aug30_snack_seq.nextval,'오땅','해태',1000,sysdate);
insert into aug30_snack values(aug30_snack_seq.nextval,'바게트','크라운',1000,sysdate);
insert into aug30_snack values(aug30_snack_seq.nextval,'커피사탕','해태',5000,sysdate);
insert into aug30_snack values(aug30_snack_seq.nextval,'치즈케이크','오리온',4500,sysdate);
insert into aug30_snack values(aug30_snack_seq.nextval,'족발','해태',2500,sysdate);
insert into aug30_snack values(aug30_snack_seq.nextval,'불고기버거','롯데',3000,sysdate);

select * from user_sequences;
select * from aug30_snack;
drop table aug30_snack cascade constraint purge;
drop table BIN$Mf6HzF7PSTOue5BiSzmuGg==$0 cascade constraint purge;
drop table bin$nnpnuycwtuev9whw/nbhug==$0 cascade constraint purge;
drop table blog cascade constraint purge;
drop table comments cascade constraint purge;