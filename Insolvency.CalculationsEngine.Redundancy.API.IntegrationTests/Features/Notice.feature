Feature: Notice Composite
  scenarios around automated testing of the Notice Composite Calculation via the Gateway API

@AutomationTest
Scenario: Test PingGet Method
# Test that the endpoint is active and responding
  Given I want to test "aggpinggetnotice" method
  When I make a request to the Notice Composite Endpoint
  Then I get a response with status code "200"
  And the response contains "PingGet response from RPS Api Notice Pay"

@AutomationTest
Scenario: NWNP employerEntitlement
# Test includes payload for Notice Worked Not Paid only.
# Tests that when the employerEntitlement is below the maximumEntitlement that the grossEntitlement matches the employerEntitlement
	When I post to the Notice endpoint with:
"""
{
  "nwnp": [
    {
      "inputSource": "rp1",
      "employmentStartDate": "1978-04-01T09:00:41.919Z",
      "insolvencyDate": "2018-05-04T09:00:41.919Z",
      "dismissalDate": "2018-05-04T09:00:41.920Z",
      "dateNoticeGiven": "2018-01-20T09:00:41.920Z",
      "unpaidPeriodFrom": "2018-01-20T09:00:41.920Z",
      "unpaidPeriodTo": "2018-05-04T09:00:41.920Z",
      "weeklyWage": 507.99,
      "shiftPattern": ["1","2","3","4","5"],
              "payDay": 5,
      "isTaxable": true
    },{
      "inputSource": "rp14a",
      "employmentStartDate": "1978-04-01T09:00:41.919Z",
      "insolvencyDate": "2018-05-04T09:00:41.919Z",
      "dismissalDate": "2018-05-04T09:00:41.920Z",
      "dateNoticeGiven": "2018-01-20T09:00:41.920Z",
      "unpaidPeriodFrom": "2018-01-20T09:00:41.920Z",
      "unpaidPeriodTo": "2018-05-04T09:00:41.920Z",
      "weeklyWage": 507.99,
      "shiftPattern": ["1","2","3","4","5"],
              "payDay": 5,
      "isTaxable": true
    }
  ]
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "nwnp": {
    "selectedInputSource": "rp14a",
    "rp1Results": {
      "inputSource": "rp1",
      "statutoryMax": 508,
      "weeklyResult": [
        {
          "weekNumber": 1,
          "payDate": "2018-01-27T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 507.99,
          "grossEntitlement": 507.99,
          "isTaxable": true,
          "taxDeducted": 101.6,
          "niDeducted": 41.04,
          "netEntitlement": 365.35,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 507.99,
          "grossEntitlementIn4Months": 507.99,
          "isSelected": false
        },
        {
          "weekNumber": 2,
          "payDate": "2018-02-03T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 507.99,
          "grossEntitlement": 507.99,
          "isTaxable": true,
          "taxDeducted": 101.6,
          "niDeducted": 41.04,
          "netEntitlement": 365.35,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 507.99,
          "grossEntitlementIn4Months": 507.99,
          "isSelected": false
        },
        {
          "weekNumber": 3,
          "payDate": "2018-02-10T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 507.99,
          "grossEntitlement": 507.99,
          "isTaxable": true,
          "taxDeducted": 101.6,
          "niDeducted": 41.04,
          "netEntitlement": 365.35,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 507.99,
          "grossEntitlementIn4Months": 507.99,
          "isSelected": false
        },
        {
          "weekNumber": 4,
          "payDate": "2018-02-17T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 507.99,
          "grossEntitlement": 507.99,
          "isTaxable": true,
          "taxDeducted": 101.6,
          "niDeducted": 41.04,
          "netEntitlement": 365.35,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 507.99,
          "grossEntitlementIn4Months": 507.99,
          "isSelected": false
        },
        {
          "weekNumber": 5,
          "payDate": "2018-02-24T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 507.99,
          "grossEntitlement": 507.99,
          "isTaxable": true,
          "taxDeducted": 101.6,
          "niDeducted": 41.04,
          "netEntitlement": 365.35,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 507.99,
          "grossEntitlementIn4Months": 507.99,
          "isSelected": false
        },
        {
          "weekNumber": 6,
          "payDate": "2018-03-03T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 507.99,
          "grossEntitlement": 507.99,
          "isTaxable": true,
          "taxDeducted": 101.6,
          "niDeducted": 41.04,
          "netEntitlement": 365.35,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 507.99,
          "grossEntitlementIn4Months": 507.99,
          "isSelected": false
        },
        {
          "weekNumber": 7,
          "payDate": "2018-03-10T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 507.99,
          "grossEntitlement": 507.99,
          "isTaxable": true,
          "taxDeducted": 101.6,
          "niDeducted": 41.04,
          "netEntitlement": 365.35,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 507.99,
          "grossEntitlementIn4Months": 507.99,
          "isSelected": false
        },
        {
          "weekNumber": 8,
          "payDate": "2018-03-17T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 507.99,
          "grossEntitlement": 507.99,
          "isTaxable": true,
          "taxDeducted": 101.6,
          "niDeducted": 41.04,
          "netEntitlement": 365.35,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 507.99,
          "grossEntitlementIn4Months": 507.99,
          "isSelected": false
        },
        {
          "weekNumber": 9,
          "payDate": "2018-03-24T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 507.99,
          "grossEntitlement": 507.99,
          "isTaxable": true,
          "taxDeducted": 101.6,
          "niDeducted": 41.04,
          "netEntitlement": 365.35,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 507.99,
          "grossEntitlementIn4Months": 507.99,
          "isSelected": false
        },
        {
          "weekNumber": 10,
          "payDate": "2018-03-31T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 507.99,
          "grossEntitlement": 507.99,
          "isTaxable": true,
          "taxDeducted": 101.6,
          "niDeducted": 41.04,
          "netEntitlement": 365.35,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 507.99,
          "grossEntitlementIn4Months": 507.99,
          "isSelected": false
        },
        {
          "weekNumber": 11,
          "payDate": "2018-04-07T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 507.99,
          "grossEntitlement": 507.99,
          "isTaxable": true,
          "taxDeducted": 101.6,
          "niDeducted": 41.04,
          "netEntitlement": 365.35,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 507.99,
          "grossEntitlementIn4Months": 507.99,
          "isSelected": false
        },
        {
          "weekNumber": 12,
          "payDate": "2018-04-14T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 507.99,
          "grossEntitlement": 507.99,
          "isTaxable": true,
          "taxDeducted": 101.6,
          "niDeducted": 41.04,
          "netEntitlement": 365.35,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 507.99,
          "grossEntitlementIn4Months": 507.99,
          "isSelected": false
        }
      ]
    },
    "rp14aResults": {
      "inputSource": "rp14a",
      "statutoryMax": 508,
      "weeklyResult": [
        {
          "weekNumber": 1,
          "payDate": "2018-01-27T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 507.99,
          "grossEntitlement": 507.99,
          "isTaxable": true,
          "taxDeducted": 101.6,
          "niDeducted": 41.04,
          "netEntitlement": 365.35,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 507.99,
          "grossEntitlementIn4Months": 507.99,
          "isSelected": true
        },
        {
          "weekNumber": 2,
          "payDate": "2018-02-03T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 507.99,
          "grossEntitlement": 507.99,
          "isTaxable": true,
          "taxDeducted": 101.6,
          "niDeducted": 41.04,
          "netEntitlement": 365.35,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 507.99,
          "grossEntitlementIn4Months": 507.99,
          "isSelected": true
        },
        {
          "weekNumber": 3,
          "payDate": "2018-02-10T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 507.99,
          "grossEntitlement": 507.99,
          "isTaxable": true,
          "taxDeducted": 101.6,
          "niDeducted": 41.04,
          "netEntitlement": 365.35,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 507.99,
          "grossEntitlementIn4Months": 507.99,
          "isSelected": true
        },
        {
          "weekNumber": 4,
          "payDate": "2018-02-17T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 507.99,
          "grossEntitlement": 507.99,
          "isTaxable": true,
          "taxDeducted": 101.6,
          "niDeducted": 41.04,
          "netEntitlement": 365.35,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 507.99,
          "grossEntitlementIn4Months": 507.99,
          "isSelected": true
        },
        {
          "weekNumber": 5,
          "payDate": "2018-02-24T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 507.99,
          "grossEntitlement": 507.99,
          "isTaxable": true,
          "taxDeducted": 101.6,
          "niDeducted": 41.04,
          "netEntitlement": 365.35,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 507.99,
          "grossEntitlementIn4Months": 507.99,
          "isSelected": true
        },
        {
          "weekNumber": 6,
          "payDate": "2018-03-03T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 507.99,
          "grossEntitlement": 507.99,
          "isTaxable": true,
          "taxDeducted": 101.6,
          "niDeducted": 41.04,
          "netEntitlement": 365.35,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 507.99,
          "grossEntitlementIn4Months": 507.99,
          "isSelected": true
        },
        {
          "weekNumber": 7,
          "payDate": "2018-03-10T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 507.99,
          "grossEntitlement": 507.99,
          "isTaxable": true,
          "taxDeducted": 101.6,
          "niDeducted": 41.04,
          "netEntitlement": 365.35,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 507.99,
          "grossEntitlementIn4Months": 507.99,
          "isSelected": true
        },
        {
          "weekNumber": 8,
          "payDate": "2018-03-17T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 507.99,
          "grossEntitlement": 507.99,
          "isTaxable": true,
          "taxDeducted": 101.6,
          "niDeducted": 41.04,
          "netEntitlement": 365.35,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 507.99,
          "grossEntitlementIn4Months": 507.99,
          "isSelected": true
        },
        {
          "weekNumber": 9,
          "payDate": "2018-03-24T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 507.99,
          "grossEntitlement": 507.99,
          "isTaxable": true,
          "taxDeducted": 101.6,
          "niDeducted": 41.04,
          "netEntitlement": 365.35,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 507.99,
          "grossEntitlementIn4Months": 507.99,
          "isSelected": true
        },
        {
          "weekNumber": 10,
          "payDate": "2018-03-31T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 507.99,
          "grossEntitlement": 507.99,
          "isTaxable": true,
          "taxDeducted": 101.6,
          "niDeducted": 41.04,
          "netEntitlement": 365.35,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 507.99,
          "grossEntitlementIn4Months": 507.99,
          "isSelected": true
        },
        {
          "weekNumber": 11,
          "payDate": "2018-04-07T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 507.99,
          "grossEntitlement": 507.99,
          "isTaxable": true,
          "taxDeducted": 101.6,
          "niDeducted": 41.04,
          "netEntitlement": 365.35,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 507.99,
          "grossEntitlementIn4Months": 507.99,
          "isSelected": true
        },
        {
          "weekNumber": 12,
          "payDate": "2018-04-14T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 507.99,
          "grossEntitlement": 507.99,
          "isTaxable": true,
          "taxDeducted": 101.6,
          "niDeducted": 41.04,
          "netEntitlement": 365.35,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 507.99,
          "grossEntitlementIn4Months": 507.99,
          "isSelected": true
        }
      ]
    }
  },
  "cnp": {
    "noticeWeeksDue": 0,
    "statutoryMax": 0,
    "maxCNPEntitlement": 0,
    "noticeStartDate": "0001-01-01T00:00:00",
    "projectedNoticeDate": "0001-01-01T00:00:00",
    "compensationEndDate": "0001-01-01T00:00:00",
    "daysInClaim": 0,
    "weeklyResults": []
  }
}
"""

@AutomationTest
Scenario: NWNP maximumEntitlement
# Test includes payload for Notice Worked Not Paid only
# Tests that when the employerEntitlement is above the stat max that the grossEntitlement matches the maximumEntitlement
	When I post to the Notice endpoint with:
"""
{
  "nwnp": [
    {
      "inputSource": "rp1",
      "employmentStartDate": "1978-04-01T09:00:41.919Z",
      "insolvencyDate": "2018-05-04T09:00:41.919Z",
      "dismissalDate": "2018-05-04T09:00:41.920Z",
      "dateNoticeGiven": "2018-01-20T09:00:41.920Z",
      "unpaidPeriodFrom": "2018-01-20T09:00:41.920Z",
      "unpaidPeriodTo": "2018-05-04T09:00:41.920Z",
      "weeklyWage": 508.01,
      "shiftPattern": ["1","2","3","4","5"],
              "payDay": 5,
      "isTaxable": true
    },{
      "inputSource": "rp14a",
      "employmentStartDate": "1978-04-01T09:00:41.919Z",
      "insolvencyDate": "2018-05-04T09:00:41.919Z",
      "dismissalDate": "2018-05-04T09:00:41.920Z",
      "dateNoticeGiven": "2018-01-20T09:00:41.920Z",
      "unpaidPeriodFrom": "2018-01-20T09:00:41.920Z",
      "unpaidPeriodTo": "2018-05-04T09:00:41.920Z",
      "weeklyWage": 508.01,
      "shiftPattern": ["1","2","3","4","5"],
              "payDay": 5,
      "isTaxable": true
    }
  ]
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "nwnp": {
    "selectedInputSource": "rp14a",
    "rp1Results": {
      "inputSource": "rp1",
      "statutoryMax": 508,
      "weeklyResult": [
        {
          "weekNumber": 1,
          "payDate": "2018-01-27T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 508.01,
          "grossEntitlement": 508.00,
          "isTaxable": true,
          "taxDeducted": 101.60,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 508.01,
          "grossEntitlementIn4Months": 508.00,
          "isSelected": false
        },
        {
          "weekNumber": 2,
          "payDate": "2018-02-03T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 508.01,
          "grossEntitlement": 508.00,
          "isTaxable": true,
          "taxDeducted": 101.60,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 508.01,
          "grossEntitlementIn4Months": 508.00,
          "isSelected": false
        },
        {
          "weekNumber": 3,
          "payDate": "2018-02-10T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 508.01,
          "grossEntitlement": 508.00,
          "isTaxable": true,
          "taxDeducted": 101.60,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 508.01,
          "grossEntitlementIn4Months": 508.00,
          "isSelected": false
        },
        {
          "weekNumber": 4,
          "payDate": "2018-02-17T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 508.01,
          "grossEntitlement": 508.00,
          "isTaxable": true,
          "taxDeducted": 101.60,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 508.01,
          "grossEntitlementIn4Months": 508.00,
          "isSelected": false
        },
        {
          "weekNumber": 5,
          "payDate": "2018-02-24T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 508.01,
          "grossEntitlement": 508.00,
          "isTaxable": true,
          "taxDeducted": 101.60,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 508.01,
          "grossEntitlementIn4Months": 508.00,
          "isSelected": false
        },
        {
          "weekNumber": 6,
          "payDate": "2018-03-03T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 508.01,
          "grossEntitlement": 508.00,
          "isTaxable": true,
          "taxDeducted": 101.60,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 508.01,
          "grossEntitlementIn4Months": 508.00,
          "isSelected": false
        },
        {
          "weekNumber": 7,
          "payDate": "2018-03-10T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 508.01,
          "grossEntitlement": 508.00,
          "isTaxable": true,
          "taxDeducted": 101.60,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 508.01,
          "grossEntitlementIn4Months": 508.00,
          "isSelected": false
        },
        {
          "weekNumber": 8,
          "payDate": "2018-03-17T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 508.01,
          "grossEntitlement": 508.00,
          "isTaxable": true,
          "taxDeducted": 101.60,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 508.01,
          "grossEntitlementIn4Months": 508.00,
          "isSelected": false
        },
        {
          "weekNumber": 9,
          "payDate": "2018-03-24T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 508.01,
          "grossEntitlement": 508.00,
          "isTaxable": true,
          "taxDeducted": 101.60,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 508.01,
          "grossEntitlementIn4Months": 508.00,
          "isSelected": false
        },
        {
          "weekNumber": 10,
          "payDate": "2018-03-31T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 508.01,
          "grossEntitlement": 508.00,
          "isTaxable": true,
          "taxDeducted": 101.60,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 508.01,
          "grossEntitlementIn4Months": 508.00,
          "isSelected": false
        },
        {
          "weekNumber": 11,
          "payDate": "2018-04-07T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 508.01,
          "grossEntitlement": 508.00,
          "isTaxable": true,
          "taxDeducted": 101.60,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 508.01,
          "grossEntitlementIn4Months": 508.00,
          "isSelected": false
        },
        {
          "weekNumber": 12,
          "payDate": "2018-04-14T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 508.01,
          "grossEntitlement": 508.00,
          "isTaxable": true,
          "taxDeducted": 101.60,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 508.01,
          "grossEntitlementIn4Months": 508.00,
          "isSelected": false
        }
      ]
    },
    "rp14aResults": {
      "inputSource": "rp14a",
      "statutoryMax": 508,
      "weeklyResult": [
        {
          "weekNumber": 1,
          "payDate": "2018-01-27T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 508.01,
          "grossEntitlement": 508.00,
          "isTaxable": true,
          "taxDeducted": 101.60,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 508.01,
          "grossEntitlementIn4Months": 508.00,
          "isSelected": true
        },
        {
          "weekNumber": 2,
          "payDate": "2018-02-03T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 508.01,
          "grossEntitlement": 508.00,
          "isTaxable": true,
          "taxDeducted": 101.60,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 508.01,
          "grossEntitlementIn4Months": 508.00,
          "isSelected": true
        },
        {
          "weekNumber": 3,
          "payDate": "2018-02-10T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 508.01,
          "grossEntitlement": 508.00,
          "isTaxable": true,
          "taxDeducted": 101.60,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 508.01,
          "grossEntitlementIn4Months": 508.00,
          "isSelected": true
        },
        {
          "weekNumber": 4,
          "payDate": "2018-02-17T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 508.01,
          "grossEntitlement": 508.00,
          "isTaxable": true,
          "taxDeducted": 101.60,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 508.01,
          "grossEntitlementIn4Months": 508.00,
          "isSelected": true
        },
        {
          "weekNumber": 5,
          "payDate": "2018-02-24T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 508.01,
          "grossEntitlement": 508.00,
          "isTaxable": true,
          "taxDeducted": 101.60,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 508.01,
          "grossEntitlementIn4Months": 508.00,
          "isSelected": true
        },
        {
          "weekNumber": 6,
          "payDate": "2018-03-03T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 508.01,
          "grossEntitlement": 508.00,
          "isTaxable": true,
          "taxDeducted": 101.60,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 508.01,
          "grossEntitlementIn4Months": 508.00,
          "isSelected": true
        },
        {
          "weekNumber": 7,
          "payDate": "2018-03-10T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 508.01,
          "grossEntitlement": 508.00,
          "isTaxable": true,
          "taxDeducted": 101.60,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 508.01,
          "grossEntitlementIn4Months": 508.00,
          "isSelected": true
        },
        {
          "weekNumber": 8,
          "payDate": "2018-03-17T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 508.01,
          "grossEntitlement": 508.00,
          "isTaxable": true,
          "taxDeducted": 101.60,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 508.01,
          "grossEntitlementIn4Months": 508.00,
          "isSelected": true
        },
        {
          "weekNumber": 9,
          "payDate": "2018-03-24T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 508.01,
          "grossEntitlement": 508.00,
          "isTaxable": true,
          "taxDeducted": 101.60,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 508.01,
          "grossEntitlementIn4Months": 508.00,
          "isSelected": true
        },
        {
          "weekNumber": 10,
          "payDate": "2018-03-31T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 508.01,
          "grossEntitlement": 508.00,
          "isTaxable": true,
          "taxDeducted": 101.60,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 508.01,
          "grossEntitlementIn4Months": 508.00,
          "isSelected": true
        },
        {
          "weekNumber": 11,
          "payDate": "2018-04-07T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 508.01,
          "grossEntitlement": 508.00,
          "isTaxable": true,
          "taxDeducted": 101.60,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 508.01,
          "grossEntitlementIn4Months": 508.00,
          "isSelected": true
        },
        {
          "weekNumber": 12,
          "payDate": "2018-04-14T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 508.01,
          "grossEntitlement": 508.00,
          "isTaxable": true,
          "taxDeducted": 101.60,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 508.01,
          "grossEntitlementIn4Months": 508.00,
          "isSelected": true
        }
      ]
    }
  },
  "cnp": {
    "noticeWeeksDue": 0,
    "statutoryMax": 0,
    "maxCNPEntitlement": 0,
    "noticeStartDate": "0001-01-01T00:00:00",
    "projectedNoticeDate": "0001-01-01T00:00:00",
    "compensationEndDate": "0001-01-01T00:00:00",
    "daysInClaim": 0,
    "weeklyResults": []
  }
}
"""


