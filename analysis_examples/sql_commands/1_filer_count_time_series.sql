SELECT 
	activity_year, 
	COUNT (*) 
FROM 
	hmda_public.ts_{year} 
GROUP BY 
	activity_year;