SELECT first_name, last_name, salary AS emp_salary
FROM employee
ORDER BY emp_salary DESC;

-- ORDER BY 할 때 염두에 둘것
-- WHERE 조건에 적어둔 필터링 기준 컬럼이 INDEX 가 설정되어 있는 경우,
-- 자동으로 해당 INDEX 에 따라서 정렬된 결과가 출력됨

select *
from bank_account
where account_number > 4; -- WHERE 조건에 들어온 인텍스가 사용되면서 자동 정렬

select *
from drink_order;

select *
from drink_order
order by customer_id is null;
-- null 아닌 경우 : 0, null 인 경우 TRUE : 1
-- ORDER BY customer_id NULLS LAST; ANSI 표준이 아님

select *
from drink_order
order by 3, 4;

select customer_id, SUM(total_amount)
from drink_order
group by customer_id
order by sum(total_amount) desc;

select *
from drink_order
order by case order_status
             when 'completed' then total_amount
             -- null 값인 경우 case 문 처리 확인
             end;