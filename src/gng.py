#!/usr/bin/env python

#
# This versionis currently only working with Python 2.7 (i.e., only that
# install is able to pick up the module).
#


import psycopg2
import sys

##PHASE 1
def query1():
    dbconn = psycopg2.connect(host='studsql.csc.uvic.ca', user='gambia',
        password='VRlwBXviGZ')

    cursor = dbconn.cursor()
    cursor.execute("""
    Select campaign.campaignid, campaignName, donationId,cost
    From campaign left outer join 
    isFundedBy on (campaign.campaignid = (isFundedBy.campaignid))
    Where campaign.campaignid = isFundedBy.campaignid;
    """)

    print("campaignId campaignName donationId")
    for row in cursor.fetchall():
        print((row[0], row[1]),row[2])

    cursor.close()
    dbconn.close()

def query2():
    dbconn = psycopg2.connect(host='studsql.csc.uvic.ca', user='gambia',
        password='VRlwBXviGZ')

    cursor = dbconn.cursor()
    cursor.execute("""
    Select staffName, staff.staffId, purchasedFor.itemid
    From staff left outer join
    purchasedFor on (staff.staffId = purchasedFor.staffid)
    Where staff.staffId = purchasedFor.staffId;
    """)

    print("staffName staffId ItemId")
    for row in cursor.fetchall():
        print((row[0], row[1]),row[2])

    cursor.close()
    dbconn.close()

def query3():
    dbconn = psycopg2.connect(host='studsql.csc.uvic.ca', user='gambia',
        password='VRlwBXviGZ')

    cursor = dbconn.cursor()
    cursor.execute("""
    Select memeberName, memebers.memeberid, supports.campaignid
    From memebers left outer join
    supports on (memebers.memeberid = supports.memeberid)
    Where memebers.memeberid = supports.memeberid;
    """)

    print("memberName memberId campaignid")
    for row in cursor.fetchall():
        print((row[0], row[1]),row[2])

    cursor.close()
    dbconn.close()

def query4():
    dbconn = psycopg2.connect(host='studsql.csc.uvic.ca', user='gambia',
        password='VRlwBXviGZ')

    cursor = dbconn.cursor()
    cursor.execute("""
    Select donator, donations.donationId, officeName
    From donations left outer join 
    contributesto on (donations.donationId = contributesto.donationId)
    Where donations.donationId = contributesto.donationId;
    """)

    print("donator donationId officeName")
    for row in cursor.fetchall():
        print((row[0], row[1]),row[2])

    cursor.close()
    dbconn.close()

def query5():
    dbconn = psycopg2.connect(host='studsql.csc.uvic.ca', user='gambia',
        password='VRlwBXviGZ')

    cursor = dbconn.cursor()
    cursor.execute("""
    Select count(staffId) as number_of_tier_2_staff
    From staff
    Where tier =  2;
    """)

    print("number of staff in tier 2")
    row = cursor.fetchone()
    print(row[0])

    cursor.close()
    dbconn.close()

def query6():
    dbconn = psycopg2.connect(host='studsql.csc.uvic.ca', user='gambia',
        password='VRlwBXviGZ')

    cursor = dbconn.cursor()
    cursor.execute("""
    Select staff.staffid, staffName
    From staff left outer join
    participatesIn on (staff.staffid = participatesIn.staffid)
    Where numberofcampaigns > 0 and staff.staffid = participatesIn.staffid;
    """)

    print("StaffId StaffName")
    for row in cursor.fetchall():
        print(row)

    cursor.close()
    dbconn.close()

def query7(): ##added a new query
    dbconn = psycopg2.connect(host='studsql.csc.uvic.ca', user='gambia',
        password='VRlwBXviGZ')

    cursor = dbconn.cursor()
    cursor.execute("""
    Select staffName,staffId
    From staff 
    Where salary = 0;
    """)

    print("StaffId StaffName")
    for row in cursor.fetchall():
        print(row)

    cursor.close()
    dbconn.close()

def query8():
    dbconn = psycopg2.connect(host='studsql.csc.uvic.ca', user='gambia',
        password='VRlwBXviGZ')

    cursor = dbconn.cursor()
    print("enter the city you would like to query")
    city = input()
    sql = 'Select eventLocation,eventName, eventId From event where eventLocation ILike %s'
    like_pattern = '%{}%'.format(city)
    cursor.execute(sql,(like_pattern,))

    print("EventLocation EventName EventId")
    for row in cursor.fetchall():
        print(row)

    cursor.close()
    dbconn.close()