@AutomationTest
Scenario: NWNP Selection Based on Claim Period rp1
# Test includes payload for Notice Worked Not Paid only
# Tests that when the amounts are the same the shortest claim period is selected for Payment. In this example it will be the rp1.
# Tests that when a contract exists beyond the claim period the maximumEntitlement is set to a full week
	When I post to the Notice endpoint with:
"""
{
  "nwnp": [
    {
      "inputSource": "rp1",
      "employmentStartDate": "1978-04-01T09:00:41.919Z",
      "insolvencyDate": "2018-05-04T09:00:41.919Z",
      "dismissalDate": "2018-05-04T09:00:41.920Z",
      "dateNoticeGiven": "2018-01-20T09:00:41.920Z",
      "unpaidPeriodFrom": "2018-01-20T09:00:41.920Z",
      "unpaidPeriodTo": "2018-04-07T09:00:41.920Z",
      "weeklyWage": 500.00,
      "shiftPattern": ["1","2","3","4","5"],
              "payDay": 5,
      "isTaxable": true
    },{
      "inputSource": "rp14a",
      "employmentStartDate": "1978-04-01T09:00:41.919Z",
      "insolvencyDate": "2018-05-04T09:00:41.919Z",
      "dismissalDate": "2018-05-04T09:00:41.920Z",
      "dateNoticeGiven": "2018-01-20T09:00:41.920Z",
      "unpaidPeriodFrom": "2018-01-20T09:00:41.920Z",
      "unpaidPeriodTo": "2018-04-14T09:00:41.920Z",
      "weeklyWage": 500.00,
      "shiftPattern": ["1","2","3","4","5"],
              "payDay": 5,
      "isTaxable": true
    }
  ]
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "nwnp": {
    "selectedInputSource": "rp1",
    "rp1Results": {
      "inputSource": "rp1",
      "statutoryMax": 508,
      "weeklyResult": [
        {
          "weekNumber": 1,
          "payDate": "2018-01-27T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": true
        },
        {
          "weekNumber": 2,
          "payDate": "2018-02-03T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": true
        },
        {
          "weekNumber": 3,
          "payDate": "2018-02-10T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": true
        },
        {
          "weekNumber": 4,
          "payDate": "2018-02-17T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": true
        },
        {
          "weekNumber": 5,
          "payDate": "2018-02-24T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": true
        },
        {
          "weekNumber": 6,
          "payDate": "2018-03-03T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": true
        },
        {
          "weekNumber": 7,
          "payDate": "2018-03-10T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": true
        },
        {
          "weekNumber": 8,
          "payDate": "2018-03-17T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": true
        },
        {
          "weekNumber": 9,
          "payDate": "2018-03-24T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": true
        },
        {
          "weekNumber": 10,
          "payDate": "2018-03-31T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": true
        },
        {
          "weekNumber": 11,
          "payDate": "2018-04-07T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": true
        }
      ]
    },
    "rp14aResults": {
      "inputSource": "rp14a",
      "statutoryMax": 508,
      "weeklyResult": [
        {
          "weekNumber": 1,
          "payDate": "2018-01-27T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": false
        },
        {
          "weekNumber": 2,
          "payDate": "2018-02-03T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": false
        },
        {
          "weekNumber": 3,
          "payDate": "2018-02-10T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": false
        },
        {
          "weekNumber": 4,
          "payDate": "2018-02-17T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": false
        },
        {
          "weekNumber": 5,
          "payDate": "2018-02-24T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": false
        },
        {
          "weekNumber": 6,
          "payDate": "2018-03-03T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": false
        },
        {
          "weekNumber": 7,
          "payDate": "2018-03-10T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": false
        },
        {
          "weekNumber": 8,
          "payDate": "2018-03-17T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": false
        },
        {
          "weekNumber": 9,
          "payDate": "2018-03-24T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": false
        },
        {
          "weekNumber": 10,
          "payDate": "2018-03-31T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": false
        },
        {
          "weekNumber": 11,
          "payDate": "2018-04-07T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": false
        },
        {
          "weekNumber": 12,
          "payDate": "2018-04-14T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": false
        }
      ]
    }
  },
  "cnp": {
    "noticeWeeksDue": 0,
    "statutoryMax": 0,
    "maxCNPEntitlement": 0,
    "noticeStartDate": "0001-01-01T00:00:00",
    "projectedNoticeDate": "0001-01-01T00:00:00",
    "compensationEndDate": "0001-01-01T00:00:00",
    "daysInClaim": 0,
    "weeklyResults": []
  }
}
"""

@AutomationTest
Scenario: NWNP Selection Based on Claim Period rp14a
# Test includes payload for Notice Worked Not Paid only
# Tests that when the amounts are the same the shortest claim period is selected for Payment. In this example it will be the rp14a.
# Tests that when a contract exists beyond the claim period the maximumEntitlement is set to a full week.
	When I post to the Notice endpoint with:
"""
{
  "nwnp": [
    {
      "inputSource": "rp1",
      "employmentStartDate": "1978-04-01T09:00:41.919Z",
      "insolvencyDate": "2018-05-04T09:00:41.919Z",
      "dismissalDate": "2018-05-04T09:00:41.920Z",
      "dateNoticeGiven": "2018-01-20T09:00:41.920Z",
      "unpaidPeriodFrom": "2018-01-20T09:00:41.920Z",
      "unpaidPeriodTo": "2018-04-14T09:00:41.920Z",
      "weeklyWage": 500.00,
      "shiftPattern": ["1","2","3","4","5"],
              "payDay": 5,
      "isTaxable": true
    },{
      "inputSource": "rp14a",
      "employmentStartDate": "1978-04-01T09:00:41.919Z",
      "insolvencyDate": "2018-05-04T09:00:41.919Z",
      "dismissalDate": "2018-05-04T09:00:41.920Z",
      "dateNoticeGiven": "2018-01-20T09:00:41.920Z",
      "unpaidPeriodFrom": "2018-01-20T09:00:41.920Z",
      "unpaidPeriodTo": "2018-04-07T09:00:41.920Z",
      "weeklyWage": 500.00,
      "shiftPattern": ["1","2","3","4","5"],
              "payDay": 5,
      "isTaxable": true
    }
  ]
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "nwnp": {
    "selectedInputSource": "rp14a",
    "rp1Results": {
      "inputSource": "rp1",
      "statutoryMax": 508,
      "weeklyResult": [
        {
          "weekNumber": 1,
          "payDate": "2018-01-27T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": false
        },
        {
          "weekNumber": 2,
          "payDate": "2018-02-03T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": false
        },
        {
          "weekNumber": 3,
          "payDate": "2018-02-10T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": false
        },
        {
          "weekNumber": 4,
          "payDate": "2018-02-17T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": false
        },
        {
          "weekNumber": 5,
          "payDate": "2018-02-24T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": false
        },
        {
          "weekNumber": 6,
          "payDate": "2018-03-03T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": false
        },
        {
          "weekNumber": 7,
          "payDate": "2018-03-10T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": false
        },
        {
          "weekNumber": 8,
          "payDate": "2018-03-17T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": false
        },
        {
          "weekNumber": 9,
          "payDate": "2018-03-24T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": false
        },
        {
          "weekNumber": 10,
          "payDate": "2018-03-31T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": false
        },
        {
          "weekNumber": 11,
          "payDate": "2018-04-07T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": false
        },
        {
          "weekNumber": 12,
          "payDate": "2018-04-14T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": false
        }
      ]
    },
    "rp14aResults": {
      "inputSource": "rp14a",
      "statutoryMax": 508,
      "weeklyResult": [
        {
          "weekNumber": 1,
          "payDate": "2018-01-27T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": true
        },
        {
          "weekNumber": 2,
          "payDate": "2018-02-03T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": true
        },
        {
          "weekNumber": 3,
          "payDate": "2018-02-10T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": true
        },
        {
          "weekNumber": 4,
          "payDate": "2018-02-17T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": true
        },
        {
          "weekNumber": 5,
          "payDate": "2018-02-24T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": true
        },
        {
          "weekNumber": 6,
          "payDate": "2018-03-03T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": true
        },
        {
          "weekNumber": 7,
          "payDate": "2018-03-10T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": true
        },
        {
          "weekNumber": 8,
          "payDate": "2018-03-17T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": true
        },
        {
          "weekNumber": 9,
          "payDate": "2018-03-24T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": true
        },
        {
          "weekNumber": 10,
          "payDate": "2018-03-31T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": true
        },
        {
          "weekNumber": 11,
          "payDate": "2018-04-07T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": true
        }
      ]
    }
  },
  "cnp": {
    "noticeWeeksDue": 0,
    "statutoryMax": 0,
    "maxCNPEntitlement": 0,
    "noticeStartDate": "0001-01-01T00:00:00",
    "projectedNoticeDate": "0001-01-01T00:00:00",
    "compensationEndDate": "0001-01-01T00:00:00",
    "daysInClaim": 0,
    "weeklyResults": []
  }
}
"""

@AutomationTest
Scenario: NWNP 4 Month Rule End of Contract
# Test includes payload for Notice Worked Not Paid only
# Tests that when the The end of the claim is the same as the end of the contract, the maximumEntitlement is pro rata to the amount of days covered in the claim for the final pay week.
# Tests that the 4 month period correctly reflects the amount paid out due to the end of the contract
# Tests a partial week
	When I post to the Notice endpoint with:
"""
{
  "nwnp": [
    {
      "inputSource": "rp1",
      "employmentStartDate": "1978-04-01T09:00:41.919Z",
      "insolvencyDate": "2018-05-04T09:00:41.919Z",
      "dismissalDate": "2018-04-13T09:00:41.920Z",
      "dateNoticeGiven": "2018-01-20T09:00:41.920Z",
      "unpaidPeriodFrom": "2018-01-20T09:00:41.920Z",
      "unpaidPeriodTo": "2018-04-13T09:00:41.920Z",
      "weeklyWage": 500.00,
      "shiftPattern": ["1","2","3","4","5"],
              "payDay": 5,
      "isTaxable": true
    },{
      "inputSource": "rp14a",
      "employmentStartDate": "1978-04-01T09:00:41.919Z",
      "insolvencyDate": "2018-05-04T09:00:41.919Z",
      "dismissalDate": "2018-04-13T09:00:41.920Z",
      "dateNoticeGiven": "2018-01-20T09:00:41.920Z",
      "unpaidPeriodFrom": "2018-01-20T09:00:41.920Z",
      "unpaidPeriodTo": "2018-04-12T09:00:41.920Z",
      "weeklyWage": 500.00,
      "shiftPattern": ["1","2","3","4","5"],
              "payDay": 5,
      "isTaxable": true
    }
  ]
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "nwnp": {
    "selectedInputSource": "rp14a",
    "rp1Results": {
      "inputSource": "rp1",
      "statutoryMax": 508,
      "weeklyResult": [
        {
          "weekNumber": 1,
          "payDate": "2018-01-27T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": false
        },
        {
          "weekNumber": 2,
          "payDate": "2018-02-03T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": false
        },
        {
          "weekNumber": 3,
          "payDate": "2018-02-10T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": false
        },
        {
          "weekNumber": 4,
          "payDate": "2018-02-17T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": false
        },
        {
          "weekNumber": 5,
          "payDate": "2018-02-24T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": false
        },
        {
          "weekNumber": 6,
          "payDate": "2018-03-03T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": false
        },
        {
          "weekNumber": 7,
          "payDate": "2018-03-10T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": false
        },
        {
          "weekNumber": 8,
          "payDate": "2018-03-17T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": false
        },
        {
          "weekNumber": 9,
          "payDate": "2018-03-24T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": false
        },
        {
          "weekNumber": 10,
          "payDate": "2018-03-31T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": false
        },
        {
          "weekNumber": 11,
          "payDate": "2018-04-07T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": false
        },
        {
          "weekNumber": 12,
          "payDate": "2018-04-14T00:00:00Z",
          "maximumEntitlement": 435.43,
          "employerEntitlement": 500,
          "grossEntitlement": 435.43,
          "isTaxable": true,
          "taxDeducted": 87.09,
          "niDeducted": 32.33,
          "netEntitlement": 316.01,
          "maximumDays": 6,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 435.43,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 435.43,
          "isSelected": false
        }
      ]
    },
    "rp14aResults": {
      "inputSource": "rp14a",
      "statutoryMax": 508,
      "weeklyResult": [
        {
          "weekNumber": 1,
          "payDate": "2018-01-27T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": true
        },
        {
          "weekNumber": 2,
          "payDate": "2018-02-03T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": true
        },
        {
          "weekNumber": 3,
          "payDate": "2018-02-10T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": true
        },
        {
          "weekNumber": 4,
          "payDate": "2018-02-17T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": true
        },
        {
          "weekNumber": 5,
          "payDate": "2018-02-24T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": true
        },
        {
          "weekNumber": 6,
          "payDate": "2018-03-03T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": true
        },
        {
          "weekNumber": 7,
          "payDate": "2018-03-10T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": true
        },
        {
          "weekNumber": 8,
          "payDate": "2018-03-17T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": true
        },
        {
          "weekNumber": 9,
          "payDate": "2018-03-24T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": true
        },
        {
          "weekNumber": 10,
          "payDate": "2018-03-31T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": true
        },
        {
          "weekNumber": 11,
          "payDate": "2018-04-07T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": true
        },
        {
          "weekNumber": 12,
          "payDate": "2018-04-14T00:00:00Z",
          "maximumEntitlement": 362.86,
          "employerEntitlement": 400,
          "grossEntitlement": 362.86,
          "isTaxable": true,
          "taxDeducted": 72.57,
          "niDeducted": 23.62,
          "netEntitlement": 266.67,
          "maximumDays": 5,
          "employmentDays": 4,
          "maximumEntitlementIn4MonthPeriod": 362.86,
          "employerEntitlementIn4MonthPeriod": 400,
          "grossEntitlementIn4Months": 362.86,
          "isSelected": true
        }
      ]
    }
  },
  "cnp": {
    "noticeWeeksDue": 0,
    "statutoryMax": 0,
    "maxCNPEntitlement": 0,
    "noticeStartDate": "0001-01-01T00:00:00",
    "projectedNoticeDate": "0001-01-01T00:00:00",
    "compensationEndDate": "0001-01-01T00:00:00",
    "daysInClaim": 0,
    "weeklyResults": []
  }
}
"""

@AutomationTest
Scenario: NWNP 4 Month Rule Claim Partially Covered
# Test includes payload for Notice Worked Not Paid only
# Tests that when the claim is outside of the 4 month period this is correctly reflected.
	When I post to the Notice endpoint with:
