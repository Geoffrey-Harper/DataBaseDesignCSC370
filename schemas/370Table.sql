	--ENTITIES

    CREATE TABLE campaign (
		campaignId INTEGER NOT NULL PRIMARY KEY,
		campaignName varchar(100),
		campaignStartDate varchar(100) ,
		campaignEndDate varchar(100),
		campaignLocation varchar(100),
		cost REAL NOT NULL CHECK(cost >=0)
	);
    
	CREATE TABLE memebers (
		memeberId  INTEGER NOT NULL PRIMARY KEY,
		memeberName varchar(100)
	);

	CREATE TABLE items (
		itemId INTEGER NOT NULL PRIMARY KEY,
		itemName varchar(100),
		cost REAL NOT NULL CHECK (cost >=0)
	);

	CREATE TABLE event (
		eventId INTEGER NOT NULL PRIMARY KEY,
		campaignId INTEGER NOT NULL,
		eventName varchar(100),
		eventStartDate varchar(100),
		eventEndDate varchar(100), 
		eventLocation varchar(100),
		FOREIGN KEY (campaignId) REFERENCES campaign(campaignId)
	);

	CREATE TABLE donations (
		donationId INTEGER NOT NULL PRIMARY KEY,
		donator varchar(100),
		amount REAL NOT NULL check (amount >= 0)
	);

	CREATE TABLE staff (
		staffId INTEGER NOT NULL PRIMARY KEY,
		staffName varchar(100),
		salary REAL NOT NULL,
		tier INTEGER CHECK (tier = 1 or tier = 2),
		burnout BOOLEAN,
		numberOfCampaigns INTEGER CHECK (numberOfCampaigns >= 0)
	);

	CREATE TABLE office (
		officeName varchar(100) NOT NULL PRIMARY KEY,
		rentPrice REAL CHECK (rentPrice >=0)
	);

	CREATE TABLE websiteLog (
		logId INTEGER NOT NULL PRIMARY KEY,
		pushDate varchar(100),
		phaseNumber INTEGER,
		campaignId INTEGER NOT NULL,
		FOREIGN KEY (campaignId) REFERENCES campaign(campaignId)
	);

	--RELATIONS :)

	CREATE TABLE supports (
		memeberId INTEGER,
		campaignId INTEGER,
		PRIMARY KEY (memeberId,campaignId),
		FOREIGN KEY (memeberId) REFERENCES memebers(memeberId),
		FOREIGN KEY (campaignId) REFERENCES campaign(campaignId)
	);

	CREATE TABLE isFundedBy (
		donationId INTEGER,
		campaignId INTEGER,
		PRIMARY KEY (donationId,campaignId),
		FOREIGN KEY (donationId) REFERENCES donations(donationId),
		FOREIGN KEY (campaignId) REFERENCES campaign(campaignId)
	);

	CREATE TABLE purchasedFor (
		itemId INTEGER,
		staffId INTEGER,
		PRIMARY KEY (itemId,staffId),
		FOREIGN KEY (itemId) REFERENCES items(itemId),
		FOREIGN KEY (staffId) REFERENCES staff(staffId)
	);

	CREATE TABLE contributesTo (
		donationId INTEGER,
		officeName varchar(100),
		PRIMARY KEY (donationId,officeName),
		FOREIGN KEY (donationId) REFERENCES donations(donationId),
		FOREIGN KEY (officeName) REFERENCES office(officeName)
	);

	CREATE TABLE participatesIn (
		campaignId INTEGER,
		staffId INTEGER,
		PRIMARY KEY (campaignId,staffId),
		FOREIGN KEY (campaignId) REFERENCES campaign(campaignId),
		FOREIGN KEY (staffId) REFERENCES staff(staffId)
	);

	CREATE TABLE paysfor (
		donationId INTEGER,
		staffId INTEGER,
		PRIMARY KEY (donationId,staffId),
		FOREIGN KEY (donationId) REFERENCES donations(donationId),
		FOREIGN KEY (staffId) REFERENCES staff(staffId)
	);