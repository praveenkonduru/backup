--select * from  [dbo].[vis_ActivationAdmin] 
--update [dbo].[vis_ActivationAdmin] set [largeBatchBoundaryValue] = 10
--go

Declare @header int;
select @header = 229585;
declare @stage as table( HostItemId varchar(30))
insert into @stage  select HostItemId from  [dbo].[vis_StagingDmsInventoryDetails] 
where stagingDmsInventoryHeaderId= @header

delete veh_inventory_option where veh_inv_id in (
	select veh_inv_id from veh_inventory where hostItemId in (
	select HostItemId from @stage)
);
delete veh_inventory 
where hostItemId in (select HostItemId from @stage);


BEGIN TRAN 
  update [dbo].[vis_StagingDmsInventoryHeaders] 
  set status = 'completed', stage= 'spooling'
  where stagingDmsInventoryHeaderId =  @header
  WAITFOR DELAY '00:00:10'   
  COMMIT TRAN
  



GO
WAITFOR delay '00:00:05'
  --select * from [dbo].[vis_StagingDmsInventoryHeaders]  where stagingDmsInventoryHeaderId =  229585
--select top(1000) dl.StartDate , dlc.Name as 'Category' , dld.Name , dld.Value 
--from bso_DataLog dl
--join bso_DataLogAction dla on dl.ActionId= dla.ActionId
--join bso_DataLogCategory dlc on dlc.CategoryId= dl.CategoryId 
--join  bso_DataLogData dld on dld.DataLogID  = dl.ID
--where dl.StartDate between '2018-03-15' and '2018-03-27' 
----where dl.StartDate between DateAdd( mi, -1425, GetDate())and DateAdd( mi, 15, GetDate())
--and dlc.Name = 'VisDeltaProcessor'
----and dla.Name ='ProcessHeader.Info'
--and dld.Name like '%Finished Header:229585%'
----and dld.Name like 'SearchParameters%'-- Update Location Summary' 
--order by dl.StartDate desc


Declare @header int;
select @header = 229585;
declare @stage as table( HostItemId varchar(30))
insert into @stage  select HostItemId from  [dbo].[vis_StagingDmsInventoryDetails] 
where stagingDmsInventoryHeaderId= @header

select veh_inv_id from veh_inventory where hostItemId in (
	select HostItemId from @stage)
