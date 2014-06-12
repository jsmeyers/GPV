/*
  © 2004-2009, Applied Geographics, Inc.  All rights reserved.

  GPV31_SQLServer_Upgrade.sql

  Creates the GPV v3.1 configuration tables from an existing set of GPV v3.0 tables.
  Set the prefixes for both sets of table names by changing the values in the "set @prefix30" 
  and "set @prefix31" lines below.  Make sure to run GPV31_SQLServer_AddConstraints.sql 
  using the v3.1 prefix to create the necessary constraints on the v3.1 tables.

*/

declare @prefix30 nvarchar(50)
declare @prefix31 nvarchar(50)

set @prefix30 = 'GPV30'
set @prefix31 = 'GPV31'

declare @sql nvarchar(2000)

/* add AuthorizedRoles, DefaultLevel, ZoneLevelID and Active to GPVApplication */

set @sql = 'CREATE TABLE ' + @prefix31 + 'Application (
  ApplicationID nvarchar(50) NOT NULL,
  DisplayName nvarchar(50) NOT NULL,
  AuthorizedRoles nvarchar(200),
  FunctionTabs nvarchar(50),
  DefaultMapTab nvarchar(50),
  DefaultAction nvarchar(50),
  DefaultTargetLayer nvarchar(50),
  DefaultProximity nvarchar(50),
  DefaultSelectionLayer nvarchar(50),
  DefaultLevel nvarchar(50),
  FullExtent nvarchar(50),
  OverviewMapID nvarchar(50),
  CoordinateModes nvarchar(50),
  AllowMapTabScroll smallint,
  AllowDataTabScroll smallint,
  ZoneLevelID nvarchar(50),
  TrackUse smallint, 
  About ntext,
  Active smallint DEFAULT 1
)'
exec(@sql)

set @sql = 'INSERT INTO ' + @prefix31 + 'Application (ApplicationID, DisplayName, FunctionTabs, DefaultMapTab, DefaultAction, DefaultTargetLayer, DefaultProximity, DefaultSelectionLayer, FullExtent, OverviewMapID, CoordinateModes, TrackUse, AllowMapTabScroll, AllowDataTabScroll, About, Active)
  SELECT ApplicationID, DisplayName, FunctionTabs, DefaultMapTab, DefaultAction, DefaultTargetLayer, DefaultProximity, DefaultSelectionLayer, FullExtent, OverviewMapID, CoordinateModes, TrackUse, AllowMapTabScroll, AllowDataTabScroll, About, 1
  FROM ' + @prefix30 + 'Application'
exec(@sql)

/* copy tables */

set @sql = 'SELECT * INTO ' + @prefix31 + 'ApplicationMapTab FROM ' + @prefix30 + 'ApplicationMapTab'
exec(@sql)

set @sql = 'SELECT * INTO ' + @prefix31 + 'ApplicationMarkupCategory FROM ' + @prefix30 + 'ApplicationMarkupCategory'
exec(@sql)

set @sql = 'SELECT * INTO ' + @prefix31 + 'ApplicationPrintTemplate FROM ' + @prefix30 + 'ApplicationPrintTemplate'
exec(@sql)

/* add Active to GPVConnection */

set @sql = 'CREATE TABLE ' + @prefix31 + 'Connection (
  ConnectionID nvarchar(50) NOT NULL,
  ConnectionString nvarchar(1000) NOT NULL,
  Active smallint DEFAULT 1
)'
exec(@sql)

set @sql = 'INSERT INTO ' + @prefix31 + 'Connection (ConnectionID, ConnectionString, Active)
  SELECT ConnectionID, ConnectionString, 1
  FROM ' + @prefix30 + 'Connection'
exec(@sql)

/* add Active to GPVDataTab */

set @sql = 'CREATE TABLE ' + @prefix31 + 'DataTab (
  DataTabID nvarchar(50) NOT NULL,
  LayerID nvarchar(50) NOT NULL,
  DisplayName nvarchar(50) NOT NULL,
  ConnectionID nvarchar(50),
  StoredProc nvarchar(100) NOT NULL,
  SequenceNo smallint NOT NULL,
  Active smallint DEFAULT 1
)'
exec(@sql)

set @sql = 'INSERT INTO ' + @prefix31 + 'DataTab (DataTabID, LayerID, DisplayName, ConnectionID, StoredProc, SequenceNo, Active)
  SELECT DataTabID, LayerID, DisplayName, ConnectionID, StoredProc, SequenceNo, 1
  FROM ' + @prefix30 + 'DataTab'
exec(@sql)

/* add Active to GPVExternalMap, increase the size of URL */