def query9():
    dbconn = psycopg2.connect(host='studsql.csc.uvic.ca', user='gambia',
        password='VRlwBXviGZ')

    cursor = dbconn.cursor()
    cursor.execute("""
    Select avg(amount)
    From donations;
    """)

    print("Average donation amount")
    row = cursor.fetchone()
    print(row[0])

    cursor.close()
    dbconn.close()

def query10():
    dbconn = psycopg2.connect(host='studsql.csc.uvic.ca', user='gambia',
        password='VRlwBXviGZ')

    cursor = dbconn.cursor()
    print("enter Month")
    month = input()
    print("enter year")
    year = input()
    sql = 'Select count(campaignid) From event Where eventStartDate ILike %s'

    pattern = '%{}%{}'.format(month,year)
   
    cursor.execute(sql,(pattern,))

    print("number of campaigns in {} {} is".format(month, year))
    row = cursor.fetchone()
    print(row[0])

    cursor.close()
    dbconn.close()
##PHASE1END

##PHASE2

def campaign():
    dbconn = psycopg2.connect(host='studsql.csc.uvic.ca', user='gambia',
        password='VRlwBXviGZ')
    cursor = dbconn.cursor()

    marker = False

    while marker == False:
        marker = True
        print("enter campaignid")
        ID = input()
        print("enter campaignName")
        name = input()
        print("enter startDate then EndDate")
        start = input()
        end = input()
        print("enter location")
        local = input()
        print("enter cost")
        cost = input()
        while True:
            if cost.isdigit():
                break
            print("please enter a number as your cost")
            cost = input()
        try:
            cursor.execute('INSERT INTO campaign (campaignId,campaignName,campaignStartDate,campaignEndDate,campaignLocation,cost) Values (%s,%s,%s,%s,%s,%s)',(ID,name,start,end,local,cost));
        except:
            print("INVALID INPUT!!! :(")
            marker = False
        if marker == True:
            break
    cursor.close()
    dbconn.close()
    print("campaign has been added with campaignid {} campaignName {} campaignStartDate {} campaignEndDate {} campaignLocation {} cost {}".format(ID,name,start,end,local,cost))

def event():
    dbconn = psycopg2.connect(host='studsql.csc.uvic.ca', user='gambia',
        password='VRlwBXviGZ')
    cursor = dbconn.cursor()

    marker = False

    while marker == False:
        marker = True
        print("enter Evntid")
        ID = input()
        print("enter campaignId")
        cam = input()
        print("enter EventName")
        name = input()
        print("enter startDate")
        start = input()
        print("enter endDate")
        end = input()
        print("enter location")
        local = input()
        try:
             cursor.execute(""" 
                SELECT campaignId from campaign where campaignId = %s""",(cam))
        except:
            print("INVALID campaignId !! :(")
            marker = False
        try:
            cursor.execute('INSERT INTO event (eventId,campaignId,eventName,eventStartDate,eventEndDate,eventLocation) Values (%s,%s,%s,%s,%s,%s)',(ID,cam,name,start,end,local));
        except:
            print("INVALID EventID!!! :(")
            marker = False
        if marker == True:
            break
    cursor.close()
    dbconn.close()
    print("event has been added with eventID {} campaignid {} eventName {} eventStartDate {} eventEndDate {} eventLocation {}".format(ID,cam,name,start,end,local))

def volunteer():
    dbconn = psycopg2.connect(host='studsql.csc.uvic.ca', user='gambia',
        password='VRlwBXviGZ')
    cursor = dbconn.cursor()
    marker = False
    while marker == False:
        marker = True
        print("who do you want to assign to a campaign? Please enter thier staffID")
        ID = input()
        print("Please enter the campaignid to which you are assigning the volunteer too")
        cam = input()
        try:
            cursor.execute(""" Select staffId from staff where staffId = %s""",(ID))
            cursor.execute("""Select numberOfcampaigns from staff where staffId = %s """,(ID))
            row = cursor.fetchone()

            print("this staff  of staff ID:" + ID + " has worked this number of campaigns:")
            print(row[0])
            print("are you sure you would like to assign them to another")
            print("enter 'n' to choose another staff member")
            t = input()
            if t == 'n':
                marker = False

        except:
            print("INVALID staffID !! :(")
            marker = False

        try:
             cursor.execute(""" 
                SELECT campaignId from campaign where campaignId = %s""",(cam))
        except:
            print("INVALID campaignId !! :(")
            marker = False
        try:
            cursor.execute('INSERT INTO participatesIn (campaignId,staffId) Values (%s,%s)',(cam,ID))
            cursor.execute("""Select numberOfcampaigns from staff where staffId = %s """,(ID))
            camper = cursor.fetchone()
            camper = int(camper[0]) + 1
            camper = str(camper)
            print(camper)
            cursor.execute('UPDATE staff SET numberofcampaigns = %s Where staffId = %s',(camper,ID))
        except:
            print("volunteer has already been assigned to this campaing")
            marker = False

        if marker == True:
            break

    print("volunteer {} was successfully assigned to campaign {}".format(ID,cam))


    cursor.close()
    dbconn.close()