"""
{
  "nwnp": [
    {
      "inputSource": "rp1",
      "employmentStartDate": "1978-04-01T09:00:41.919Z",
      "insolvencyDate": "2018-05-28T09:00:41.919Z",
      "dismissalDate": "2018-04-13T09:00:41.920Z",
      "dateNoticeGiven": "2018-01-20T09:00:41.920Z",
      "unpaidPeriodFrom": "2018-01-20T09:00:41.920Z",
      "unpaidPeriodTo": "2018-04-13T09:00:41.920Z",
      "weeklyWage": 508.01,
      "shiftPattern": ["1","2","3","4","5"],
              "payDay": 5,
      "isTaxable": true
    },{
      "inputSource": "rp14a",
      "employmentStartDate": "1978-04-01T09:00:41.919Z",
      "insolvencyDate": "2018-05-28T09:00:41.919Z",
      "dismissalDate": "2018-04-13T09:00:41.920Z",
      "dateNoticeGiven": "2018-01-20T09:00:41.920Z",
      "unpaidPeriodFrom": "2018-01-20T09:00:41.920Z",
      "unpaidPeriodTo": "2018-04-12T09:00:41.920Z",
      "weeklyWage": 500.00,
      "shiftPattern": ["1","2","3","4","5"],
              "payDay": 5,
      "isTaxable": true
    }
  ]
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "nwnp": {
    "selectedInputSource": "rp14a",
    "rp1Results": {
      "inputSource": "rp1",
      "statutoryMax": 508,
      "weeklyResult": [
        {
          "weekNumber": 1,
          "payDate": "2018-01-27T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 508.01,
          "grossEntitlement": 508.00,
          "isTaxable": true,
          "taxDeducted": 101.60,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 0,
          "employerEntitlementIn4MonthPeriod": 0,
          "grossEntitlementIn4Months": 0,
          "isSelected": false
        },
        {
          "weekNumber": 2,
          "payDate": "2018-02-03T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 508.01,
          "grossEntitlement": 508.00,
          "isTaxable": true,
          "taxDeducted": 101.60,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 508.01,
          "grossEntitlementIn4Months": 508.00,
          "isSelected": false
        },
        {
          "weekNumber": 3,
          "payDate": "2018-02-10T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 508.01,
          "grossEntitlement": 508.00,
          "isTaxable": true,
          "taxDeducted": 101.60,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 508.01,
          "grossEntitlementIn4Months": 508.00,
          "isSelected": false
        },
        {
          "weekNumber": 4,
          "payDate": "2018-02-17T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 508.01,
          "grossEntitlement": 508.00,
          "isTaxable": true,
          "taxDeducted": 101.60,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 508.01,
          "grossEntitlementIn4Months": 508.00,
          "isSelected": false
        },
        {
          "weekNumber": 5,
          "payDate": "2018-02-24T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 508.01,
          "grossEntitlement": 508.00,
          "isTaxable": true,
          "taxDeducted": 101.60,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 508.01,
          "grossEntitlementIn4Months": 508.00,
          "isSelected": false
        },
        {
          "weekNumber": 6,
          "payDate": "2018-03-03T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 508.01,
          "grossEntitlement": 508.00,
          "isTaxable": true,
          "taxDeducted": 101.60,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 508.01,
          "grossEntitlementIn4Months": 508.00,
          "isSelected": false
        },
        {
          "weekNumber": 7,
          "payDate": "2018-03-10T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 508.01,
          "grossEntitlement": 508.00,
          "isTaxable": true,
          "taxDeducted": 101.60,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 508.01,
          "grossEntitlementIn4Months": 508.00,
          "isSelected": false
        },
        {
          "weekNumber": 8,
          "payDate": "2018-03-17T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 508.01,
          "grossEntitlement": 508.00,
          "isTaxable": true,
          "taxDeducted": 101.60,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 508.01,
          "grossEntitlementIn4Months": 508.00,
          "isSelected": false
        },
        {
          "weekNumber": 9,
          "payDate": "2018-03-24T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 508.01,
          "grossEntitlement": 508.00,
          "isTaxable": true,
          "taxDeducted": 101.60,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 508.01,
          "grossEntitlementIn4Months": 508.00,
          "isSelected": false
        },
        {
          "weekNumber": 10,
          "payDate": "2018-03-31T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 508.01,
          "grossEntitlement": 508.00,
          "isTaxable": true,
          "taxDeducted": 101.60,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 508.01,
          "grossEntitlementIn4Months": 508.00,
          "isSelected": false
        },
        {
          "weekNumber": 11,
          "payDate": "2018-04-07T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 508.01,
          "grossEntitlement": 508.00,
          "isTaxable": true,
          "taxDeducted": 101.60,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 508.01,
          "grossEntitlementIn4Months": 508.00,
          "isSelected": false
        },
        {
          "weekNumber": 12,
          "payDate": "2018-04-14T00:00:00Z",
          "maximumEntitlement": 435.43,
          "employerEntitlement": 508.01,
          "grossEntitlement": 435.43,
          "isTaxable": true,
          "taxDeducted": 87.09,
          "niDeducted": 32.33,
          "netEntitlement": 316.01,
          "maximumDays": 6,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 435.43,
          "employerEntitlementIn4MonthPeriod": 508.01,
          "grossEntitlementIn4Months": 435.43,
          "isSelected": false
        }
      ]
    },
    "rp14aResults": {
      "inputSource": "rp14a",
      "statutoryMax": 508,
      "weeklyResult": [
        {
          "weekNumber": 1,
          "payDate": "2018-01-27T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 0,
          "employerEntitlementIn4MonthPeriod": 0,
          "grossEntitlementIn4Months": 0,
          "isSelected": true
        },
        {
          "weekNumber": 2,
          "payDate": "2018-02-03T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": true
        },
        {
          "weekNumber": 3,
          "payDate": "2018-02-10T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": true
        },
        {
          "weekNumber": 4,
          "payDate": "2018-02-17T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": true
        },
        {
          "weekNumber": 5,
          "payDate": "2018-02-24T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": true
        },
        {
          "weekNumber": 6,
          "payDate": "2018-03-03T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": true
        },
        {
          "weekNumber": 7,
          "payDate": "2018-03-10T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": true
        },
        {
          "weekNumber": 8,
          "payDate": "2018-03-17T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": true
        },
        {
          "weekNumber": 9,
          "payDate": "2018-03-24T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": true
        },
        {
          "weekNumber": 10,
          "payDate": "2018-03-31T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": true
        },
        {
          "weekNumber": 11,
          "payDate": "2018-04-07T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": true
        },
        {
          "weekNumber": 12,
          "payDate": "2018-04-14T00:00:00Z",
          "maximumEntitlement": 362.86,
          "employerEntitlement": 400.00,
          "grossEntitlement": 362.86,
          "isTaxable": true,
          "taxDeducted": 72.57,
          "niDeducted": 23.62,
          "netEntitlement": 266.67,
          "maximumDays": 5,
          "employmentDays": 4,
          "maximumEntitlementIn4MonthPeriod": 362.86,
          "employerEntitlementIn4MonthPeriod": 400,
          "grossEntitlementIn4Months": 362.86,
          "isSelected": true
        }
      ]
    }
  },
  "cnp": {
    "noticeWeeksDue": 0,
    "statutoryMax": 0,
    "maxCNPEntitlement": 0,
    "noticeStartDate": "0001-01-01T00:00:00",
    "projectedNoticeDate": "0001-01-01T00:00:00",
    "compensationEndDate": "0001-01-01T00:00:00",
    "daysInClaim": 0,
    "weeklyResults": []
  }
}
"""

@AutomationTest
Scenario: NWNP Tax Set to False
# Test includes payload for Notice Worked Not Paid only
# Tests that when isTaxable is set to False that tax and ni are not applied.
	When I post to the Notice endpoint with:
"""
{
  "nwnp": [
    {
      "inputSource": "rp1",
      "employmentStartDate": "1978-04-01T09:00:41.919Z",
      "insolvencyDate": "2018-05-04T09:00:41.919Z",
      "dismissalDate": "2018-05-04T09:00:41.920Z",
      "dateNoticeGiven": "2018-01-20T09:00:41.920Z",
      "unpaidPeriodFrom": "2018-01-20T09:00:41.920Z",
      "unpaidPeriodTo": "2018-05-04T09:00:41.920Z",
      "weeklyWage": 500.00,
      "shiftPattern": ["1","2","3","4","5"],
              "payDay": 5,
      "isTaxable": false
    },{
      "inputSource": "rp14a",
      "employmentStartDate": "1978-04-01T09:00:41.919Z",
      "insolvencyDate": "2018-05-04T09:00:41.919Z",
      "dismissalDate": "2018-05-04T09:00:41.920Z",
      "dateNoticeGiven": "2018-01-20T09:00:41.920Z",
      "unpaidPeriodFrom": "2018-01-20T09:00:41.920Z",
      "unpaidPeriodTo": "2018-05-04T09:00:41.920Z",
      "weeklyWage": 500.00,
      "shiftPattern": ["1","2","3","4","5"],
              "payDay": 5,
      "isTaxable": true
    }
  ]
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "nwnp": {
    "selectedInputSource": "rp14a",
    "rp1Results": {
      "inputSource": "rp1",
      "statutoryMax": 508,
      "weeklyResult": [
        {
          "weekNumber": 1,
          "payDate": "2018-01-27T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500.00,
          "grossEntitlement": 500.00,
          "isTaxable": false,
          "taxDeducted": 0,
          "niDeducted": 0,
          "netEntitlement": 500.00,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500.00,
          "grossEntitlementIn4Months": 500.00,
          "isSelected": false
        },
        {
          "weekNumber": 2,
          "payDate": "2018-02-03T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500.00,
          "grossEntitlement": 500.00,
          "isTaxable": false,
          "taxDeducted": 0,
          "niDeducted": 0,
          "netEntitlement": 500.00,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500.00,
          "grossEntitlementIn4Months": 500.00,
          "isSelected": false
        },
        {
          "weekNumber": 3,
          "payDate": "2018-02-10T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500.00,
          "grossEntitlement": 500.00,
          "isTaxable": false,
          "taxDeducted": 0,
          "niDeducted": 0,
          "netEntitlement": 500.00,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500.00,
          "grossEntitlementIn4Months": 500.00,
          "isSelected": false
        },
        {
          "weekNumber": 4,
          "payDate": "2018-02-17T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500.00,
          "grossEntitlement": 500.00,
          "isTaxable": false,
          "taxDeducted": 0,
          "niDeducted": 0,
          "netEntitlement": 500.00,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500.00,
          "grossEntitlementIn4Months": 500.00,
          "isSelected": false
        },
        {
          "weekNumber": 5,
          "payDate": "2018-02-24T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500.00,
          "grossEntitlement": 500.00,
          "isTaxable": false,
          "taxDeducted": 0,
          "niDeducted": 0,
          "netEntitlement": 500.00,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500.00,
          "grossEntitlementIn4Months": 500.00,
          "isSelected": false
        },
        {
          "weekNumber": 6,
          "payDate": "2018-03-03T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500.00,
          "grossEntitlement": 500.00,
          "isTaxable": false,
          "taxDeducted": 0,
          "niDeducted": 0,
          "netEntitlement": 500.00,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500.00,
          "grossEntitlementIn4Months": 500.00,
          "isSelected": false
        },
        {
          "weekNumber": 7,
          "payDate": "2018-03-10T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500.00,
          "grossEntitlement": 500.00,
          "isTaxable": false,
          "taxDeducted": 0,
          "niDeducted": 0,
          "netEntitlement": 500.00,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500.00,
          "grossEntitlementIn4Months": 500.00,
          "isSelected": false
        },
        {
          "weekNumber": 8,
          "payDate": "2018-03-17T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500.00,
          "grossEntitlement": 500.00,
          "isTaxable": false,
          "taxDeducted": 0,
          "niDeducted": 0,
          "netEntitlement": 500.00,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500.00,
          "grossEntitlementIn4Months": 500.00,
          "isSelected": false
        },
        {
          "weekNumber": 9,
          "payDate": "2018-03-24T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500.00,
          "grossEntitlement": 500.00,
          "isTaxable": false,
          "taxDeducted": 0,
          "niDeducted": 0,
          "netEntitlement": 500.00,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500.00,
          "grossEntitlementIn4Months": 500.00,
          "isSelected": false
        },
        {
          "weekNumber": 10,
          "payDate": "2018-03-31T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500.00,
          "grossEntitlement": 500.00,
          "isTaxable": false,
          "taxDeducted": 0,
          "niDeducted": 0,
          "netEntitlement": 500.00,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500.00,
          "grossEntitlementIn4Months": 500.00,
          "isSelected": false
        },
        {
          "weekNumber": 11,
          "payDate": "2018-04-07T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500.00,
          "grossEntitlement": 500.00,
          "isTaxable": false,
          "taxDeducted": 0,
          "niDeducted": 0,
          "netEntitlement": 500.00,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500.00,
          "grossEntitlementIn4Months": 500.00,
          "isSelected": false
        },
        {
          "weekNumber": 12,
          "payDate": "2018-04-14T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500.00,
          "grossEntitlement": 500.00,
          "isTaxable": false,
          "taxDeducted": 0,
          "niDeducted": 0,
          "netEntitlement": 500.00,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500.00,
          "grossEntitlementIn4Months": 500.00,
          "isSelected": false
        }
      ]
    },
    "rp14aResults": {
      "inputSource": "rp14a",
      "statutoryMax": 508,
      "weeklyResult": [
        {
          "weekNumber": 1,
          "payDate": "2018-01-27T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": true
        },
        {
          "weekNumber": 2,
          "payDate": "2018-02-03T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": true
        },
        {
          "weekNumber": 3,
          "payDate": "2018-02-10T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": true
        },
        {
          "weekNumber": 4,
          "payDate": "2018-02-17T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": true
        },
        {
          "weekNumber": 5,
          "payDate": "2018-02-24T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": true
        },
        {
          "weekNumber": 6,
          "payDate": "2018-03-03T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": true
        },
        {
          "weekNumber": 7,
          "payDate": "2018-03-10T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": true
        },
        {
          "weekNumber": 8,
          "payDate": "2018-03-17T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": true
        },
        {
          "weekNumber": 9,
          "payDate": "2018-03-24T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": true
        },
        {
          "weekNumber": 10,
          "payDate": "2018-03-31T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": true
        },
        {
          "weekNumber": 11,
          "payDate": "2018-04-07T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": true
        },
        {
          "weekNumber": 12,
          "payDate": "2018-04-14T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": true
        }
      ]
    }
  },
  "cnp": {
    "noticeWeeksDue": 0,
    "statutoryMax": 0,
    "maxCNPEntitlement": 0,
    "noticeStartDate": "0001-01-01T00:00:00",
    "projectedNoticeDate": "0001-01-01T00:00:00",
    "compensationEndDate": "0001-01-01T00:00:00",
    "daysInClaim": 0,
    "weeklyResults": []
  }
}
"""

@AutomationTest
Scenario: NWNP 4 Month Rule Continuing Contract
# Test includes payload for Notice Worked Not Paid only
# Tests that when the The end of the claim predates the end of the contract, the maximumEntitlement is paid for the full week.
	When I post to the Notice endpoint with:
"""
{
  "nwnp": [
    {
      "inputSource": "rp1",
      "employmentStartDate": "1978-04-01T09:00:41.919Z",
      "insolvencyDate": "2018-05-04T09:00:41.919Z",
      "dismissalDate": "2018-04-28T09:00:41.920Z",
      "dateNoticeGiven": "2018-01-20T09:00:41.920Z",
      "unpaidPeriodFrom": "2018-01-20T09:00:41.920Z",
      "unpaidPeriodTo": "2018-04-13T09:00:41.920Z",
      "weeklyWage": 508.01,
      "shiftPattern": ["1","2","3","4","5"],
              "payDay": 5,
      "isTaxable": true
    },{
      "inputSource": "rp14a",
      "employmentStartDate": "1978-04-01T09:00:41.919Z",
      "insolvencyDate": "2018-05-04T09:00:41.919Z",
      "dismissalDate": "2018-04-28T09:00:41.920Z",
      "dateNoticeGiven": "2018-01-20T09:00:41.920Z",
      "unpaidPeriodFrom": "2018-01-20T09:00:41.920Z",
      "unpaidPeriodTo": "2018-04-12T09:00:41.920Z",
      "weeklyWage": 500.00,
      "shiftPattern": ["1","2","3","4","5"],
              "payDay": 5,
      "isTaxable": true
    }
  ]
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "nwnp": {
    "selectedInputSource": "rp14a",
    "rp1Results": {
      "inputSource": "rp1",
      "statutoryMax": 508,
      "weeklyResult": [
        {
          "weekNumber": 1,
          "payDate": "2018-01-27T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 508.01,
          "grossEntitlement": 508,
          "isTaxable": true,
          "taxDeducted": 101.6,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 508.01,
          "grossEntitlementIn4Months": 508,
          "isSelected": false
        },
        {
          "weekNumber": 2,
          "payDate": "2018-02-03T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 508.01,
          "grossEntitlement": 508,
          "isTaxable": true,
          "taxDeducted": 101.6,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 508.01,
          "grossEntitlementIn4Months": 508,
          "isSelected": false
        },
        {
          "weekNumber": 3,
          "payDate": "2018-02-10T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 508.01,
          "grossEntitlement": 508,
          "isTaxable": true,
          "taxDeducted": 101.6,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 508.01,
          "grossEntitlementIn4Months": 508,
          "isSelected": false
        },
        {
          "weekNumber": 4,
          "payDate": "2018-02-17T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 508.01,
          "grossEntitlement": 508,
          "isTaxable": true,
          "taxDeducted": 101.6,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 508.01,
          "grossEntitlementIn4Months": 508,
          "isSelected": false
        },
        {
          "weekNumber": 5,
          "payDate": "2018-02-24T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 508.01,
          "grossEntitlement": 508,
          "isTaxable": true,
          "taxDeducted": 101.6,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 508.01,
          "grossEntitlementIn4Months": 508,
          "isSelected": false
        },
        {
          "weekNumber": 6,
          "payDate": "2018-03-03T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 508.01,
          "grossEntitlement": 508.00,
          "isTaxable": true,
          "taxDeducted": 101.6,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 508.01,
          "grossEntitlementIn4Months": 508,
          "isSelected": false
        },
        {
          "weekNumber": 7,
          "payDate": "2018-03-10T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 508.01,
          "grossEntitlement": 508,
          "isTaxable": true,
          "taxDeducted": 101.6,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 508.01,
          "grossEntitlementIn4Months": 508,
          "isSelected": false
        },
        {
          "weekNumber": 8,
          "payDate": "2018-03-17T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 508.01,
          "grossEntitlement": 508,
          "isTaxable": true,
          "taxDeducted": 101.6,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 508.01,
          "grossEntitlementIn4Months": 508,
          "isSelected": false
        },
        {
          "weekNumber": 9,
          "payDate": "2018-03-24T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 508.01,
          "grossEntitlement": 508,
          "isTaxable": true,
          "taxDeducted": 101.6,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 508.01,
          "grossEntitlementIn4Months": 508,
          "isSelected": false
        },
        {
          "weekNumber": 10,
          "payDate": "2018-03-31T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 508.01,
          "grossEntitlement": 508,
          "isTaxable": true,
          "taxDeducted": 101.6,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 508.01,
          "grossEntitlementIn4Months": 508,
          "isSelected": false
        },
        {
          "weekNumber": 11,
          "payDate": "2018-04-07T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 508.01,
          "grossEntitlement": 508,
          "isTaxable": true,
          "taxDeducted": 101.60,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 508.01,
          "grossEntitlementIn4Months": 508,
          "isSelected": false
        },
        {
          "weekNumber": 12,
          "payDate": "2018-04-14T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 508.01,
          "grossEntitlement": 508,
          "isTaxable": true,
          "taxDeducted": 101.6,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 508.01,
          "grossEntitlementIn4Months": 508,
          "isSelected": false
        }
      ]
    },
    "rp14aResults": {
      "inputSource": "rp14a",
      "statutoryMax": 508,
      "weeklyResult": [
        {
          "weekNumber": 1,
          "payDate": "2018-01-27T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": true
        },
        {
          "weekNumber": 2,
          "payDate": "2018-02-03T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": true
        },
        {
          "weekNumber": 3,
          "payDate": "2018-02-10T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": true
        },
        {
          "weekNumber": 4,
          "payDate": "2018-02-17T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": true
        },
        {
          "weekNumber": 5,
          "payDate": "2018-02-24T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": true
        },
        {
          "weekNumber": 6,
          "payDate": "2018-03-03T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": true
        },
        {
          "weekNumber": 7,
          "payDate": "2018-03-10T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": true
        },
        {
          "weekNumber": 8,
          "payDate": "2018-03-17T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": true
        },
        {
          "weekNumber": 9,
          "payDate": "2018-03-24T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": true
        },
        {
          "weekNumber": 10,
          "payDate": "2018-03-31T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": true
        },
        {
          "weekNumber": 11,
          "payDate": "2018-04-07T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": true
        },
        {
          "weekNumber": 12,
          "payDate": "2018-04-14T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 400,
          "grossEntitlement": 400,
          "isTaxable": true,
          "taxDeducted": 80,
          "niDeducted": 28.08,
          "netEntitlement": 291.92,
          "maximumDays": 7,
          "employmentDays": 4,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 400,
          "grossEntitlementIn4Months": 400,
          "isSelected": true
        }
      ]
    }
  },
  "cnp": {
    "noticeWeeksDue": 0,
    "statutoryMax": 0,
    "maxCNPEntitlement": 0,
    "noticeStartDate": "0001-01-01T00:00:00",
    "projectedNoticeDate": "0001-01-01T00:00:00",
    "compensationEndDate": "0001-01-01T00:00:00",
    "daysInClaim": 0,
    "weeklyResults": []
  }
}
"""

