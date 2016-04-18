/*
  Copyright 2016 Applied Geographics, Inc.

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.

  GPV50_SQLServer_Check_IDs.sql

  Checks for case-sensitive mismatches between primary and foreign keys.
  If any mismatches are found, they must be corrected before running
  GPV50_SQLServer_AddConstraints.sql.

*/

declare @prefix nvarchar(50)
set @prefix = 'GPV50'

declare @sql nvarchar(4000)
declare @count int

set @sql = '
  select ''' + @prefix + 'ApplicationMapTab'' as [From Table], ''ApplicationID'' as [Column], ''' + @prefix + 'Application'' as [To Table], count(*) as Mismatches 
    from ' + @prefix + 'ApplicationMapTab
    where ApplicationID not in (select ApplicationID from ' + @prefix + 'Application)
  union
    select ''' + @prefix + 'ApplicationMapTab'' as [From Table], ''MapTabID'' as [Column], ''' + @prefix + 'MapTab'' as [To Table], count(*) as Mismatches 
    from ' + @prefix + 'ApplicationMapTab
    where MapTabID not in (select MapTabID from ' + @prefix + 'Application)
'
exec (@sql)

set @sql = '
  select ''' + @prefix + 'ApplicationMarkupCategory'' as [From Table], ''ApplicationID'' as [Column], ''' + @prefix + 'Application'' as [To Table], count(*) as Mismatches 
    from ' + @prefix + 'ApplicationMarkupCategory
    where ApplicationID not in (select ApplicationID from ' + @prefix + 'Application)
  union
    select ''' + @prefix + 'ApplicationMarkupCategory'' as [From Table], ''CategoryID'' as [Column], ''' + @prefix + 'MapTab'' as [To Table], count(*) as Mismatches 
    from ' + @prefix + 'ApplicationMarkupCategory
    where CategoryID not in (select CategoryID from ' + @prefix + 'Application)
'
exec (@sql)

set @sql = '
  select ''' + @prefix + 'ApplicationPrintTemplate'' as [From Table], ''ApplicationID'' as [Column], ''' + @prefix + 'Application'' as [To Table], count(*) as Mismatches 
    from ' + @prefix + 'ApplicationPrintTemplate
    where ApplicationID not in (select ApplicationID from ' + @prefix + 'Application)
  union
    select ''' + @prefix + 'ApplicationPrintTemplate'' as [From Table], ''TemplateID'' as [Column], ''' + @prefix + 'MapTab'' as [To Table], count(*) as Mismatches 
    from ' + @prefix + 'ApplicationPrintTemplate
    where TemplateID not in (select TemplateID from ' + @prefix + 'Application)
'
exec (@sql)

set @sql = '
  select ''' + @prefix + 'DataTab'' as [From Table], ''LayerID'' as [Column], ''' + @prefix + 'Layer'' as [To Table], count(*) as Mismatches 
    from ' + @prefix + 'DataTab
    where LayerID not in (select LayerID from ' + @prefix + 'Layer)
  union
    select ''' + @prefix + 'DataTab'' as [From Table], ''ConnectionID'' as [Column], ''' + @prefix + 'MapTab'' as [To Table], count(*) as Mismatches 
    from ' + @prefix + 'DataTab
    where ConnectionID not in (select ConnectionID from ' + @prefix + 'Layer)
'
exec (@sql)

set @sql = '
  select ''' + @prefix + 'LayerFunction'' as [From Table], ''LayerID'' as [Column], ''' + @prefix + 'Layer'' as [To Table], count(*) as Mismatches 
    from ' + @prefix + 'LayerFunction
    where LayerID not in (select LayerID from ' + @prefix + 'Layer)
  union
    select ''' + @prefix + 'LayerFunction'' as [From Table], ''ConnectionID'' as [Column], ''' + @prefix + 'MapTab'' as [To Table], count(*) as Mismatches 
    from ' + @prefix + 'LayerFunction
    where ConnectionID not in (select ConnectionID from ' + @prefix + 'Layer)
'
exec (@sql)

set @sql = '
  select ''' + @prefix + 'LayerProximity'' as [From Table], ''LayerID'' as [Column], ''' + @prefix + 'Layer'' as [To Table], count(*) as Mismatches 
    from ' + @prefix + 'LayerProximity
    where LayerID not in (select LayerID from ' + @prefix + 'Layer)
  union
    select ''' + @prefix + 'LayerProximity'' as [From Table], ''ProximityID'' as [Column], ''' + @prefix + 'MapTab'' as [To Table], count(*) as Mismatches 
    from ' + @prefix + 'LayerProximity
    where ProximityID not in (select ProximityID from ' + @prefix + 'Layer)
'
exec (@sql)

