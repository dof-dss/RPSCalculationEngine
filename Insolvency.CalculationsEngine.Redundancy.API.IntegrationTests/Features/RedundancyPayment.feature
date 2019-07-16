Feature: Redundancy Payment
	 scenarios around automated testing of the Projected Notice via the Gateway

@AutomationTest
Scenario:  Test PingGet Method
	Given I want to test "aggpinggetrp" method
	When I make a request to the Redundancy Payment Endpoint
	Then I get a response with status code "200"
	And the response contains "PingGet response from RPS Api RedundancyPay"
	
@AutomationTest
Scenario: Employed for 2 Years
# Tests that when an employee has been employed for 2 years they are entitled to 2 weeks of redundancy pay
	When I post to the Redundancy Payments endpoint with:
"""
{
  "employmentStartDate": "2016-10-01T10:50:56.008Z",
  "dismissalDate": "2018-10-01T10:50:56.008Z",
  "dateNoticeGiven": "2018-10-02T10:50:56.008Z",
  "claimReceiptDate": "2018-10-01T10:50:56.008Z",
  "dateOfBirth": "1997-10-01T10:50:56.008Z",
  "weeklyWage": 104.61,
  "employerPartPayment": 0,
  "employmentBreaks": 0,
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "adjEmploymentStartDate": "2016-10-01T10:50:56.008Z",
  "noticeEntitlementWeeks": 2,
  "noticeDateForRedundancyPay": "2018-10-15T10:50:56.008Z",
  "yearsOfServiceUpto21": 2,
  "yearsOfServiceFrom22To41": 0,
  "yearsServiceOver41": 0,
  "redundancyPayWeeks": 1,
  "grossEntitlement": 104.61,
  "employerPartPayment": 0,
  "netEntitlement": 104.61,
  "preferentialClaim": 0,
  "nonPreferentialClaim": 104.61,
  "statutoryMax" : 508
}
"""

@AutomationTest
Scenario: Employed for 21 Years
# Tests that when an employee has been employed for 21 years they are entitled to 20 weeks of redundancy pay
	When I post to the Redundancy Payments endpoint with:
"""
{
  "employmentStartDate": "1997-10-01T10:50:56.008Z",
  "dismissalDate": "2018-10-01T10:50:56.008Z",
  "dateNoticeGiven": "2018-10-01T10:50:56.008Z",
  "claimReceiptDate": "2018-10-01T10:50:56.008Z",
  "dateOfBirth": "1956-09-01T10:50:56.008Z",
  "weeklyWage": 300,
  "employerPartPayment": 0,
  "employmentBreaks": 0,
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "adjEmploymentStartDate": "1997-10-01T10:50:56.008Z",
  "noticeEntitlementWeeks": 12,
  "noticeDateForRedundancyPay": "2018-12-24T10:50:56.008Z",
  "yearsOfServiceUpto21": 0,
  "yearsOfServiceFrom22To41": 0,
  "yearsServiceOver41": 20,
  "redundancyPayWeeks": 30,
  "grossEntitlement": 9000,
  "employerPartPayment": 0,
  "netEntitlement": 9000,
  "preferentialClaim": 0,
  "nonPreferentialClaim": 9000,
  "statutoryMax" : 508
}
"""

@AutomationTest
Scenario: Adjusted Employment Start Date
# Tests that when an employee has taken employment breaks then the start date is adjusted
# Due to the Notice period extending to 2018-12-24 an employment break of 450 is required to have an impact on the financial output of this calculation
	When I post to the Redundancy Payments endpoint with:
"""
{
  "employmentStartDate": "1997-10-01T10:50:56.008Z",
  "dismissalDate": "2018-10-01T10:50:56.008Z",
  "dateNoticeGiven": "2018-10-01T10:50:56.008Z",
  "claimReceiptDate": "2018-10-01T10:50:56.008Z",
  "dateOfBirth": "1955-09-01T10:50:56.008",
  "weeklyWage": 300,
  "employerPartPayment": 0,
  "employmentBreaks": 450,
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "adjEmploymentStartDate": "1998-12-25T10:50:56.008Z",
  "noticeEntitlementWeeks": 12,
  "noticeDateForRedundancyPay": "2018-12-24T10:50:56.008Z",
  "yearsOfServiceUpto21": 0,
  "yearsOfServiceFrom22To41": 0,
  "yearsServiceOver41": 19,
  "redundancyPayWeeks": 28.5,
  "grossEntitlement": 8550,
  "employerPartPayment": 0,
  "netEntitlement": 8550,
  "preferentialClaim": 0,
  "nonPreferentialClaim": 8550,
  "statutoryMax" : 508
}
"""

