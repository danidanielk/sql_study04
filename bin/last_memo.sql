--between , and 
--between 	: ~와~의사이 하지만 초과 미만의 표현이 어렴다.
--and		: 이상 ,이하, 초과,미만 표현이 가능해서 편하다



--or , in 
--or: 계속 or를 붙혀줘야한다.
--in: where s_price in (1000,2000,3000) 이렇게 쓰면 편하다. 결과의 반대갚을 가져오고 싶다면 not in 쓰면 된다 우와 편하다.



--패턴 연선자.
--like : 자열을 포함하는 검색 : like '패턴' 의 형태 이때 패턴에는 '%'를 넣는데 뭐가 들어갈지 모른다는 뜻.
like '%ㅋ' 	: ㅋ로 끝나는거
like 'ㅋ%'	: ㅋ로 시작하는
like '%ㅋ%'	: ㅋ가 포함
--regexp_like
where regexp_like(컬럼명,'^새콤달콤으로시작하는단어|몽쉘로끝나는단어$');
select s_name , s_maker, s_price from aug30_snack where REGEXP_LIKE(s_name,'^새콤달콤|몽쉘$'); 


--집합연산자.
--합집합 
union : 중복되는 값을 제외하고 출력
--교집합
intersect : 두집합의 공통되는 값 출력
--차집합
minus : 첫번째 셀렉문 중 두번째 셀렉 문에 없는 값을 출력



--Group by : 그룹으로 묶어 연산해서 하나의 결과를 나타내는것
--회사별로 그룹을 지어서 과자 평균가격, 최소가격, 최고가격 을 알고싶을때
select s_maker, avg(s_price), min(s_price), max(s_price) from aug30_snack group by s_maker;



--rollup : 
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



--or > and > not > 비교연산자 > 괄호  제일 오른쪽이 우선순위