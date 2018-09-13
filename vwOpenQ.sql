



CREATE VIEW [dbo].[vwOpenQ] 
AS


SELECT [Number], [OrgName], [ServiceOffering], [ServiceLevel], [Assignment_Group], [Assigned_To], [Caller_ID], [Location], [Cmdb_CI], [Incident_State], [State], [Category], [Subcategory], [ReOpened], [Problem_Id], [Calendar_Duration], [Business_Duration], [Short_Description], [Made_SLA], [Priority], [Severity], [Sys_Created_On], [Resolved_At], [Closed_At], [Close_Code], [WithinSLA], [Actual_Duration], [Aged], [Time_Left], [ServiceLine], [Service], [Mapped_CIName], [Mapped_CICode],
  (CASE WHEN Assigned_To = '' THEN 1 WHEN Assigned_To IS NULL THEN 1 ELSE 0 END) AS [Un-Assigned],
  (CASE WHEN (DATEDIFF(dd, Sys_Created_On, GETDATE()) > 15) THEN 1 ELSE 0 END) AS [Age >15 Days],
  (CASE WHEN (DATEDIFF(dd, Sys_Created_On, GETDATE()) > 30) THEN 1 ELSE 0 END) AS [Age >30 Days],
  (CASE WHEN Time_Left < 24 THEN 1 ELSE 0 END) AS [TimeLeft <24Hrs], 
  (CASE WHEN Time_Left BETWEEN 24 AND 48 THEN 1 ELSE 0 END) AS [TimeLeft 24-48Hrs],
  (CASE WHEN Time_Left > 48 THEN 1 ELSE 0 END) AS [TimeLeft >48 Hrs]
FROM [dbo].[snStaging_Open_Incident] WITH (NOLOCK) 