set @sql = 'CREATE TABLE ' + @prefix31 + 'ExternalMap (
  DisplayName nvarchar(50) NOT NULL,
  URL nvarchar(400) NOT NULL,
  SequenceNo smallint NOT NULL,
  Active smallint DEFAULT 1
)'
exec(@sql)

set @sql = 'INSERT INTO ' + @prefix31 + 'ExternalMap (DisplayName, URL, SequenceNo, Active)
  SELECT DisplayName, URL, SequenceNo, 1
  FROM ' + @prefix30 + 'ExternalMap'
exec(@sql)

/* add DisplayName, MetaDataURL, ZoneField, LevelField and Active to GPVLayer */

set @sql = 'CREATE TABLE ' + @prefix31 + 'Layer (
  LayerID nvarchar(50) NOT NULL,
  LayerName nvarchar(50) NOT NULL,
  DisplayName nvarchar(50),
  MetaDataURL nvarchar(200),
  KeyField nvarchar(50),
  ZoneField nvarchar(50),
  LevelField nvarchar(50),
  MaxNumberSelected int,
  MaxSelectionArea float,
  MinNearestDistance float,
  MaxNearestDistance float,
  BaseMapID nvarchar(50),
  Active smallint DEFAULT 1
)'
exec(@sql)

set @sql = 'INSERT INTO ' + @prefix31 + 'Layer (LayerID, LayerName, KeyField, MaxNumberSelected, MaxSelectionArea, 
  MinNearestDistance, MaxNearestDistance, BaseMapID, Active)
  SELECT LayerID, LayerName, KeyField, MaxNumberSelected, MaxSelectionArea, MinNearestDistance, MaxNearestDistance, BaseMapID, 1
  FROM ' + @prefix30 + 'Layer'
exec(@sql)

/* add Active to GPVLayerFunction */

set @sql = 'CREATE TABLE ' + @prefix31 + 'LayerFunction (
  LayerID nvarchar(50) NOT NULL,
  [Function] nvarchar(20) NOT NULL,
  ConnectionID nvarchar(50),
  StoredProc nvarchar(100) NOT NULL,
  Active smallint DEFAULT 1
)'
exec(@sql)

set @sql = 'INSERT INTO ' + @prefix31 + 'LayerFunction (LayerID, [Function], ConnectionID, StoredProc, Active)
  SELECT LayerID, [Function], ConnectionID, StoredProc, 1
  FROM ' + @prefix30 + 'LayerFunction'
exec(@sql)

/* copy tables */

set @sql = 'SELECT * INTO ' + @prefix31 + 'LayerProximity FROM ' + @prefix30 + 'LayerProximity'
exec(@sql)

/* create GPVLevel */

set @sql = 'CREATE TABLE ' + @prefix31 + 'Level (
  ZoneLevelID nvarchar(50) NOT NULL,
  LevelID nvarchar(50) NOT NULL,
  DisplayName nvarchar(50),
  SequenceNo smallint NOT NULL,
  Active smallint DEFAULT 1
)'
exec(@sql)

/* copy tables */

set @sql = 'SELECT * INTO ' + @prefix31 + 'MailingLabel FROM ' + @prefix30 + 'MailingLabel'
exec(@sql)

/* add Active to GPVMapTab */

set @sql = 'CREATE TABLE ' + @prefix31 + 'MapTab (
  MapTabID nvarchar(50) NOT NULL,
  DisplayName nvarchar(50) NOT NULL,
  MapHost nvarchar(50) NOT NULL,
  MapService nvarchar(50) NOT NULL,
  DataFrame nvarchar(50),
  UserName nvarchar(50),
  Password nvarchar(50),
  InteractiveLegend smallint,
  BaseMapID nvarchar(50),
  ShowBaseMapInLegend smallint,
  Active smallint DEFAULT 1
)'
exec(@sql)

set @sql = 'INSERT INTO ' + @prefix31 + 'MapTab (MapTabID, DisplayName, MapHost, MapService, DataFrame, UserName, Password, InteractiveLegend, BaseMapID, ShowBaseMapInLegend, Active)
  SELECT MapTabID, DisplayName, MapHost, MapService, DataFrame, UserName, Password, InteractiveLegend, BaseMapID, ShowBaseMapInLegend, 1
  FROM ' + @prefix30 + 'MapTab'
exec(@sql)

/* add IsExclusive to GPVMapTabLayer */

set @sql = 'CREATE TABLE ' + @prefix31 + 'MapTabLayer (
  MapTabID nvarchar(50) NOT NULL,
  LayerID nvarchar(50) NOT NULL,
  AllowTarget smallint,
  AllowSelection smallint,
  ShowInLegend smallint,
  CheckInLegend smallint,
  IsExclusive smallint,
  ShowInPrintLegend smallint
)'
exec(@sql)

