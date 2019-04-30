USE ExampleDB
GO

/*
This is probably where I'm going to fall short. Projects at my previous work always
involved tight deadlines and most of the time were one-off solutions. So speed of construction
was more valued than repeat performance. But I figured I'd try anyway.
*/

/*
Creating indexes on the ids in the tables should help.

CREATE INDEX idx_bookings ON dbo.Events_Bookings (JobSeekerId)
CREATE INDEX idx_attendance ON dbo.Events_Attendance (JobSeekerId)
*/

/*
This new query has a few improvements:
- It works a little better (this may not technically be what you wanted for the test)
	- If you added a second booking but no second attendence for a job seeker,
		the original would be dividing Booking Count (2) with Attendance Count (1) as ints, resulting in 0.
	- The original would produce a divide by zero error when there are JobSeekers with no bookings
- Less code repetition
- Less subqueries

I'm not actually sure if it's more efficient/optimized. But I feel it's better regardless.
*/

BEGIN TRANSACTION/*INSERT INTO dbo.JobSeekers VALUES ( 7777 )INSERT INTO dbo.Events_Bookings (EventId, AddedUserId, LastUpdatedUserId, Status, JobSeekerId)VALUES ( 3194119, 1, 1, 0, 3892 )INSERT INTO dbo.Events_Attendance VALUES (11, GETUTCDATE(), 1, 3892)*/SELECT 	Bookings.JobSeekerID, 	Bookings.[Booking Count], 	Bookings.[Attendance Count], 	CAST(Bookings.[Attendance Count] / Bookings.[Booking Count] * 100 AS INTEGER) AS 'Attendance Percentage'FROM (
		SELECT
			eb.JobSeekerId, 
			CAST(Count(eb.JobSeekerId) AS DECIMAL) As 'Booking Count',
			(SELECT CAST(COUNT(ea.JobSeekerId) AS DECIMAL) FROM dbo.Events_Attendance ea WHERE ea.JobSeekerId = eb.JobSeekerId) AS 'Attendance Count'
		FROM dbo.Events_Bookings eb		GROUP BY eb.JobSeekerId	) AS BookingsROLLBACK/* Original QuerySELECT
Id,
(SELECT COUNT(*) FROM Events_Bookings WHERE JS.Id = JobSeekerId) AS 'Booking
Count',
(SELECT COUNT(*) FROM Events_Attendance WHERE JS.Id = JobSeekerId) AS 'Attendance
Count',
((SELECT COUNT(*) FROM Events_Attendance WHERE JS.Id = JobSeekerId) / (SELECT
COUNT(*) FROM Events_Bookings WHERE JS.Id = JobSeekerId)) * 100 AS 'Attendance percentage'
FROM
JobSeekers JS*//* Testing QueriesDROP INDEX dbo.Events_Bookings.idx_bookingsDROP INDEX dbo.Events_Attendance.idx_attendance
SELECT * FROM dbo.Events_Bookings;SELECT * FROM dbo.Events_Attendance;*/