@AutomationTest
Scenario: CNP 13 Years Service
# Test includes payload for Compensatory Notice of Pay only
# Tests that when an employee was employed for 13 Years they are capped at 12 weeks of CNP
	When I post to the Notice endpoint with:
"""
{
  "cnp": {
    "insolvencyEmploymentStartDate": "2005-03-28T09:00:41.920Z",
    "insolvencyDate": "2018-03-29T09:00:41.920Z",
    "dismissalDate": "2018-03-28T09:00:41.920Z",
    "dateNoticeGiven": "2018-03-28T09:00:41.920Z",
    "weeklyWage": 337.50,
    "shiftPattern": ["1","2","3","4","5"],
          "isTaxable": true,
    "dateOfBirth": "1957-04-29T09:00:41.920Z",
    "deceasedDate": ""
  }
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "nwnp": {
    "selectedInputSource": null,
    "rp1Results": {
      "inputSource": null,
      "statutoryMax": 0,
      "weeklyResult": []
    },
    "rp14aResults": {
      "inputSource": null,
      "statutoryMax": 0,
      "weeklyResult": []
    }
  },
  "cnp": {
    "noticeWeeksDue": 12,
    "statutoryMax": 489,
    "maxCNPEntitlement": 4050,
    "noticeStartDate": "2018-03-29T00:00:00Z",
    "projectedNoticeDate": "2018-06-20T00:00:00Z",
    "compensationEndDate": "2018-06-20T00:00:00Z",
    "daysInClaim": 60,
    "weeklyResults": [
      {
        "weekNumber": 1,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 270,
        "isTaxable": false,
        "notionalTaxDeducted": 67.5,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 270,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 270,
        "isSelected": true
      },
      {
        "weekNumber": 2,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 211.49,
        "isTaxable": false,
        "notionalTaxDeducted": 52.87,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 211.49,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 211.49,
        "isSelected": true
      },
      {
        "weekNumber": 3,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 211.49,
        "isTaxable": false,
        "notionalTaxDeducted": 52.87,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 211.49,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 211.49,
        "isSelected": true
      },
      {
        "weekNumber": 4,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 211.49,
        "isTaxable": false,
        "notionalTaxDeducted": 52.87,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 211.49,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 211.49,
        "isSelected": true
      },
      {
        "weekNumber": 5,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 211.49,
        "isTaxable": false,
        "notionalTaxDeducted": 52.87,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 211.49,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 211.49,
        "isSelected": true
      },
      {
        "weekNumber": 6,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 211.49,
        "isTaxable": false,
        "notionalTaxDeducted": 52.87,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 211.49,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 211.49,
        "isSelected": true
      },
      {
        "weekNumber": 7,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 211.49,
        "isTaxable": false,
        "notionalTaxDeducted": 52.87,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 211.49,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 211.49,
        "isSelected": true
      },
      {
        "weekNumber": 8,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 211.49,
        "isTaxable": false,
        "notionalTaxDeducted": 52.87,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 211.49,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 211.49,
        "isSelected": true
      },
      {
        "weekNumber": 9,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 211.49,
        "isTaxable": false,
        "notionalTaxDeducted": 52.87,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 211.49,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 211.49,
        "isSelected": true
      },
      {
        "weekNumber": 10,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 211.49,
        "isTaxable": false,
        "notionalTaxDeducted": 52.87,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 211.49,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 211.49,
        "isSelected": true
      },
      {
        "weekNumber": 11,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 211.49,
        "isTaxable": false,
        "notionalTaxDeducted": 52.87,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 211.49,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 211.49,
        "isSelected": true
      },
      {
        "weekNumber": 12,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 211.49,
        "isTaxable": false,
        "notionalTaxDeducted": 52.87,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 211.49,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 211.49,
        "isSelected": true
      }
    ]
  }
}
"""


@AutomationTest
Scenario: CNP 1 Month Service
# Test includes payload for Compensatory Notice of Pay only
# Tests that when an employee was employed for a month they are awarded 1 week of CNP
	When I post to the Notice endpoint with:
"""
{
  "cnp": {
    "insolvencyEmploymentStartDate": "2018-02-28T09:00:41.920Z",
    "insolvencyDate": "2018-03-29T09:00:41.920Z",
    "dismissalDate": "2018-03-28T09:00:41.920Z",
    "dateNoticeGiven": "2018-03-28T09:00:41.920Z",
    "weeklyWage": 337.50,
    "shiftPattern": ["1","2","3","4","5"],
          "isTaxable": true,
    "dateOfBirth": "1957-04-29T09:00:41.920Z",
    "deceasedDate": ""
  }
}

"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "nwnp": {
    "selectedInputSource": null,
    "rp1Results": {
      "inputSource": null,
      "statutoryMax": 0,
      "weeklyResult": []
    },
    "rp14aResults": {
      "inputSource": null,
      "statutoryMax": 0,
      "weeklyResult": []
    }
  },
  "cnp": {
    "noticeWeeksDue": 1,
    "statutoryMax": 489,
    "maxCNPEntitlement": 337.5,
    "noticeStartDate": "2018-03-29T00:00:00Z",
    "projectedNoticeDate": "2018-04-04T00:00:00Z",
    "compensationEndDate": "2018-04-04T00:00:00Z",
    "daysInClaim": 5,
    "weeklyResults": [
      {
        "weekNumber": 1,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 270,
        "isTaxable": false,
        "notionalTaxDeducted": 67.5,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 270,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 270,
        "isSelected": true
      }
    ]
  }
}
"""

@AutomationTest
Scenario: CNP Age 24 Notional Benefit
# Test includes payload for Compensatory Notice of Pay only
# Tests that when an employee was 24 Years old at the date of dismissal the Notional Benefit is calculated at the lower rate
	When I post to the Notice endpoint with:
"""
{
  "cnp": {
    "insolvencyEmploymentStartDate": "2005-03-28T09:00:41.920Z",
    "insolvencyDate": "2018-03-29T09:00:41.920Z",
    "dismissalDate": "2018-03-28T09:00:41.920Z",
    "dateNoticeGiven": "2018-03-28T09:00:41.920Z",
    "weeklyWage": 337.50,
    "shiftPattern": ["1","2","3","4","5"],
          "isTaxable": true,
    "dateOfBirth": "1993-03-29T09:00:41.920Z",
    "deceasedDate": ""
  }
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "nwnp": {
    "selectedInputSource": null,
    "rp1Results": {
      "inputSource": null,
      "statutoryMax": 0,
      "weeklyResult": []
    },
    "rp14aResults": {
      "inputSource": null,
      "statutoryMax": 0,
      "weeklyResult": []
    }
  },
  "cnp": {
    "noticeWeeksDue": 12,
    "statutoryMax": 489,
    "maxCNPEntitlement": 4050,
    "noticeStartDate": "2018-03-29T00:00:00Z",
    "projectedNoticeDate": "2018-06-20T00:00:00Z",
    "compensationEndDate": "2018-06-20T00:00:00Z",
    "daysInClaim": 60,
    "weeklyResults": [
      {
        "weekNumber": 1,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 270,
        "isTaxable": false,
        "notionalTaxDeducted": 67.5,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 270,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 270,
        "isSelected": true
      },
      {
        "weekNumber": 2,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 57.94,
        "grossEntitlement": 223.65,
        "isTaxable": false,
        "notionalTaxDeducted": 55.91,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 223.65,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 223.65,
        "isSelected": true
      },
      {
        "weekNumber": 3,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 57.94,
        "grossEntitlement": 223.65,
        "isTaxable": false,
        "notionalTaxDeducted": 55.91,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 223.65,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 223.65,
        "isSelected": true
      },
      {
        "weekNumber": 4,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 57.94,
        "grossEntitlement": 223.65,
        "isTaxable": false,
        "notionalTaxDeducted": 55.91,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 223.65,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 223.65,
        "isSelected": true
	  },
      {
        "weekNumber": 5,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 57.94,
        "grossEntitlement": 223.65,
        "isTaxable": false,
        "notionalTaxDeducted": 55.91,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 223.65,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 223.65,
        "isSelected": true
      },
      {
        "weekNumber": 6,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 57.94,
        "grossEntitlement": 223.65,
        "isTaxable": false,
        "notionalTaxDeducted": 55.91,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 223.65,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 223.65,
        "isSelected": true
	  },
      {
        "weekNumber": 7,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 57.94,
        "grossEntitlement": 223.65,
        "isTaxable": false,
        "notionalTaxDeducted": 55.91,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 223.65,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 223.65,
        "isSelected": true
      },
      {
        "weekNumber": 8,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 57.94,
        "grossEntitlement": 223.65,
        "isTaxable": false,
        "notionalTaxDeducted": 55.91,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 223.65,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 223.65,
        "isSelected": true
      },
      {
        "weekNumber": 9,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 57.94,
        "grossEntitlement": 223.65,
        "isTaxable": false,
        "notionalTaxDeducted": 55.91,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 223.65,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 223.65,
        "isSelected": true
      },
      {
        "weekNumber": 10,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 57.94,
        "grossEntitlement": 223.65,
        "isTaxable": false,
        "notionalTaxDeducted": 55.91,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 223.65,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 223.65,
        "isSelected": true
      },
      {
        "weekNumber": 11,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 57.94,
        "grossEntitlement": 223.65,
        "isTaxable": false,
        "notionalTaxDeducted": 55.91,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 223.65,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 223.65,
        "isSelected": true
      },
      {
        "weekNumber": 12,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 57.94,
        "grossEntitlement": 223.65,
        "isTaxable": false,
        "notionalTaxDeducted": 55.91,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 223.65,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 223.65,
        "isSelected": true
      }
    ]
  }
}
"""

@AutomationTest
Scenario: CNP Age 25 Notional Benefit
# Test includes payload for Compensatory Notice of Pay only
# Tests that when an employee was 25 Years old at the date of dismissal the Notional Benefit is calculated at the higher rate
	When I post to the Notice endpoint with:
"""
{
  "cnp": {
    "insolvencyEmploymentStartDate": "2005-03-28T09:00:41.920Z",
    "insolvencyDate": "2018-03-29T09:00:41.920Z",
    "dismissalDate": "2018-03-28T09:00:41.920Z",
    "dateNoticeGiven": "2018-03-28T09:00:41.920Z",
    "weeklyWage": 337.50,
    "shiftPattern": ["1","2","3","4","5"],
          "isTaxable": true,
    "dateOfBirth": "1993-03-28T09:00:41.920Z",
    "deceasedDate": ""
  }
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "nwnp": {
    "selectedInputSource": null,
    "rp1Results": {
      "inputSource": null,
      "statutoryMax": 0,
      "weeklyResult": []
    },
    "rp14aResults": {
      "inputSource": null,
      "statutoryMax": 0,
      "weeklyResult": []
    }
  },
  "cnp": {
    "noticeWeeksDue": 12,
    "statutoryMax": 489,
    "maxCNPEntitlement": 4050,
    "noticeStartDate": "2018-03-29T00:00:00Z",
    "projectedNoticeDate": "2018-06-20T00:00:00Z",
    "compensationEndDate": "2018-06-20T00:00:00Z",
    "daysInClaim": 60,
    "weeklyResults": [
      {
        "weekNumber": 1,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 270,
        "isTaxable": false,
        "notionalTaxDeducted": 67.5,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 270,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 270,
        "isSelected": true
      },
      {
        "weekNumber": 2,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 211.49,
        "isTaxable": false,
        "notionalTaxDeducted": 52.87,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 211.49,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 211.49,
        "isSelected": true
      },
      {
        "weekNumber": 3,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 211.49,
        "isTaxable": false,
        "notionalTaxDeducted": 52.87,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 211.49,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 211.49,
        "isSelected": true
      },
      {
        "weekNumber": 4,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 211.49,
        "isTaxable": false,
        "notionalTaxDeducted": 52.87,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 211.49,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 211.49,
        "isSelected": true
      },
      {
        "weekNumber": 5,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 211.49,
        "isTaxable": false,
        "notionalTaxDeducted": 52.87,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 211.49,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 211.49,
        "isSelected": true
      },
      {
        "weekNumber": 6,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 211.49,
        "isTaxable": false,
        "notionalTaxDeducted": 52.87,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 211.49,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 211.49,
        "isSelected": true
      },
      {
        "weekNumber": 7,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 211.49,
        "isTaxable": false,
        "notionalTaxDeducted": 52.87,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 211.49,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 211.49,
        "isSelected": true
      },
      {
        "weekNumber": 8,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 211.49,
        "isTaxable": false,
        "notionalTaxDeducted": 52.87,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 211.49,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 211.49,
        "isSelected": true
      },
      {
        "weekNumber": 9,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 211.49,
        "isTaxable": false,
        "notionalTaxDeducted": 52.87,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 211.49,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 211.49,
        "isSelected": true
      },
      {
        "weekNumber": 10,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 211.49,
        "isTaxable": false,
        "notionalTaxDeducted": 52.87,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 211.49,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 211.49,
        "isSelected": true
      },
      {
        "weekNumber": 11,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 211.49,
        "isTaxable": false,
        "notionalTaxDeducted": 52.87,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 211.49,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 211.49,
        "isSelected": true
      },
      {
        "weekNumber": 12,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 211.49,
        "isTaxable": false,
        "notionalTaxDeducted": 52.87,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 211.49,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 211.49,
        "isSelected": true
      }
    ]
  }
}
"""

@AutomationTest
Scenario: CNP Death of Claimant During Claim
# Test includes payload for Compensatory Notice of Pay only
# Tests that when an employee dies partway through a claim the claim ends at the point of death.
	When I post to the Notice endpoint with:
