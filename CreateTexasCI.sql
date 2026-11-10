CREATE TABLE [Adresse] (
	[TaID] [int] NOT NULL ,
	[State] [smallint] NULL ,
	[ID] [int] NOT NULL ,
	[Nummer] [int] NULL ,
	[Bezeichnung1] [char] (40) COLLATE Latin1_General_CI_AS NULL ,
	[Bezeichnung2] [char] (40) COLLATE Latin1_General_CI_AS NULL ,
	[Strasse] [char] (40) COLLATE Latin1_General_CI_AS NULL ,
	[PLZ] [char] (40) COLLATE Latin1_General_CI_AS NULL ,
	[Ort] [char] (40) COLLATE Latin1_General_CI_AS NULL ,
	[Land] [char] (40) COLLATE Latin1_General_CI_AS NULL ,
	[TelefonNummer] [char] (40) COLLATE Latin1_General_CI_AS NULL ,
	[Liefertage] [char] (10) COLLATE Latin1_General_CI_AS NULL ,
	[Aktiv] [bit] NULL ,
	[LetzterImport] [datetime] NULL ,
	[Kunde_ID] [int] NULL ,
	CONSTRAINT [PK_Adresse] PRIMARY KEY  CLUSTERED 
	(
		[TaID],
		[ID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
) ON [PRIMARY]
GO

CREATE TABLE [BarcodeLeser] (
	[TaId] [int] NOT NULL ,
	[State] [smallint] NULL ,
	[ID] [int] NOT NULL ,
	[Bezeichnung] [char] (50) COLLATE Latin1_General_CI_AS NULL ,
	[Beschreibung] [char] (250) COLLATE Latin1_General_CI_AS NULL ,
	CONSTRAINT [PK_BarcodeLeser] PRIMARY KEY  CLUSTERED 
	(
		[TaId],
		[ID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
) ON [PRIMARY]
GO

CREATE TABLE [Benutzer] (
	[TaId] [int] NOT NULL ,
	[State] [smallint] NULL ,
	[ID] [int] NOT NULL ,
	[Benutzername] [char] (40) COLLATE Latin1_General_CI_AS NULL ,
	[Passwort] [char] (40) COLLATE Latin1_General_CI_AS NULL ,
	[Admin] [bit] NULL ,
	[ContainerAusgangLoeschen] [bit] NULL ,
	CONSTRAINT [PKey_Benutzer] PRIMARY KEY  CLUSTERED 
	(
		[TaId],
		[ID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
) ON [PRIMARY]
GO

CREATE TABLE [Boxen] (
	[ID] [int] NULL ,
	[EAN13] [nvarchar] (255) COLLATE Latin1_General_CI_AS NULL ,
	[Nummer] [nvarchar] (255) COLLATE Latin1_General_CI_AS NULL ,
	[Bezeichnung] [nvarchar] (255) COLLATE Latin1_General_CI_AS NULL ,
	[Typ] [nvarchar] (255) COLLATE Latin1_General_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [boxenzulassung] (
	[TaId] [int] NOT NULL ,
	[State] [smallint] NULL ,
	[ID] [int] NOT NULL ,
	[Typ] [int] NULL ,
	[LetzterImport] [datetime] NULL ,
	[Kunde_ID] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [Container] (
	[TaId] [int] NOT NULL ,
	[State] [smallint] NULL ,
	[ID] [int] NOT NULL ,
	[EAN13] [char] (40) COLLATE Latin1_General_CI_AS NULL ,
	[Nummer] [char] (40) COLLATE Latin1_General_CI_AS NULL ,
	[Bezeichnung] [char] (40) COLLATE Latin1_General_CI_AS NULL ,
	[Typ] [int] NULL ,
	[Aktiv] [bit] NULL ,
	[LetzterImport] [datetime] NULL ,
	[AktuellerAusgang_ID] [int] NULL ,
	CONSTRAINT [PKey_Container] PRIMARY KEY  CLUSTERED 
	(
		[TaId],
		[ID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
) ON [PRIMARY]
GO

CREATE TABLE [ContainerAusgang] (
	[TaId] [int] NOT NULL ,
	[State] [smallint] NULL ,
	[ID] [int] NOT NULL ,
	[EAN13] [char] (40) COLLATE Latin1_General_CI_AS NULL ,
	[Nummer] [char] (40) COLLATE Latin1_General_CI_AS NULL ,
	[Bezeichnung] [char] (40) COLLATE Latin1_General_CI_AS NULL ,
	[Typ] [int] NULL ,
	[AnERPUebergeben] [bit] NULL ,
	[ContainerAuslieferung_ID] [int] NULL ,
	CONSTRAINT [PKey_ContainerAusgang] PRIMARY KEY  CLUSTERED 
	(
		[TaId],
		[ID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
) ON [PRIMARY]
GO

CREATE TABLE [ContainerAuslieferung] (
	[TaId] [int] NOT NULL ,
	[State] [smallint] NULL ,
	[ID] [int] NOT NULL ,
	[BelegNummer] [decimal](28, 0) NULL ,
	[BelegDatum] [datetime] NULL ,
	[KundenNummer] [int] NULL ,
	[AdressNummer] [int] NULL ,
	[Bezeichnung1] [char] (40) COLLATE Latin1_General_CI_AS NULL ,
	[Bezeichnung2] [char] (40) COLLATE Latin1_General_CI_AS NULL ,
	[Strasse] [char] (40) COLLATE Latin1_General_CI_AS NULL ,
	[PLZ] [char] (40) COLLATE Latin1_General_CI_AS NULL ,
	[Ort] [char] (40) COLLATE Latin1_General_CI_AS NULL ,
	[AnERPUebergeben] [bit] NULL ,
	CONSTRAINT [PKey_ContainerAuslieferung] PRIMARY KEY  CLUSTERED 
	(
		[TaId],
		[ID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
) ON [PRIMARY]
GO

CREATE TABLE [ContainerEingang] (
	[TaId] [int] NOT NULL ,
	[State] [smallint] NULL ,
	[ID] [int] NOT NULL ,
	[LeserNummer] [char] (40) COLLATE Latin1_General_CI_AS NULL ,
	[LeserStatus] [char] (10) COLLATE Latin1_General_CI_AS NULL ,
	[LeseDatum] [datetime] NULL ,
	[EAN13] [char] (40) COLLATE Latin1_General_CI_AS NULL ,
	[Fiktiv] [bit] NULL ,
	[AnERPUebergeben] [bit] NULL ,
	CONSTRAINT [PKey_ContainerEingang] PRIMARY KEY  CLUSTERED 
	(
		[TaId],
		[ID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
) ON [PRIMARY]
GO

CREATE TABLE [ContainerTrailer] (
	[TaId] [int] NOT NULL ,
	[State] [smallint] NULL ,
	[ID] [int] NOT NULL ,
	[Trailer] [char] (20) COLLATE Latin1_General_CI_AS NULL ,
	[Codelaenge] [smallint] NULL ,
	CONSTRAINT [PK_ContainerTrailer] PRIMARY KEY  CLUSTERED 
	(
		[TaId],
		[ID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
) ON [PRIMARY]
GO

CREATE TABLE [ContainerZulassung] (
	[TaId] [int] NOT NULL ,
	[State] [smallint] NULL ,
	[ID] [int] NOT NULL ,
	[Typ] [int] NULL ,
	[LetzterImport] [datetime] NULL ,
	[Kunde_ID] [int] NULL ,
	CONSTRAINT [PKey_ContainerZulassung] PRIMARY KEY  CLUSTERED 
	(
		[TaId],
		[ID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
) ON [PRIMARY]
GO

CREATE TABLE [Kunde] (
	[TaId] [int] NOT NULL ,
	[State] [smallint] NULL ,
	[ID] [int] NOT NULL ,
	[Nummer] [int] NULL ,
	[Kurzbezeichnung] [char] (40) COLLATE Latin1_General_CI_AS NULL ,
	[Bezeichnung1] [char] (40) COLLATE Latin1_General_CI_AS NULL ,
	[Bezeichnung2] [char] (40) COLLATE Latin1_General_CI_AS NULL ,
	[Strasse] [char] (40) COLLATE Latin1_General_CI_AS NULL ,
	[PLZ] [char] (40) COLLATE Latin1_General_CI_AS NULL ,
	[Ort] [char] (40) COLLATE Latin1_General_CI_AS NULL ,
	[Land] [char] (40) COLLATE Latin1_General_CI_AS NULL ,
	[TelefonNummer] [char] (40) COLLATE Latin1_General_CI_AS NULL ,
	[Aktiv] [bit] NULL ,
	[LetzterImport] [datetime] NULL ,
	CONSTRAINT [PKey_Kunde] PRIMARY KEY  CLUSTERED 
	(
		[TaId],
		[ID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
) ON [PRIMARY]
GO

CREATE TABLE [Trx] (
	[TaId] [int] NOT NULL ,
	[Owner] [char] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Name] [char] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[State] [smallint] NULL ,
	[DatabaseName] [char] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Client] [smallint] NULL ,
	[Locale] [char] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[CreatedAt] [datetime] NULL ,
	[ModifiedAt] [datetime] NULL ,
	[RemoteStub] [char] (800) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	 PRIMARY KEY  CLUSTERED 
	(
		[TaId]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
) ON [PRIMARY]
GO

CREATE TABLE [TrxRsc] (
	[TaId] [int] NOT NULL ,
	[RscClass] [char] (100) COLLATE Latin1_General_CI_AS NOT NULL ,
	CONSTRAINT [PKey_TrxRsc] PRIMARY KEY  CLUSTERED 
	(
		[TaId],
		[RscClass]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
) ON [PRIMARY]
GO