@AutomationTest
Scenario: Employer Part Paid
# Tests that when an employer has paid part of the claim, then the payout is adjusted
	When I post to the Redundancy Payments endpoint with:
"""
{
  "employmentStartDate": "1997-10-01T10:50:56.008Z",
  "dismissalDate": "2018-10-01T10:50:56.008Z",
  "dateNoticeGiven": "2018-10-01T10:50:56.008Z",
  "claimReceiptDate": "2018-10-01T10:50:56.008Z",
  "dateOfBirth": "1956-09-01T10:50:56.008Z",
  "weeklyWage": 300,
  "employerPartPayment": 3000,
  "employmentBreaks": 0,
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "adjEmploymentStartDate": "1997-10-01T10:50:56.008Z",
  "noticeEntitlementWeeks": 12,
  "noticeDateForRedundancyPay": "2018-12-24T10:50:56.008Z",
  "yearsOfServiceUpto21": 0,
  "yearsOfServiceFrom22To41": 0,
  "yearsServiceOver41": 20,
  "redundancyPayWeeks": 30,
  "grossEntitlement": 6000,
  "employerPartPayment": 3000,
  "netEntitlement": 6000,
  "preferentialClaim": 0,
  "nonPreferentialClaim": 6000,
  "statutoryMax" : 508
}
"""

@AutomationTest
Scenario: Employer Paid More Than Entitlement
# Tests that when an employer has paid the employee more than the value of the claim, then the payout is adjusted to show the value of the entitlement and nothing to be paid
	When I post to the Redundancy Payments endpoint with:
"""
{
  "employmentStartDate": "1997-10-01T10:50:56.008Z",
  "dismissalDate": "2018-10-01T10:50:56.008Z",
  "dateNoticeGiven": "2018-10-01T10:50:56.008Z",
  "claimReceiptDate": "2018-10-01T10:50:56.008Z",
  "dateOfBirth": "1956-09-01T10:50:56.008Z",
  "weeklyWage": 300,
  "employerPartPayment": 10000,
  "employmentBreaks": 0,
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "adjEmploymentStartDate": "1997-10-01T10:50:56.008Z",
  "noticeEntitlementWeeks": 12,
  "noticeDateForRedundancyPay": "2018-12-24T10:50:56.008Z",
  "yearsOfServiceUpto21": 0,
  "yearsOfServiceFrom22To41": 0,
  "yearsServiceOver41": 20,
  "redundancyPayWeeks": 30,
  "grossEntitlement": 0,
  "employerPartPayment": 10000,
  "netEntitlement": 0,
  "preferentialClaim": 0,
  "nonPreferentialClaim": 0,
  "statutoryMax" : 508
}
"""

@AutomationTest
Scenario: Employee Given Extended Notice
# Tests that when an employee has been given more notice than they are entitled to then the calculation is still worked out to the dismissal date
	When I post to the Redundancy Payments endpoint with:
"""
{
  "employmentStartDate": "1997-10-01T10:50:56.008Z",
  "dismissalDate": "2018-10-01T10:50:56.008Z",
  "dateNoticeGiven": "2018-05-01T10:50:56.008Z",
  "claimReceiptDate": "2018-10-01T10:50:56.008Z",
  "dateOfBirth": "1956-09-01T10:50:56.008Z",
  "weeklyWage": 300,
  "employerPartPayment": 0,
  "employmentBreaks": 0,
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "adjEmploymentStartDate": "1997-10-01T10:50:56.008Z",
  "noticeEntitlementWeeks": 12,
  "noticeDateForRedundancyPay": "2018-10-01T10:50:56.008Z",
  "yearsOfServiceUpto21": 0,
  "yearsOfServiceFrom22To41": 0,
  "yearsServiceOver41": 20,
  "redundancyPayWeeks": 30,
  "grossEntitlement": 9000,
  "employerPartPayment": 0,
  "netEntitlement": 9000,
  "preferentialClaim": 0,
  "nonPreferentialClaim": 9000,
  "statutoryMax" : 508
}
"""

Scenario: No Minimum Age
# Tests that an employee has no minimum age for working
	When I post to the Redundancy Payments endpoint with:
"""
{
  "employmentStartDate": "1997-10-01T10:50:56.008Z",
  "dismissalDate": "2018-10-01T10:50:56.008Z",
  "dateNoticeGiven": "2018-05-01T10:50:56.008Z",
  "claimReceiptDate": "2018-10-01T10:50:56.008Z",
  "dateOfBirth": "1997-10-01T10:50:56.008Z",
  "weeklyWage": 100,
  "employerPartPayment": 0,
  "employmentBreaks": 0,
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "adjEmploymentStartDate": "1997-10-01T10:50:56.008Z",
  "noticeEntitlementWeeks": 12,
  "noticeDateForRedundancyPay": "2018-10-01T10:50:56.008Z",
  "yearsOfServiceUpto21": 20,
  "yearsOfServiceFrom22To41": 0,
  "yearsServiceOver41": 0,
  "redundancyPayWeeks": 10,
  "grossEntitlement": 1000,
  "employerPartPayment": 0,
  "netEntitlement": 1000,
  "preferentialClaim": 0,
  "nonPreferentialClaim": 1000,
  "statutoryMax" : 508
}
"""

Scenario: No Maximum Age
# Tests that an employee has no maximum age for working
	When I post to the Redundancy Payments endpoint with:
"""
{
  "employmentStartDate": "1997-10-01T10:50:56.008Z",
  "dismissalDate": "2018-10-01T10:50:56.008Z",
  "dateNoticeGiven": "2018-05-01T10:50:56.008Z",
  "claimReceiptDate": "2018-10-01T10:50:56.008Z",
  "dateOfBirth": "1900-04-14T10:50:56.008Z",
  "weeklyWage": 300,
  "employerPartPayment": 0,
  "employmentBreaks": 0,
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "adjEmploymentStartDate": "1997-10-01T10:50:56.008Z",
  "noticeEntitlementWeeks": 12,
  "noticeDateForRedundancyPay": "2018-10-01T10:50:56.008Z",
  "yearsOfServiceUpto21": 0,
  "yearsOfServiceFrom22To41": 0,
  "yearsServiceOver41": 20,
  "redundancyPayWeeks": 30,
  "grossEntitlement": 9000,
  "employerPartPayment": 0,
  "netEntitlement": 9000,
  "preferentialClaim": 0,
  "nonPreferentialClaim": 9000,
  "statutoryMax" : 508
}
"""

Scenario: 20 Years Service Started Before 21 Dismissed Before 41
# Tests that an employee is paid correctly on the basis they were up to 21 years of age when were first employed and have 20 Years of Service
	When I post to the Redundancy Payments endpoint with:
"""
{
  "employmentStartDate": "1995-04-14T10:50:56.008Z",
  "dismissalDate": "2018-04-13T10:50:56.008Z",
  "dateNoticeGiven": "2018-01-01T10:50:56.008Z",
  "claimReceiptDate": "2018-10-01T10:50:56.008Z",
  "dateOfBirth": "1979-04-01T10:50:56.008Z",
  "weeklyWage": 317.76,
  "employerPartPayment": 0,
  "employmentBreaks": 0,
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "adjEmploymentStartDate": "1995-04-14T10:50:56.008Z",
  "noticeEntitlementWeeks": 12,
  "noticeDateForRedundancyPay": "2018-04-13T10:50:56.008Z",
  "yearsOfServiceUpto21": 3,
  "yearsOfServiceFrom22To41": 17,
  "yearsServiceOver41": 0,
  "redundancyPayWeeks": 18.5,
  "grossEntitlement": 5878.56,
  "employerPartPayment": 0,
  "netEntitlement": 5878.56,
  "preferentialClaim": 0,
  "nonPreferentialClaim": 5878.56,
  "statutoryMax" : 489
}
"""

Scenario: 20 Years Service Started Aged 22
# Tests that an employee is paid correctly on the basis they were 22 years of age when were first employed and have 20 Years of Service
	When I post to the Redundancy Payments endpoint with:
"""
{
  "employmentStartDate": "1995-04-14T10:50:56.008Z",
  "dismissalDate": "2018-04-13T10:50:56.008Z",
  "dateNoticeGiven": "2018-01-01T10:50:56.008Z",
  "claimReceiptDate": "2018-10-01T10:50:56.008Z",
  "dateOfBirth": "1973-04-01T10:50:56.008Z",
  "weeklyWage": 257.28,
  "employerPartPayment": 0,
  "employmentBreaks": 0,
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "adjEmploymentStartDate": "1995-04-14T10:50:56.008Z",
  "noticeEntitlementWeeks": 12,
  "noticeDateForRedundancyPay": "2018-04-13T10:50:56.008Z",
  "yearsOfServiceUpto21": 0,
  "yearsOfServiceFrom22To41": 16,
  "yearsServiceOver41": 4,
  "redundancyPayWeeks": 22,
  "grossEntitlement": 5660.16,
  "employerPartPayment": 0,
  "netEntitlement": 5660.16,
  "preferentialClaim": 0,
  "nonPreferentialClaim": 5660.16,
  "statutoryMax" : 489
}
"""

