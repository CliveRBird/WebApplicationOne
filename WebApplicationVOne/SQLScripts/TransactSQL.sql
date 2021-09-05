
drop table if exists Continent;
go

create table Continent
(
ContinentID int identity(1,1) primary key,
Name		varchar(100) not null,
Active		bit not null
);

insert into Continent (Name,Active) values ('North America',1);
insert into Continent (Name,Active) values ('South America',1);
insert into Continent (Name,Active) values ('Europe',1);
insert into Continent (Name,Active) values ('Asia',1);
insert into Continent (Name,Active) values ('Africa',1);

select * from Continent

drop table if exists Country;

create table Country
(
CountryID	int identity(1,1) primary key,
Name		varchar(100) not null,
ContinentID int foreign key references Continent(ContinentID),
Active		bit not null
);

insert into Country (Name,ContinentID,Active) values ('USA',1,1);
insert into Country (Name,ContinentID,Active) values ('Canada',1,1);
insert into Country (Name,ContinentID,Active) values ('Mexico',2,1);
insert into Country (Name,ContinentID,Active) values ('Brazil',2,1);
insert into Country (Name,ContinentID,Active) values ('Peru',2,1);
insert into Country (Name,ContinentID,Active) values ('United Kingdom',3,1);
insert into Country (Name,ContinentID,Active) values ('France',3,1);
insert into Country (Name,ContinentID,Active) values ('Germany',3,1);
insert into Country (Name,ContinentID,Active) values ('Spain',3,1);
insert into Country (Name,ContinentID,Active) values ('Ireland',3,1);
insert into Country (Name,ContinentID,Active) values ('Singapore',4,1);
insert into Country (Name,ContinentID,Active) values ('Malaysia',4,1);
insert into Country (Name,ContinentID,Active) values ('South Africa',5,1);
insert into Country (Name,ContinentID,Active) values ('Lybia',5,1);

select * from Country;

drop table if exists Airport;

create table Airport
(
AirportID	int identity(1,1) primary key,
Name		varchar(100) not null,
CountryID	int foreign key references Country(CountryID),
Active		bit not null
);

insert into Airport (Name,CountryID,Active) values ('Heathrow',1,1);
insert into Airport (Name,CountryID,Active) values ('Dublin',1,1);
insert into Airport (Name,CountryID,Active) values ('Paris CDG',1,1);
insert into Airport (Name,CountryID,Active) values ('New York JFK',1,1);

select * from Airport;


SELECT CountryID, [Continent].[Name] Name,  [Country].[ContinentID] ContinentID, [Continent].Name ContinentName, [Country].[Active] Active  FROM [Country] INNER JOIN [Continent] ON ([Continent].ContinentID = [Country].[ContinentID])


select * from Country

select (ROW_NUMBER() over (order by countryid)) as rownumber , name, active from Country;

--
-- visit
--
drop table if exists tblApplicationStatus;
go

create table tblApplicationStatus
(
ApplicationStatusPK int identity(1,1) not null primary key,
StatusName		varchar(50) not null
);
go

INSERT INTO tblApplicationStatus (StatusName) VALUES ('Valid');
INSERT INTO tblApplicationStatus (StatusName) VALUES ('Invalid');
INSERT INTO tblApplicationStatus (StatusName) VALUES ('Delete');

drop table if exists tblVisitApplication;
go

create table tblVisitApplication
(
ApplicationPK			int identity(1,1) not null primary key,
ReferenceID				uniqueidentifier not null default newid(),
VisitDescription		varchar(500),
Size					int,
POC						varchar(50),
[ApplicationStatusFK]	int not null,
lastupdated				datetime default getdate(),
Active					bit default 1
);
go

ALTER TABLE tblVisitApplication  
ADD CONSTRAINT FK_ApplicationStatusFK FOREIGN KEY([ApplicationStatusFK])
        REFERENCES tblApplicationStatus (ApplicationStatusPK);
go

drop table if exists tblApplicant;
go

create table tblApplicant
(
ApplicantPK				int identity(1,1) not null primary key,
ApplicantReferenceID	uniqueidentifier not null default newid(),
ApplicationFK			int not null,
passportnumber			varchar(50) not null,
passportExpiry			varchar(50),
lastupdated				datetime default getdate(),
Active					bit default 1
);
go

alter table tblApplicant add  passportcolour varchar(50) null;

ALTER TABLE tblApplicant  
ADD CONSTRAINT FK_ApplicationFK FOREIGN KEY(ApplicationFK)
        REFERENCES tblVisitApplication (ApplicationPK);
go

drop table if exists tblSite
go

Create table tblSite
(
SitePK		int identity(1,1) not null primary key,
SiteName	varchar(50) not null
);
go

INSERT INTO tblSite VALUES ('Site A');
INSERT INTO tblSite VALUES ('Site B');

drop table if exists tblApplicantSiteVisit;
go

create table tblApplicantSiteVisit
(
ApplicantSiteVisit				int identity(1,1) not null primary key,
ApplicantSiteVisitReferenceID	uniqueidentifier not null default newid(),
ApplicantFK						int not null,
SiteFK							int,
arrivalDT						datetime not null,
departureDT						datetime not null,
lastupdated						datetime default getdate(),
Active							bit default 1
);
go

ALTER TABLE tblApplicantSiteVisit  
ADD CONSTRAINT FK_ApplicantFK FOREIGN KEY(ApplicantFK)
        REFERENCES tblSite (SitePK);
go


insert into tblVisitApplication
(

VisitDescription		,
Size					,
POC						,
[ApplicationStatusFK]	
) VALUES
(
'To see friends',
1,
'Clive',
2
);
go


insert into tblApplicant
(
ApplicationFK,
passportnumber,
passportExpiry
) VALUES (
1,
'A123',
'June 2022'
)
go

insert into tblApplicant
(
ApplicationFK,
passportnumber,
passportExpiry
) VALUES (
1,
'B9923',
'May 2022'
)
go

Insert into tblApplicantSiteVisit
(
ApplicantFK	,
SiteFK,
arrivalDT,
departureDT
) values
(
1,
1,
getdate(),
getdate()
)
go

select * from tblApplicant