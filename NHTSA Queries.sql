select * from crash_timestamp_correct

-- Mengubah Time Zone sesuai dengan negara bagian --
create table crash_timestamp_correct as
select x.* from
(
select distinct *,
	case
	when state_name = 'Alabama'					then timestamp_of_crash at time zone 'CST'
	when state_name = 'Alaska'					then timestamp_of_crash at time zone 'AKST'
	when state_name = 'Arizona'					then timestamp_of_crash at time zone 'MST'
	when state_name = 'Arkansas'				then timestamp_of_crash at time zone 'CST'
	when state_name = 'California'				then timestamp_of_crash at time zone 'PST'
	when state_name = 'Colorado'				then timestamp_of_crash at time zone 'MST'
	when state_name = 'Connecticut'				then timestamp_of_crash at time zone 'EST'
	when state_name = 'Delaware'				then timestamp_of_crash at time zone 'EST'
	when state_name = 'District of Columbia'	then timestamp_of_crash at time zone 'EST'
	when state_name = 'Florida'					then timestamp_of_crash at time zone 'EST'
	when state_name = 'Georgia'					then timestamp_of_crash at time zone 'EST'
	when state_name = 'Hawaii'					then timestamp_of_crash at time zone 'HST'
	when state_name = 'Idaho'					then timestamp_of_crash at time zone 'MST'
	when state_name = 'Illinois'				then timestamp_of_crash at time zone 'CST'
	when state_name = 'Indiana'					then timestamp_of_crash at time zone 'EST'
	when state_name = 'Iowa'					then timestamp_of_crash at time zone 'CST'
	when state_name = 'Kansas'					then timestamp_of_crash at time zone 'CST'
	when state_name = 'Kentucky'				then timestamp_of_crash at time zone 'EST'
	when state_name = 'Louisiana'				then timestamp_of_crash at time zone 'CST'
	when state_name = 'Maine'					then timestamp_of_crash at time zone 'EST'
	when state_name = 'Maryland'				then timestamp_of_crash at time zone 'EST'
	when state_name = 'Massachusetts'			then timestamp_of_crash at time zone 'EST'
	when state_name = 'Michigan'				then timestamp_of_crash at time zone 'EST'
	when state_name = 'Minnesota'				then timestamp_of_crash at time zone 'CST'
	when state_name = 'Mississippi'				then timestamp_of_crash at time zone 'CST'
	when state_name = 'Missouri'				then timestamp_of_crash at time zone 'CST'
	when state_name = 'Montana'					then timestamp_of_crash at time zone 'MST'
	when state_name = 'Nebraska'				then timestamp_of_crash at time zone 'CST'
	when state_name = 'Nevada'					then timestamp_of_crash at time zone 'PST'
	when state_name = 'New Hampshire'			then timestamp_of_crash at time zone 'EST'
	when state_name = 'New Jersey'				then timestamp_of_crash at time zone 'EST'
	when state_name = 'New Mexico'				then timestamp_of_crash at time zone 'MST'
	when state_name = 'New York'				then timestamp_of_crash at time zone 'EST'
	when state_name = 'North Carolina'			then timestamp_of_crash at time zone 'EST'
	when state_name = 'North Dakota'			then timestamp_of_crash at time zone 'CST'
	when state_name = 'Ohio'					then timestamp_of_crash at time zone 'EST'
	when state_name = 'Oklahoma'				then timestamp_of_crash at time zone 'CST'
	when state_name = 'Oregon'					then timestamp_of_crash at time zone 'PST'
	when state_name = 'Pennsylvania'			then timestamp_of_crash at time zone 'EST'
	when state_name = 'Rhode Island'			then timestamp_of_crash at time zone 'EST'
	when state_name = 'South Carolina'			then timestamp_of_crash at time zone 'EST'
	when state_name = 'South Dakota'			then timestamp_of_crash at time zone 'CST'
	when state_name = 'Tennessee'				then timestamp_of_crash at time zone 'CST'
	when state_name = 'Texas'					then timestamp_of_crash at time zone 'CST'
	when state_name = 'Utah'					then timestamp_of_crash at time zone 'MST'
	when state_name = 'Vermont'					then timestamp_of_crash at time zone 'EST'
	when state_name = 'Virginia'				then timestamp_of_crash at time zone 'EST'
	when state_name = 'Washington'				then timestamp_of_crash at time zone 'PST'
	when state_name = 'West Virginia'			then timestamp_of_crash at time zone 'EST'
	when state_name = 'Wisconsin'				then timestamp_of_crash at time zone 'CST'
	when state_name = 'Wyoming'					then timestamp_of_crash at time zone 'MST'
	
	end timestamp_correct
from crash
) x

-- Menghilangkan data pada tahun 2020 --

delete from crash_timestamp_correct 
where extract(year from timestamp_correct) = '2020'

-- Delete Kolom timestamp_of_crash --
alter table crash_timestamp_correct drop column timestamp_of_crash

-- update data land_use_name --		 
update crash_timestamp_correct 
set  land_use_name = 'Others'
where land_use_name = 'Not Reported' 
						or land_use_name = 'Unknown'
						or land_use_name = 'Trafficway Not in State Inventory' ;		 
					 
