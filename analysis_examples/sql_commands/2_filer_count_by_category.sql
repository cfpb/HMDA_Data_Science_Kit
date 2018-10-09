SELECT 
	activity_year, COUNT (*) AS filer_count 
FROM 
	hmda_public.ts_{year} 
{extention}
;