set @sql = 'INSERT INTO ' + @prefix31 + 'MapTabLayer (MapTabID, LayerID, AllowTarget, AllowSelection, ShowInLegend, CheckInLegend, ShowInPrintLegend)
  SELECT MapTabID, LayerID, AllowTarget, AllowSelection, ShowInLegend, CheckInLegend, ShowInPrintLegend
  FROM ' + @prefix30 + 'MapTabLayer'
exec(@sql)

/* copy tables */

set @sql = 'SELECT * INTO ' + @prefix31 + 'Markup FROM ' + @prefix30 + 'Markup'
exec(@sql)

/* add AuthorizedRoles and Active to GPVMarkupCategory */

set @sql = 'CREATE TABLE ' + @prefix31 + 'MarkupCategory (
  CategoryID nvarchar(50) NOT NULL,
  DisplayName nvarchar(50) NOT NULL,
  AuthorizedRoles nvarchar(200),
  Active smallint DEFAULT 1
)'
exec(@sql)

set @sql = 'INSERT INTO ' + @prefix31 + 'MarkupCategory (CategoryID, DisplayName, Active)
  SELECT CategoryID, DisplayName, 1
  FROM ' + @prefix30 + 'MarkupCategory'
exec(@sql)

/* add Locked and CreatedByUser to GPVMarkupGroup */

set @sql = 'CREATE TABLE ' + @prefix31 + 'MarkupGroup (
  GroupID int NOT NULL,
  CategoryID nvarchar(50) NOT NULL,
  DisplayName nvarchar(100) NOT NULL,
  CreatedBy nvarchar(50) NOT NULL,
  CreatedByUser nvarchar(200),
  Locked smallint NOT NULL,
  DateCreated datetime NOT NULL,
  DateLastAccessed datetime NOT NULL,
  Deleted smallint NOT NULL 
)'
exec(@sql)

set @sql = 'INSERT INTO ' + @prefix31 + 'MarkupGroup (GroupID, CategoryID, DisplayName, CreatedBy, Locked, DateCreated, DateLastAccessed, Deleted)
  SELECT GroupID, CategoryID, DisplayName, CreatedBy, 0, DateCreated, DateLastAccessed, Deleted
  FROM ' + @prefix30 + 'MarkupGroup'
exec(@sql)

/* copy tables */

set @sql = 'SELECT * INTO ' + @prefix31 + 'MarkupSequence FROM ' + @prefix30 + 'MarkupSequence'
exec(@sql)

/* add Active to GPVPrintTemplate */

set @sql = 'CREATE TABLE ' + @prefix31 + 'PrintTemplate (
  TemplateID nvarchar(50) NOT NULL,
  SequenceNo smallint NOT NULL,
  TemplateTitle nvarchar(50) NOT NULL,
  PageWidth float NOT NULL,
  PageHeight float NOT NULL,
  AlwaysAvailable smallint NULL,
  Active smallint DEFAULT 1 
)'
exec(@sql)

set @sql = 'INSERT INTO ' + @prefix31 + 'PrintTemplate (TemplateID, SequenceNo, TemplateTitle, PageWidth, PageHeight, AlwaysAvailable, Active)
  SELECT TemplateID, SequenceNo, TemplateTitle, PageWidth, PageHeight, AlwaysAvailable, 1
  FROM ' + @prefix30 + 'PrintTemplate'
exec(@sql)

/* add Active to GPVPrintTemplateContent */

set @sql = 'CREATE TABLE ' + @prefix31 + 'PrintTemplateContent (
  TemplateID nvarchar(50) NOT NULL,
  SequenceNo smallint NOT NULL,
  ContentType nvarchar(20) NOT NULL,
  DisplayName nvarchar(50),
  OriginX float NOT NULL,
  OriginY float NOT NULL,
  Width float NOT NULL,
  Height float NOT NULL,
  FillColor nvarchar(25),
  OutlineColor nvarchar(25),
  OutlineWidth int,
  LegendColumnWidth float,
  Text ntext,
  TextFont nvarchar(16),
  TextAlign nvarchar(6),
  [TextSize] int,
  TextBold int,
  TextWrap int,
  FileName nvarchar(25),
  Active smallint DEFAULT 1 
)'
exec(@sql)

