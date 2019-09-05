--CAMPAIGN
INSERT INTO campaign (campaignId,campaignName,
	campaignStartDate,campaignEndDate,campaignLocation,cost)
Values ('1','G$','May 16th, 2019','May 10th, 2019','VicCIty','200000');

INSERT INTO campaign (campaignId,campaignName,
	campaignStartDate,campaignEndDate,campaignLocation,cost)
Values ('2','HnM','October 16th, 2019','October 31th, 2019','NewYORK','1500');

INSERT INTO campaign (campaignId,campaignName,
	campaignStartDate,campaignEndDate,campaignLocation,cost)
Values ('3','NickBreakfast','MAY 20th, 2019','August 10th, 2019','Vancouver, Washtionton','80');


INSERT INTO campaign (campaignId,campaignName,
	campaignStartDate,campaignEndDate,campaignLocation,cost)
Values ('4','GangGang','June 16th, 2019','MAY 10th, 2019','VicCIty','200000');

INSERT INTO campaign (campaignId,campaignName,
	campaignStartDate,campaignEndDate,campaignLocation,cost)
Values ('5','ICETRAY','MAY 6th, 2019','MAY 20th, 2019','VicCIty','4000000');
--END OF CAMPAIGN

--MEMBERS
INSERT INTO memebers (memeberId, memeberName)
Values ('1','GEOFF');

INSERT INTO memebers (memeberId, memeberName)
Values ('2','NICK');

INSERT INTO memebers (memeberId, memeberName)
Values ('3','ANDREAS');

--END OF MEMEBERS 

--ITEMS
INSERT INTO items (itemId,itemName,cost)
Values ('1','GolfCLUBS','10000');

INSERT INTO items (itemId,itemName,cost)
Values ('2','CEOs YACHT','10000000');

INSERT INTO items (itemId,itemName,cost)
Values ('3','BOXTICKETS TO RAPTORS GAME','6000');

--END OF ITEMS

--EVENT
INSERT INTO event (eventId,campaignId,eventName,eventStartDate,
	eventEndDate,eventLocation)
Values ('1','1','watch tiger play golf','MAY 20th, 2019',
	'MAY 24th, 2019','Vancouver');

INSERT INTO event (eventId,campaignId,eventName,eventStartDate,
	eventEndDate,eventLocation)
Values ('2','1','watch Brooks play golf','MAY 20th, 2019',
	'MAY 24th, 2019','Vancouver');

INSERT INTO event (eventId,campaignId,eventName,eventStartDate,
	eventEndDate,eventLocation)
Values ('3','5','Go get a swatch from Johnny Dang','May 20th, 2019',
	'May 20th, 2019','Vancouver');
--END OF EVENT

--DONATIONS

INSERT INTO donations (donationId,donator,amount)
Values ('1','Bono','50');

INSERT INTO donations (donationId,donator,amount)
Values ('2','STEPHEN HARPER','0');

INSERT INTO donations (donationId,donator,amount)
Values ('3','ANDREW WEAVER?','25');


--END OF DONATIONS

--STAFF

INSERT INTO staff (staffId,staffName,salary,tier,numberOfCampaigns)
Values ('1','Lebron James','5000','2','30');

INSERT INTO staff (staffId,staffName,salary,tier,numberOfCampaigns)
Values ('2','MICHEAL JEFFREY JORDAN!','6','1','2');

INSERT INTO staff (staffId,staffName,salary,tier,numberOfCampaigns)
Values ('3','PHIL KNIGHT','0','2','300');

--END OF STAFF

--OFFICE

INSERT INTO office (officeName,rentPrice)
Values ('THE HACKED LIBRARY','1000');

--END OF OFFICE

--WEBSITELOG

INSERT INTO websiteLog (logId,pushDate,phaseNumber,campaignId)
Values ('1','MAY 16th','1','1');

--END OF WEBSITELOG

--SUPPORTS

INSERT INTO supports (memeberId,campaignId)
Values ('1','1');

INSERT INTO supports (memeberId,campaignId)
Values ('1','2');

INSERT INTO supports (memeberId,campaignId)
Values ('2','1');

--END OF SUPPORTS

--ISFUNDEDBY

INSERT INTO isFundedBy (donationId,campaignId)
Values('1','2');

INSERT INTO isFundedBy (donationId,campaignId)
Values('3','2');

INSERT INTO isFundedBy (donationId,campaignId)
Values('3','1');


--END OF ISFUNDEDBY

--PURCHASEDFOR

INSERT INTO purchasedFor (itemId,staffId)
Values ('1','2');

INSERT INTO purchasedFor (itemId,staffId)
Values ('3','2');

--END OF PURCHASED FOR

--CONTRIBUTESTO

INSERT INTO contributesTo (donationId,officeName)
Values ('1','THE HACKED LIBRARY');

--END OF CONTRIBUTESTO

--PARTICIPATESIN

INSERT INTO participatesIn (campaignId,staffId)
Values ('1','1');

--END OF PARTICIAPTESIN

--PAYSFOR

INSERT INTO paysfor (donationId,staffId)
Values ('1','1');

INSERT INTO paysfor (donationId,staffId)
Values ('1','2');