-- update data atmospheric_conditions_1_name --
update crash_timestamp_correct 
set  atmospheric_conditions_1_name = 'Others'
where atmospheric_conditions_1_name = 'Reported as Unknown' or atmospheric_conditions_1_name = 'Other' ;

-- update light_condition_name --

update crash_timestamp_correct 
set  light_condition_name = 'Others'
where light_condition_name = 'Reported as Unknown' 
							or light_condition_name = 'Other'
							or light_condition_name = 'Not Reported';
							


-- 1. Kondisi yang meningkatkan risiko kecelakaan --

	-- Jumlah Kejadian terkait kondisi_pencahayaan --
	
select

	light_condition_name as kondisi_pencahayaan,
	count(1) as total_kejadian

from crash_timestamp_correct

group by kondisi_pencahayaan
order by count(1) desc;

	-- Jumlah Kejadian terkait kondisi_atmosfer --
	
select

	atmospheric_conditions_1_name as kondisi_atmosfer,
	count(1) as total_kejadian

from crash_timestamp_correct

group by kondisi_atmosfer
order by count(1) desc;

	-- Jumlah Kejadian terkait tipe_persimpangan --

select

	type_of_intersection_name as tipe_persimpangan,
	count(1) as total_kejadian

from crash_timestamp_correct

group by tipe_persimpangan
order by count(1) desc;

	-- Jumlah Kejadian melibatkan jumlah_pengemudi_mabuk --

select

	number_of_drunk_drivers,
	count(1) as total_kejadian

from crash_timestamp_correct

group by number_of_drunk_drivers
order by count(1) desc;


-- 2. 10 teratas negara bagian di mana kecelakaan paling banyak terjadi --

	--  10 teratas negara bagian kecelakaan yang paling banyak --
select 
	state_name as negara_bagian,
	count(state_name) as total_kejadian

from crash_timestamp_correct

group by negara_bagian
order by total_kejadian desc
limit 10;

	--  Kecelakaan yang dipengaruhi oleh pengemudi mabuk per negara bagian --

select

	state_name,
	case 
		when number_of_drunk_drivers = 0 then 'Tidak'
		else 'Iya' 
	end as apakah_terdapat_pengemudi_mabuk,
	sum(total) as total_kejadian
	
from 
	(
	select

		state_name,
		number_of_drunk_drivers,
		count(1) as total

	from crash_timestamp_correct
	group by state_name, number_of_drunk_drivers
	order by count(1) desc
	) x

where 	state_name = 'California' or state_name = 'Florida' or state_name = 'Georgia' or state_name = 'Illinois' or
		state_name = 'Michigan' or state_name = 'North Carolina' or state_name = 'Ohio' or state_name = 'Pennsylvania'
		or state_name = 'Tennessee' or state_name = 'Texas'
group by state_name, apakah_terdapat_pengemudi_mabuk
order by state_name asc;

-- 3. Jumlah rata-rata kejadian kecelakaan perhari berdasarkan jam terjadinya kecelakaan --

select

	extract(hour from timestamp_correct) as jam_kejadian,
	count(1) as jumlah_total_kejadian_per_jam,
	(count(1) / 365) rata_rata_kejadian_per_hari_per_jam

from crash_timestamp_correct
group by jam_kejadian
order by jam_kejadian;


-- 4. Persentase kecelakaan yang disebabkan oleh pengemudi yang mabuk --

select

	case 
		when number_of_drunk_drivers = 0 then 'Tidak'
		else 'Iya' 
	end as apakah_terdapat_pengemudi_mabuk,
	sum(total) as total_kejadian,
	round((sum(total) / 35412),2) as persentase_dalam_desimal
	
from 
(
select

	number_of_drunk_drivers,
	count(1) as total
	
from crash_timestamp_correct
group by number_of_drunk_drivers
order by count(1) desc
)x

group by apakah_terdapat_pengemudi_mabuk
order by total_kejadian desc;


-- 5. Persentasi kecelakaan di daerah pedesaan dan perkotaan --

select 

	land_use_name as daerah_kecelakaan,
	count(1) as jumlah_kejadian,
	round((count(1)::numeric / 34930),2) as persentase_dalam_desimal
	
from crash_timestamp_correct

where land_use_name = 'Rural' or land_use_name = 'Urban'
group by land_use_name;


-- 6. Jumlah kecelakaan berdasarkan hari --

select

	to_char(timestamp_correct,'Day') as hari_kejadian,
	count(1) as jumlah_kejadian

from crash_timestamp_correct
group by to_char(timestamp_correct,'Day')
order by

	case
	when to_char(timestamp_correct,'Day') like 'Monday%'		then 1
	when to_char(timestamp_correct,'Day') like 'Tuesday%'		then 2
	when to_char(timestamp_correct,'Day') like 'Wednesday%'		then 3
	when to_char(timestamp_correct,'Day') like 'Thursday%'		then 4
	when to_char(timestamp_correct,'Day') like 'Friday%'		then 5
	when to_char(timestamp_correct,'Day') like 'Saturday%'		then 6
	else 7
	end asc;