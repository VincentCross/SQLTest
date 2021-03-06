USE ExampleDB
GO

/*
I had a little bit of an issue with this one. Namely that none of the records
fell within the requested dates. I'm not sure if this is an error on my part or
in the test. Either way I'd like to be informed about the issue.

I tested the query with other records so I know it works.
*/

BEGIN TRANSACTION

DECLARE @rangestart datetimeoffset(3) = '2015-12-12 11:00:00.000 +10:00'; --1am on the 12th in UTC
DECLARE @rangeend datetimeoffset(3) = '2015-12-24 18:00:00.000 +10:00'; --Requested date: 8am on the 24th in UTC
--DECLARE @rangeend datetimeoffset(3) = '2015-12-25 18:00:00.000 +10:00'; --Testing date: 8am on the 25th in UTC
DECLARE @currenttime datetimeoffset(3) = GETUTCDATE();

INSERT INTO dbo.Events_Attendance
	SELECT eb.ID, @currenttime, 1, eb.JobSeekerID FROM dbo.Events e
	INNER JOIN dbo.Events_Bookings eb
	ON e.EntityID = eb.EventId
	INNER JOIN dbo.Events_Attendance ea
	ON eb.Id = ea.BookingId
	WHERE e.[Start] > @rangestart
	AND e.[End] < @rangeend;

--SELECT * FROM dbo.Events_Attendance;
--ROLLBACK
COMMIT


/* Testing scripts
SELECT * FROM dbo.Events;
SELECT * FROM Events_Bookings;
SELECT * FROM Events_Attendance;

-- Requested date range
DECLARE @rangestart datetimeoffset(3) = '2015-12-12 11:00:00.000 +10:00'; --1am on the 12th in UTC
DECLARE @rangeend datetimeoffset(3) = '2015-12-24 18:00:00.000 +10:00'; --8am on the 24th in UTC
SELECT * FROM dbo.Events
WHERE [Start] > @rangestart
AND [End] < @rangeend;

-- Testing date range
DECLARE @rangestart datetimeoffset(3) = '2015-12-12 11:00:00.000 +10:00'; --1am on the 12th in UTC
DECLARE @rangeend datetimeoffset(3) = '2015-12-25 18:00:00.000 +10:00'; --8am on the 25th in UTC
SELECT * FROM dbo.Events
WHERE [Start] > @rangestart
AND [End] < @rangeend;
*/