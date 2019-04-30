USE ExampleDB;
BEGIN TRANSACTION;

SELECT
CASE
	WHEN jl.Country IS NULL THEN 'No Country'
	ELSE jl.Country
END AS Country, count(*) AS ResultCount
FROM dbo.Jobs AS j
INNER JOIN dbo.JobLocations AS jl
ON j.EntityId = jl.JobId
WHERE j.ContractHours = 1
GROUP BY jl.Country
ORDER BY ResultCount DESC;

ROLLBACK;