Scenario: 20 Years Service Started Aged Over 41
# Tests that an employee is paid correctly on the basis they were over 41 years of age when were first employed and have 20 Years of Service
	When I post to the Redundancy Payments endpoint with:
"""
{
  "employmentStartDate": "1995-04-14T10:50:56.008Z",
  "dismissalDate": "2018-04-13T10:50:56.008Z",
  "dateNoticeGiven": "2018-01-01T10:50:56.008Z",
  "claimReceiptDate": "2018-10-01T10:50:56.008Z",
  "dateOfBirth": "1954-04-01T10:50:56.008Z",
  "weeklyWage": 303.97,
  "employerPartPayment": 0,
  "employmentBreaks": 0,
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "adjEmploymentStartDate": "1995-04-14T10:50:56.008Z",
  "noticeEntitlementWeeks": 12,
  "noticeDateForRedundancyPay": "2018-04-13T10:50:56.008Z",
  "yearsOfServiceUpto21": 0,
  "yearsOfServiceFrom22To41": 0,
  "yearsServiceOver41": 20,
  "redundancyPayWeeks": 30,
  "grossEntitlement": 9119.10,
  "employerPartPayment": 0,
  "netEntitlement": 9119.10,
  "preferentialClaim": 0,
  "nonPreferentialClaim": 9119.10,
  "statutoryMax" : 489
}
"""

Scenario: Boundary Up to 21 Upper Limit
# Tests that an employee crosses an age threshold the years of service and redundancy pay weeks are correctly calculated
	When I post to the Redundancy Payments endpoint with:
"""
{
  "employmentStartDate": "2011-04-14T10:50:56.008Z",
  "dismissalDate": "2018-04-14T10:50:56.008Z",
  "dateNoticeGiven": "2018-01-01T10:50:56.008Z",
  "claimReceiptDate": "2018-10-01T10:50:56.008Z",
  "dateOfBirth": "1989-04-15T10:50:56.008Z",
  "weeklyWage": 297.85,
  "employerPartPayment": 0,
  "employmentBreaks": 0,
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "adjEmploymentStartDate": "2011-04-14T10:50:56.008Z",
  "noticeEntitlementWeeks": 6,
  "noticeDateForRedundancyPay": "2018-04-14T10:50:56.008Z",
  "yearsOfServiceUpto21": 1,
  "yearsOfServiceFrom22To41": 6,
  "yearsServiceOver41": 0,
  "redundancyPayWeeks": 6.5,
  "grossEntitlement": 1936.02,
  "employerPartPayment": 0,
  "netEntitlement": 1936.02,
  "preferentialClaim": 0,
  "nonPreferentialClaim": 1936.02,
  "statutoryMax" : 489
}
"""

Scenario: Boundary 22 to 41 Lower Limit
# Tests that an employee crosses an age threshold the years of service and redundancy pay weeks are correctly calculated
When I post to the Redundancy Payments endpoint with:
"""
{
  "employmentStartDate": "2011-04-14T10:50:56.008Z",
  "dismissalDate": "2018-04-14T10:50:56.008Z",
  "dateNoticeGiven": "2018-02-13T10:50:56.008Z",
  "claimReceiptDate": "2018-10-01T10:50:56.008Z",
  "dateOfBirth": "1989-04-14T10:50:56.008Z",
  "weeklyWage": 447.35,
  "employerPartPayment": 0,
  "employmentBreaks": 0,
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "adjEmploymentStartDate": "2011-04-14T10:50:56.008Z",
  "noticeEntitlementWeeks": 6,
  "noticeDateForRedundancyPay": "2018-04-14T10:50:56.008Z",
  "yearsOfServiceUpto21": 0,
  "yearsOfServiceFrom22To41": 7,
  "yearsServiceOver41": 0,
  "redundancyPayWeeks": 7,
  "grossEntitlement": 3131.45,
  "employerPartPayment": 0,
  "netEntitlement": 3131.45,
  "preferentialClaim": 0,
  "nonPreferentialClaim": 3131.45,
  "statutoryMax" : 489
}
"""

