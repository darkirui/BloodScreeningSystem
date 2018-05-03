USE [karp]
GO

IF(NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE  TABLE_NAME = 'dtl_users'))
	BEGIN
		CREATE TABLE dtl_users(userid INT IDENTITY(1,1) PRIMARY KEY, username varchar(100) NOT NULL, userpassword TEXT NOT NULL, roleid INT, facilityid INT)
	END
GO

IF(NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE  TABLE_NAME = 'dtl_facilities'))
	BEGIN
		CREATE TABLE dtl_facilities(facilityid INT IDENTITY(1,1) PRIMARY KEY, facilityname varchar(100))
	END
GO

IF(NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE  TABLE_NAME = 'dtl_roles'))
	BEGIN
		CREATE TABLE dtl_roles(roleid INT IDENTITY(1,1) PRIMARY KEY, rolename varchar(100), responsibilityid INT)
	END
GO

IF(NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE  TABLE_NAME = 'dtl_patient'))
	BEGIN
		CREATE TABLE dtl_patient(patientid INT IDENTITY(1,1) PRIMARY KEY, surname varchar(100), firstname varchar(100), lastname varchar(100), phonenumber text, idno text, dob date)
	END
GO

IF(NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE  TABLE_NAME = 'dtl_screeningforms'))
	BEGIN
		CREATE TABLE dtl_screeningforms(screenid INT IDENTITY(1,1) PRIMARY KEY, screenname varchar(100), responsibityid INT)
	END
GO

IF(NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE  TABLE_NAME = 'dtl_screeningdata'))
	BEGIN
		CREATE TABLE dtl_screeningdata(dataid INT IDENTITY(1,1) PRIMARY KEY, screenid INT NOT NULL, patientid int NOT NULL, visitdate date, facilityid int, userid int)
	END
GO

IF(NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE  TABLE_NAME = 'dtl_bloodpressurescreening'))
	BEGIN
		CREATE TABLE dtl_bloodpressurescreening(bpid INT IDENTITY(1,1) PRIMARY KEY, patientid INT NOT NULL, dataid INT NOT NULL, createdate date, updatedate date, systolic int, diastolic int, bpstatus varchar, notes text)
	END
GO

--insert blood pressure form
IF EXISTS(SELECT screenid FROM dtl_screeningforms WHERE screenname = 'BPF')
	BEGIN
		INSERT INTO dtl_screeningforms(screenname)VALUES('BPF')
	END
GO

--create procedure to create user
CREATE procedure [dbo].[pr_createuser]
(
	@username varchar(100), @userpassword text, @roleid int
)
AS
	BEGIN
		IF EXISTS(SELECT userid FROM dtl_users WHERE username = @username)
			BEGIN
				SELECT userid FROM dtl_users WHERE username = @username
			END
		ELSE
			BEGIN 
				INSERT INTO dtl_users(username,userpassword,roleid)VALUES(@username,@userpassword,@roleid)
			END
	END
GO



-- create procedure to login user
CREATE procedure[dbo].[pr_loginuser]
(
	@username varchar(100), @userpassword text
)
AS
	BEGIN
		SELECT userid,username FROM dtl_users WHERE username = @username and userpassword LIKE @userpassword
	END
GO


--create procedure to create patient
CREATE procedure[dbo].[pr_createpatient]
(
	@surname varchar(100), @firstname varchar(100), @lastname varchar(100), @phonenumber text, @idno text, @dob date
)
AS
	BEGIN
		IF(NOT EXISTS(SELECT patientid FROM dtl_patient WHERE phonenumber LIKE @phonenumber OR idno LIKE @idno))
			BEGIN
				INSERT INTO dtl_patient(surname,firstname,lastname,phonenumber,idno,dob)VALUES(@surname,@firstname,@lastname,@phonenumber,@idno,@dob)
				SElECT * FROM dtl_patient WHERE patientid = IDENT_CURRENT('dtl_patient')
			END
	END
GO

ALTER procedure[dbo].[pr_createpatient]
(
	@surname varchar(100), @firstname varchar(100), @lastname varchar(100), @phonenumber text, @idno text, @dob date,@patientid int,@facilityid int 
)
AS
	BEGIN
		IF(NOT EXISTS(SELECT patientid FROM dtl_patient WHERE phonenumber LIKE @phonenumber OR idno LIKE @idno))
			BEGIN
				INSERT INTO dtl_patient(surname,firstname,lastname,phonenumber,idno,dob)VALUES(@surname,@firstname,@lastname,@phonenumber,@idno,@dob)
				INSERT INTO dtl_screeningdata(patientid,visitdate,facilityid,userid)VALUES(@patientid,GETDATE(),@facilityid,@dob)
			END
	END
GO



-- create procedure to search patient
CREATE procedure[dbo].[pr_searchpatient]
(
	@phonenumber text, @idno text
)
AS
	BEGIN
		SELECT * FROM dtl_patient WHERE phonenumber LIKE @phonenumber OR idno LIKE @idno
	END
GO

-- create procedure to save/update blood pressure screening data
CREATE procedure[dbo].[pr_saveupdate]
(
	@screenid int, @dataid int, @patientid int, @visitdate date, @facilityid int, @userid int, @systolic int, @diastolic int, @bpstatus varchar(100), @notes text 
)
AS
	BEGIN
		IF EXISTS (SELECT * FROM dtl_screeningdata WHERE dataid = @dataid)
			BEGIN
				UPDATE dtl_bloodpressurescreening SET updatedate = GETDATE(),systolic = @systolic, diastolic = @diastolic, bpstatus = @bpstatus, notes = @notes
			END
		ELSE
			BEGIN
				INSERT INTO dtl_screeningdata(screenid, patientid, visitdate, facilityid, userid)VALUES(@screenid,@patientid,@visitdate,@facilityid,@userid)
				INSERT INTO dtl_bloodpressurescreening(patientid, dataid,createdate,systolic,diastolic,bpstatus,notes)VALUES(@patientid,IDENT_CURRENT('dtl_screeningdata'),GETDATE(),@systolic,@diastolic,@bpstatus,@notes)
			END
	END
GO


-- create procedure to get patient data
CREATE procedure[dbo].[pr_getpatientdata]
(
	@patientid int, @dataid int
)
AS
	BEGIN
		SELECT s.visitdate,s.userid,p.* FROM dtl_bloodpressurescreening p INNER JOIN dtl_screeningdata s ON s.dataid = p.dataid WHERE p.dataid = @dataid
	END
GO

-- create procedure to create facility 
CREATE procedure[dbo].[pr_createfacility] 
(
	@facilityname varchar(100)
)
AS
	BEGIN
		INSERT INTO dtl_facilities(facilityname)VALUES(@facilityname)
	END
GO


-- create procedure to create user roles
CREATE procedure[dbo].[pr_createuserrole]
(
	@rolename varchar
)
AS
	BEGIN
		INSERT INTO dtl_roles(rolename)VALUES(@rolename)
	END
GO