##END PHASE 2
##PHASE 3

def campaigncosts():
    dbconn = psycopg2.connect(host='studsql.csc.uvic.ca', user='gambia',
        password='VRlwBXviGZ')
    cursor = dbconn.cursor()

    cursor.execute("""Select campaignName,cost
    From campaign left outer join 
    isFundedBy on (campaign.campaignid = (isFundedBy.campaignid))
    Where campaign.campaignid = isFundedBy.campaignid;""")

    data = cursor.fetchall()

    data.sort(key=lambda data: data[1])


## The following code was adapted from 
#https://alexwlchan.net/2018/05/ascii-bar-charts/

    max_value = max(count for _, count in data)
    increment = max_value / 25

    longest_label_length = max(len(label) for label, _ in data)

    for label, count in data:

        # The ASCII block elements come in chunks of 8, so we work out how
        # many fractions of 8 we need.
        # https://en.wikipedia.org/wiki/Block_Elements
        bar_chunks, remainder = divmod(int(count * 8 / increment), 8)

        # First draw the full width chunks
        bar = '█' * bar_chunks

    # Then add the fractional  part.  The Unicode code points for
    # block elements are (8/8), (7/8), (6/8), ... , so we need to
    # work backwards.
        if remainder > 0:
            bar += chr(ord('█') + (8 - remainder))

    # If the bar is empty, add a left one-eighth block
        bar = bar or  '▏'

        print(f'{label.rjust(longest_label_length)} ▏ {count:#4.2f} {bar}')


    cursor.close()
    dbconn.close()

def officecosts():
    dbconn = psycopg2.connect(host='studsql.csc.uvic.ca', user='gambia',
        password='VRlwBXviGZ')
    cursor = dbconn.cursor()

    cursor.execute("""Select officeName, amount
    From donations left outer join 
    contributesto on (donations.donationId = contributesto.donationId)
    Where donations.donationId = contributesto.donationId;""")

    data = cursor.fetchall()

    data.sort(key=lambda data: data[1])

    ## The following code was adapted from 
#https://alexwlchan.net/2018/05/ascii-bar-charts/

    max_value = max(count for _, count in data)
    increment = max_value / 25

    longest_label_length = max(len(label) for label, _ in data)

    for label, count in data:

        # The ASCII block elements come in chunks of 8, so we work out how
        # many fractions of 8 we need.
        # https://en.wikipedia.org/wiki/Block_Elements
        bar_chunks, remainder = divmod(int(count * 8 / increment), 8)

        # First draw the full width chunks
        bar = '█' * bar_chunks

    # Then add the fractional  part.  The Unicode code points for
    # block elements are (8/8), (7/8), (6/8), ... , so we need to
    # work backwards.
        if remainder > 0:
            bar += chr(ord('█') + (8 - remainder))

    # If the bar is empty, add a left one-eighth block
        bar = bar or  '▏'

        print(f'{label.rjust(longest_label_length)} ▏ {count:#4.2f} {bar}')

    cursor.close()
    dbconn.close()
##END PHASE3

##PHASE 4

