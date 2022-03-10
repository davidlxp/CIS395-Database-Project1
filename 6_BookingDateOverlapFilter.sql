-- The query below validates the date input for a new record --
--
-- Output: 
--   there will be 2 columns in the output -->
--   'newRecordValid' = 1 (TRUE) means in new record "dateTo" <= "dateFrom". Otherwise, it will be 0 (FALSE).
--   'noOverlapIssue' = 1 (TRUE) means no exsiting record has date conflict with the new record. Otherwise 0 (FALSE).
--
-- How to use output:
--   only when both output columns show 1 means the "date" information of the new record is valid.
--   Otherwise, the user need to adjust the value of "dateFrom" or "dateTo" for the new record
--
-- Describe validation procedure: 
--   in a Python script, save the following SQL codes to a string variable called "validationSql".
--   replacing the actual values in the "newRecord" subquery to "{}". For instance, replacing
--   [1, 88, '2020-12-25', '2021-01-15', 2] in the example below. Then, before user inserting a
--   new record, the program firstly extracting out the information for inserting, and pass them into
--   the string "validationSql" using the format() function in Python. After that, passing the string 
--   "validationSql" into MySQL API to run. Finally, if both columns in the returned result are 1,
--   the new record is valid in terms of "dateFrom" and "dateTo" values. The new record is then ready to
--   be inserted. For the other columns like "hotelNo", the Primary key and Unique key constraint will 
--   validate them when inserting

use hoteldb;

with newRecord as (
	select
	1 hotelNo,
    88 guestNo,
	'2020-12-25' dateFrom,
	'2021-01-15' dateTo,
	2 roomNo
)
, analysisOverlap as (
	select count(*) overlapNum
	from booking b
		inner join newRecord n on b.hotelNo = n.hotelNo and b.roomNo = n.roomNo
	where not(b.dateTo < n.dateFrom || n.dateTo < b.dateFrom)
)
, noOverlapIssue as (
	select case when ao.overlapNum = 0 then true
				else false end as noOverlapIssue
	from analysisOverlap ao
)
, inputValid as (
	select case when dateTo >= dateFrom then true
				else false end as newRecordValid
    from newRecord n
)
select *
from noOverlapIssue, inputValid
    
