Select campaign.campaignid, campaignName, donationId,cost
From campaign left outer join 
isFundedBy on (campaign.campaignid = (isFundedBy.campaignid))
Where campaign.campaignid = isFundedBy.campaignid;

Select staffName, staff.staffId, purchasedFor.itemid
From staff left outer join
purchasedFor on (staff.staffId = purchasedFor.staffid)
Where staff.staffId = purchasedFor.staffId;

Select memeberName, memebers.memeberid, supports.campaignid
From memebers left outer join
supports on (memebers.memeberid = supports.memeberid)
Where memebers.memeberid = supports.memeberid;

Select donator, donations.donationId, officeName
From donations left outer join 
contributesto on (donations.donationId = contributesto.donationId)
Where donations.donationId = contributesto.donationId;

Select staff.staffid, staffName
From staff left outer join
participatesIn on (staff.staffid = participatesIn.staffid)
Where numberofcampaigns > 0 and staff.staffid = participatesIn.staffid;

Select staffName,salary,numberofcampaigns
From staff 
Where tier = 2 and salary > 6;

Select count(staffId) as number_of_tier_2_staff
From staff
Where tier =  2;

Select campaignName, campaignStartDate, campaignEndDate,campaignid
From campaign
Where campaignStartDate like '%MAY%2019';

Select pushDate, logId
From websiteLog
Where phaseNumber >= 1;

Select count(campaignid) as total_campaigns
from event
where eventStartDate like '%MAY%2019';

Select sum(cost)
From items;

Select avg(amount)
From donations;

Select count(donator) as numberofdonations
From donations;

Select donator
From donations
Where amount >=0 and amount <= 100;

Select eventLocation,eventName, eventId
From event
where eventLocation like 'Vancouver%'
order by eventName;