"""
{
  "cnp": {
    "insolvencyEmploymentStartDate": "2005-03-28T09:00:41.920Z",
    "insolvencyDate": "2018-03-29T09:00:41.920Z",
    "dismissalDate": "2018-03-28T09:00:41.920Z",
    "dateNoticeGiven": "2018-03-28T09:00:41.920Z",
    "weeklyWage": 337.50,
    "shiftPattern": ["1","2","3","4","5"],
          "isTaxable": true,
    "dateOfBirth": "1957-03-28T09:00:41.920Z",
    "deceasedDate": "2018-06-06T09:00:41.920Z"
  }
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "nwnp": {
    "selectedInputSource": null,
    "rp1Results": {
      "inputSource": null,
      "statutoryMax": 0,
      "weeklyResult": []
    },
    "rp14aResults": {
      "inputSource": null,
      "statutoryMax": 0,
      "weeklyResult": []
    }
  },
  "cnp": {
    "noticeWeeksDue": 10,
    "statutoryMax": 489,
    "maxCNPEntitlement": 3375,
    "noticeStartDate": "2018-03-29T00:00:00Z",
    "projectedNoticeDate": "2018-06-20T00:00:00Z",
    "compensationEndDate": "2018-06-06T00:00:00Z",
    "daysInClaim": 50,
    "weeklyResults": [
      {
        "weekNumber": 1,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 270,
        "isTaxable": false,
        "notionalTaxDeducted": 67.5,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 270,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 270,
        "isSelected": true
      },
      {
        "weekNumber": 2,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 211.49,
        "isTaxable": false,
        "notionalTaxDeducted": 52.87,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 211.49,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 211.49,
        "isSelected": true
      },
      {
        "weekNumber": 3,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 211.49,
        "isTaxable": false,
        "notionalTaxDeducted": 52.87,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 211.49,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 211.49,
        "isSelected": true
      },
      {
        "weekNumber": 4,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 211.49,
        "isTaxable": false,
        "notionalTaxDeducted": 52.87,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 211.49,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 211.49,
        "isSelected": true
      },
      {
        "weekNumber": 5,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 211.49,
        "isTaxable": false,
        "notionalTaxDeducted": 52.87,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 211.49,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 211.49,
        "isSelected": true
      },
      {
        "weekNumber": 6,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 211.49,
        "isTaxable": false,
        "notionalTaxDeducted": 52.87,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 211.49,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 211.49,
        "isSelected": true
      },
      {
        "weekNumber": 7,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 211.49,
        "isTaxable": false,
        "notionalTaxDeducted": 52.87,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 211.49,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 211.49,
        "isSelected": true
      },
      {
        "weekNumber": 8,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 211.49,
        "isTaxable": false,
        "notionalTaxDeducted": 52.87,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 211.49,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 211.49,
        "isSelected": true
      },
      {
        "weekNumber": 9,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 211.49,
        "isTaxable": false,
        "notionalTaxDeducted": 52.87,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 211.49,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 211.49,
        "isSelected": true
      },
      {
        "weekNumber": 10,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 211.49,
        "isTaxable": false,
        "notionalTaxDeducted": 52.87,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 211.49,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 211.49,
        "isSelected": true
      }
    ]
  }
}
"""

@AutomationTest
Scenario: CNP Notional Benefit Overrides
# Test includes payload for Compensatory Notice of Pay only
# Tests that when notional Benefit Overrides are used then notional benefit is not deducted
	When I post to the Notice endpoint with:
"""
{
  "cnp": {
    "insolvencyEmploymentStartDate": "2005-03-28T09:00:41.920Z",
    "insolvencyDate": "2018-03-29T09:00:41.920Z",
    "dismissalDate": "2018-03-28T09:00:41.920Z",
    "dateNoticeGiven": "2018-03-28T09:00:41.920Z",
    "weeklyWage": 337.50,
    "shiftPattern": ["1","2","3","4","5"],
          "isTaxable": true,
    "dateOfBirth": "1957-03-28T09:00:41.920Z",
    "deceasedDate": "2018-06-06T09:00:41.920Z",
	"notionalBenefitOverrides": [
	{
		"notionalBenefitOverrideStartDate": "2018-04-26T09:00:41.920Z",
		"notionalBenefitOverrideEndDate": "2018-05-02T09:00:41.920Z"
	},
	{
		"notionalBenefitOverrideStartDate": "2018-05-17T09:00:41.920Z",
		"notionalBenefitOverrideEndDate": "2018-05-23T09:00:41.920Z"
	}
	]
  }
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "nwnp": {
    "selectedInputSource": null,
    "rp1Results": {
      "inputSource": null,
      "statutoryMax": 0,
      "weeklyResult": []
    },
    "rp14aResults": {
      "inputSource": null,
      "statutoryMax": 0,
      "weeklyResult": []
    }
  },
  "cnp": {
    "noticeWeeksDue": 10,
    "statutoryMax": 489,
    "maxCNPEntitlement": 3375,
    "noticeStartDate": "2018-03-29T00:00:00Z",
    "projectedNoticeDate": "2018-06-20T00:00:00Z",
    "compensationEndDate": "2018-06-06T00:00:00Z",
    "daysInClaim": 50,
    "weeklyResults": [
      {
        "weekNumber": 1,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 270,
        "isTaxable": false,
        "notionalTaxDeducted": 67.5,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 270,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 270,
        "isSelected": true
      },
      {
        "weekNumber": 2,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 211.49,
        "isTaxable": false,
        "notionalTaxDeducted": 52.87,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 211.49,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 211.49,
        "isSelected": true
      },
      {
        "weekNumber": 3,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 211.49,
        "isTaxable": false,
        "notionalTaxDeducted": 52.87,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 211.49,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 211.49,
        "isSelected": true
      },
      {
        "weekNumber": 4,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 211.49,
        "isTaxable": false,
        "notionalTaxDeducted": 52.87,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 211.49,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 211.49,
        "isSelected": true
      },
      {
        "weekNumber": 5,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 270,
        "isTaxable": false,
        "notionalTaxDeducted": 67.5,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 270,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 270,
        "isSelected": true
      },
      {
        "weekNumber": 6,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 270,
        "isTaxable": false,
        "notionalTaxDeducted": 67.5,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 270,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 270,
        "isSelected": true
      },
      {
        "weekNumber": 7,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 211.49,
        "isTaxable": false,
        "notionalTaxDeducted": 52.87,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 211.49,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 211.49,
        "isSelected": true
      },
      {
        "weekNumber": 8,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 270,
        "isTaxable": false,
        "notionalTaxDeducted": 67.5,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 270,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 270,
        "isSelected": true
      },
      {
        "weekNumber": 9,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 270,
        "isTaxable": false,
        "notionalTaxDeducted": 67.5,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 270,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 270,
        "isSelected": true
      },
      {
        "weekNumber": 10,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 211.49,
        "isTaxable": false,
        "notionalTaxDeducted": 52.87,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 211.49,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 211.49,
        "isSelected": true
      }
    ]
  }
}
"""

@AutomationTest
Scenario: CNP Mitigations Benefits & New Employments
# Test includes payload for Compensatory Notice of Pay only
# Tests that when benefits and new employments are declared the affected weeks are adjusted
	When I post to the Notice endpoint with:
"""
{
  "cnp": {
    "insolvencyEmploymentStartDate": "2005-03-28T09:00:41.920Z",
    "insolvencyDate": "2018-03-29T09:00:41.920Z",
    "dismissalDate": "2018-03-28T09:00:41.920Z",
    "dateNoticeGiven": "2018-03-28T09:00:41.920Z",
    "weeklyWage": 337.50,
    "shiftPattern": ["1","2","3","4","5"],
          "isTaxable": true,
    "dateOfBirth": "1957-03-28T09:00:41.920Z",
    "deceasedDate": "",
	"benefits": [
	  {
		"benefitStartDate": "2018-04-26T09:00:41.920Z",
		"benefitEndDate": "2018-05-02T09:00:41.920Z",
		"benefitAmount": 200
	  }
	],
	"newEmployments": [
	  {
		"newEmploymentStartDate": "2018-05-17T09:00:41.920Z",
		"newEmploymentEndDate": "2018-06-06T09:00:41.920Z",
		"newEmploymentWage": 900,
		"newEmploymentWeeklyWage": 300
	   }
	]
  }
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "nwnp": {
    "selectedInputSource": null,
    "rp1Results": {
      "inputSource": null,
      "statutoryMax": 0,
      "weeklyResult": []
    },
    "rp14aResults": {
      "inputSource": null,
      "statutoryMax": 0,
      "weeklyResult": []
    }
  },
  "cnp": {
    "noticeWeeksDue": 12,
    "statutoryMax": 489,
    "maxCNPEntitlement": 4050,
    "noticeStartDate": "2018-03-29T00:00:00Z",
    "projectedNoticeDate": "2018-06-20T00:00:00Z",
    "compensationEndDate": "2018-06-20T00:00:00Z",
    "daysInClaim": 60,
    "weeklyResults": [
      {
        "weekNumber": 1,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 270,
        "isTaxable": false,
        "notionalTaxDeducted": 67.5,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 270,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 270,
        "isSelected": true
      },
      {
        "weekNumber": 2,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 211.49,
        "isTaxable": false,
        "notionalTaxDeducted": 52.87,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 211.49,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 211.49,
        "isSelected": true
      },
      {
        "weekNumber": 3,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 211.49,
        "isTaxable": false,
        "notionalTaxDeducted": 52.87,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 211.49,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 211.49,
        "isSelected": true
      },
      {
        "weekNumber": 4,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 211.49,
        "isTaxable": false,
        "notionalTaxDeducted": 52.87,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 211.49,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 211.49,
        "isSelected": true
      },
      {
        "weekNumber": 5,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 200,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 110,
        "isTaxable": false,
        "notionalTaxDeducted": 27.5,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 110,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 110,
        "isSelected": true
      },
      {
        "weekNumber": 6,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 270,
        "isTaxable": false,
        "notionalTaxDeducted": 67.5,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 270,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 270,
        "isSelected": true
      },
      {
        "weekNumber": 7,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 211.49,
        "isTaxable": false,
        "notionalTaxDeducted": 52.87,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 211.49,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 211.49,
        "isSelected": true
      },
      {
        "weekNumber": 8,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 300,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 30,
        "isTaxable": false,
        "notionalTaxDeducted": 7.5,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 30,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 30,
        "isSelected": true
      },
      {
        "weekNumber": 9,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 300,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 30,
        "isTaxable": false,
        "notionalTaxDeducted": 7.5,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 30,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 30,
        "isSelected": true
      },
      {
        "weekNumber": 10,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 300,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 30,
        "isTaxable": false,
        "notionalTaxDeducted": 7.5,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 30,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 30,
        "isSelected": true
      },
      {
        "weekNumber": 11,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 270,
        "isTaxable": false,
        "notionalTaxDeducted": 67.5,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 270,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 270,
        "isSelected": true
      },
	  {
        "weekNumber": 12,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 211.49,
        "isTaxable": false,
        "notionalTaxDeducted": 52.87,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 211.49,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 211.49,
        "isSelected": true
      }
    ]
  }
}
"""

@AutomationTest
Scenario: CNP Mitigations More Than Value of Claim
# Test includes payload for Compensatory Notice of Pay only
# Tests that when wage increase is declared the affected weeks are adjusted
# Tests that when the total of declarations exceed the weekly wage, nothing is paid out
	When I post to the Notice endpoint with:
"""
{
  "cnp": {
    "insolvencyEmploymentStartDate": "2005-03-28T09:00:41.920Z",
    "insolvencyDate": "2018-03-29T09:00:41.920Z",
    "dismissalDate": "2018-03-28T09:00:41.920Z",
    "dateNoticeGiven": "2018-03-28T09:00:41.920Z",
    "weeklyWage": 337.50,
    "shiftPattern": ["1","2","3","4","5"],
          "isTaxable": true,
    "dateOfBirth": "1957-03-28T09:00:41.920Z",
    "deceasedDate": "",
	"benefits": [
	  {
		"benefitStartDate": "2018-05-17T09:00:41.920Z",
		"benefitEndDate": "2018-06-06T09:00:41.920Z",
		"benefitAmount": 300
	  },
	],
	"newEmployments": [
	  {
		"newEmploymentStartDate": "2018-05-17T09:00:41.920Z",
		"newEmploymentEndDate": "2018-06-06T09:00:41.920Z",
		"newEmploymentWage": 900,
		"newEmploymentWeeklyWage": 300
	   }
	],
	"wageIncreases": [
	  {
		"wageIncreaseStartDate": "2018-03-29T09:00:41.920Z",
		"wageIncreaseEndDate": "2018-06-20T09:00:41.920Z",
		"WageIncreaseAmount": 1200
	   }
	]
  }
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "nwnp": {
    "selectedInputSource": null,
    "rp1Results": {
      "inputSource": null,
      "statutoryMax": 0,
      "weeklyResult": []
    },
    "rp14aResults": {
      "inputSource": null,
      "statutoryMax": 0,
      "weeklyResult": []
    }
  },
  "cnp": {
    "noticeWeeksDue": 12,
    "statutoryMax": 489,
    "maxCNPEntitlement": 4050,
    "noticeStartDate": "2018-03-29T00:00:00Z",
    "projectedNoticeDate": "2018-06-20T00:00:00Z",
    "compensationEndDate": "2018-06-20T00:00:00Z",
    "daysInClaim": 60,
    "weeklyResults": [
      {
        "weekNumber": 1,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 100,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 190,
        "isTaxable": false,
        "notionalTaxDeducted": 47.5,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 190,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 190,
        "isSelected": true
      },
      {
        "weekNumber": 2,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 100,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 190,
        "isTaxable": false,
        "notionalTaxDeducted": 47.5,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 190,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 190,
        "isSelected": true
      },
      {
        "weekNumber": 3,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 100,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 190,
        "isTaxable": false,
        "notionalTaxDeducted": 47.5,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 190,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 190,
        "isSelected": true
      },
      {
        "weekNumber": 4,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 100,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 190,
        "isTaxable": false,
        "notionalTaxDeducted": 47.5,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 190,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 190,
        "isSelected": true
      },
      {
        "weekNumber": 5,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 100,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 190,
        "isTaxable": false,
        "notionalTaxDeducted": 47.5,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 190,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 190,
        "isSelected": true
      },
      {
        "weekNumber": 6,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 100,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 190,
        "isTaxable": false,
        "notionalTaxDeducted": 47.5,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 190,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 190,
        "isSelected": true
      },
      {
        "weekNumber": 7,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 100,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 190,
        "isTaxable": false,
        "notionalTaxDeducted": 47.5,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 190,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 190,
        "isSelected": true
      },
      {
        "weekNumber": 8,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 100,
        "newEmploymentDeducted": 300,
        "wageIncreaseDeducted": 100,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 0,
        "isTaxable": false,
        "notionalTaxDeducted": 0,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 0,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 0,
        "isSelected": true
      },
      {
        "weekNumber": 9,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 100,
        "newEmploymentDeducted": 300,
        "wageIncreaseDeducted": 100,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 0,
        "isTaxable": false,
        "notionalTaxDeducted": 0,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 0,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 0,
        "isSelected": true
      },
      {
        "weekNumber": 10,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 100,
        "newEmploymentDeducted": 300,
        "wageIncreaseDeducted": 100,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 0,
        "isTaxable": false,
        "notionalTaxDeducted": 0,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 0,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 0,
        "isSelected": true
      },
      {
        "weekNumber": 11,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 100,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 190,
        "isTaxable": false,
        "notionalTaxDeducted": 47.5,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 190,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 190,
        "isSelected": true
      },
	  {
        "weekNumber": 12,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 100,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 190,
        "isTaxable": false,
        "notionalTaxDeducted": 47.5,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 190,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 190,
        "isSelected": true
      }
    ]
  }
}
"""

@AutomationTest
Scenario: CNP Post 2018 Tax and NI
# Test includes payload for Compensatory Notice of Pay only
# Tests that tax and ni are charged for post April 2018 
	When I post to the Notice endpoint with:
"""
{
  "cnp": {
    "insolvencyEmploymentStartDate": "2005-03-28T09:00:41.920Z",
    "insolvencyDate": "2018-04-07T09:00:41.920Z",
    "dismissalDate": "2018-04-06T09:00:41.920Z",
    "dateNoticeGiven": "2018-04-06T09:00:41.920Z",
    "weeklyWage": 337.50,
    "shiftPattern": ["1","2","3","4","5"],
          "isTaxable": true,
    "dateOfBirth": "1957-04-29T09:00:41.920Z",
    "deceasedDate": ""
  }
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "nwnp": {
    "selectedInputSource": null,
    "rp1Results": {
      "inputSource": null,
      "statutoryMax": 0,
      "weeklyResult": []
    },
    "rp14aResults": {
      "inputSource": null,
      "statutoryMax": 0,
      "weeklyResult": []
    }
  },
  "cnp": {
    "noticeWeeksDue": 12,
    "statutoryMax": 508,
    "maxCNPEntitlement": 4050,
    "noticeStartDate": "2018-04-07T00:00:00Z",
    "projectedNoticeDate": "2018-06-29T00:00:00Z",
    "compensationEndDate": "2018-06-29T00:00:00Z",
    "daysInClaim": 60,
    "weeklyResults": [
      {
        "weekNumber": 1,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 337.5,
        "isTaxable": true,
        "notionalTaxDeducted": 0,
        "taxDeducted": 67.5,
        "niDeducted": 20.58,
        "netEntitlement": 249.42,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 249.42,
        "isSelected": true
      },
      {
        "weekNumber": 2,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 264.36,
        "isTaxable": true,
        "notionalTaxDeducted": 0,
        "taxDeducted": 52.87,
        "niDeducted": 11.80,
        "netEntitlement": 199.69,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 199.69,
        "isSelected": true
      },
      {
        "weekNumber": 3,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 264.36,
        "isTaxable": true,
        "notionalTaxDeducted": 0,
        "taxDeducted": 52.87,
        "niDeducted": 11.80,
        "netEntitlement": 199.69,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 199.69,
        "isSelected": true
      },
      {
        "weekNumber": 4,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 264.36,
        "isTaxable": true,
        "notionalTaxDeducted": 0,
        "taxDeducted": 52.87,
        "niDeducted": 11.80,
        "netEntitlement": 199.69,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 199.69,
        "isSelected": true
      },
      {
        "weekNumber": 5,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 264.36,
        "isTaxable": true,
        "notionalTaxDeducted": 0,
        "taxDeducted": 52.87,
        "niDeducted": 11.80,
        "netEntitlement": 199.69,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 199.69,
        "isSelected": true
      },
      {
        "weekNumber": 6,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 264.36,
        "isTaxable": true,
        "notionalTaxDeducted": 0,
        "taxDeducted": 52.87,
        "niDeducted": 11.80,
        "netEntitlement": 199.69,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 199.69,
        "isSelected": true
      },
      {
        "weekNumber": 7,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 264.36,
        "isTaxable": true,
        "notionalTaxDeducted": 0,
        "taxDeducted": 52.87,
        "niDeducted": 11.80,
        "netEntitlement": 199.69,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 199.69,
        "isSelected": true
      },
      {
        "weekNumber": 8,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 264.36,
        "isTaxable": true,
        "notionalTaxDeducted": 0,
        "taxDeducted": 52.87,
        "niDeducted": 11.80,
        "netEntitlement": 199.69,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 199.69,
        "isSelected": true
      },
      {
        "weekNumber": 9,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 264.36,
        "isTaxable": true,
        "notionalTaxDeducted": 0,
        "taxDeducted": 52.87,
        "niDeducted": 11.80,
        "netEntitlement": 199.69,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 199.69,
        "isSelected": true
      },
      {
        "weekNumber": 10,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 264.36,
        "isTaxable": true,
        "notionalTaxDeducted": 0,
        "taxDeducted": 52.87,
        "niDeducted": 11.80,
        "netEntitlement": 199.69,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 199.69,
        "isSelected": true
      },
      {
        "weekNumber": 11,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 264.36,
        "isTaxable": true,
        "notionalTaxDeducted": 0,
        "taxDeducted": 52.87,
        "niDeducted": 11.80,
        "netEntitlement": 199.69,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 199.69,
        "isSelected": true
      },
      {
        "weekNumber": 12,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 264.36,
        "isTaxable": true,
        "notionalTaxDeducted": 0,
        "taxDeducted": 52.87,
        "niDeducted": 11.80,
        "netEntitlement": 199.69,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 199.69,
        "isSelected": true
      }
    ]
  }
}
"""

