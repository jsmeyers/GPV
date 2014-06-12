/*
  © 2004-2009, Applied Geographics, Inc.  All rights reserved.

  GPV31_SQLServer_AddConstraints.sql

  Adds primary key, foreign key and unique constraints to the GPV v3.1 configuration tables.  You can
  set the prefix for the table names by changing the value in the "set @prefix" line below.

*/

declare @prefix nvarchar(50)
set @prefix = 'GPV31'

declare @sql nvarchar(2000)

/* add primary key and unique constraints */

set @sql = 'ALTER TABLE ' + @prefix + 'Application ADD 
  CONSTRAINT PK_' + @prefix + 'Application PRIMARY KEY  CLUSTERED 
  (
    ApplicationID
  )'
exec(@sql)

set @sql = 'ALTER TABLE ' + @prefix + 'ApplicationMapTab ADD 
  CONSTRAINT ' + @prefix + 'ApplicationMapTabUnique UNIQUE  NONCLUSTERED 
  (
    ApplicationID,
    MapTabID
  )'
exec(@sql)

set @sql = 'ALTER TABLE ' + @prefix + 'ApplicationMarkupCategory ADD 
  CONSTRAINT ' + @prefix + 'ApplicationMarkupCategoryUnique UNIQUE  NONCLUSTERED 
  (
    ApplicationID,
    CategoryID
  )'
exec(@sql)

set @sql = 'ALTER TABLE ' + @prefix + 'ApplicationPrintTemplate ADD 
  CONSTRAINT ' + @prefix + 'ApplicationPrintTemplateUnique UNIQUE  NONCLUSTERED 
  (
    ApplicationID,
    TemplateID
  )'
exec(@sql)

set @sql = 'ALTER TABLE ' + @prefix + 'Connection ADD 
  CONSTRAINT PK_' + @prefix + 'Connection PRIMARY KEY  CLUSTERED 
  (
    ConnectionID
  )'
exec(@sql)

set @sql = 'ALTER TABLE ' + @prefix + 'DataTab ADD 
  CONSTRAINT PK_' + @prefix + 'DataTab PRIMARY KEY  CLUSTERED 
  (
    DataTabID
  )'
exec(@sql)

set @sql = 'ALTER TABLE ' + @prefix + 'ExternalMap ADD 
  CONSTRAINT PK_' + @prefix + 'ExternalMap PRIMARY KEY  CLUSTERED 
  (
    DisplayName
  )'
exec(@sql)

set @sql = 'ALTER TABLE ' + @prefix + 'Layer ADD 
  CONSTRAINT PK_' + @prefix + 'Layer PRIMARY KEY  CLUSTERED 
  (
    LayerID
  )'
exec(@sql)

set @sql = 'ALTER TABLE ' + @prefix + 'LayerFunction ADD 
  CONSTRAINT ' + @prefix + 'LayerFunctionUnique UNIQUE  NONCLUSTERED 
  (
    LayerID,
    [Function]
  )'
exec(@sql)

set @sql = 'ALTER TABLE ' + @prefix + 'LayerProximity ADD 
  CONSTRAINT ' + @prefix + 'LayerProximityUnique UNIQUE  NONCLUSTERED 
  (
    LayerID,
    ProximityID
  )'
exec(@sql)

set @sql = 'ALTER TABLE ' + @prefix + 'Level ADD 
  CONSTRAINT PK_' + @prefix + 'Level PRIMARY KEY  CLUSTERED 
  (
    ZoneLevelID, LevelID
  )'
exec(@sql)

set @sql = 'ALTER TABLE ' + @prefix + 'MapTab ADD 
  CONSTRAINT PK_' + @prefix + 'MapTab PRIMARY KEY  CLUSTERED 
  (
    MapTabID
  )'
exec(@sql)

set @sql = 'ALTER TABLE ' + @prefix + 'MapTabLayer ADD 
  CONSTRAINT ' + @prefix + 'MapTabLayerUnique UNIQUE  NONCLUSTERED 
  (
    MapTabID,
    LayerID
  )'
exec(@sql)

set @sql = 'ALTER TABLE ' + @prefix + 'Markup ADD 
  CONSTRAINT PK_' + @prefix + 'Markup PRIMARY KEY  CLUSTERED 
  (
    MarkupID
  )'
exec(@sql)

set @sql = 'ALTER TABLE ' + @prefix + 'MarkupCategory ADD 
  CONSTRAINT PK_' + @prefix + 'MarkupCategory PRIMARY KEY  CLUSTERED 
  (
    CategoryID
  )'
exec(@sql)

set @sql = 'ALTER TABLE ' + @prefix + 'MarkupGroup ADD 
  CONSTRAINT PK_' + @prefix + 'MarkupGroup PRIMARY KEY  CLUSTERED 
  (
    GroupID
  )'
exec(@sql)

