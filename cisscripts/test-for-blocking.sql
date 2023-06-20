
/* 

****NOTE:**** Please change the @waitUntil to the actual start time you want across the multiple DB connections from which you plan to run this test script.

This script updates the [name] column of a row with an [id] that already exists. If that row doesn't exist, it inserts a row.

CREATE TABLE [test-for-blocking](
	[id] [int] NOT NULL,
	[name] [varchar](50) NOT NULL
) ON [PRIMARY]

   */

set xact_abort on

declare @counter int, @waitUntil datetime, @nunberOfIterations int, @secondsToWaitBeforeNextIteration int, @value varchar(50) 
select 
	@counter = 1
	, @waitUntil = '13:04:30'
	, @secondsToWaitBeforeNextIteration = 1
	, @nunberOfIterations = 10

while @counter <= @nunberOfIterations 
begin
	waitfor time @waitUntil
	
	set @value = convert(varchar(50), getDate(), 121)

	begin tran
	update [test-for-blocking]
	set [name] = @value
	where [id] = @counter
	if @@ROWCOUNT = 0
	begin
		insert into [test-for-blocking] values (@counter, @value)
		if @@error = 0
			print 'inserted row [' + cast(@counter as varchar(50)) + '] with value [' + @value + ']'
		else
			print 'error inserting row [' + cast(@counter as varchar(50)) + '] with value [' + @value + ']'
	end
	else
		print 'updated row [' + cast(@counter as varchar(50)) + '] with value [' + @value + ']'

	commit tran

	set @waitUntil = DATEADD(s, @secondsToWaitBeforeNextIteration, getDate())
	set @counter = @counter + 1
end