Scenario: Boundary 22 to 41 Upper Limit
# Tests that an employee crosses an age threshold the years of service and redundancy pay weeks are correctly calculated
	When I post to the Redundancy Payments endpoint with:
"""
{
  "employmentStartDate": "2011-04-13T10:50:56.008Z",
  "dismissalDate": "2018-04-13T10:50:56.008Z",
  "dateNoticeGiven": "2018-02-13T10:50:56.008Z",
  "claimReceiptDate": "2018-10-01T10:50:56.008Z",
  "dateOfBirth": "1970-04-14T10:50:56.008Z",
  "weeklyWage": 345.75,
  "employerPartPayment": 0,
  "employmentBreaks": 0,
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "adjEmploymentStartDate": "2011-04-13T10:50:56.008Z",
  "noticeEntitlementWeeks": 6,
  "noticeDateForRedundancyPay": "2018-04-13T10:50:56.008Z",
  "yearsOfServiceUpto21": 0,
  "yearsOfServiceFrom22To41": 1,
  "yearsServiceOver41": 6,
  "redundancyPayWeeks": 10,
  "grossEntitlement": 3457.50,
  "employerPartPayment": 0,
  "netEntitlement": 3457.50,
  "preferentialClaim": 0,
  "nonPreferentialClaim": 3457.50,
  "statutoryMax" : 489
}
"""

Scenario: Boundary Over 41 Lower Limit
# Tests that an employee crosses an age threshold the years of service and redundancy pay weeks are correctly calculated
	When I post to the Redundancy Payments endpoint with:
"""
{
  "employmentStartDate": "2011-04-14T10:50:56.008Z",
  "dismissalDate": "2018-04-14T10:50:56.008Z",
  "dateNoticeGiven": "2018-02-13T10:50:56.008Z",
  "claimReceiptDate": "2018-10-01T10:50:56.008Z",
  "dateOfBirth": "1970-04-14T10:50:56.008Z",
  "weeklyWage": 241.56,
  "employerPartPayment": 0,
  "employmentBreaks": 0,
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "adjEmploymentStartDate": "2011-04-14T10:50:56.008Z",
  "noticeEntitlementWeeks": 6,
  "noticeDateForRedundancyPay": "2018-04-14T10:50:56.008Z",
  "yearsOfServiceUpto21": 0,
  "yearsOfServiceFrom22To41": 0,
  "yearsServiceOver41": 7,
  "redundancyPayWeeks": 10.5,
  "grossEntitlement": 2536.38,
  "employerPartPayment": 0,
  "netEntitlement": 2536.38,
  "preferentialClaim": 0,
  "nonPreferentialClaim": 2536.38,
  "statutoryMax" : 489
}
"""

Scenario: Notice Extends Service
# Tests that an employee is given no notice, the notice given extends their service giving them a better payout
	When I post to the Redundancy Payments endpoint with:
"""
{
  "employmentStartDate": "2016-04-21T10:50:56.008Z",
  "dismissalDate": "2018-04-14T10:50:56.008Z",
  "dateNoticeGiven": "2018-04-14T10:50:56.008Z",
  "claimReceiptDate": "2018-10-01T10:50:56.008Z",
  "dateOfBirth": "1970-04-14T10:50:56.008Z",
  "weeklyWage": 300,
  "employerPartPayment": 0,
  "employmentBreaks": 0,
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "adjEmploymentStartDate": "2016-04-21T10:50:56.008Z",
  "noticeEntitlementWeeks": 1,
  "noticeDateForRedundancyPay": "2018-04-21T10:50:56.008Z",
  "yearsOfServiceUpto21": 0,
  "yearsOfServiceFrom22To41": 0,
  "yearsServiceOver41": 2,
  "redundancyPayWeeks": 3,
  "grossEntitlement": 900,
  "employerPartPayment": 0,
  "netEntitlement": 900,
  "preferentialClaim": 0,
  "nonPreferentialClaim": 900,
  "statutoryMax" : 508
}
"""

@AutomationTest
Scenario: Validation Employed Less Than 2 Years
# Tests that when an employee has less than 2 years service then a validation message is displayed as this is an invalid claim
	When I post to the Redundancy Payments endpoint with:
"""
{
  "employmentStartDate": "2010-12-13T10:50:56.008Z",
  "dismissalDate": "2012-12-12T10:50:56.008Z",
  "dateNoticeGiven": "2012-12-05T10:50:56.008Z",
  "claimReceiptDate": "2018-10-01T10:50:56.008Z",
  "dateOfBirth": "1990-09-20T10:50:56.008Z",
  "weeklyWage": 104.61,
  "employerPartPayment": 0,
  "employmentBreaks": 0,
}
"""
	Then I get a response with status code "400"
	And the response contains "Years of service cannot be less than 2 years"

