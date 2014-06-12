/*
  © 2004-2009, Applied Geographics, Inc.  All rights reserved.

  GPV31_SQLServer_Delete.sql

  Deletes all GPV v3.1 configuration tables.  You can set the prefix for the table names by changing 
  the value in the "set @prefix" line below.

*/

declare @prefix nvarchar(50)
set @prefix = 'GPV31'

declare @sql nvarchar(2000)

/* tables not referenced by a foreign key */

set @sql = 'DROP TABLE ' + @prefix + 'ApplicationMapTab'; exec(@sql)
set @sql = 'DROP TABLE ' + @prefix + 'ApplicationMarkupCategory'; exec(@sql)
set @sql = 'DROP TABLE ' + @prefix + 'ApplicationPrintTemplate'; exec(@sql)
set @sql = 'DROP TABLE ' + @prefix + 'DataTab'; exec(@sql)
set @sql = 'DROP TABLE ' + @prefix + 'ExternalMap'; exec(@sql)
set @sql = 'DROP TABLE ' + @prefix + 'LayerFunction'; exec(@sql)
set @sql = 'DROP TABLE ' + @prefix + 'LayerProximity'; exec(@sql)
set @sql = 'DROP TABLE ' + @prefix + 'MailingLabel'; exec(@sql)
set @sql = 'DROP TABLE ' + @prefix + 'MapTabLayer'; exec(@sql)
set @sql = 'DROP TABLE ' + @prefix + 'Markup'; exec(@sql)
set @sql = 'DROP TABLE ' + @prefix + 'MarkupGroup'; exec(@sql)
set @sql = 'DROP TABLE ' + @prefix + 'MarkupSequence'; exec(@sql)
set @sql = 'DROP TABLE ' + @prefix + 'PrintTemplateContent'; exec(@sql)
set @sql = 'DROP TABLE ' + @prefix + 'Proximity'; exec(@sql)
set @sql = 'DROP TABLE ' + @prefix + 'Query'; exec(@sql)
set @sql = 'DROP TABLE ' + @prefix + 'SavedState'; exec(@sql)
set @sql = 'DROP TABLE ' + @prefix + 'UsageTracking'; exec(@sql)
set @sql = 'DROP TABLE ' + @prefix + 'User'; exec(@sql)
set @sql = 'DROP TABLE ' + @prefix + 'ZoneLevelCombo'; exec(@sql)

/* tables referenced by a foreign key */

set @sql = 'DROP TABLE ' + @prefix + 'Application'; exec(@sql)
set @sql = 'DROP TABLE ' + @prefix + 'Connection'; exec(@sql)
set @sql = 'DROP TABLE ' + @prefix + 'Layer'; exec(@sql)
set @sql = 'DROP TABLE ' + @prefix + 'Level'; exec(@sql)
set @sql = 'DROP TABLE ' + @prefix + 'MapTab'; exec(@sql)
set @sql = 'DROP TABLE ' + @prefix + 'MarkupCategory'; exec(@sql)
set @sql = 'DROP TABLE ' + @prefix + 'PrintTemplate'; exec(@sql)
set @sql = 'DROP TABLE ' + @prefix + 'Zone'; exec(@sql)
set @sql = 'DROP TABLE ' + @prefix + 'ZoneLevel'; exec(@sql)