def memberhistory():
    dbconn = psycopg2.connect(host='studsql.csc.uvic.ca', user='gambia',
        password='VRlwBXviGZ')
    cursor = dbconn.cursor()
    marker = False
    while marker == False:
        marker = True
        print("enter thier staffID of the member history you want to view")
        ID = input()
        try:
            cursor.execute(""" Select staffId from staff where staffId = %s""",(ID))
            cursor.execute("""Select numberOfcampaigns from staff where staffId = %s """,(ID))
            row = cursor.fetchone()
            
            print("this staff  of staff ID:" + ID + " has worked this number of campaigns:")
            print(row[0])
            #print("There burnout value is " + turth)

        except:
            print("Invalid staffID :(")
            marker = False
            continue

        print()
        
        print("THE Burnout for the staff member of ID " + ID)
        cursor.execute("""
        SELECT burnout
        FROM Staff
        Where staffId = %s
        """,(ID))
        res = cursor.fetchall()

        for row in res:
            print(row[0])

        print("Do you want to reassign their burnout value type 'y'")
        t = input()

        
        if t == 'y':
            try:
                print("type 'True' to set to true. Type 'False' to set to false")
                camper = input()
                cursor.execute('UPDATE staff SET burnout = %s Where staffId = %s',(camper,ID))
                print("you have set staff member of ID " + ID + " Burnout value to " + camper)
            except:
                print("Invalid input")
                marker = False

    cursor.close()
    dbconn.close()
#END PHASE 4

#PHASE 5

def website():
    dbconn = psycopg2.connect(host='studsql.csc.uvic.ca', user='gambia',
        password='VRlwBXviGZ')

    cursor = dbconn.cursor()

    marker = False
    while marker == False:
        marker = True
        print("what campaignid do you want to push to the website log")
        ID = input()
        try:
            cursor.execute(""" Select campaignId from campaign where campaignId = %s""",(ID))

        except:
            print("INVALID campaignID !! :(")
            marker = False
            continue

        print("Please enter the logid you are creating to which you are assigning the campagin too")
        cam = input()

        print("what is the phase the campaign is in")
        phase = input()
        print("enter the push date")
        date = input()
        try:
            cursor.execute('INSERT INTO websiteLog (logId,pushDate,phaseNumber,campaignId) Values (%s,%s,%s,%s)',(cam,date,phase,ID))
        except:
            print("campaign has already been assigned to this weblog")
            marker = False

        if marker == True:
            break

    print("you have added a website log of Id {0} push date {1} phase number {2} campaignid {3}".format(cam,date,phase,ID))

    cursor.close()
    dbconn.close()




def main():
    print("Hello. Welcome to the GNG database what would you like to do")
    while True:
        inner = True
        print("To Query type 'q'\nSet up a Campaign type 'setup'\nRetrive Accounting info type 'accounting'\nMembership history type 'history'")
        print("Push campagin to website type 'website' ")
        print("To exit program type 'quit'")
        the_bay= input()
        if the_bay =='q':
            while inner == True:
                print("this is the query section. To select a query type the correspoinding number according to each option, using numbers 1-10")
                print("1: Campaigns funded by donations")
                print("2: Staff members who have purchased items")
                print("3: Members of GnG who support Campaigns")
                print("4: Donators who fund the office")
                print("5: Number of tier 2 staff")
                print("6: Staff participating a Campaigns")
                print("7: Staff who are volunteers")
                print("8: Events in a specific city")
                print("9: Average donation cost")
                print("10: Number of campaigns in a certain year and month")
                print("enter 'back' to return to homepage")
                num = input()

                if num == '1':
                    query1()
                if num == '2':
                    query2()
                if num == '3':
                    query3()
                if num == '4':
                    query4()
                if num == '5':
                    query5()
                if num == '6':
                    query6()
                if num == '7':
                    query7()
                if num == '8':
                    query8()
                if num == '9':
                    query9()
                if num == '10':
                    query10()
                
                if num == 'back':
                    print('hit enter to complete the return')
                    break
                else:
                    continue
                num = None

        if the_bay == 'setup':
            while True:
                print("To setup campaign type 'c'")
                print("To create an event type 'ec")
                print("To add volunteers to a specific campaign type 'v'")
                print("To return to homepage type 'back'")
                su = input()
                if su == 'c':
                    campaign()
                if su == 'v':
                    volunteer()
                if su == 'ec':
                    event()
                if su == 'back':
                    break

        if the_bay == 'accounting':
            while True:
                print("To look at cost out type 'out'")
                print("To look at costs in type 'in'")
                print("To return to homepage type 'back'")
                ac = input()
                if ac == 'out':
                    campaigncosts()
                if ac == 'in':
                    officecosts()
                if ac == 'back':
                    break
        if the_bay =='history':
            print("To view a members history type 'h'")
            mem = input()
            if mem == 'h':
                memberhistory()
        if the_bay =='website':
            website()

        if the_bay == 'quit':
            break
        else:
            continue

if __name__ == "__main__": main()
