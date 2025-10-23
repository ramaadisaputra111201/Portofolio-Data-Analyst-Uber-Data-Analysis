select * from `rama adi`.uberdatasetcleaned;

# POIN 1 : Pola Perjalanan Berdasarkan Kategori (Total trip, Rata-rata harian, Rata-rata durasi, Jarak tempuh rata-rata)
with data_uber as (
	select *, 
		miles * 1.60934  as distance_km,
        speed * 1.60934 as speed_kmh,
	case
		when `day` in ('Saturday', 'Sunday') then 'Weekend'
        else 'Weekdays' 
	end as day_type
	from `rama adi`.uberdatasetcleaned
)
select
	category,
    day_type,
	count(*) as total_trip,
    round(count(*)/count(distinct start_date), 2) as avg_harian,
	round(avg(case when duration > 0 then duration end), 2) as avg_duration,
    round(avg(case when distance_km > 0 then distance_km end), 2) as avg_distance_km,
    round(avg(case when speed_kmh > 0 then speed_kmh end), 2) as avg_speed_kmh
from data_uber
group by 1, 2;

# POIN 2 : Peak Hours (total trip per jam pada weekend dan weekdays ; Top 10 hari dan jam tersibuk)
#-- 2a. Total trip weekend per jam
with data_uber as (
	select *,
		miles * 1.60934 as distance_km,
        speed * 1.60934 as speed_kmh,
	case 
		when day in ('Saturday', 'Sunday') then 'Weekend'
        else 'Weekdays'
	end as day_type
    from `rama adi`.uberdatasetcleaned
)
select start_hour, 
	count(*) as total_trip_weekend
from data_uber
where day_type = 'Weekend'
group by 1
order by start_hour;

#-- 2a. Total trip weekdays per jam
with data_uber as (
	select *,
		miles * 1.60934 as distance_km,
        speed * 1.60934 as speed_kmh,
	case 
		when day in ('Saturday', 'Sunday') then 'Weekend'
        else 'Weekdays'
	end as day_type
    from `rama adi`.uberdatasetcleaned
)
select start_hour,
	count(*) as total_trip_weekdays
from data_uber
where day_type = 'Weekdays'
group by 1
order by start_hour;

#-- 2b. Top 10 hari dan jam tersibuk
with data_uber as (
	select *,
		miles * 1.60934 as distance_km,
        speed * 1.60934 as speed_kmh,
	case 
		when day in ('Saturday', 'Sunday') then 'Weekend'
        else 'Weekdays'
	end as day_type
    from `rama adi`.uberdatasetcleaned
)
select `day`, 
	start_hour,
    count(*) as total_trip
from data_uber
group by 1, 2
order by count(*) desc limit 10;

# POIN 3
## 3a. Jumlah trip yg tergolong efficient, moderate, dan inefficient
with data_uber as (
	select *,
		miles * 1.60934 as distance_km,
        speed * 1.60934 as speed_kmh,
	case
		when day in ('Saturday', 'Sunday') then 'Weekend'
        else 'Weekdays'
	end as day_type
    from `rama adi`.uberdatasetcleaned
),
treshold as (
	select *,
	 case
		when speed_kmh > 40 then 'Efficient'
        when speed_kmh between 25 and 40 then 'Moderate'
        else 'Inefficient'
	 end as Efficiency_Category
	from data_uber
)
select
	day_type,
    Efficiency_Category,
    count(*) as total_trip,
    round(avg(case when duration > 0 then duration end), 2) as avg_duration_minutes,
    round(avg(distance_km), 2) as avg_distance_km,
    round(avg(case when speed_kmh > 0 then speed_kmh end), 2) as avg_speed_kmh
from treshold
group by 1,2
order by 1,2;


## 3b. jam-jam paling banyak terjadi perjalanan tidak effisien dan presentase trip tidak effisient per jam dalam sehari
with data_uber as (
	select *,
		miles * 1.60934 as distance_km,
        speed * 1.60934 as speed_kmh,
	case
		when day in ('Saturday', 'Sunday') then 'Weekend'
        else 'Weekdays'
	end as day_type
    from `rama adi`.uberdatasetcleaned
),
threshold as (
	select *, 
		case
			when speed_kmh > 40 then 'Efficient'
			when speed_kmh between 25 and 40 then 'Moderate'
			else 'Inefficient'
		end as Efficientcy_Category
    from data_uber
),
hourly_summary as (
	select day_type,
		start_hour,
        count(*) as total_trip,
        countif(Efficientcy_Category = 'Inefficient') as Inefficient_trip
	from threshold
    group by 1, 2
)
select day_type,
	start_hour,
    total_trip,
    Inefficient_trip,
    round((Inefficient_trip/total_trip)* 100, 2) as Inefficient_Percentage
from hourly_summary
where total_trip > 10
qualify row_number() over (partition by day_type order by Inefficient_trip/total_trip desc) <= 5
order by 1, 5 desc;

## 3c.  Purpose atau tujuan trip dg persentase trip tidak effisien terbesar
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
  from `rama adi`.uberdatasetcleaned
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
qualify row_number() over(partition by day_type order by inefficient_trip/Total_trip desc) <= 2
order by 1,5 desc;