@AutomationTest
Scenario: CNP Post 2018 Tax and NI Set to False
# Test includes payload for Compensatory Notice of Pay only
# Tests that tax and ni are not charged when set to false post April 2018 
	When I post to the Notice endpoint with:
"""
{
  "cnp": {
    "insolvencyEmploymentStartDate": "2005-03-28T09:00:41.920Z",
    "insolvencyDate": "2018-04-07T09:00:41.920Z",
    "dismissalDate": "2018-04-06T09:00:41.920Z",
    "dateNoticeGiven": "2018-04-06T09:00:41.920Z",
    "weeklyWage": 337.50,
    "shiftPattern": ["1","2","3","4","5"],
          "isTaxable": false,
    "dateOfBirth": "1957-04-29T09:00:41.920Z",
    "deceasedDate": ""
  }
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "nwnp": {
    "selectedInputSource": null,
    "rp1Results": {
      "inputSource": null,
      "statutoryMax": 0,
      "weeklyResult": []
    },
    "rp14aResults": {
      "inputSource": null,
      "statutoryMax": 0,
      "weeklyResult": []
    }
  },
  "cnp": {
    "noticeWeeksDue": 12,
    "statutoryMax": 508,
    "maxCNPEntitlement": 4050,
    "noticeStartDate": "2018-04-07T00:00:00Z",
    "projectedNoticeDate": "2018-06-29T00:00:00Z",
    "compensationEndDate": "2018-06-29T00:00:00Z",
    "daysInClaim": 60,
    "weeklyResults": [
      {
        "weekNumber": 1,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 337.5,
        "isTaxable": true,
        "notionalTaxDeducted": 0,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 337.5,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 337.5,
        "isSelected": true
      },
      {
        "weekNumber": 2,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 264.36,
        "isTaxable": true,
        "notionalTaxDeducted": 0,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 264.36,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 264.36,
        "isSelected": true
      },
      {
        "weekNumber": 3,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 264.36,
        "isTaxable": true,
        "notionalTaxDeducted": 0,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 264.36,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 264.36,
        "isSelected": true
      },
      {
        "weekNumber": 4,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 264.36,
        "isTaxable": true,
        "notionalTaxDeducted": 0,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 264.36,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 264.36,
        "isSelected": true
      },
      {
        "weekNumber": 5,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 264.36,
        "isTaxable": true,
        "notionalTaxDeducted": 0,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 264.36,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 264.36,
        "isSelected": true
      },
      {
        "weekNumber": 6,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 264.36,
        "isTaxable": true,
        "notionalTaxDeducted": 0,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 264.36,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 264.36,
        "isSelected": true
      },
      {
        "weekNumber": 7,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 264.36,
        "isTaxable": true,
        "notionalTaxDeducted": 0,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 264.36,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 264.36,
        "isSelected": true
      },
      {
        "weekNumber": 8,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 264.36,
        "isTaxable": true,
        "notionalTaxDeducted": 0,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 264.36,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 264.36,
        "isSelected": true
      },
      {
        "weekNumber": 9,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 264.36,
        "isTaxable": true,
        "notionalTaxDeducted": 0,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 264.36,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 264.36,
        "isSelected": true
      },
      {
        "weekNumber": 10,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 264.36,
        "isTaxable": true,
        "notionalTaxDeducted": 0,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 264.36,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 264.36,
        "isSelected": true
      },
      {
        "weekNumber": 11,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 264.36,
        "isTaxable": true,
        "notionalTaxDeducted": 0,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 264.36,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 264.36,
        "isSelected": true
      },
      {
        "weekNumber": 12,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 264.36,
        "isTaxable": true,
        "notionalTaxDeducted": 0,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 264.36,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 264.36,
        "isSelected": true
      }
    ]
  }
}
"""

@AutomationTest
Scenario: Composite Dismissed During Notice
# Test includes payload for both Notice Worked Not Paid and Compensatory Notice of Pay
# Tests that when the Dismissal is in the middle of the week that correct amount of weeks are calculated
	When I post to the Notice endpoint with:
"""
{
  "nwnp": [
    {
      "inputSource": "rp1",
      "employmentStartDate": "1978-04-01T09:00:41.919Z",
      "insolvencyDate": "2018-03-07T09:00:41.919Z",
      "dismissalDate": "2018-03-07T09:00:41.920Z",
      "dateNoticeGiven": "2018-02-03T09:00:41.920Z",
      "unpaidPeriodFrom": "2018-02-03T09:00:41.920Z",
      "unpaidPeriodTo": "2018-03-07T09:00:41.920Z",
      "weeklyWage": 337.50,
      "shiftPattern": ["1","2","3","4","5"],
              "payDay": 6,
      "isTaxable": true
    },{
      "inputSource": "rp14a",
      "employmentStartDate": "1978-04-01T09:00:41.919Z",
      "insolvencyDate": "2018-03-07T09:00:41.919Z",
      "dismissalDate": "2018-03-07T09:00:41.920Z",
      "dateNoticeGiven": "2018-02-03T09:00:41.920Z",
      "unpaidPeriodFrom": "2018-02-03T09:00:41.920Z",
      "unpaidPeriodTo": "2018-03-07T09:00:41.920Z",
      "weeklyWage": 347.50,
      "shiftPattern": ["1","2","3","4","5"],
              "payDay": 6,
      "isTaxable": true
    }

  ],
  "cnp": {
    "insolvencyEmploymentStartDate": "1978-04-01T09:00:41.920Z",
    "insolvencyDate": "2018-03-07T09:00:41.920Z",
    "dismissalDate": "2018-03-07T09:00:41.920Z",
    "dateNoticeGiven": "2018-02-03T09:00:41.920Z",
    "weeklyWage": 337.50,
    "shiftPattern": ["1","2","3","4","5"],
          "isTaxable": true,
    "dateOfBirth": "1957-04-29T09:00:41.920Z",
    "deceasedDate": ""
  }
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "nwnp": {
    "selectedInputSource": "rp1",
    "rp1Results": {
      "inputSource": "rp1",
      "statutoryMax": 489,
      "weeklyResult": [
        {
          "weekNumber": 1,
          "payDate": "2018-02-10T00:00:00Z",
          "maximumEntitlement": 489,
          "employerEntitlement": 337.5,
          "grossEntitlement": 337.5,
          "isTaxable": true,
          "taxDeducted": 67.5,
          "niDeducted": 20.58,
          "netEntitlement": 249.42,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 489,
          "employerEntitlementIn4MonthPeriod": 337.5,
          "grossEntitlementIn4Months": 337.5,
          "isSelected": true
        },
        {
          "weekNumber": 2,
          "payDate": "2018-02-17T00:00:00Z",
          "maximumEntitlement": 489,
          "employerEntitlement": 337.5,
          "grossEntitlement": 337.5,
          "isTaxable": true,
          "taxDeducted": 67.5,
          "niDeducted": 20.58,
          "netEntitlement": 249.42,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 489,
          "employerEntitlementIn4MonthPeriod": 337.5,
          "grossEntitlementIn4Months": 337.5,
          "isSelected": true
        },
        {
          "weekNumber": 3,
          "payDate": "2018-02-24T00:00:00Z",
          "maximumEntitlement": 489,
          "employerEntitlement": 337.5,
          "grossEntitlement": 337.5,
          "isTaxable": true,
          "taxDeducted": 67.5,
          "niDeducted": 20.58,
          "netEntitlement": 249.42,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 489,
          "employerEntitlementIn4MonthPeriod": 337.5,
          "grossEntitlementIn4Months": 337.5,
          "isSelected": true
        },
        {
          "weekNumber": 4,
          "payDate": "2018-03-03T00:00:00Z",
          "maximumEntitlement": 489,
          "employerEntitlement": 337.5,
          "grossEntitlement": 337.5,
          "isTaxable": true,
          "taxDeducted": 67.5,
          "niDeducted": 20.58,
          "netEntitlement": 249.42,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 489,
          "employerEntitlementIn4MonthPeriod": 337.5,
          "grossEntitlementIn4Months": 337.5,
          "isSelected": true
        },
        {
          "weekNumber": 5,
          "payDate": "2018-03-10T00:00:00Z",
          "maximumEntitlement": 279.43,
          "employerEntitlement": 202.5,
          "grossEntitlement": 202.5,
          "isTaxable": true,
          "taxDeducted": 40.5,
          "niDeducted": 4.38,
          "netEntitlement": 157.62,
          "maximumDays": 4,
          "employmentDays": 3,
          "maximumEntitlementIn4MonthPeriod": 279.43,
          "employerEntitlementIn4MonthPeriod": 202.5,
          "grossEntitlementIn4Months": 202.5,
          "isSelected": true
        }
      ]
    },
    "rp14aResults": {
      "inputSource": "rp14a",
      "statutoryMax": 489,
      "weeklyResult": [
        {
          "weekNumber": 1,
          "payDate": "2018-02-10T00:00:00Z",
          "maximumEntitlement": 489,
          "employerEntitlement": 347.5,
          "grossEntitlement": 347.5,
          "isTaxable": true,
          "taxDeducted": 69.5,
          "niDeducted": 21.78,
          "netEntitlement": 256.22,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 489,
          "employerEntitlementIn4MonthPeriod": 347.5,
          "grossEntitlementIn4Months": 347.5,
          "isSelected": false
        },
        {
          "weekNumber": 2,
          "payDate": "2018-02-17T00:00:00Z",
          "maximumEntitlement": 489,
          "employerEntitlement": 347.5,
          "grossEntitlement": 347.5,
          "isTaxable": true,
          "taxDeducted": 69.5,
          "niDeducted": 21.78,
          "netEntitlement": 256.22,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 489,
          "employerEntitlementIn4MonthPeriod": 347.5,
          "grossEntitlementIn4Months": 347.5,
          "isSelected": false
        },
        {
          "weekNumber": 3,
          "payDate": "2018-02-24T00:00:00Z",
          "maximumEntitlement": 489,
          "employerEntitlement": 347.5,
          "grossEntitlement": 347.5,
          "isTaxable": true,
          "taxDeducted": 69.5,
          "niDeducted": 21.78,
          "netEntitlement": 256.22,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 489,
          "employerEntitlementIn4MonthPeriod": 347.5,
          "grossEntitlementIn4Months": 347.5,
          "isSelected": false
        },
        {
          "weekNumber": 4,
          "payDate": "2018-03-03T00:00:00Z",
          "maximumEntitlement": 489,
          "employerEntitlement": 347.5,
          "grossEntitlement": 347.5,
          "isTaxable": true,
          "taxDeducted": 69.5,
          "niDeducted": 21.78,
          "netEntitlement": 256.22,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 489,
          "employerEntitlementIn4MonthPeriod": 347.5,
          "grossEntitlementIn4Months": 347.5,
          "isSelected": false
        },
        {
          "weekNumber": 5,
          "payDate": "2018-03-10T00:00:00Z",
          "maximumEntitlement": 279.43,
          "employerEntitlement": 208.5,
          "grossEntitlement": 208.5,
          "isTaxable": true,
          "taxDeducted": 41.7,
          "niDeducted": 5.10,
          "netEntitlement": 161.70,
          "maximumDays": 4,
          "employmentDays": 3,
          "maximumEntitlementIn4MonthPeriod": 279.43,
          "employerEntitlementIn4MonthPeriod": 208.5,
          "grossEntitlementIn4Months": 208.5,
          "isSelected": false
        }
      ]
    }
  },
  "cnp": {
    "noticeWeeksDue": 8,
    "statutoryMax": 489,
    "maxCNPEntitlement": 2700,
    "noticeStartDate": "2018-02-04T00:00:00Z",
    "projectedNoticeDate": "2018-04-28T00:00:00Z",
    "compensationEndDate": "2018-04-28T00:00:00Z",
    "daysInClaim": 37,
    "weeklyResults": [
      {
        "weekNumber": 1,
        "employerEntitlement": 135,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 108,
        "isTaxable": false,
        "notionalTaxDeducted": 27,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 108,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 108,
        "isSelected": true
      },
      {
        "weekNumber": 2,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 31.35,
        "grossEntitlement": 244.92,
        "isTaxable": false,
        "notionalTaxDeducted": 61.23,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 244.92,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 244.92,
        "isSelected": true
      },
      {
        "weekNumber": 3,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 211.49,
        "isTaxable": false,
        "notionalTaxDeducted": 52.87,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 211.49,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 211.49,
        "isSelected": true
      },
      {
        "weekNumber": 4,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 211.49,
        "isTaxable": false,
        "notionalTaxDeducted": 52.87,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 211.49,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 211.49,
        "isSelected": true
      },
      {
        "weekNumber": 5,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 211.49,
        "isTaxable": false,
        "notionalTaxDeducted": 52.87,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 211.49,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 211.49,
        "isSelected": true
      },
      {
        "weekNumber": 6,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 211.49,
        "isTaxable": false,
        "notionalTaxDeducted": 52.87,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 211.49,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 211.49,
        "isSelected": true
      },
      {
        "weekNumber": 7,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 211.49,
        "isTaxable": false,
        "notionalTaxDeducted": 52.87,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 211.49,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 211.49,
        "isSelected": true
      },
      {
        "weekNumber": 8,
        "employerEntitlement": 337.5,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 211.49,
        "isTaxable": false,
        "notionalTaxDeducted": 52.87,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 211.49,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 211.49,
        "isSelected": true
      }
    ]
  }
}
"""

@AutomationTest
Scenario: CNP Pre 2018 Wage Above Statutory Maximum
# Test includes payload for Compensatory Notice of Pay only
# Tests that when an employee's wage with mitigations and notional tax applied is above the statutory maximum that the output is capped at the stat max for the first week
# Tests that when an employee's wage with mitigations and notional tax applied is below the statutory maximum that the output is caluclated at the rates supplied for the other weeks
	When I post to the Notice endpoint with:
"""
{
  "cnp": {
    "insolvencyEmploymentStartDate": "2005-03-28T09:00:41.920Z",
    "insolvencyDate": "2018-03-29T09:00:41.920Z",
    "dismissalDate": "2018-03-28T09:00:41.920Z",
    "dateNoticeGiven": "2018-03-28T09:00:41.920Z",
    "weeklyWage": 612,
    "shiftPattern": ["1","2","3","4","5"],
          "isTaxable": true,
    "dateOfBirth": "1957-04-29T09:00:41.920Z",
    "deceasedDate": ""
  }
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "nwnp": {
    "selectedInputSource": null,
    "rp1Results": {
      "inputSource": null,
      "statutoryMax": 0,
      "weeklyResult": []
    },
    "rp14aResults": {
      "inputSource": null,
      "statutoryMax": 0,
      "weeklyResult": []
    }
  },
  "cnp": {
    "noticeWeeksDue": 12,
    "statutoryMax": 489,
    "maxCNPEntitlement": 5868,
    "noticeStartDate": "2018-03-29T00:00:00Z",
    "projectedNoticeDate": "2018-06-20T00:00:00Z",
    "compensationEndDate": "2018-06-20T00:00:00Z",
    "daysInClaim": 60,
    "weeklyResults": [
      {
        "weekNumber": 1,
        "employerEntitlement": 612,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 489,
        "isTaxable": false,
        "notionalTaxDeducted": 122.4,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 489,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 489,
        "isSelected": true
      },
      {
        "weekNumber": 2,
        "employerEntitlement": 612,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 431.09,
        "isTaxable": false,
        "notionalTaxDeducted": 107.77,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 431.09,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 431.09,
        "isSelected": true
      },
      {
        "weekNumber": 3,
        "employerEntitlement": 612,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 431.09,
        "isTaxable": false,
        "notionalTaxDeducted": 107.77,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 431.09,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 431.09,
        "isSelected": true
      },
      {
        "weekNumber": 4,
        "employerEntitlement": 612,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 431.09,
        "isTaxable": false,
        "notionalTaxDeducted": 107.77,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 431.09,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 431.09,
        "isSelected": true
      },
      {
        "weekNumber": 5,
        "employerEntitlement": 612,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 431.09,
        "isTaxable": false,
        "notionalTaxDeducted": 107.77,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 431.09,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 431.09,
        "isSelected": true
      },
      {
        "weekNumber": 6,
        "employerEntitlement": 612,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 431.09,
        "isTaxable": false,
        "notionalTaxDeducted": 107.77,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 431.09,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 431.09,
        "isSelected": true
      },
      {
        "weekNumber": 7,
        "employerEntitlement": 612,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 431.09,
        "isTaxable": false,
        "notionalTaxDeducted": 107.77,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 431.09,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 431.09,
        "isSelected": true
      },
      {
        "weekNumber": 8,
        "employerEntitlement": 612,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 431.09,
        "isTaxable": false,
        "notionalTaxDeducted": 107.77,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 431.09,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 431.09,
        "isSelected": true
      },
      {
        "weekNumber": 9,
        "employerEntitlement": 612,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 431.09,
        "isTaxable": false,
        "notionalTaxDeducted": 107.77,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 431.09,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 431.09,
        "isSelected": true
      },
      {
        "weekNumber": 10,
        "employerEntitlement": 612,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 431.09,
        "isTaxable": false,
        "notionalTaxDeducted": 107.77,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 431.09,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 431.09,
        "isSelected": true
      },
      {
        "weekNumber": 11,
        "employerEntitlement": 612,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 431.09,
        "isTaxable": false,
        "notionalTaxDeducted": 107.77,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 431.09,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 431.09,
        "isSelected": true
      },
      {
        "weekNumber": 12,
        "employerEntitlement": 612,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 431.09,
        "isTaxable": false,
        "notionalTaxDeducted": 107.77,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 431.09,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 431.09,
        "isSelected": true
      }
    ]
  }
}
"""