set @sql = 'ALTER TABLE ' + @prefix + 'PrintTemplate ADD 
  CONSTRAINT PK_' + @prefix + 'PrintTemplate PRIMARY KEY  CLUSTERED 
  (
    TemplateID
  )'
exec(@sql)

set @sql = 'ALTER TABLE ' + @prefix + 'PrintTemplateContent ADD 
  CONSTRAINT ' + @prefix + 'PrintTemplateContentUnique UNIQUE  NONCLUSTERED 
  (
    TemplateID,
    SequenceNo
  )'
exec(@sql)

set @sql = 'ALTER TABLE ' + @prefix + 'Proximity ADD 
  CONSTRAINT PK_' + @prefix + 'Proximity PRIMARY KEY  CLUSTERED 
  (
    ProximityID
  )'
exec(@sql)

set @sql = 'ALTER TABLE ' + @prefix + 'Query ADD 
  CONSTRAINT PK_' + @prefix + 'Query PRIMARY KEY  CLUSTERED 
  (
    QueryID
  )'
exec(@sql)

set @sql = 'ALTER TABLE ' + @prefix + 'SavedState ADD 
  CONSTRAINT PK_' + @prefix + 'SavedState PRIMARY KEY  CLUSTERED 
  (
    StateID
  )'
exec(@sql)

set @sql = 'ALTER TABLE ' + @prefix + 'Zone ADD 
  CONSTRAINT PK_' + @prefix + 'Zone PRIMARY KEY  CLUSTERED 
  (
    ZoneLevelID, ZoneID
  )'
exec(@sql)

set @sql = 'ALTER TABLE ' + @prefix + 'ZoneLevel ADD 
  CONSTRAINT PK_' + @prefix + 'ZoneLevel PRIMARY KEY  CLUSTERED 
  (
    ZoneLevelID
  )'
exec(@sql)

set @sql = 'ALTER TABLE ' + @prefix + 'ZoneLevelCombo ADD 
  CONSTRAINT ' + @prefix + 'ZoneLevelComboUnique UNIQUE  NONCLUSTERED 
  (
    ZoneLevelID,
    ZoneID,
    LevelID
  )'
exec(@sql)

/* add foreign key constraints */

set @sql = 'ALTER TABLE ' + @prefix + 'Application ADD 
  CONSTRAINT FK_' + @prefix + 'Application_' + @prefix + 'ZoneLevel FOREIGN KEY 
  (
    ZoneLevelID
  ) REFERENCES ' + @prefix + 'ZoneLevel (
    ZoneLevelID
  )'
exec(@sql)

set @sql = 'ALTER TABLE ' + @prefix + 'ApplicationMapTab ADD 
  CONSTRAINT FK_' + @prefix + 'ApplicationMapTab_' + @prefix + 'Application FOREIGN KEY 
  (
    ApplicationID
  ) REFERENCES ' + @prefix + 'Application (
    ApplicationID
  ),
  CONSTRAINT FK_' + @prefix + 'ApplicationMapTab_' + @prefix + 'MapTab FOREIGN KEY 
  (
    MapTabID
  ) REFERENCES ' + @prefix + 'MapTab (
    MapTabID
  )'
exec(@sql)

set @sql = 'ALTER TABLE ' + @prefix + 'ApplicationMarkupCategory ADD 
  CONSTRAINT FK_' + @prefix + 'ApplicationMarkupCategory_' + @prefix + 'Application FOREIGN KEY 
  (
    ApplicationID
  ) REFERENCES ' + @prefix + 'Application (
    ApplicationID
  ),
  CONSTRAINT FK_' + @prefix + 'ApplicationMarkupCategory_' + @prefix + 'MarkupCategory FOREIGN KEY 
  (
    CategoryID
  ) REFERENCES ' + @prefix + 'MarkupCategory (
    CategoryID
  )'
exec(@sql)

set @sql = 'ALTER TABLE ' + @prefix + 'ApplicationPrintTemplate ADD 
  CONSTRAINT FK_' + @prefix + 'ApplicationPrintTemplate_' + @prefix + 'Application FOREIGN KEY 
  (
    ApplicationID
  ) REFERENCES ' + @prefix + 'Application (
    ApplicationID
  ),
  CONSTRAINT FK_' + @prefix + 'ApplicationPrintTemplate_' + @prefix + 'PrintTemplate FOREIGN KEY 
  (
    TemplateID
  ) REFERENCES ' + @prefix + 'PrintTemplate (
    TemplateID
  )'
exec(@sql)

set @sql = 'ALTER TABLE ' + @prefix + 'DataTab ADD 
  CONSTRAINT FK_' + @prefix + 'DataTab_' + @prefix + 'Layer FOREIGN KEY 
  (
    LayerID
  ) REFERENCES ' + @prefix + 'Layer (
    LayerID
  ), 
  CONSTRAINT FK_' + @prefix + 'DataTab_' + @prefix + 'Connection FOREIGN KEY 
  (
    ConnectionID
  ) REFERENCES ' + @prefix + 'Connection (
    ConnectionID
  )'
