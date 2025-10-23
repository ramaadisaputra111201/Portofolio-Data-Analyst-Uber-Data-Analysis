-- Poin 3

with base_data as (
  select *,
  -- Convert miles and speeds to km and km/h
  MILES * 1.60934 as distance_km,
  speed * 1.60934 as speed_kmh,
  -- Beri keterangan day_type
  case
    when day in ('Saturday','Sunday') then 'Weekend'
    else 'Weekdays' 
  end as day_type
  from `iron-bedrock-474713-d7.Uber.uber_clean` 
),

threshold as (
select *,
  case
    when speed_kmh > 40 then 'Efficient'
    when speed_kmh between 25 and 40 then 'Moderate'
    else 'Inefficient'
  end as Efficient_Category
from base_data 
),

purpose_summary as (
  select
    day_type,
    purpose,
    count(*) as Total_trip,
    countif(Efficient_Category = 'Inefficient') as inefficient_trip
  from threshold
  group by 1,2
)

select
  day_type,
  purpose,
  inefficient_trip,
  Total_trip,
  round((inefficient_trip/Total_trip)*100, 2) as inefficient_percentage
from purpose_summary
-- where Total_trip > 10
qualify row_number() over(partition by day_type order by inefficient_trip/Total_trip desc) <= 2
order by 1,5 desc;
