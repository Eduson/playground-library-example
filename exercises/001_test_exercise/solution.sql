SELECT employee,
       type,
       sum,
       RANK() OVER(PARTITION BY employee ORDER BY sum DESC) AS rnk
FROM transactions
ORDER BY employee DESC, rnk