@AutomationTest
Scenario: CNP Post 2018 Wage Above Statutory Maximum
# Test includes payload for Compensatory Notice of Pay only
# Tests that when an employee's wage with mitigations applied is above the statutory maximum that the output is capped at the stat max for the first week
# Tests that when an employee's wage with mitigations applied is below the statutory maximum that the output is caluclated at the rates supplied for the other weeks
	When I post to the Notice endpoint with:
"""
{
  "cnp": {
    "insolvencyEmploymentStartDate": "2005-03-28T09:00:41.920Z",
    "insolvencyDate": "2018-04-07T09:00:41.920Z",
    "dismissalDate": "2018-04-06T09:00:41.920Z",
    "dateNoticeGiven": "2018-04-06T09:00:41.920Z",
    "weeklyWage": 520,
    "shiftPattern": ["1","2","3","4","5"],
          "isTaxable": true,
    "dateOfBirth": "1957-04-29T09:00:41.920Z",
    "deceasedDate": ""
  }
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "nwnp": {
    "selectedInputSource": null,
    "rp1Results": {
      "inputSource": null,
      "statutoryMax": 0,
      "weeklyResult": []
    },
    "rp14aResults": {
      "inputSource": null,
      "statutoryMax": 0,
      "weeklyResult": []
    }
  },
  "cnp": {
    "noticeWeeksDue": 12,
    "statutoryMax": 508,
    "maxCNPEntitlement": 6096,
    "noticeStartDate": "2018-04-07T00:00:00Z",
    "projectedNoticeDate": "2018-06-29T00:00:00Z",
    "compensationEndDate": "2018-06-29T00:00:00Z",
    "daysInClaim": 60,
    "weeklyResults": [
      {
        "weekNumber": 1,
        "employerEntitlement": 520,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 508,
        "isTaxable": true,
        "notionalTaxDeducted": 0,
        "taxDeducted": 101.6,
        "niDeducted": 41.04,
        "netEntitlement": 365.36,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 365.36,
        "isSelected": true
      },
      {
        "weekNumber": 2,
        "employerEntitlement": 520,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 446.86,
        "isTaxable": true,
        "notionalTaxDeducted": 0,
        "taxDeducted": 89.37,
        "niDeducted": 33.70,
        "netEntitlement": 323.79,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 323.79,
        "isSelected": true
      },
      {
        "weekNumber": 3,
        "employerEntitlement": 520,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 446.86,
        "isTaxable": true,
        "notionalTaxDeducted": 0,
        "taxDeducted": 89.37,
        "niDeducted": 33.70,
        "netEntitlement": 323.79,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 323.79,
        "isSelected": true
      },
      {
        "weekNumber": 4,
        "employerEntitlement": 520,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 446.86,
        "isTaxable": true,
        "notionalTaxDeducted": 0,
        "taxDeducted": 89.37,
        "niDeducted": 33.70,
        "netEntitlement": 323.79,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 323.79,
        "isSelected": true
      },
      {
        "weekNumber": 5,
        "employerEntitlement": 520,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 446.86,
        "isTaxable": true,
        "notionalTaxDeducted": 0,
        "taxDeducted": 89.37,
        "niDeducted": 33.70,
        "netEntitlement": 323.79,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 323.79,
        "isSelected": true
      },
      {
        "weekNumber": 6,
        "employerEntitlement": 520,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 446.86,
        "isTaxable": true,
        "notionalTaxDeducted": 0,
        "taxDeducted": 89.37,
        "niDeducted": 33.70,
        "netEntitlement": 323.79,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 323.79,
        "isSelected": true
      },
      {
        "weekNumber": 7,
        "employerEntitlement": 520,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 446.86,
        "isTaxable": true,
        "notionalTaxDeducted": 0,
        "taxDeducted": 89.37,
        "niDeducted": 33.70,
        "netEntitlement": 323.79,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 323.79,
        "isSelected": true
      },
      {
        "weekNumber": 8,
        "employerEntitlement": 520,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 446.86,
        "isTaxable": true,
        "notionalTaxDeducted": 0,
        "taxDeducted": 89.37,
        "niDeducted": 33.70,
        "netEntitlement": 323.79,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 323.79,
        "isSelected": true
      },
      {
        "weekNumber": 9,
        "employerEntitlement": 520,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 446.86,
        "isTaxable": true,
        "notionalTaxDeducted": 0,
        "taxDeducted": 89.37,
        "niDeducted": 33.70,
        "netEntitlement": 323.79,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 323.79,
        "isSelected": true
      },
      {
        "weekNumber": 10,
        "employerEntitlement": 520,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 446.86,
        "isTaxable": true,
        "notionalTaxDeducted": 0,
        "taxDeducted": 89.37,
        "niDeducted": 33.70,
        "netEntitlement": 323.79,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 323.79,
        "isSelected": true
      },
      {
        "weekNumber": 11,
        "employerEntitlement": 520,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 446.86,
        "isTaxable": true,
        "notionalTaxDeducted": 0,
        "taxDeducted": 89.37,
        "niDeducted": 33.70,
        "netEntitlement": 323.79,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 323.79,
        "isSelected": true
      },
      {
        "weekNumber": 12,
        "employerEntitlement": 520,
        "benefitsDeducted": 0,
        "newEmploymentDeducted": 0,
        "wageIncreaseDeducted": 0,
        "notionalBenefitDeducted": 73.14,
        "grossEntitlement": 446.86,
        "isTaxable": true,
        "notionalTaxDeducted": 0,
        "taxDeducted": 89.37,
        "niDeducted": 33.70,
        "netEntitlement": 323.79,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 323.79,
        "isSelected": true
      }
    ]
  }
}
"""

@AutomationTest
Scenario: NWNP 1 Month Service
# Test includes payload for Notice Worked Not Paid only
# Tests that when an employee was employed for a month they are awarded 1 week of NWNP
	When I post to the Notice endpoint with:
"""
{
  "nwnp": [
    {
      "inputSource": "rp1",
      "employmentStartDate": "2018-04-04T09:00:41.919Z",
      "insolvencyDate": "2018-05-04T09:00:41.919Z",
      "dismissalDate": "2018-05-04T09:00:41.920Z",
      "dateNoticeGiven": "2018-04-04T09:00:41.920Z",
      "unpaidPeriodFrom": "2018-04-04T09:00:41.920Z",
      "unpaidPeriodTo": "2018-05-04T09:00:41.920Z",
      "weeklyWage": 500.00,
      "shiftPattern": ["1","2","3","4","5"],
              "payDay": 5,
      "isTaxable": true
    },{
      "inputSource": "rp14a",
      "employmentStartDate": "2018-04-04T09:00:41.919Z",
      "insolvencyDate": "2018-05-04T09:00:41.919Z",
      "dismissalDate": "2018-05-04T09:00:41.920Z",
      "dateNoticeGiven": "2018-04-04T09:00:41.920Z",
      "unpaidPeriodFrom": "2018-04-04T09:00:41.920Z",
      "unpaidPeriodTo": "2018-05-04T09:00:41.920Z",
      "weeklyWage": 508.01,
      "shiftPattern": ["1","2","3","4","5"],
              "payDay": 5,
      "isTaxable": true
    }
  ]
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "nwnp": {
    "selectedInputSource": "rp1",
    "rp1Results": {
      "inputSource": "rp1",
      "statutoryMax": 508,
      "weeklyResult": [
        {
          "weekNumber": 1,
          "payDate": "2018-04-11T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": true
        }
      ]
    },
    "rp14aResults": {
      "inputSource": "rp14a",
      "statutoryMax": 508,
      "weeklyResult": [
        {
          "weekNumber": 1,
          "payDate": "2018-04-11T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 508.01,
          "grossEntitlement": 508.00,
          "isTaxable": true,
          "taxDeducted": 101.60,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 508.01,
          "grossEntitlementIn4Months": 508.00,
          "isSelected": false
        }
      ]
    }
  },
  "cnp": {
    "noticeWeeksDue": 0,
    "statutoryMax": 0,
    "maxCNPEntitlement": 0,
    "noticeStartDate": "0001-01-01T00:00:00",
    "projectedNoticeDate": "0001-01-01T00:00:00",
    "compensationEndDate": "0001-01-01T00:00:00",
    "daysInClaim": 0,
    "weeklyResults": []
  }
}
"""

@AutomationTest
Scenario: NWNP Less Than 1 Month Service
# Test includes payload for Notice Worked Not Paid only
# Tests that when an employee was employed for less than a month they are not awarded NWNP
	When I post to the Notice endpoint with:
"""
{
  "nwnp": [
    {
      "inputSource": "rp1",
      "employmentStartDate": "2018-04-05T09:00:41.919Z",
      "insolvencyDate": "2018-05-04T09:00:41.919Z",
      "dismissalDate": "2018-05-04T09:00:41.920Z",
      "dateNoticeGiven": "2018-04-05T09:00:41.920Z",
      "unpaidPeriodFrom": "2018-04-05T09:00:41.920Z",
      "unpaidPeriodTo": "2018-05-04T09:00:41.920Z",
      "weeklyWage": 500.00,
      "shiftPattern": ["1","2","3","4","5"],
              "payDay": 5,
      "isTaxable": true
    },{
      "inputSource": "rp14a",
      "employmentStartDate": "2018-04-05T09:00:41.919Z",
      "insolvencyDate": "2018-05-04T09:00:41.919Z",
      "dismissalDate": "2018-05-04T09:00:41.920Z",
      "dateNoticeGiven": "2018-04-05T09:00:41.920Z",
      "unpaidPeriodFrom": "2018-04-05T09:00:41.920Z",
      "unpaidPeriodTo": "2018-05-04T09:00:41.920Z",
      "weeklyWage": 508.01,
      "shiftPattern": ["1","2","3","4","5"],
              "payDay": 5,
      "isTaxable": true
    }
  ]
}
"""
	Then I get a response with status code "400"
	And the response contains "'Dismissal Date' must be at least 1 calendar month after the Employment Start Date"

@AutomationTest
Scenario: CNP Less than 1 Month Service
# Test includes payload for Compensatory Notice of Pay only
# Tests that when an employee was employed for less than a month they are not awarded CNP
	When I post to the Notice endpoint with:
"""
{
  "cnp": {
    "insolvencyEmploymentStartDate": "2018-03-01T09:00:41.920Z",
    "insolvencyDate": "2018-03-29T09:00:41.920Z",
    "dismissalDate": "2018-03-28T09:00:41.920Z",
    "dateNoticeGiven": "2018-03-28T09:00:41.920Z",
    "weeklyWage": 337.50,
    "shiftPattern": ["1","2","3","4","5"],
          "isTaxable": true,
    "dateOfBirth": "1957-04-29T09:00:41.920Z",
    "deceasedDate": ""
  }
}

"""
	Then I get a response with status code "400"
	And the response contains "'Dismissal Date' must be at least 1 calendar month after the Insolvency Employment Start Date"

@AutomationTest
Scenario: NWNP RP1 Data Only
# Test includes payload for Notice Worked Not Paid only
# Tests that when rp1 data is provided alone then the calculation will calculate
	When I post to the Notice endpoint with:
"""
{
  "nwnp": [
    {
      "inputSource": "rp1",
      "employmentStartDate": "2018-04-04T09:00:41.919Z",
      "insolvencyDate": "2018-05-04T09:00:41.919Z",
      "dismissalDate": "2018-05-04T09:00:41.920Z",
      "dateNoticeGiven": "2018-04-04T09:00:41.920Z",
      "unpaidPeriodFrom": "2018-04-04T09:00:41.920Z",
      "unpaidPeriodTo": "2018-05-04T09:00:41.920Z",
      "weeklyWage": 500.00,
      "shiftPattern": ["1","2","3","4","5"],
              "payDay": 5,
      "isTaxable": true
    }
  ]
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "nwnp": {
    "selectedInputSource": "rp1",
    "rp1Results": {
      "inputSource": "rp1",
      "statutoryMax": 508,
      "weeklyResult": [
        {
          "weekNumber": 1,
          "payDate": "2018-04-11T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": true
        }
      ]
    },
    "rp14aResults": {
      "inputSource": "rp14a",
      "statutoryMax": 508,
      "weeklyResult": [
      ]
    }
  },
  "cnp": {
    "noticeWeeksDue": 0,
    "statutoryMax": 0,
    "maxCNPEntitlement": 0,
    "noticeStartDate": "0001-01-01T00:00:00",
    "projectedNoticeDate": "0001-01-01T00:00:00",
    "compensationEndDate": "0001-01-01T00:00:00",
    "daysInClaim": 0,
    "weeklyResults": []
  }
}
"""

@AutomationTest
Scenario: NWNP RP14a Data Only
# Test includes payload for Notice Worked Not Paid only
# Tests that when rp14a data is provided alone then the calculation will calculate
	When I post to the Notice endpoint with:
"""
{
 "rp1NotRequired": true,
  "nwnp": [
    {
      "inputSource": "rp14a",
      "employmentStartDate": "2018-04-04T09:00:41.919Z",
      "insolvencyDate": "2018-05-04T09:00:41.919Z",
      "dismissalDate": "2018-05-04T09:00:41.920Z",
      "dateNoticeGiven": "2018-04-04T09:00:41.920Z",
      "unpaidPeriodFrom": "2018-04-04T09:00:41.920Z",
      "unpaidPeriodTo": "2018-05-04T09:00:41.920Z",
      "weeklyWage": 500.00,
      "shiftPattern": ["1","2","3","4","5"],
              "payDay": 5,
      "isTaxable": true
    }
  ]
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "nwnp": {
    "selectedInputSource": "rp14a",
    "rp1Results": {
      "inputSource": "rp1",
      "statutoryMax": 508,
      "weeklyResult": []
    },
    "rp14aResults": {
      "inputSource": "rp14a",
      "statutoryMax": 508,
      "weeklyResult": [
        {
          "weekNumber": 1,
          "payDate": "2018-04-11T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 500,
          "grossEntitlement": 500,
          "isTaxable": true,
          "taxDeducted": 100,
          "niDeducted": 40.08,
          "netEntitlement": 359.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 500,
          "grossEntitlementIn4Months": 500,
          "isSelected": true
        }
      ]
    }
  },
  "cnp": {
    "noticeWeeksDue": 0,
    "statutoryMax": 0,
    "maxCNPEntitlement": 0,
    "noticeStartDate": "0001-01-01T00:00:00",
    "projectedNoticeDate": "0001-01-01T00:00:00",
    "compensationEndDate": "0001-01-01T00:00:00",
    "daysInClaim": 0,
    "weeklyResults": []
  }
}
"""

@AutomationTest
Scenario: NWNP RP14a Data RP1 Required
# Test includes payload for Notice Worked Not Paid only
# Tests that when rp1 data is provided alone then the calculation will calculate
	When I post to the Notice endpoint with:
"""
{
  "nwnp": [
    {
      "inputSource": "rp14a",
      "employmentStartDate": "2018-04-04T09:00:41.919Z",
      "insolvencyDate": "2018-05-04T09:00:41.919Z",
      "dismissalDate": "2018-05-04T09:00:41.920Z",
      "dateNoticeGiven": "2018-04-04T09:00:41.920Z",
      "unpaidPeriodFrom": "2018-04-04T09:00:41.920Z",
      "unpaidPeriodTo": "2018-05-04T09:00:41.920Z",
      "weeklyWage": 500.00,
      "shiftPattern": ["1","2","3","4","5"],
      "payDay": 5,
      "isTaxable": true
    }
  ]
}
"""
	Then I get a response with status code "400"
	And the response contains "Notice Worked Not Paid RP1 data has not been provided"

@AutomationTest
Scenario: CNP Mitigations with no End Date
# Test includes payload for Compensatory Notice of Pay only
# Tests that when no end date is set in the mitigations then the calculation will still calculate
	When I post to the Notice endpoint with:
"""
{
  "cnp": {
    "insolvencyEmploymentStartDate": "2005-03-28T09:00:41.920Z",
    "insolvencyDate": "2018-03-29T09:00:41.920Z",
    "dismissalDate": "2018-03-28T09:00:41.920Z",
    "dateNoticeGiven": "2018-03-28T09:00:41.920Z",
    "weeklyWage": 400,
    "shiftPattern": ["1","2","3","4","5"],
          "isTaxable": true,
    "dateOfBirth": "1957-03-28T09:00:41.920Z",
    "deceasedDate": "",
	"benefits": [
	  {
		"benefitStartDate": "2018-03-29T09:00:41.920Z",
		"benefitAmount": 1200
	  },
	],
	"newEmployments": [
	  {
		"newEmploymentStartDate": "2018-03-29T09:00:41.920Z",
		"newEmploymentWage": 1200,
		"newEmploymentWeeklyWage": 100
	   }
	],
	"wageIncreases": [
	  {
		"wageIncreaseStartDate": "2018-03-29T09:00:41.920Z",
		"WageIncreaseAmount": 1200
	   }
	]
  }
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "nwnp": {
    "selectedInputSource": null,
    "rp1Results": {
      "inputSource": null,
      "statutoryMax": 0,
      "weeklyResult": []
    },
    "rp14aResults": {
      "inputSource": null,
      "statutoryMax": 0,
      "weeklyResult": []
    }
  },
  "cnp": {
    "noticeWeeksDue": 12,
    "statutoryMax": 489,
    "maxCNPEntitlement": 4800,
    "noticeStartDate": "2018-03-29T00:00:00Z",
    "projectedNoticeDate": "2018-06-20T00:00:00Z",
    "compensationEndDate": "2018-06-20T00:00:00Z",
    "daysInClaim": 60,
    "weeklyResults": [
      {
        "weekNumber": 1,
        "employerEntitlement": 400,
        "benefitsDeducted": 100,
        "newEmploymentDeducted": 100,
        "wageIncreaseDeducted": 100,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 80,
        "isTaxable": false,
        "notionalTaxDeducted": 20,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 80,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 80,
        "isSelected": true
      },
      {
        "weekNumber": 2,
        "employerEntitlement": 400,
        "benefitsDeducted": 100,
        "newEmploymentDeducted": 100,
        "wageIncreaseDeducted": 100,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 80,
        "isTaxable": false,
        "notionalTaxDeducted": 20,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 80,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 80,
        "isSelected": true
      },
      {
        "weekNumber": 3,
        "employerEntitlement": 400,
        "benefitsDeducted": 100,
        "newEmploymentDeducted": 100,
        "wageIncreaseDeducted": 100,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 80,
        "isTaxable": false,
        "notionalTaxDeducted": 20,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 80,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 80,
        "isSelected": true
      },
      {
        "weekNumber": 4,
        "employerEntitlement": 400,
        "benefitsDeducted": 100,
        "newEmploymentDeducted": 100,
        "wageIncreaseDeducted": 100,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 80,
        "isTaxable": false,
        "notionalTaxDeducted": 20,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 80,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 80,
        "isSelected": true
      },
      {
        "weekNumber": 5,
        "employerEntitlement": 400,
        "benefitsDeducted": 100,
        "newEmploymentDeducted": 100,
        "wageIncreaseDeducted": 100,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 80,
        "isTaxable": false,
        "notionalTaxDeducted": 20,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 80,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 80,
        "isSelected": true
      },
      {
        "weekNumber": 6,
        "employerEntitlement": 400,
        "benefitsDeducted": 100,
        "newEmploymentDeducted": 100,
        "wageIncreaseDeducted": 100,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 80,
        "isTaxable": false,
        "notionalTaxDeducted": 20,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 80,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 80,
        "isSelected": true
      },
      {
        "weekNumber": 7,
        "employerEntitlement": 400,
        "benefitsDeducted": 100,
        "newEmploymentDeducted": 100,
        "wageIncreaseDeducted": 100,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 80,
        "isTaxable": false,
        "notionalTaxDeducted": 20,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 80,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 80,
        "isSelected": true
      },
      {
        "weekNumber": 8,
        "employerEntitlement": 400,
        "benefitsDeducted": 100,
        "newEmploymentDeducted": 100,
        "wageIncreaseDeducted": 100,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 80,
        "isTaxable": false,
        "notionalTaxDeducted": 20,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 80,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 80,
        "isSelected": true
      },
      {
        "weekNumber": 9,
        "employerEntitlement": 400,
        "benefitsDeducted": 100,
        "newEmploymentDeducted": 100,
        "wageIncreaseDeducted": 100,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 80,
        "isTaxable": false,
        "notionalTaxDeducted": 20,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 80,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 80,
        "isSelected": true
      },
      {
        "weekNumber": 10,
        "employerEntitlement": 400,
        "benefitsDeducted": 100,
        "newEmploymentDeducted": 100,
        "wageIncreaseDeducted": 100,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 80,
        "isTaxable": false,
        "notionalTaxDeducted": 20,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 80,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 80,
        "isSelected": true
      },
      {
        "weekNumber": 11,
        "employerEntitlement": 400,
        "benefitsDeducted": 100,
        "newEmploymentDeducted": 100,
        "wageIncreaseDeducted": 100,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 80,
        "isTaxable": false,
        "notionalTaxDeducted": 20,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 80,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 80,
        "isSelected": true
      },
	  {
        "weekNumber": 12,
        "employerEntitlement": 400,
        "benefitsDeducted": 100,
        "newEmploymentDeducted": 100,
        "wageIncreaseDeducted": 100,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 80,
        "isTaxable": false,
        "notionalTaxDeducted": 20,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 80,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 80,
        "isSelected": true
      }
    ]
  }
}
"""

@AutomationTest
Scenario: CNP New Employement Self Employed
# Test includes payload for Compensatory Notice of Pay only
# Tests that when no end date is set in the mitigations then the calculation will still calculate
	When I post to the Notice endpoint with:
"""
{
  "cnp": {
    "insolvencyEmploymentStartDate": "2005-03-28T09:00:41.920Z",
    "insolvencyDate": "2018-03-29T09:00:41.920Z",
    "dismissalDate": "2018-03-28T09:00:41.920Z",
    "dateNoticeGiven": "2018-03-28T09:00:41.920Z",
    "weeklyWage": 400,
    "shiftPattern": ["1","2","3","4","5"],
          "isTaxable": true,
    "dateOfBirth": "1957-03-28T09:00:41.920Z",
    "deceasedDate": "",
	"benefits": [
	  {
		"benefitStartDate": "2018-03-29T09:00:41.920Z",
		"benefitAmount": 1200
	  },
	],
	"newEmployments": [
	  {
		"newEmploymentStartDate": "2018-03-29T09:00:41.920Z",
		"newEmploymentWage": 1200,
		"newEmploymentWeeklyWage": 0
	   }
	],
	"wageIncreases": [
	  {
		"wageIncreaseStartDate": "2018-03-29T09:00:41.920Z",
		"WageIncreaseAmount": 1200
	   }
	]
  }
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "nwnp": {
    "selectedInputSource": null,
    "rp1Results": {
      "inputSource": null,
      "statutoryMax": 0,
      "weeklyResult": []
    },
    "rp14aResults": {
      "inputSource": null,
      "statutoryMax": 0,
      "weeklyResult": []
    }
  },
  "cnp": {
    "noticeWeeksDue": 12,
    "statutoryMax": 489,
    "maxCNPEntitlement": 4800,
    "noticeStartDate": "2018-03-29T00:00:00Z",
    "projectedNoticeDate": "2018-06-20T00:00:00Z",
    "compensationEndDate": "2018-06-20T00:00:00Z",
    "daysInClaim": 60,
    "weeklyResults": [
      {
        "weekNumber": 1,
        "employerEntitlement": 400,
        "benefitsDeducted": 100,
        "newEmploymentDeducted": 100,
        "wageIncreaseDeducted": 100,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 80,
        "isTaxable": false,
        "notionalTaxDeducted": 20,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 80,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 80,
        "isSelected": true
      },
      {
        "weekNumber": 2,
        "employerEntitlement": 400,
        "benefitsDeducted": 100,
        "newEmploymentDeducted": 100,
        "wageIncreaseDeducted": 100,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 80,
        "isTaxable": false,
        "notionalTaxDeducted": 20,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 80,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 80,
        "isSelected": true
      },
      {
        "weekNumber": 3,
        "employerEntitlement": 400,
        "benefitsDeducted": 100,
        "newEmploymentDeducted": 100,
        "wageIncreaseDeducted": 100,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 80,
        "isTaxable": false,
        "notionalTaxDeducted": 20,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 80,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 80,
        "isSelected": true
      },
      {
        "weekNumber": 4,
        "employerEntitlement": 400,
        "benefitsDeducted": 100,
        "newEmploymentDeducted": 100,
        "wageIncreaseDeducted": 100,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 80,
        "isTaxable": false,
        "notionalTaxDeducted": 20,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 80,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 80,
        "isSelected": true
      },
      {
        "weekNumber": 5,
        "employerEntitlement": 400,
        "benefitsDeducted": 100,
        "newEmploymentDeducted": 100,
        "wageIncreaseDeducted": 100,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 80,
        "isTaxable": false,
        "notionalTaxDeducted": 20,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 80,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 80,
        "isSelected": true
      },
      {
        "weekNumber": 6,
        "employerEntitlement": 400,
        "benefitsDeducted": 100,
        "newEmploymentDeducted": 100,
        "wageIncreaseDeducted": 100,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 80,
        "isTaxable": false,
        "notionalTaxDeducted": 20,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 80,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 80,
        "isSelected": true
      },
      {
        "weekNumber": 7,
        "employerEntitlement": 400,
        "benefitsDeducted": 100,
        "newEmploymentDeducted": 100,
        "wageIncreaseDeducted": 100,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 80,
        "isTaxable": false,
        "notionalTaxDeducted": 20,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 80,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 80,
        "isSelected": true
      },
      {
        "weekNumber": 8,
        "employerEntitlement": 400,
        "benefitsDeducted": 100,
        "newEmploymentDeducted": 100,
        "wageIncreaseDeducted": 100,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 80,
        "isTaxable": false,
        "notionalTaxDeducted": 20,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 80,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 80,
        "isSelected": true
      },
      {
        "weekNumber": 9,
        "employerEntitlement": 400,
        "benefitsDeducted": 100,
        "newEmploymentDeducted": 100,
        "wageIncreaseDeducted": 100,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 80,
        "isTaxable": false,
        "notionalTaxDeducted": 20,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 80,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 80,
        "isSelected": true
      },
      {
        "weekNumber": 10,
        "employerEntitlement": 400,
        "benefitsDeducted": 100,
        "newEmploymentDeducted": 100,
        "wageIncreaseDeducted": 100,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 80,
        "isTaxable": false,
        "notionalTaxDeducted": 20,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 80,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 80,
        "isSelected": true
      },
      {
        "weekNumber": 11,
        "employerEntitlement": 400,
        "benefitsDeducted": 100,
        "newEmploymentDeducted": 100,
        "wageIncreaseDeducted": 100,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 80,
        "isTaxable": false,
        "notionalTaxDeducted": 20,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 80,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 80,
        "isSelected": true
      },
	  {
        "weekNumber": 12,
        "employerEntitlement": 400,
        "benefitsDeducted": 100,
        "newEmploymentDeducted": 100,
        "wageIncreaseDeducted": 100,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 80,
        "isTaxable": false,
        "notionalTaxDeducted": 20,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 80,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 80,
        "isSelected": true
      }
    ]
  }
}
"""

@AutomationTest
Scenario: CNP New Employement Higher Weekly Wage
# Test includes payload for Compensatory Notice of Pay only
# Tests that when no end date is set in the mitigations then the calculation will still calculate
	When I post to the Notice endpoint with:
"""
{
  "cnp": {
    "insolvencyEmploymentStartDate": "2005-03-28T09:00:41.920Z",
    "insolvencyDate": "2018-03-29T09:00:41.920Z",
    "dismissalDate": "2018-03-28T09:00:41.920Z",
    "dateNoticeGiven": "2018-03-28T09:00:41.920Z",
    "weeklyWage": 400,
    "shiftPattern": ["1","2","3","4","5"],
          "isTaxable": true,
    "dateOfBirth": "1957-03-28T09:00:41.920Z",
    "deceasedDate": "",
	"benefits": [
	  {
		"benefitStartDate": "2018-03-29T09:00:41.920Z",
		"benefitAmount": 1200
	  },
	],
	"newEmployments": [
	  {
		"newEmploymentStartDate": "2018-03-29T09:00:41.920Z",
		"newEmploymentWage": 50,
		"newEmploymentWeeklyWage": 100
	   }
	],
	"wageIncreases": [
	  {
		"wageIncreaseStartDate": "2018-03-29T09:00:41.920Z",
		"WageIncreaseAmount": 1200
	   }
	]
  }
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "nwnp": {
    "selectedInputSource": null,
    "rp1Results": {
      "inputSource": null,
      "statutoryMax": 0,
      "weeklyResult": []
    },
    "rp14aResults": {
      "inputSource": null,
      "statutoryMax": 0,
      "weeklyResult": []
    }
  },
  "cnp": {
    "noticeWeeksDue": 12,
    "statutoryMax": 489,
    "maxCNPEntitlement": 4800,
    "noticeStartDate": "2018-03-29T00:00:00Z",
    "projectedNoticeDate": "2018-06-20T00:00:00Z",
    "compensationEndDate": "2018-06-20T00:00:00Z",
    "daysInClaim": 60,
    "weeklyResults": [
      {
        "weekNumber": 1,
        "employerEntitlement": 400,
        "benefitsDeducted": 100,
        "newEmploymentDeducted": 100,
        "wageIncreaseDeducted": 100,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 80,
        "isTaxable": false,
        "notionalTaxDeducted": 20,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 80,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 80,
        "isSelected": true
      },
      {
        "weekNumber": 2,
        "employerEntitlement": 400,
        "benefitsDeducted": 100,
        "newEmploymentDeducted": 100,
        "wageIncreaseDeducted": 100,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 80,
        "isTaxable": false,
        "notionalTaxDeducted": 20,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 80,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 80,
        "isSelected": true
      },
      {
        "weekNumber": 3,
        "employerEntitlement": 400,
        "benefitsDeducted": 100,
        "newEmploymentDeducted": 100,
        "wageIncreaseDeducted": 100,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 80,
        "isTaxable": false,
        "notionalTaxDeducted": 20,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 80,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 80,
        "isSelected": true
      },
      {
        "weekNumber": 4,
        "employerEntitlement": 400,
        "benefitsDeducted": 100,
        "newEmploymentDeducted": 100,
        "wageIncreaseDeducted": 100,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 80,
        "isTaxable": false,
        "notionalTaxDeducted": 20,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 80,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 80,
        "isSelected": true
      },
      {
        "weekNumber": 5,
        "employerEntitlement": 400,
        "benefitsDeducted": 100,
        "newEmploymentDeducted": 100,
        "wageIncreaseDeducted": 100,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 80,
        "isTaxable": false,
        "notionalTaxDeducted": 20,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 80,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 80,
        "isSelected": true
      },
      {
        "weekNumber": 6,
        "employerEntitlement": 400,
        "benefitsDeducted": 100,
        "newEmploymentDeducted": 100,
        "wageIncreaseDeducted": 100,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 80,
        "isTaxable": false,
        "notionalTaxDeducted": 20,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 80,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 80,
        "isSelected": true
      },
      {
        "weekNumber": 7,
        "employerEntitlement": 400,
        "benefitsDeducted": 100,
        "newEmploymentDeducted": 100,
        "wageIncreaseDeducted": 100,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 80,
        "isTaxable": false,
        "notionalTaxDeducted": 20,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 80,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 80,
        "isSelected": true
      },
      {
        "weekNumber": 8,
        "employerEntitlement": 400,
        "benefitsDeducted": 100,
        "newEmploymentDeducted": 100,
        "wageIncreaseDeducted": 100,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 80,
        "isTaxable": false,
        "notionalTaxDeducted": 20,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 80,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 80,
        "isSelected": true
      },
      {
        "weekNumber": 9,
        "employerEntitlement": 400,
        "benefitsDeducted": 100,
        "newEmploymentDeducted": 100,
        "wageIncreaseDeducted": 100,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 80,
        "isTaxable": false,
        "notionalTaxDeducted": 20,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 80,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 80,
        "isSelected": true
      },
      {
        "weekNumber": 10,
        "employerEntitlement": 400,
        "benefitsDeducted": 100,
        "newEmploymentDeducted": 100,
        "wageIncreaseDeducted": 100,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 80,
        "isTaxable": false,
        "notionalTaxDeducted": 20,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 80,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 80,
        "isSelected": true
      },
      {
        "weekNumber": 11,
        "employerEntitlement": 400,
        "benefitsDeducted": 100,
        "newEmploymentDeducted": 100,
        "wageIncreaseDeducted": 100,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 80,
        "isTaxable": false,
        "notionalTaxDeducted": 20,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 80,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 80,
        "isSelected": true
      },
	  {
        "weekNumber": 12,
        "employerEntitlement": 400,
        "benefitsDeducted": 100,
        "newEmploymentDeducted": 100,
        "wageIncreaseDeducted": 100,
        "notionalBenefitDeducted": 0,
        "grossEntitlement": 80,
        "isTaxable": false,
        "notionalTaxDeducted": 20,
        "taxDeducted": 0,
        "niDeducted": 0,
        "netEntitlement": 80,
        "preferentialClaim": 0,
        "nonPreferentialClaim": 80,
        "isSelected": true
      }
    ]
  }
}
"""

@AutomationTest
Scenario: CNP New Employement Validation Wage 0 Weekly Wage More
# Test includes payload for Compensatory Notice of Pay only
# Tests that when no end date is set in the mitigations then the calculation will still calculate
	When I post to the Notice endpoint with:
"""
{
  "cnp": {
    "insolvencyEmploymentStartDate": "2005-03-28T09:00:41.920Z",
    "insolvencyDate": "2018-03-29T09:00:41.920Z",
    "dismissalDate": "2018-03-28T09:00:41.920Z",
    "dateNoticeGiven": "2018-03-28T09:00:41.920Z",
    "weeklyWage": 400,
    "shiftPattern": ["1","2","3","4","5"],
          "isTaxable": true,
    "dateOfBirth": "1957-03-28T09:00:41.920Z",
    "deceasedDate": "",
	"benefits": [
	  {
		"benefitStartDate": "2018-03-29T09:00:41.920Z",
		"benefitAmount": 1200
	  },
	],
	"newEmployments": [
	  {
		"newEmploymentStartDate": "2018-03-29T09:00:41.920Z",
		"newEmploymentWage": 0,
		"newEmploymentWeeklyWage": 100
	   }
	],
	"wageIncreases": [
	  {
		"wageIncreaseStartDate": "2018-03-29T09:00:41.920Z",
		"WageIncreaseAmount": 1200
	   }
	]
  }
}
"""
	Then I get a response with status code "400"
	And the response contains "'New Employment Wage' is invalid; value must not be negative or zero"
	And the response contains "'New Employment Weekly Wage' must be zero if New Employment Wage is zero"