@AutomationTest
Scenario: Weekly Wage Higher Than Stat Max
# Tests that when an employee's weekly wage is more than the stat max then the payout is limited to the stat max
When I post to the Redundancy Payments endpoint with:
"""
{
  "employmentStartDate": "1997-10-01T10:50:56.008Z",
  "dismissalDate": "2018-10-01T10:50:56.008Z",
  "dateNoticeGiven": "2018-10-01T10:50:56.008Z",
  "claimReceiptDate": "2018-10-01T10:50:56.008Z",
  "dateOfBirth": "1956-09-01T10:50:56.008Z",
  "weeklyWage": 509,
  "employerPartPayment": 0,
  "employmentBreaks": 0,
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "adjEmploymentStartDate": "1997-10-01T10:50:56.008Z",
  "noticeEntitlementWeeks": 12,
  "noticeDateForRedundancyPay": "2018-12-24T10:50:56.008Z",
  "yearsOfServiceUpto21": 0,
  "yearsOfServiceFrom22To41": 0,
  "yearsServiceOver41": 20,
  "redundancyPayWeeks": 30,
  "grossEntitlement": 15240,
  "employerPartPayment": 0,
  "netEntitlement": 15240,
  "preferentialClaim": 0,
  "nonPreferentialClaim": 15240,
  "statutoryMax" : 508
}
"""

@AutomationTest
Scenario: Validation Claim Receipt Date More Than 6 Months
# Tests that when the claim receipt date is more than 6 months after the dismissal date validation is displayed
When I post to the Redundancy Payments endpoint with:
"""
{
  "employmentStartDate": "1997-09-01T10:50:56.008Z",
  "dismissalDate": "2018-09-01T10:50:56.008Z",
  "dateNoticeGiven": "2018-09-01T10:50:56.008Z",
  "claimReceiptDate": "2019-03-02T10:50:56.008Z",
  "dateOfBirth": "1956-09-01T10:50:56.008Z",
  "weeklyWage": 509,
  "employerPartPayment": 0,
  "employmentBreaks": 0,
}
"""
	Then I get a response with status code "400"
	And the response contains "Claim Receipt Date must be within 6 months of the dismissal date"

@AutomationTest
Scenario: Validation Claim Receipt Date not Entered
# Tests that when no Claim Receipt Date is provided then validation is displayed
When I post to the Redundancy Payments endpoint with:
"""
{
  "employmentStartDate": "1997-09-01T10:50:56.008Z",
  "dismissalDate": "2018-09-01T10:50:56.008Z",
  "dateNoticeGiven": "2018-09-01T10:50:56.008Z",
  "dateOfBirth": "1956-09-01T10:50:56.008Z",
  "weeklyWage": 509,
  "employerPartPayment": 0,
  "employmentBreaks": 0,
}
"""
	Then I get a response with status code "400"
	And the response contains "Claim Receipt Date is not provided or it is an invalid date"

Scenario: Adjusted Notice Date Stat Max
# Tests that when the adjusted notice period crosses into a new stat max range then the stat max is based on the notice date
	When I post to the Redundancy Payments endpoint with:
"""
{
  "employmentStartDate": "1995-04-14T10:50:56.008Z",
  "dismissalDate": "2018-04-05T10:50:56.008Z",
  "dateNoticeGiven": "2018-01-19T10:50:56.008Z",
  "claimReceiptDate": "2018-10-01T10:50:56.008Z",
  "dateOfBirth": "1973-04-01T10:50:56.008Z",
  "weeklyWage": 257.28,
  "employerPartPayment": 0,
  "employmentBreaks": 0,
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "adjEmploymentStartDate": "1995-04-14T10:50:56.008Z",
  "noticeEntitlementWeeks": 12,
  "noticeDateForRedundancyPay": "2018-04-13T10:50:56.008Z",
  "yearsOfServiceUpto21": 0,
  "yearsOfServiceFrom22To41": 16,
  "yearsServiceOver41": 4,
  "redundancyPayWeeks": 22,
  "grossEntitlement": 5660.16,
  "employerPartPayment": 0,
  "netEntitlement": 5660.16,
  "preferentialClaim": 0,
  "nonPreferentialClaim": 5660.16,
  "statutoryMax" : 508
}
"""