set @sql = 'INSERT INTO ' + @prefix31 + 'PrintTemplateContent (TemplateID, SequenceNo, ContentType, DisplayName, OriginX, OriginY, Width, Height, FillColor, OutlineColor, OutlineWidth, LegendColumnWidth, Text, TextFont, TextAlign, [TextSize], TextBold, TextWrap, FileName, Active)
  SELECT TemplateID, SequenceNo, ContentType, DisplayName, OriginX, OriginY, Width, Height, FillColor, OutlineColor, OutlineWidth, LegendColumnWidth, Text, TextFont, TextAlign, [TextSize], TextBold, TextWrap, FileName, 1
  FROM ' + @prefix30 + 'PrintTemplateContent'
exec(@sql)

/* add Active to GPVProximity */

set @sql = 'CREATE TABLE ' + @prefix31 + 'Proximity (
  ProximityID nvarchar(50) NOT NULL,
  DisplayName nvarchar(150) NOT NULL,
  SequenceNo smallint NOT NULL,
  Distance float NOT NULL,
  IsDefault smallint NULL,
  Active smallint DEFAULT 1 
)'
exec(@sql)

set @sql = 'INSERT INTO ' + @prefix31 + 'Proximity (ProximityID, DisplayName, SequenceNo, Distance, IsDefault, Active)
  SELECT ProximityID, DisplayName, SequenceNo, Distance, IsDefault, 1
  FROM ' + @prefix30 + 'Proximity'
exec(@sql)

/* add Active to GPVQuery */

set @sql = 'CREATE TABLE ' + @prefix31 + 'Query (
  QueryID nvarchar(50) NOT NULL,
  LayerID nvarchar(50) NOT NULL,
  DisplayName nvarchar(50) NOT NULL,
  ConnectionID nvarchar(50),
  StoredProc nvarchar(100) NOT NULL,
  SequenceNo smallint NOT NULL,
  Active smallint DEFAULT 1 
)'
exec(@sql)

set @sql = 'INSERT INTO ' + @prefix31 + 'Query (QueryID, LayerID, DisplayName, ConnectionID, StoredProc, SequenceNo, Active)
  SELECT QueryID, LayerID, DisplayName, ConnectionID, StoredProc, SequenceNo, 1
  FROM ' + @prefix30 + 'Query'
exec(@sql)

/* copy tables */

set @sql = 'SELECT * INTO ' + @prefix31 + 'SavedState FROM ' + @prefix30 + 'SavedState'
exec(@sql)

/* increase the size of the UserAgent column in GPVUsageTracking */

set @sql = 'CREATE TABLE ' + @prefix31 + 'UsageTracking (
  ApplicationID nvarchar(50) NOT NULL,
  UrlQuery nvarchar(1024) NOT NULL,
  DateStarted datetime NOT NULL,
  UserAgent nvarchar(400) NOT NULL,
  UserHostAddress nvarchar(15) NOT NULL,
  UserHostName nvarchar(50) NOT NULL
)'
exec(@sql)

set @sql = 'INSERT INTO ' + @prefix31 + 'UsageTracking (ApplicationID, UrlQuery, DateStarted, UserAgent, UserHostAddress, UserHostName)
  SELECT ApplicationID, UrlQuery, DateStarted, UserAgent, UserHostAddress, UserHostName
  FROM ' + @prefix30 + 'UsageTracking'
exec(@sql)

/* create GPVUser */

set @sql = 'CREATE TABLE ' + @prefix31 + 'User (
  UserName nvarchar(200) NOT NULL,
  Password nvarchar(40),
  Role nvarchar(25),
  DisplayName nvarchar(50),
  Active smallint DEFAULT 1
)'
exec(@sql)

/* create GPVZone */

set @sql = 'CREATE TABLE ' + @prefix31 + 'Zone (
  ZoneLevelID nvarchar(50) NOT NULL,
  ZoneID nvarchar(50) NOT NULL,
  DisplayName nvarchar(50),
  SequenceNo smallint NOT NULL,
  Active smallint DEFAULT 1
)'
exec(@sql)

/* create GPVZoneLevel */

set @sql = 'CREATE TABLE ' + @prefix31 + 'ZoneLevel (
  ZoneLevelID nvarchar(50) NOT NULL,
  ZoneTypeDisplayName nvarchar(50),
  LevelTypeDisplayName nvarchar(50),
  Active smallint DEFAULT 1
)'
exec(@sql)

/* create GPVZoneLevelCombo */

set @sql = 'CREATE TABLE ' + @prefix31 + 'ZoneLevelCombo (
  ZoneLevelID nvarchar(50) NOT NULL,
  ZoneID nvarchar(50) NOT NULL,
  LevelID nvarchar(50) NOT NULL,
  Active smallint DEFAULT 1
)'
exec(@sql)
