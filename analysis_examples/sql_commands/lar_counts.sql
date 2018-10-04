SELECT 
	activity_year, 
	COUNT (*) 
FROM 
	hmda_public.lar_{year} 
GROUP BY 
	activity_year;