set @sql = '
  select ''' + @prefix + 'MapTabLayer'' as [From Table], ''LayerID'' as [Column], ''' + @prefix + 'Layer'' as [To Table], count(*) as Mismatches 
    from ' + @prefix + 'MapTabLayer
    where LayerID not in (select LayerID from ' + @prefix + 'Layer)
  union
    select ''' + @prefix + 'MapTabLayer'' as [From Table], ''MapTabID'' as [Column], ''' + @prefix + 'MapTab'' as [To Table], count(*) as Mismatches 
    from ' + @prefix + 'MapTabLayer
    where MapTabID not in (select MapTabID from ' + @prefix + 'Layer)
'
exec (@sql)

set @sql = '
  select ''' + @prefix + 'MapTabTileGroup'' as [From Table], ''TileGroupID'' as [Column], ''' + @prefix + 'TileGroup'' as [To Table], count(*) as Mismatches 
    from ' + @prefix + 'MapTabTileGroup
    where TileGroupID not in (select TileGroupID from ' + @prefix + 'TileGroup)
  union
    select ''' + @prefix + 'MapTabTileGroup'' as [From Table], ''MapTabID'' as [Column], ''' + @prefix + 'MapTab'' as [To Table], count(*) as Mismatches 
    from ' + @prefix + 'MapTabTileGroup
    where MapTabID not in (select MapTabID from ' + @prefix + 'TileGroup)
'
exec (@sql)

set @sql = '
  select ''' + @prefix + 'Query'' as [From Table], ''LayerID'' as [Column], ''' + @prefix + 'Layer'' as [To Table], count(*) as Mismatches 
    from ' + @prefix + 'Query
    where LayerID not in (select LayerID from ' + @prefix + 'Layer)
  union
    select ''' + @prefix + 'Query'' as [From Table], ''ConnectionID'' as [Column], ''' + @prefix + 'MapTab'' as [To Table], count(*) as Mismatches 
    from ' + @prefix + 'Query
    where ConnectionID not in (select ConnectionID from ' + @prefix + 'Layer)
'
exec (@sql)

set @sql = '
  select ''' + @prefix + 'Search'' as [From Table], ''LayerID'' as [Column], ''' + @prefix + 'Layer'' as [To Table], count(*) as Mismatches 
    from ' + @prefix + 'Search
    where LayerID not in (select LayerID from ' + @prefix + 'Layer)
  union
    select ''' + @prefix + 'Search'' as [From Table], ''ConnectionID'' as [Column], ''' + @prefix + 'MapTab'' as [To Table], count(*) as Mismatches 
    from ' + @prefix + 'Search
    where ConnectionID not in (select ConnectionID from ' + @prefix + 'Layer)
'
exec (@sql)

set @sql = '
  select ''' + @prefix + 'SearchInputField'' as [From Table], ''SearchID'' as [Column], ''' + @prefix + 'Search'' as [To Table], count(*) as Mismatches 
    from ' + @prefix + 'SearchInputField
    where SearchID not in (select SearchID from ' + @prefix + 'Search)
  union
    select ''' + @prefix + 'SearchInputField'' as [From Table], ''ConnectionID'' as [Column], ''' + @prefix + 'MapTab'' as [To Table], count(*) as Mismatches 
    from ' + @prefix + 'SearchInputField
    where ConnectionID not in (select ConnectionID from ' + @prefix + 'Search)
'
exec (@sql)

set @sql = '
  select ''' + @prefix + 'ZoneLevelCombo'' as [From Table], ''ZoneLevelID'' as [Column], ''' + @prefix + 'Zone'' as [To Table], count(*) as Mismatches 
    from ' + @prefix + 'ZoneLevelCombo
    where ZoneLevelID not in (select ZoneLevelID from ' + @prefix + 'Zone)
  union
    select ''' + @prefix + 'ZoneLevelCombo'' as [From Table], ''ZoneLevelID'' as [Column], ''' + @prefix + 'MapTab'' as [To Table], count(*) as Mismatches 
    from ' + @prefix + 'ZoneLevelCombo
    where ZoneLevelID not in (select ZoneLevelID from ' + @prefix + 'Zone)
'
exec (@sql)

set @sql = '
  select ''' + @prefix + 'ZoneLevelCombo'' as [From Table], ''ZoneID'' as [Column], ''' + @prefix + 'Zone'' as [To Table], count(*) as Mismatches 
    from ' + @prefix + 'ZoneLevelCombo
    where ZoneID not in (select ZoneID from ' + @prefix + 'Zone)
  union
    select ''' + @prefix + 'ZoneLevelCombo'' as [From Table], ''LevelID'' as [Column], ''' + @prefix + 'MapTab'' as [To Table], count(*) as Mismatches 
    from ' + @prefix + 'ZoneLevelCombo
    where LevelID not in (select LevelID from ' + @prefix + 'Zone)
'
exec (@sql)

