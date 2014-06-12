/*
  © 2004-2009, Applied Geographics, Inc.  All rights reserved.

  GPV31_SQLServer_Copy.sql

  Copies the GPV v3.1 configuration tables.  You can set the source and destination prefixes for 
  the table names by changing the values in the "set @srcPrefix" and "set @desPrefix" lines below.  
  Make sure to run GPV31_SQLServer_AddConstraints.sql using the destination prefix to create the 
  necessary constraints on the copied tables.

*/

declare @srcPrefix nvarchar(50)
declare @desPrefix nvarchar(50)

set @srcPrefix = 'GPV31'
set @desPrefix = 'GPVx'

declare @sql nvarchar(2000)

set @sql = 'SELECT * INTO ' + @desPrefix + 'Application FROM ' + @srcPrefix + 'Application'; exec(@sql)
set @sql = 'SELECT * INTO ' + @desPrefix + 'ApplicationMapTab FROM ' + @srcPrefix + 'ApplicationMapTab'; exec(@sql)
set @sql = 'SELECT * INTO ' + @desPrefix + 'ApplicationMarkupCategory FROM ' + @srcPrefix + 'ApplicationMarkupCategory'; exec(@sql)
set @sql = 'SELECT * INTO ' + @desPrefix + 'ApplicationPrintTemplate FROM ' + @srcPrefix + 'ApplicationPrintTemplate'; exec(@sql)
set @sql = 'SELECT * INTO ' + @desPrefix + 'Connection FROM ' + @srcPrefix + 'Connection'; exec(@sql)
set @sql = 'SELECT * INTO ' + @desPrefix + 'DataTab FROM ' + @srcPrefix + 'DataTab'; exec(@sql)
set @sql = 'SELECT * INTO ' + @desPrefix + 'ExternalMap FROM ' + @srcPrefix + 'ExternalMap'; exec(@sql)
set @sql = 'SELECT * INTO ' + @desPrefix + 'Layer FROM ' + @srcPrefix + 'Layer'; exec(@sql)
set @sql = 'SELECT * INTO ' + @desPrefix + 'LayerFunction FROM ' + @srcPrefix + 'LayerFunction'; exec(@sql)
set @sql = 'SELECT * INTO ' + @desPrefix + 'LayerProximity FROM ' + @srcPrefix + 'LayerProximity'; exec(@sql)
set @sql = 'SELECT * INTO ' + @desPrefix + 'Level FROM ' + @srcPrefix + 'Level'; exec(@sql)
set @sql = 'SELECT * INTO ' + @desPrefix + 'MailingLabel FROM ' + @srcPrefix + 'MailingLabel'; exec(@sql)
set @sql = 'SELECT * INTO ' + @desPrefix + 'MapTab FROM ' + @srcPrefix + 'MapTab'; exec(@sql)
set @sql = 'SELECT * INTO ' + @desPrefix + 'MapTabLayer FROM ' + @srcPrefix + 'MapTabLayer'; exec(@sql)
set @sql = 'SELECT * INTO ' + @desPrefix + 'Markup FROM ' + @srcPrefix + 'Markup'; exec(@sql)
set @sql = 'SELECT * INTO ' + @desPrefix + 'MarkupCategory FROM ' + @srcPrefix + 'MarkupCategory'; exec(@sql)
set @sql = 'SELECT * INTO ' + @desPrefix + 'MarkupGroup FROM ' + @srcPrefix + 'MarkupGroup'; exec(@sql)
set @sql = 'SELECT * INTO ' + @desPrefix + 'MarkupSequence FROM ' + @srcPrefix + 'MarkupSequence'; exec(@sql)
set @sql = 'SELECT * INTO ' + @desPrefix + 'PrintTemplate FROM ' + @srcPrefix + 'PrintTemplate'; exec(@sql)
set @sql = 'SELECT * INTO ' + @desPrefix + 'PrintTemplateContent FROM ' + @srcPrefix + 'PrintTemplateContent'; exec(@sql)
set @sql = 'SELECT * INTO ' + @desPrefix + 'Proximity FROM ' + @srcPrefix + 'Proximity'; exec(@sql)
set @sql = 'SELECT * INTO ' + @desPrefix + 'Query FROM ' + @srcPrefix + 'Query'; exec(@sql)
set @sql = 'SELECT * INTO ' + @desPrefix + 'SavedState FROM ' + @srcPrefix + 'SavedState'; exec(@sql)
set @sql = 'SELECT * INTO ' + @desPrefix + 'UsageTracking FROM ' + @srcPrefix + 'UsageTracking'; exec(@sql)
set @sql = 'SELECT * INTO ' + @desPrefix + 'User FROM ' + @srcPrefix + 'User'; exec(@sql)
set @sql = 'SELECT * INTO ' + @desPrefix + 'Zone FROM ' + @srcPrefix + 'Zone'; exec(@sql)
set @sql = 'SELECT * INTO ' + @desPrefix + 'ZoneLevel FROM ' + @srcPrefix + 'ZoneLevel'; exec(@sql)
set @sql = 'SELECT * INTO ' + @desPrefix + 'ZoneLevelCombo FROM ' + @srcPrefix + 'ZoneLevelCombo'; exec(@sql)