exec(@sql)

set @sql = 'ALTER TABLE ' + @prefix + 'LayerFunction ADD 
  CONSTRAINT FK_' + @prefix + 'LayerFunction_' + @prefix + 'Layer FOREIGN KEY 
  (
    LayerID
  ) REFERENCES ' + @prefix + 'Layer (
    LayerID
  ),
  CONSTRAINT FK_' + @prefix + 'LayerFunction_' + @prefix + 'Connection FOREIGN KEY 
  (
    ConnectionID
  ) REFERENCES ' + @prefix + 'Connection (
    ConnectionID
  )'
exec(@sql)

set @sql = 'ALTER TABLE ' + @prefix + 'LayerProximity ADD 
  CONSTRAINT FK_' + @prefix + 'LayerProximity_' + @prefix + 'Layer FOREIGN KEY 
  (
    LayerID
  ) REFERENCES ' + @prefix + 'Layer (
    LayerID
  ),
  CONSTRAINT FK_' + @prefix + 'LayerProximity_' + @prefix + 'Proximity FOREIGN KEY 
  (
    ProximityID
  ) REFERENCES ' + @prefix + 'Proximity (
    ProximityID
  )'
exec(@sql)

set @sql = 'ALTER TABLE ' + @prefix + 'Level ADD 
  CONSTRAINT FK_' + @prefix + 'Level_' + @prefix + 'ZoneLevel FOREIGN KEY 
  (
    ZoneLevelID
  ) REFERENCES ' + @prefix + 'ZoneLevel (
    ZoneLevelID
  )'
exec(@sql)

set @sql = 'ALTER TABLE ' + @prefix + 'MapTabLayer ADD 
  CONSTRAINT FK_' + @prefix + 'MapTabLayer_' + @prefix + 'Layer FOREIGN KEY 
  (
    LayerID
  ) REFERENCES ' + @prefix + 'Layer (
    LayerID
  ),
  CONSTRAINT FK_' + @prefix + 'MapTabLayer_' + @prefix + 'MapTab FOREIGN KEY 
  (
    MapTabID
  ) REFERENCES ' + @prefix + 'MapTab (
    MapTabID
  )'
exec(@sql)

set @sql = 'ALTER TABLE ' + @prefix + 'Markup ADD 
  CONSTRAINT FK_' + @prefix + 'Markup_' + @prefix + 'MarkupGroup FOREIGN KEY 
  (
    GroupID
  ) REFERENCES ' + @prefix + 'MarkupGroup (
    GroupID
  )'
exec(@sql)

set @sql = 'ALTER TABLE ' + @prefix + 'MarkupGroup ADD 
  CONSTRAINT FK_' + @prefix + 'MarkupGroup_' + @prefix + 'MarkupCategory FOREIGN KEY 
  (
    CategoryID
  ) REFERENCES ' + @prefix + 'MarkupCategory (
    CategoryID
  )'
exec(@sql)

set @sql = 'ALTER TABLE ' + @prefix + 'PrintTemplateContent ADD 
  CONSTRAINT FK_' + @prefix + 'PrintTemplateContent_' + @prefix + 'PrintTemplate FOREIGN KEY 
  (
    TemplateID
  ) REFERENCES ' + @prefix + 'PrintTemplate (
    TemplateID
  )'
exec(@sql)

set @sql = 'ALTER TABLE ' + @prefix + 'Query ADD 
  CONSTRAINT FK_' + @prefix + 'Query_' + @prefix + 'Layer FOREIGN KEY 
  (
    LayerID
  ) REFERENCES ' + @prefix + 'Layer (
    LayerID
  ),
  CONSTRAINT FK_' + @prefix + 'Query_' + @prefix + 'Connection FOREIGN KEY 
  (
    ConnectionID
  ) REFERENCES ' + @prefix + 'Connection (
    ConnectionID
  )'
exec(@sql)

set @sql = 'ALTER TABLE ' + @prefix + 'Zone ADD 
  CONSTRAINT FK_' + @prefix + 'Zone_' + @prefix + 'ZoneLevel FOREIGN KEY 
  (
    ZoneLevelID
  ) REFERENCES ' + @prefix + 'ZoneLevel (
    ZoneLevelID
  )'
exec(@sql)

set @sql = 'ALTER TABLE ' + @prefix + 'ZoneLevelCombo ADD 
  CONSTRAINT FK_' + @prefix + 'ZoneLevelCombo_' + @prefix + 'Zone FOREIGN KEY 
  (
    ZoneLevelID, ZoneID
  ) REFERENCES ' + @prefix + 'Zone (
    ZoneLevelID, ZoneID
  ),
  CONSTRAINT FK_' + @prefix + 'ZoneLevelCombo_' + @prefix + 'Level FOREIGN KEY 
  (
    ZoneLevelID, LevelID
  ) REFERENCES ' + @prefix + 'Level (
    ZoneLevelID, LevelID
  )'
exec(@sql)
