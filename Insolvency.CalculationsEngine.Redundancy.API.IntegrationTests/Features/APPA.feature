Feature: APPA Composite
  scenarios around automated testing of the APPA Composite Calculation via the Gateway API

@AutomationTest
Scenario: Test PingGet Method
  Given I want to test "aggpinggetappa" method
  When I make a request to the APPA Composite Endpoint
  Then I get a response with status code "200"
  And the response contains "PingGet response from RPS Api APPA"

@AutomationTest
Scenario: AP Statutory Maximum
# Test include a payload for Arrears Of Pay only
# Tests that when the weekly wage is below the stat max the gross entitlement matches the statutory maximum
	When I post to the APPA endpoint with:
"""
{
"rp1NotRequired": false,
"rp14aNotRequired": false,
"ap": [ 
{ 
"inputSource": "rp1", 
"insolvencyDate": "2018-06-23T09:32:03.524Z", 
"employmentStartDate": "2011-02-03T09:32:03.524Z", 
"dismissalDate": "2018-06-23T09:32:03.524Z", 
"dateNoticeGiven": "2018-06-23T09:32:03.524Z", 
"unpaidPeriodFrom": "2018-06-10T09:32:03.525Z", 
"unpaidPeriodTo": "2018-06-23T09:32:03.525Z", 
"apClaimAmount":1200, 
"isTaxable": true, 
"payDay": 6, 
"shiftPattern": ["1","2","3","4","5"], 
"weeklyWage": 600.00 },
{ 
"inputSource": "rp14a", 
"insolvencyDate": "2018-06-23T09:32:03.524Z", 
"employmentStartDate": "2011-02-03T09:32:03.524Z", 
"dismissalDate": "2018-06-23T09:32:03.524Z", 
"dateNoticeGiven": "2018-06-23T09:32:03.524Z", 
"unpaidPeriodFrom": "2018-06-10T09:32:03.525Z", 
"unpaidPeriodTo": "2018-06-23T09:32:03.525Z", 
"apClaimAmount":1200, 
"isTaxable": true, 
"payDay": 6, 
"shiftPattern": ["1","2","3","4","5"], 
"weeklyWage": 600.00 }
] 
}         
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "ap": {
    "selectedInputSource": "rp14a",
    "rP1ResultsList": {
      "inputSource": "rp1",
      "statutoryMax": 508,
      "dngApplied": false,
      "runNWNP": false,
      "weeklyResult": [
        {
          "weekNumber": 1,
          "payDate": "2018-06-16T00:00:00Z",
          "apPayRate": 600,
          "maximumEntitlement": 508,
          "employerEntitlement": 600,
          "grossEntitlement": 508,
          "isTaxable": true,
          "taxDeducted": 101.6,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 600,
          "grossEntitlementIn4Months": 508,
          "isSelected": false
        },
        {
          "weekNumber": 2,
          "payDate": "2018-06-23T00:00:00Z",
          "apPayRate": 600,
          "maximumEntitlement": 508,
          "employerEntitlement": 600,
          "grossEntitlement": 508,
          "isTaxable": true,
          "taxDeducted": 101.6,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 600,
          "grossEntitlementIn4Months": 508,
          "isSelected": false
        }
      ]
    },
    "rP14aResultsList": {
      "inputSource": "rp14a",
      "statutoryMax": 508,
      "dngApplied": false,
      "runNWNP": false,
      "weeklyResult": [
        {
          "weekNumber": 1,
          "payDate": "2018-06-16T00:00:00Z",
          "apPayRate": 600,
          "maximumEntitlement": 508,
          "employerEntitlement": 600,
          "grossEntitlement": 508,
          "isTaxable": true,
          "taxDeducted": 101.6,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 600,
          "grossEntitlementIn4Months": 508,
          "isSelected": true
        },
        {
          "weekNumber": 2,
          "payDate": "2018-06-23T00:00:00Z",
          "apPayRate": 600,
          "maximumEntitlement": 508,
          "employerEntitlement": 600,
          "grossEntitlement": 508,
          "isTaxable": true,
          "taxDeducted": 101.6,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 600,
          "grossEntitlementIn4Months": 508,
          "isSelected": true
        }	  
	  ]
    }
  },
  "pa": null
}
"""

@AutomationTest
Scenario: AP Employer Entitlement
# Test include a payload for Arrears Of Pay only
# Tests that when the weekly wage is below the stat max the gross entitlement matches the employer entitlement
	When I post to the APPA endpoint with:
"""
{
"rp1NotRequired": false,
"rp14aNotRequired": false,
"ap": [ 
{ 
"inputSource": "rp1", 
"insolvencyDate": "2018-06-23T09:32:03.524Z", 
"employmentStartDate": "2011-02-03T09:32:03.524Z", 
"dismissalDate": "2018-06-23T09:32:03.524Z", 
"dateNoticeGiven": "2018-06-23T09:32:03.524Z", 
"unpaidPeriodFrom": "2018-06-10T09:32:03.525Z", 
"unpaidPeriodTo": "2018-06-23T09:32:03.525Z", 
"apClaimAmount":600, 
"isTaxable": true, 
"payDay": 6, 
"shiftPattern": ["1","2","3","4","5"], 
"weeklyWage": 300.00 },
{ 
"inputSource": "rp14a", 
"insolvencyDate": "2018-06-23T09:32:03.524Z", 
"employmentStartDate": "2011-02-03T09:32:03.524Z", 
"dismissalDate": "2018-06-23T09:32:03.524Z", 
"dateNoticeGiven": "2018-06-23T09:32:03.524Z", 
"unpaidPeriodFrom": "2018-06-10T09:32:03.525Z", 
"unpaidPeriodTo": "2018-06-23T09:32:03.525Z", 
"apClaimAmount":600, 
"isTaxable": true, 
"payDay": 6, 
"shiftPattern": ["1","2","3","4","5"], 
"weeklyWage": 300.00 }
] 
}         
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "ap": {
    "selectedInputSource": "rp14a",
    "rP1ResultsList": {
      "inputSource": "rp1",
      "statutoryMax": 508,
      "dngApplied": false,
      "runNWNP": false,
      "weeklyResult": [
        {
          "weekNumber": 1,
          "payDate": "2018-06-16T00:00:00Z",
          "apPayRate": 300,
          "maximumEntitlement": 508,
          "employerEntitlement": 300,
          "grossEntitlement": 300,
          "isTaxable": true,
          "taxDeducted": 60,
          "niDeducted": 16.08,
          "netEntitlement": 223.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 300,
          "grossEntitlementIn4Months": 300,
          "isSelected": false
        },
        {
          "weekNumber": 2,
          "payDate": "2018-06-23T00:00:00Z",
          "apPayRate": 300,
          "maximumEntitlement": 508,
          "employerEntitlement": 300,
          "grossEntitlement": 300,
          "isTaxable": true,
          "taxDeducted": 60,
          "niDeducted": 16.08,
          "netEntitlement": 223.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 300,
          "grossEntitlementIn4Months": 300,
          "isSelected": false
        }
      ]
    },
    "rP14aResultsList": {
      "inputSource": "rp14a",
      "statutoryMax": 508,
      "dngApplied": false,
      "runNWNP": false,
      "weeklyResult": [
        {
          "weekNumber": 1,
          "payDate": "2018-06-16T00:00:00Z",
          "apPayRate": 300,
          "maximumEntitlement": 508,
          "employerEntitlement": 300,
          "grossEntitlement": 300,
          "isTaxable": true,
          "taxDeducted": 60,
          "niDeducted": 16.08,
          "netEntitlement": 223.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 300,
          "grossEntitlementIn4Months": 300,
          "isSelected": true
        },
        {
          "weekNumber": 2,
          "payDate": "2018-06-23T00:00:00Z",
          "apPayRate": 300,
          "maximumEntitlement": 508,
          "employerEntitlement": 300,
          "grossEntitlement": 300,
          "isTaxable": true,
          "taxDeducted": 60,
          "niDeducted": 16.08,
          "netEntitlement": 223.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 300,
          "grossEntitlementIn4Months": 300,
          "isSelected": true
        }	  
	  ]
    }
  },
  "pa": null
}
"""

@AutomationTest
Scenario: AP Adjusted to Insolvency Date
# Test include a payload for Arrears Of Pay only
# Tests that when the dismissal date is before the unpaid period to then the claim is paid up until the insolvency date
	When I post to the APPA endpoint with:
"""
{
"rp1NotRequired": false,
"rp14aNotRequired": false,
"ap": [ 
{ 
"inputSource": "rp1", 
"insolvencyDate": "2018-06-23T09:32:03.524Z", 
"employmentStartDate": "2011-02-03T09:32:03.524Z", 
"dismissalDate": "2018-06-23T09:32:03.524Z", 
"dateNoticeGiven": "2018-06-23T09:32:03.524Z", 
"unpaidPeriodFrom": "2018-06-10T09:32:03.525Z", 
"unpaidPeriodTo": "2018-06-30T09:32:03.525Z", 
"apClaimAmount":1200, 
"isTaxable": true, 
"payDay": 6, 
"shiftPattern": ["1","2","3","4","5"], 
"weeklyWage": 600.00 
},
{ 
"inputSource": "rp14a", 
"insolvencyDate": "2018-06-23T09:32:03.524Z", 
"employmentStartDate": "2011-02-03T09:32:03.524Z", 
"dismissalDate": "2018-06-23T09:32:03.524Z", 
"dateNoticeGiven": "2018-06-23T09:32:03.524Z", 
"unpaidPeriodFrom": "2018-06-10T09:32:03.525Z", 
"unpaidPeriodTo": "2018-06-30T09:32:03.525Z", 
"apClaimAmount":1200, 
"isTaxable": true, 
"payDay": 6, 
"shiftPattern": ["1","2","3","4","5"], 
"weeklyWage": 600.00 
}
] 
}         
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "ap": {
    "selectedInputSource": "rp14a",
    "rP1ResultsList": {
      "inputSource": "rp1",
      "statutoryMax": 508,
      "dngApplied": false,
      "runNWNP": false,
      "weeklyResult": [
        {
          "weekNumber": 1,
          "payDate": "2018-06-16T00:00:00Z",
          "apPayRate": 600,
          "maximumEntitlement": 508,
          "employerEntitlement": 600,
          "grossEntitlement": 508,
          "isTaxable": true,
          "taxDeducted": 101.6,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 600,
          "grossEntitlementIn4Months": 508,
          "isSelected": false
        },
        {
          "weekNumber": 2,
          "payDate": "2018-06-23T00:00:00Z",
          "apPayRate": 600,
          "maximumEntitlement": 508,
          "employerEntitlement": 600,
          "grossEntitlement": 508,
          "isTaxable": true,
          "taxDeducted": 101.6,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 600,
          "grossEntitlementIn4Months": 508,
          "isSelected": false
        }
      ]
    },
    "rP14aResultsList": {
      "inputSource": "rp14a",
      "statutoryMax": 508,
      "dngApplied": false,
      "runNWNP": false,
      "weeklyResult": [
	  {
          "weekNumber": 1,
          "payDate": "2018-06-16T00:00:00Z",
          "apPayRate": 600,
          "maximumEntitlement": 508,
          "employerEntitlement": 600,
          "grossEntitlement": 508,
          "isTaxable": true,
          "taxDeducted": 101.6,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 600,
          "grossEntitlementIn4Months": 508,
          "isSelected": true
        },
        {
          "weekNumber": 2,
          "payDate": "2018-06-23T00:00:00Z",
          "apPayRate": 600,
          "maximumEntitlement": 508,
          "employerEntitlement": 600,
          "grossEntitlement": 508,
          "isTaxable": true,
          "taxDeducted": 101.6,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 600,
          "grossEntitlementIn4Months": 508,
          "isSelected": true
        }
		]
    }
  },
  "pa": null
}
"""

@AutomationTest
Scenario: AP Adjusted to Dismissal Date
# Test include a payload for Arrears Of Pay only
# Tests that when the dismissal date is before the unpaid period to then the claim is paid up until the dismissal date
	When I post to the APPA endpoint with:
"""
{
"rp1NotRequired": false,
"rp14aNotRequired": false,
"ap": [ 
{ 
"inputSource": "rp1", 
"insolvencyDate": "2018-06-30T09:32:03.524Z", 
"employmentStartDate": "2011-02-03T09:32:03.524Z", 
"dismissalDate": "2018-06-23T09:32:03.524Z", 
"dateNoticeGiven": "2018-06-23T09:32:03.524Z", 
"unpaidPeriodFrom": "2018-06-10T09:32:03.525Z", 
"unpaidPeriodTo": "2018-06-30T09:32:03.525Z", 
"apClaimAmount":1200, 
"isTaxable": true, 
"payDay": 6, 
"shiftPattern": ["1","2","3","4","5"], 
"weeklyWage": 600.00 },
{ 
"inputSource": "rp14a", 
"insolvencyDate": "2018-06-30T09:32:03.524Z", 
"employmentStartDate": "2011-02-03T09:32:03.524Z", 
"dismissalDate": "2018-06-23T09:32:03.524Z", 
"dateNoticeGiven": "2018-06-23T09:32:03.524Z", 
"unpaidPeriodFrom": "2018-06-10T09:32:03.525Z", 
"unpaidPeriodTo": "2018-06-30T09:32:03.525Z", 
"apClaimAmount":1200, 
"isTaxable": true, 
"payDay": 6, 
"shiftPattern": ["1","2","3","4","5"], 
"weeklyWage": 600.00 }
] 
}         
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "ap": {
    "selectedInputSource": "rp14a",
    "rP1ResultsList": {
      "inputSource": "rp1",
      "statutoryMax": 508,
      "dngApplied": false,
      "runNWNP": false,
      "weeklyResult": [
        {
          "weekNumber": 1,
          "payDate": "2018-06-16T00:00:00Z",
          "apPayRate": 600,
          "maximumEntitlement": 508,
          "employerEntitlement": 600,
          "grossEntitlement": 508,
          "isTaxable": true,
          "taxDeducted": 101.6,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 600,
          "grossEntitlementIn4Months": 508,
          "isSelected": false
        },
        {
          "weekNumber": 2,
          "payDate": "2018-06-23T00:00:00Z",
          "apPayRate": 600,
          "maximumEntitlement": 508,
          "employerEntitlement": 600,
          "grossEntitlement": 508,
          "isTaxable": true,
          "taxDeducted": 101.6,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 600,
          "grossEntitlementIn4Months": 508,
          "isSelected": false
        }
      ]
    },
    "rP14aResultsList": {
      "inputSource": "rp14a",
      "statutoryMax": 508,
      "dngApplied": false,
      "runNWNP": false,
      "weeklyResult": [
	  {
          "weekNumber": 1,
          "payDate": "2018-06-16T00:00:00Z",
          "apPayRate": 600,
          "maximumEntitlement": 508,
          "employerEntitlement": 600,
          "grossEntitlement": 508,
          "isTaxable": true,
          "taxDeducted": 101.6,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 600,
          "grossEntitlementIn4Months": 508,
          "isSelected": true
        },
        {
          "weekNumber": 2,
          "payDate": "2018-06-23T00:00:00Z",
          "apPayRate": 600,
          "maximumEntitlement": 508,
          "employerEntitlement": 600,
          "grossEntitlement": 508,
          "isTaxable": true,
          "taxDeducted": 101.6,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 600,
          "grossEntitlementIn4Months": 508,
          "isSelected": true
        }
		]
    }
  },
  "pa": null
}
"""

@AutomationTest
Scenario: AP Includes Insolvency Day
# Test include a payload for Arrears Of Pay only
# Tests that when the insolvency date is one day before the pay day to then the claim is paid up to and including the insolvency date
	When I post to the APPA endpoint with:
"""
{
"rp1NotRequired": false,
"rp14aNotRequired": false,
"ap": [ 
{ 
"inputSource": "rp1", 
"insolvencyDate": "2018-08-22T09:32:03.524Z", 
"employmentStartDate": "2018-04-06T09:32:03.524Z", 
"dismissalDate": "2018-08-22T09:32:03.524Z", 
"dateNoticeGiven": "2018-08-22T09:32:03.524Z", 
"unpaidPeriodFrom": "2018-08-10T09:32:03.525Z", 
"unpaidPeriodTo": "2018-08-22T09:32:03.525Z", 
"apClaimAmount":621, 
"isTaxable": true, 
"payDay": 4, 
"shiftPattern": ["1","2","3","4","5"], 
"weeklyWage": 345.00 },
{ 
"inputSource": "rp14a", 
"insolvencyDate": "2018-08-22T09:32:03.524Z", 
"employmentStartDate": "2018-04-06T09:32:03.524Z", 
"dismissalDate": "2018-08-22T09:32:03.524Z", 
"dateNoticeGiven": "2018-08-22T09:32:03.524Z", 
"unpaidPeriodFrom": "2018-08-10T09:32:03.525Z", 
"unpaidPeriodTo": "2018-08-22T09:32:03.525Z", 
"apClaimAmount":621, 
"isTaxable": true, 
"payDay": 4, 
"shiftPattern": ["1","2","3","4","5"], 
"weeklyWage": 345.00 },
] 
}         
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "ap": {
    "selectedInputSource": "rp14a",
    "rP1ResultsList": {
      "inputSource": "rp1",
      "statutoryMax": 508,
      "dngApplied": false,
      "runNWNP": false,
      "weeklyResult": [
        {
          "weekNumber": 1,
          "payDate": "2018-08-16T00:00:00Z",
          "apPayRate": 345,
          "maximumEntitlement": 508,
          "employerEntitlement": 345,
          "grossEntitlement": 345,
          "isTaxable": true,
          "taxDeducted": 69,
          "niDeducted": 21.48,
          "netEntitlement": 254.52,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 345,
          "grossEntitlementIn4Months": 345,
          "isSelected": false
        },
        {
          "weekNumber": 2,
          "payDate": "2018-08-23T00:00:00Z",
          "apPayRate": 345,
          "maximumEntitlement": 435.43,
          "employerEntitlement": 276,
          "grossEntitlement": 276,
          "isTaxable": true,
          "taxDeducted": 55.2,
          "niDeducted": 13.2,
          "netEntitlement": 207.6,
          "maximumDays": 6,
          "employmentDays": 4,
          "maximumEntitlementIn4MonthPeriod": 435.43,
          "employerEntitlementIn4MonthPeriod": 276,
          "grossEntitlementIn4Months": 276,
          "isSelected": false
        }
      ]
    },
    "rP14aResultsList": {
      "inputSource": "rp14a",
      "statutoryMax": 508,
      "dngApplied": false,
      "runNWNP": false,
      "weeklyResult": [
	  {
          "weekNumber": 1,
          "payDate": "2018-08-16T00:00:00Z",
          "apPayRate": 345,
          "maximumEntitlement": 508,
          "employerEntitlement": 345,
          "grossEntitlement": 345,
          "isTaxable": true,
          "taxDeducted": 69,
          "niDeducted": 21.48,
          "netEntitlement": 254.52,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 345,
          "grossEntitlementIn4Months": 345,
          "isSelected": true
        },
        {
          "weekNumber": 2,
          "payDate": "2018-08-23T00:00:00Z",
          "apPayRate": 345,
          "maximumEntitlement": 435.43,
          "employerEntitlement": 276,
          "grossEntitlement": 276,
          "isTaxable": true,
          "taxDeducted": 55.2,
          "niDeducted": 13.2,
          "netEntitlement": 207.6,
          "maximumDays": 6,
          "employmentDays": 4,
          "maximumEntitlementIn4MonthPeriod": 435.43,
          "employerEntitlementIn4MonthPeriod": 276,
          "grossEntitlementIn4Months": 276,
          "isSelected": true
        }
		]
    }
  },
  "pa": null
}
"""

@AutomationTest
Scenario: AP Partial Week Last Week of Employment
# Test include a payload for Arrears Of Pay only
# Tests that when  partial week is the last week of employment then the stat max is pro rata depending on days cover
	When I post to the APPA endpoint with:
"""
{
"rp1NotRequired": false,
"rp14aNotRequired": false,
"ap": [ 
{ 
"inputSource": "rp1", 
"insolvencyDate": "2018-05-05T09:32:03.524Z", 
"employmentStartDate": "2010-06-08T09:32:03.524Z", 
"dismissalDate": "2018-05-03T09:32:03.524Z", 
"dateNoticeGiven": "2018-05-03T09:32:03.524Z", 
"unpaidPeriodFrom": "2018-04-07T09:32:03.525Z", 
"unpaidPeriodTo": "2018-05-03T09:32:03.525Z", 
"apClaimAmount": 0, 
"isTaxable": true, 
"payDay": 6, 
"shiftPattern": ["1","3","5"], 
"weeklyWage": 763.45 },
{ 
"inputSource": "rp14a", 
"insolvencyDate": "2018-05-05T09:32:03.524Z", 
"employmentStartDate": "2010-06-08T09:32:03.524Z", 
"dismissalDate": "2018-05-03T09:32:03.524Z", 
"dateNoticeGiven": "2018-05-03T09:32:03.524Z", 
"unpaidPeriodFrom": "2018-04-07T09:32:03.525Z", 
"unpaidPeriodTo": "2018-05-03T09:32:03.525Z", 
"apClaimAmount": 0, 
"isTaxable": true, 
"payDay": 6, 
"shiftPattern": ["1","3","5"], 
"weeklyWage": 763.45 }
] 
}         
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "ap": {
    "selectedInputSource": "rp1",
    "rP1ResultsList": {
      "inputSource": "rp1",
      "statutoryMax": 508,
      "dngApplied": false,
      "runNWNP": false,
      "weeklyResult": [
        {
          "weekNumber": 1,
          "payDate": "2018-04-07T00:00:00Z",
          "apPayRate": 763.45,
          "maximumEntitlement": 508,
          "employerEntitlement": 0,
          "grossEntitlement": 0,
          "isTaxable": true,
          "taxDeducted": 0,
          "niDeducted": 0,
          "netEntitlement": 0,
          "maximumDays": 7,
          "employmentDays": 0,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 0,
          "grossEntitlementIn4Months": 0,
          "isSelected": false
        },
        {
          "weekNumber": 2,
          "payDate": "2018-04-14T00:00:00Z",
          "apPayRate": 763.45,
          "maximumEntitlement": 508,
          "employerEntitlement": 763.45,
          "grossEntitlement": 508,
          "isTaxable": true,
          "taxDeducted": 101.6,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 3,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 763.45,
          "grossEntitlementIn4Months": 508,
          "isSelected": false
        },
        {
          "weekNumber": 3,
          "payDate": "2018-04-21T00:00:00Z",
          "apPayRate": 763.45,
          "maximumEntitlement": 508,
          "employerEntitlement": 763.45,
          "grossEntitlement": 508,
          "isTaxable": true,
          "taxDeducted": 101.6,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 3,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 763.45,
          "grossEntitlementIn4Months": 508,
          "isSelected": false
        },
        {
          "weekNumber": 4,
          "payDate": "2018-04-28T00:00:00Z",
          "apPayRate": 763.45,
          "maximumEntitlement": 508,
          "employerEntitlement": 763.45,
          "grossEntitlement": 508,
          "isTaxable": true,
          "taxDeducted": 101.6,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 3,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 763.45,
          "grossEntitlementIn4Months": 508,
          "isSelected": false
        },
        {
          "weekNumber": 5,
          "payDate": "2018-05-05T00:00:00Z",
          "apPayRate": 763.45,
          "maximumEntitlement": 362.86,
          "employerEntitlement": 508.97,
          "grossEntitlement": 362.86,
          "isTaxable": true,
          "taxDeducted": 72.57,
          "niDeducted": 23.62,
          "netEntitlement": 266.67,
          "maximumDays": 5,
          "employmentDays": 2,
          "maximumEntitlementIn4MonthPeriod": 362.86,
          "employerEntitlementIn4MonthPeriod": 508.97,
          "grossEntitlementIn4Months": 362.86,
          "isSelected": false
        }
      ]
    },
    "rP14aResultsList": {
      "inputSource": "rp14a",
      "statutoryMax": 508,
      "dngApplied": false,
      "runNWNP": false,
      "weeklyResult": [
        {
          "weekNumber": 1,
          "payDate": "2018-04-07T00:00:00Z",
          "apPayRate": 763.45,
          "maximumEntitlement": 508,
          "employerEntitlement": 0,
          "grossEntitlement": 0,
          "isTaxable": true,
          "taxDeducted": 0,
          "niDeducted": 0,
          "netEntitlement": 0,
          "maximumDays": 7,
          "employmentDays": 0,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 0,
          "grossEntitlementIn4Months": 0,
          "isSelected": true
        },
        {
          "weekNumber": 2,
          "payDate": "2018-04-14T00:00:00Z",
          "apPayRate": 763.45,
          "maximumEntitlement": 508,
          "employerEntitlement": 763.45,
          "grossEntitlement": 508,
          "isTaxable": true,
          "taxDeducted": 101.6,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 3,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 763.45,
          "grossEntitlementIn4Months": 508,
          "isSelected": true
        },
        {
          "weekNumber": 3,
          "payDate": "2018-04-21T00:00:00Z",
          "apPayRate": 763.45,
          "maximumEntitlement": 508,
          "employerEntitlement": 763.45,
          "grossEntitlement": 508,
          "isTaxable": true,
          "taxDeducted": 101.6,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 3,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 763.45,
          "grossEntitlementIn4Months": 508,
          "isSelected": true
        },
        {
          "weekNumber": 4,
          "payDate": "2018-04-28T00:00:00Z",
          "apPayRate": 763.45,
          "maximumEntitlement": 508,
          "employerEntitlement": 763.45,
          "grossEntitlement": 508,
          "isTaxable": true,
          "taxDeducted": 101.6,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 3,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 763.45,
          "grossEntitlementIn4Months": 508,
          "isSelected": true
        },
        {
          "weekNumber": 5,
          "payDate": "2018-05-05T00:00:00Z",
          "apPayRate": 763.45,
          "maximumEntitlement": 362.86,
          "employerEntitlement": 508.97,
          "grossEntitlement": 362.86,
          "isTaxable": true,
          "taxDeducted": 72.57,
          "niDeducted": 23.62,
          "netEntitlement": 266.67,
          "maximumDays": 5,
          "employmentDays": 2,
          "maximumEntitlementIn4MonthPeriod": 362.86,
          "employerEntitlementIn4MonthPeriod": 508.97,
          "grossEntitlementIn4Months": 362.86,
          "isSelected": true
        }	  
	  ]
    }
  },
  "pa": null
}
"""

@AutomationTest
Scenario: AP Partial Week First Week of Employment
# Test include a payload for Arrears Of Pay only
# Tests that when partial week is the first week of employment then the stat max is pro rata depending on days cover
	When I post to the APPA endpoint with:
"""
{
"rp1NotRequired": false,
"rp14aNotRequired": false,
"ap": [ 
{ 
"inputSource": "rp1", 
"insolvencyDate": "2018-05-05T09:32:03.524Z", 
"employmentStartDate": "2018-04-09T09:32:03.524Z", 
"dismissalDate": "2018-05-05T09:32:03.524Z", 
"dateNoticeGiven": "2018-05-05T09:32:03.524Z", 
"unpaidPeriodFrom": "2018-04-09T09:32:03.525Z", 
"unpaidPeriodTo": "2018-05-05T09:32:03.525Z", 
"apClaimAmount": 0, 
"isTaxable": true, 
"payDay": 6, 
"shiftPattern": ["1","2","3","4","5"], 
"weeklyWage": 763.45 },
{ 
"inputSource": "rp14a", 
"insolvencyDate": "2018-05-05T09:32:03.524Z", 
"employmentStartDate": "2018-04-09T09:32:03.524Z", 
"dismissalDate": "2018-05-05T09:32:03.524Z", 
"dateNoticeGiven": "2018-05-05T09:32:03.524Z", 
"unpaidPeriodFrom": "2018-04-09T09:32:03.525Z", 
"unpaidPeriodTo": "2018-05-05T09:32:03.525Z", 
"apClaimAmount": 0, 
"isTaxable": true, 
"payDay": 6, 
"shiftPattern": ["1","2","3","4","5"], 
"weeklyWage": 763.45 }
] 
}         
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "ap": {
    "selectedInputSource": "rp1",
    "rP1ResultsList": {
      "inputSource": "rp1",
      "statutoryMax": 508,
      "dngApplied": false,
      "runNWNP": false,
      "weeklyResult": [
        {
          "weekNumber": 1,
          "payDate": "2018-04-14T00:00:00Z",
          "apPayRate": 763.45,
          "maximumEntitlement": 435.43,
          "employerEntitlement": 763.45,
          "grossEntitlement": 435.43,
          "isTaxable": true,
          "taxDeducted": 87.09,
          "niDeducted": 32.33,
          "netEntitlement": 316.01,
          "maximumDays": 6,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 435.43,
          "employerEntitlementIn4MonthPeriod": 763.45,
          "grossEntitlementIn4Months": 435.43,
          "isSelected": false
        },
        {
          "weekNumber": 2,
          "payDate": "2018-04-21T00:00:00Z",
          "apPayRate": 763.45,
          "maximumEntitlement": 508,
          "employerEntitlement": 763.45,
          "grossEntitlement": 508,
          "isTaxable": true,
          "taxDeducted": 101.6,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 763.45,
          "grossEntitlementIn4Months": 508,
          "isSelected": false
        },
        {
          "weekNumber": 3,
          "payDate": "2018-04-28T00:00:00Z",
          "apPayRate": 763.45,
          "maximumEntitlement": 508,
          "employerEntitlement": 763.45,
          "grossEntitlement": 508,
          "isTaxable": true,
          "taxDeducted": 101.6,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 763.45,
          "grossEntitlementIn4Months": 508,
          "isSelected": false
        },
        {
          "weekNumber": 4,
          "payDate": "2018-05-05T00:00:00Z",
          "apPayRate": 763.45,
          "maximumEntitlement": 508,
          "employerEntitlement": 763.45,
          "grossEntitlement": 508,
          "isTaxable": true,
          "taxDeducted": 101.6,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 763.45,
          "grossEntitlementIn4Months": 508,
          "isSelected": false
        }
      ]
    },
    "rP14aResultsList": {
      "inputSource": "rp14a",
      "statutoryMax": 508,
      "dngApplied": false,
      "runNWNP": false,
      "weeklyResult": [
        {
          "weekNumber": 1,
          "payDate": "2018-04-14T00:00:00Z",
          "apPayRate": 763.45,
          "maximumEntitlement": 435.43,
          "employerEntitlement": 763.45,
          "grossEntitlement": 435.43,
          "isTaxable": true,
          "taxDeducted": 87.09,
          "niDeducted": 32.33,
          "netEntitlement": 316.01,
          "maximumDays": 6,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 435.43,
          "employerEntitlementIn4MonthPeriod": 763.45,
          "grossEntitlementIn4Months": 435.43,
          "isSelected": true
        },
        {
          "weekNumber": 2,
          "payDate": "2018-04-21T00:00:00Z",
          "apPayRate": 763.45,
          "maximumEntitlement": 508,
          "employerEntitlement": 763.45,
          "grossEntitlement": 508,
          "isTaxable": true,
          "taxDeducted": 101.6,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 763.45,
          "grossEntitlementIn4Months": 508,
          "isSelected": true
        },
        {
          "weekNumber": 3,
          "payDate": "2018-04-28T00:00:00Z",
          "apPayRate": 763.45,
          "maximumEntitlement": 508,
          "employerEntitlement": 763.45,
          "grossEntitlement": 508,
          "isTaxable": true,
          "taxDeducted": 101.6,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 763.45,
          "grossEntitlementIn4Months": 508,
          "isSelected": true
        },
        {
          "weekNumber": 4,
          "payDate": "2018-05-05T00:00:00Z",
          "apPayRate": 763.45,
          "maximumEntitlement": 508,
          "employerEntitlement": 763.45,
          "grossEntitlement": 508,
          "isTaxable": true,
          "taxDeducted": 101.6,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 763.45,
          "grossEntitlementIn4Months": 508,
          "isSelected": true
        }	  
	  ]
    }
  },
  "pa": null
}
"""

@AutomationTest
Scenario: AP Partial Week During Contract
# Test include a payload for Arrears Of Pay only
# Tests that when  partial week is the in the middle of employment then the stat max paid for all days of the partial week
	When I post to the APPA endpoint with:
"""
{
"rp1NotRequired": false,
"rp14aNotRequired": false,
"ap": [ 
{ 
"inputSource": "rp1", 
"insolvencyDate": "2018-06-05T09:32:03.524Z", 
"employmentStartDate": "2010-04-09T09:32:03.524Z", 
"dismissalDate": "2018-06-05T09:32:03.524Z", 
"dateNoticeGiven": "2018-06-05T09:32:03.524Z", 
"unpaidPeriodFrom": "2018-04-11T09:32:03.525Z", 
"unpaidPeriodTo": "2018-05-01T09:32:03.525Z", 
"apClaimAmount": 0, 
"isTaxable": true, 
"payDay": 6, 
"shiftPattern": ["1","2","3","4","5"], 
"weeklyWage": 763.45 },
{ 
"inputSource": "rp14a", 
"insolvencyDate": "2018-06-05T09:32:03.524Z", 
"employmentStartDate": "2010-04-09T09:32:03.524Z", 
"dismissalDate": "2018-06-05T09:32:03.524Z", 
"dateNoticeGiven": "2018-06-05T09:32:03.524Z", 
"unpaidPeriodFrom": "2018-04-11T09:32:03.525Z", 
"unpaidPeriodTo": "2018-05-01T09:32:03.525Z", 
"apClaimAmount": 0, 
"isTaxable": true, 
"payDay": 6, 
"shiftPattern": ["1","2","3","4","5"], 
"weeklyWage": 763.45 }
] 
}         
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "ap": {
    "selectedInputSource": "rp14a",
    "rP1ResultsList": {
      "inputSource": "rp1",
      "statutoryMax": 508,
      "dngApplied": false,
      "runNWNP": false,
      "weeklyResult": [
        {
          "weekNumber": 1,
          "payDate": "2018-04-14T00:00:00Z",
          "apPayRate": 763.45,
          "maximumEntitlement": 508,
          "employerEntitlement": 458.07,
          "grossEntitlement": 458.07,
          "isTaxable": true,
          "taxDeducted": 91.61,
          "niDeducted": 35.05,
          "netEntitlement": 331.41,
          "maximumDays": 7,
          "employmentDays": 3,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 458.07,
          "grossEntitlementIn4Months": 458.07,
          "isSelected": false
        },
        {
          "weekNumber": 2,
          "payDate": "2018-04-21T00:00:00Z",
          "apPayRate": 763.45,
          "maximumEntitlement": 508,
          "employerEntitlement": 763.45,
          "grossEntitlement": 508,
          "isTaxable": true,
          "taxDeducted": 101.6,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 763.45,
          "grossEntitlementIn4Months": 508,
          "isSelected": false
        },
        {
          "weekNumber": 3,
          "payDate": "2018-04-28T00:00:00Z",
          "apPayRate": 763.45,
          "maximumEntitlement": 508,
          "employerEntitlement": 763.45,
          "grossEntitlement": 508,
          "isTaxable": true,
          "taxDeducted": 101.6,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 763.45,
          "grossEntitlementIn4Months": 508,
          "isSelected": false
        },
        {
          "weekNumber": 4,
          "payDate": "2018-05-05T00:00:00Z",
          "apPayRate": 763.45,
          "maximumEntitlement": 508,
          "employerEntitlement": 305.38,
          "grossEntitlement": 305.38,
          "isTaxable": true,
          "taxDeducted": 61.08,
          "niDeducted": 16.73,
          "netEntitlement": 227.57,
          "maximumDays": 7,
          "employmentDays": 2,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 305.38,
          "grossEntitlementIn4Months": 305.38,
          "isSelected": false
        }
      ]
    },
    "rP14aResultsList": {
      "inputSource": "rp14a",
      "statutoryMax": 508,
      "dngApplied": false,
      "runNWNP": false,
      "weeklyResult": [
        {
          "weekNumber": 1,
          "payDate": "2018-04-14T00:00:00Z",
          "apPayRate": 763.45,
          "maximumEntitlement": 508,
          "employerEntitlement": 458.07,
          "grossEntitlement": 458.07,
          "isTaxable": true,
          "taxDeducted": 91.61,
          "niDeducted": 35.05,
          "netEntitlement": 331.41,
          "maximumDays": 7,
          "employmentDays": 3,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 458.07,
          "grossEntitlementIn4Months": 458.07,
          "isSelected": true
        },
        {
          "weekNumber": 2,
          "payDate": "2018-04-21T00:00:00Z",
          "apPayRate": 763.45,
          "maximumEntitlement": 508,
          "employerEntitlement": 763.45,
          "grossEntitlement": 508,
          "isTaxable": true,
          "taxDeducted": 101.6,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 763.45,
          "grossEntitlementIn4Months": 508,
          "isSelected": true
        },
        {
          "weekNumber": 3,
          "payDate": "2018-04-28T00:00:00Z",
          "apPayRate": 763.45,
          "maximumEntitlement": 508,
          "employerEntitlement": 763.45,
          "grossEntitlement": 508,
          "isTaxable": true,
          "taxDeducted": 101.6,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 763.45,
          "grossEntitlementIn4Months": 508,
          "isSelected": true
        },
        {
          "weekNumber": 4,
          "payDate": "2018-05-05T00:00:00Z",
          "apPayRate": 763.45,
          "maximumEntitlement": 508,
          "employerEntitlement": 305.38,
          "grossEntitlement": 305.38,
          "isTaxable": true,
          "taxDeducted": 61.08,
          "niDeducted": 16.73,
          "netEntitlement": 227.57,
          "maximumDays": 7,
          "employmentDays": 2,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 305.38,
          "grossEntitlementIn4Months": 305.38,
          "isSelected": true
        }	  
	  ]
    }
  },
  "pa": null
}
"""

@AutomationTest
Scenario: AP Claim Amount Higher Than Wages
# Test include a payload for Arrears Of Pay only
# Tests that when the claim amount is higher than the weekly wage then the entitlement is adjusted
	When I post to the APPA endpoint with:
"""
{
"rp1NotRequired": false,
"rp14aNotRequired": false,
"ap": [ 
{ 
"inputSource": "rp1", 
"insolvencyDate": "2018-06-23T09:32:03.524Z", 
"employmentStartDate": "2011-02-03T09:32:03.524Z", 
"dismissalDate": "2018-06-23T09:32:03.524Z", 
"dateNoticeGiven": "2018-06-23T09:32:03.524Z", 
"unpaidPeriodFrom": "2018-06-10T09:32:03.525Z", 
"unpaidPeriodTo": "2018-06-23T09:32:03.525Z", 
"apClaimAmount":600, 
"isTaxable": true, 
"payDay": 6, 
"shiftPattern": ["1","2","3","4","5"], 
"weeklyWage": 100.00 },
{ 
"inputSource": "rp14a", 
"insolvencyDate": "2018-06-23T09:32:03.524Z", 
"employmentStartDate": "2011-02-03T09:32:03.524Z", 
"dismissalDate": "2018-06-23T09:32:03.524Z", 
"dateNoticeGiven": "2018-06-23T09:32:03.524Z", 
"unpaidPeriodFrom": "2018-06-10T09:32:03.525Z", 
"unpaidPeriodTo": "2018-06-23T09:32:03.525Z", 
"apClaimAmount":600, 
"isTaxable": true, 
"payDay": 6, 
"shiftPattern": ["1","2","3","4","5"], 
"weeklyWage": 100.00 }
] 
}         
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "ap": {
    "selectedInputSource": "rp14a",
    "rP1ResultsList": {
      "inputSource": "rp1",
      "statutoryMax": 508,
      "dngApplied": false,
      "runNWNP": false,
      "weeklyResult": [
        {
          "weekNumber": 1,
          "payDate": "2018-06-16T00:00:00Z",
          "apPayRate": 300,
          "maximumEntitlement": 508,
          "employerEntitlement": 300,
          "grossEntitlement": 300,
          "isTaxable": true,
          "taxDeducted": 60,
          "niDeducted": 16.08,
          "netEntitlement": 223.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 300,
          "grossEntitlementIn4Months": 300,
          "isSelected": false
        },
        {
          "weekNumber": 2,
          "payDate": "2018-06-23T00:00:00Z",
          "apPayRate": 300,
          "maximumEntitlement": 508,
          "employerEntitlement": 300,
          "grossEntitlement": 300,
          "isTaxable": true,
          "taxDeducted": 60,
          "niDeducted": 16.08,
          "netEntitlement": 223.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 300,
          "grossEntitlementIn4Months": 300,
          "isSelected": false
        }
      ]
    },
    "rP14aResultsList": {
      "inputSource": "rp14a",
      "statutoryMax": 508,
      "dngApplied": false,
      "runNWNP": false,
      "weeklyResult": [
	          {
          "weekNumber": 1,
          "payDate": "2018-06-16T00:00:00Z",
          "apPayRate": 300,
          "maximumEntitlement": 508,
          "employerEntitlement": 300,
          "grossEntitlement": 300,
          "isTaxable": true,
          "taxDeducted": 60,
          "niDeducted": 16.08,
          "netEntitlement": 223.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 300,
          "grossEntitlementIn4Months": 300,
          "isSelected": true
        },
        {
          "weekNumber": 2,
          "payDate": "2018-06-23T00:00:00Z",
          "apPayRate": 300,
          "maximumEntitlement": 508,
          "employerEntitlement": 300,
          "grossEntitlement": 300,
          "isTaxable": true,
          "taxDeducted": 60,
          "niDeducted": 16.08,
          "netEntitlement": 223.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 300,
          "grossEntitlementIn4Months": 300,
          "isSelected": true
		  }
        ]
    }
  },
  "pa": null
}
"""

@AutomationTest
Scenario: AP Claim Amount Lower Than Wages
# Test include a payload for Arrears Of Pay only
# Tests that when the claim amount is lower than the weekly wage then the entitlement is adjusted
	When I post to the APPA endpoint with:
"""
{
"rp1NotRequired": false,
"rp14aNotRequired": false,
"ap": [ 
{ 
"inputSource": "rp1", 
"insolvencyDate": "2018-06-23T09:32:03.524Z", 
"employmentStartDate": "2011-02-03T09:32:03.524Z", 
"dismissalDate": "2018-06-23T09:32:03.524Z", 
"dateNoticeGiven": "2018-06-23T09:32:03.524Z", 
"unpaidPeriodFrom": "2018-06-10T09:32:03.525Z", 
"unpaidPeriodTo": "2018-06-23T09:32:03.525Z", 
"apClaimAmount":200, 
"isTaxable": true, 
"payDay": 6, 
"shiftPattern": ["1","2","3","4","5"], 
"weeklyWage": 300.00 },
{ 
"inputSource": "rp14a", 
"insolvencyDate": "2018-06-23T09:32:03.524Z", 
"employmentStartDate": "2011-02-03T09:32:03.524Z", 
"dismissalDate": "2018-06-23T09:32:03.524Z", 
"dateNoticeGiven": "2018-06-23T09:32:03.524Z", 
"unpaidPeriodFrom": "2018-06-10T09:32:03.525Z", 
"unpaidPeriodTo": "2018-06-23T09:32:03.525Z", 
"apClaimAmount":200, 
"isTaxable": true, 
"payDay": 6, 
"shiftPattern": ["1","2","3","4","5"], 
"weeklyWage": 300.00 }
] 
}         
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "ap": {
    "selectedInputSource": "rp1",
    "rP1ResultsList": {
      "inputSource": "rp1",
      "statutoryMax": 508,
      "dngApplied": false,
      "runNWNP": false,
      "weeklyResult": [
        {
          "weekNumber": 1,
          "payDate": "2018-06-16T00:00:00Z",
          "apPayRate": 100,
          "maximumEntitlement": 508,
          "employerEntitlement": 100,
          "grossEntitlement": 100,
          "isTaxable": true,
          "taxDeducted": 20,
          "niDeducted": 0,
          "netEntitlement": 80,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 100,
          "grossEntitlementIn4Months": 100,
          "isSelected": false
        },
        {
          "weekNumber": 2,
          "payDate": "2018-06-23T00:00:00Z",
          "apPayRate": 100,
          "maximumEntitlement": 508,
          "employerEntitlement": 100,
          "grossEntitlement": 100,
          "isTaxable": true,
          "taxDeducted": 20,
          "niDeducted": 0,
          "netEntitlement": 80,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 100,
          "grossEntitlementIn4Months": 100,
          "isSelected": false
        }
      ]
    },
    "rP14aResultsList": {
      "inputSource": "rp14a",
      "statutoryMax": 508,
      "dngApplied": false,
      "runNWNP": false,
      "weeklyResult": [
	    {
          "weekNumber": 1,
          "payDate": "2018-06-16T00:00:00Z",
          "apPayRate": 100,
          "maximumEntitlement": 508,
          "employerEntitlement": 100,
          "grossEntitlement": 100,
          "isTaxable": true,
          "taxDeducted": 20,
          "niDeducted": 0,
          "netEntitlement": 80,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 100,
          "grossEntitlementIn4Months": 100,
          "isSelected": true
        },
        {
          "weekNumber": 2,
          "payDate": "2018-06-23T00:00:00Z",
          "apPayRate": 100,
          "maximumEntitlement": 508,
          "employerEntitlement": 100,
          "grossEntitlement": 100,
          "isTaxable": true,
          "taxDeducted": 20,
          "niDeducted": 0,
          "netEntitlement": 80,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 100,
          "grossEntitlementIn4Months": 100,
          "isSelected": true
        }
	  ]
    }
  },
  "pa": null
}
"""

@AutomationTest
Scenario: AP Selection Based on Wages
# Test include a payload for Arrears Of Pay only
# Tests that when the claim amount is lower on the rp14a form then the rp14a is selected
	When I post to the APPA endpoint with:
"""
{
"rp1NotRequired": false,
"rp14aNotRequired": false,
"ap": [ 
{ 
"inputSource": "rp1", 
"insolvencyDate": "2018-06-23T09:32:03.524Z", 
"employmentStartDate": "2011-02-03T09:32:03.524Z", 
"dismissalDate": "2018-06-23T09:32:03.524Z", 
"dateNoticeGiven": "2018-06-23T09:32:03.524Z", 
"unpaidPeriodFrom": "2018-06-10T09:32:03.525Z", 
"unpaidPeriodTo": "2018-06-23T09:32:03.525Z", 
"apClaimAmount":600, 
"isTaxable": true, 
"payDay": 6, 
"shiftPattern": ["1","2","3","4","5"], 
"weeklyWage": 200.00 
},
{ 
"inputSource": "rp14a", 
"insolvencyDate": "2018-06-23T09:32:03.524Z", 
"employmentStartDate": "2011-02-03T09:32:03.524Z", 
"dismissalDate": "2018-06-23T09:32:03.524Z", 
"dateNoticeGiven": "2018-06-23T09:32:03.524Z", 
"unpaidPeriodFrom": "2018-06-10T09:32:03.525Z", 
"unpaidPeriodTo": "2018-06-23T09:32:03.525Z", 
"apClaimAmount":400, 
"isTaxable": true, 
"payDay": 6, 
"shiftPattern": ["1","2","3","4","5"], 
"weeklyWage": 200.00 
}
]
}       
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "ap": {
    "selectedInputSource": "rp14a",
    "rP1ResultsList": {
      "inputSource": "rp1",
      "statutoryMax": 508,
      "dngApplied": false,
      "runNWNP": false,
      "weeklyResult": [
        {
          "weekNumber": 1,
          "payDate": "2018-06-16T00:00:00Z",
          "apPayRate": 300,
          "maximumEntitlement": 508,
          "employerEntitlement": 300,
          "grossEntitlement": 300,
          "isTaxable": true,
          "taxDeducted": 60,
          "niDeducted": 16.08,
          "netEntitlement": 223.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 300,
          "grossEntitlementIn4Months": 300,
          "isSelected": false
        },
        {
          "weekNumber": 2,
          "payDate": "2018-06-23T00:00:00Z",
          "apPayRate": 300,
          "maximumEntitlement": 508,
          "employerEntitlement": 300,
          "grossEntitlement": 300,
          "isTaxable": true,
          "taxDeducted": 60,
          "niDeducted": 16.08,
          "netEntitlement": 223.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 300,
          "grossEntitlementIn4Months": 300,
          "isSelected": false
        }
      ]
    },
    "rP14aResultsList": {
      "inputSource": "rp14a",
      "statutoryMax": 508,
      "dngApplied": false,
      "runNWNP": false,
      "weeklyResult": [{
          "weekNumber": 1,
          "payDate": "2018-06-16T00:00:00Z",
          "apPayRate": 200,
          "maximumEntitlement": 508,
          "employerEntitlement": 200,
          "grossEntitlement": 200,
          "isTaxable": true,
          "taxDeducted": 40,
          "niDeducted": 4.08,
          "netEntitlement": 155.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 200,
          "grossEntitlementIn4Months": 200,
          "isSelected": true
        },
        {
          "weekNumber": 2,
          "payDate": "2018-06-23T00:00:00Z",
          "apPayRate": 200,
          "maximumEntitlement": 508,
          "employerEntitlement": 200,
          "grossEntitlement": 200,
          "isTaxable": true,
          "taxDeducted": 40,
          "niDeducted": 4.08,
          "netEntitlement": 155.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 200,
          "grossEntitlementIn4Months": 200,
          "isSelected": true
        }]
    }
  },
  "pa": null
}
"""

@AutomationTest
Scenario: AP Selection Based on Length of Claim
# Test include a payload for Arrears Of Pay only
# Tests that when the claim length is lower on the rp1 form then the rp1 is selected
	When I post to the APPA endpoint with:
"""
{
"rp1NotRequired": false,
"rp14aNotRequired": false,
"ap": [ 
{ 
"inputSource": "rp1", 
"insolvencyDate": "2018-06-23T09:32:03.524Z", 
"employmentStartDate": "2011-02-03T09:32:03.524Z", 
"dismissalDate": "2018-06-23T09:32:03.524Z", 
"dateNoticeGiven": "2018-06-23T09:32:03.524Z", 
"unpaidPeriodFrom": "2018-06-10T09:32:03.525Z", 
"unpaidPeriodTo": "2018-06-16T09:32:03.525Z", 
"apClaimAmount":300, 
"isTaxable": true, 
"payDay": 6, 
"shiftPattern": ["1","2","3","4","5"], 
"weeklyWage": 300.00 
},
{ 
"inputSource": "rp14a", 
"insolvencyDate": "2018-06-23T09:32:03.524Z", 
"employmentStartDate": "2011-02-03T09:32:03.524Z", 
"dismissalDate": "2018-06-23T09:32:03.524Z", 
"dateNoticeGiven": "2018-06-23T09:32:03.524Z", 
"unpaidPeriodFrom": "2018-06-10T09:32:03.525Z", 
"unpaidPeriodTo": "2018-06-23T09:32:03.525Z", 
"apClaimAmount":600, 
"isTaxable": true, 
"payDay": 6, 
"shiftPattern": ["1","2","3","4","5"], 
"weeklyWage": 300.00 
}
]
}       
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "ap": {
    "selectedInputSource": "rp1",
    "rP1ResultsList": {
      "inputSource": "rp1",
      "statutoryMax": 508,
      "dngApplied": false,
      "runNWNP": false,
      "weeklyResult": [
        {
          "weekNumber": 1,
          "payDate": "2018-06-16T00:00:00Z",
          "apPayRate": 300,
          "maximumEntitlement": 508,
          "employerEntitlement": 300,
          "grossEntitlement": 300,
          "isTaxable": true,
          "taxDeducted": 60,
          "niDeducted": 16.08,
          "netEntitlement": 223.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 300,
          "grossEntitlementIn4Months": 300,
          "isSelected": true
        }
      ]
    },
    "rP14aResultsList": {
      "inputSource": "rp14a",
      "statutoryMax": 508,
      "dngApplied": false,
      "runNWNP": false,
      "weeklyResult": [{
          "weekNumber": 1,
          "payDate": "2018-06-16T00:00:00Z",
          "apPayRate": 300,
          "maximumEntitlement": 508,
          "employerEntitlement": 300,
          "grossEntitlement": 300,
          "isTaxable": true,
          "taxDeducted": 60,
          "niDeducted": 16.08,
          "netEntitlement": 223.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 300,
          "grossEntitlementIn4Months": 300,
          "isSelected": false
        },
        {
          "weekNumber": 2,
          "payDate": "2018-06-23T00:00:00Z",
          "apPayRate": 300,
          "maximumEntitlement": 508,
          "employerEntitlement": 300,
          "grossEntitlement": 300,
          "isTaxable": true,
          "taxDeducted": 60,
          "niDeducted": 16.08,
          "netEntitlement": 223.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 300,
          "grossEntitlementIn4Months": 300,
          "isSelected": false
        }
		]
    }
  },
  "pa": null
}
"""

@AutomationTest
Scenario: AP Tax Set to False
# Test include a payload for Arrears Of Pay only
# Tests that when the is taxable flag is set to false no tax or ni is charged
	When I post to the APPA endpoint with:
"""
{
"rp1NotRequired": false,
"rp14aNotRequired": false,
"ap": [ 
{ 
"inputSource": "rp1", 
"insolvencyDate": "2018-06-23T09:32:03.524Z", 
"employmentStartDate": "2011-02-03T09:32:03.524Z", 
"dismissalDate": "2018-06-23T09:32:03.524Z", 
"dateNoticeGiven": "2018-06-23T09:32:03.524Z", 
"unpaidPeriodFrom": "2018-06-10T09:32:03.525Z", 
"unpaidPeriodTo": "2018-06-23T09:32:03.525Z", 
"apClaimAmount":600, 
"isTaxable": false, 
"payDay": 6, 
"shiftPattern": ["1","2","3","4","5"], 
"weeklyWage": 300.00 },
{ 
"inputSource": "rp14a", 
"insolvencyDate": "2018-06-23T09:32:03.524Z", 
"employmentStartDate": "2011-02-03T09:32:03.524Z", 
"dismissalDate": "2018-06-23T09:32:03.524Z", 
"dateNoticeGiven": "2018-06-23T09:32:03.524Z", 
"unpaidPeriodFrom": "2018-06-10T09:32:03.525Z", 
"unpaidPeriodTo": "2018-06-23T09:32:03.525Z", 
"apClaimAmount":600, 
"isTaxable": false, 
"payDay": 6, 
"shiftPattern": ["1","2","3","4","5"], 
"weeklyWage": 300.00 }
] 
}         
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "ap": {
    "selectedInputSource": "rp14a",
    "rP1ResultsList": {
      "inputSource": "rp1",
      "statutoryMax": 508,
      "dngApplied": false,
      "runNWNP": false,
      "weeklyResult": [
        {
          "weekNumber": 1,
          "payDate": "2018-06-16T00:00:00Z",
          "apPayRate": 300,
          "maximumEntitlement": 508,
          "employerEntitlement": 300,
          "grossEntitlement": 300,
          "isTaxable": false,
          "taxDeducted": 0,
          "niDeducted": 0,
          "netEntitlement": 300,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 300,
          "grossEntitlementIn4Months": 300,
          "isSelected": false
        },
        {
          "weekNumber": 2,
          "payDate": "2018-06-23T00:00:00Z",
          "apPayRate": 300,
          "maximumEntitlement": 508,
          "employerEntitlement": 300,
          "grossEntitlement": 300,
          "isTaxable": false,
          "taxDeducted": 0,
          "niDeducted": 0,
          "netEntitlement": 300,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 300,
          "grossEntitlementIn4Months": 300,
          "isSelected": false
        }
      ]
    },
    "rP14aResultsList": {
      "inputSource": "rp14a",
      "statutoryMax": 508,
      "dngApplied": false,
      "runNWNP": false,
      "weeklyResult": [
        {
          "weekNumber": 1,
          "payDate": "2018-06-16T00:00:00Z",
          "apPayRate": 300,
          "maximumEntitlement": 508,
          "employerEntitlement": 300,
          "grossEntitlement": 300,
          "isTaxable": false,
          "taxDeducted": 0,
          "niDeducted": 0,
          "netEntitlement": 300,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 300,
          "grossEntitlementIn4Months": 300,
          "isSelected": true
        },
        {
          "weekNumber": 2,
          "payDate": "2018-06-23T00:00:00Z",
          "apPayRate": 300,
          "maximumEntitlement": 508,
          "employerEntitlement": 300,
          "grossEntitlement": 300,
          "isTaxable": false,
          "taxDeducted": 0,
          "niDeducted": 0,
          "netEntitlement": 300,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 300,
          "grossEntitlementIn4Months": 300,
          "isSelected":true
        }	  
	  ]
    }
  },
  "pa": null
}
"""

@AutomationTest
Scenario: AP Date Notice Given
# Test include a payload for Arrears Of Pay only
# Tests that when a claim is past the date of notice given then the weekly wage is no longer paid
	When I post to the APPA endpoint with:
"""
{
"rp1NotRequired": false,
"rp14aNotRequired": false,
"ap": [ 
{ 
"inputSource": "rp1", 
"insolvencyDate": "2018-06-23T09:32:03.524Z", 
"employmentStartDate": "2011-02-03T09:32:03.524Z", 
"dismissalDate": "2018-06-23T09:32:03.524Z", 
"dateNoticeGiven": "2018-06-16T09:32:03.524Z", 
"unpaidPeriodFrom": "2018-06-10T09:32:03.525Z", 
"unpaidPeriodTo": "2018-06-23T09:32:03.525Z", 
"apClaimAmount":600, 
"isTaxable": true, 
"payDay": 6, 
"shiftPattern": ["1","2","3","4","5"], 
"weeklyWage": 100.00 
},
{ 
"inputSource": "rp14a", 
"insolvencyDate": "2018-06-23T09:32:03.524Z", 
"employmentStartDate": "2011-02-03T09:32:03.524Z", 
"dismissalDate": "2018-06-23T09:32:03.524Z", 
"dateNoticeGiven": "2018-06-16T09:32:03.524Z", 
"unpaidPeriodFrom": "2018-06-10T09:32:03.525Z", 
"unpaidPeriodTo": "2018-06-23T09:32:03.525Z", 
"apClaimAmount":600, 
"isTaxable": true, 
"payDay": 6, 
"shiftPattern": ["1","2","3","4","5"], 
"weeklyWage": 100.00
}
] 
}         
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "ap": {
    "selectedInputSource": "rp14a",
    "rP1ResultsList": {
      "inputSource": "rp1",
      "statutoryMax": 508,
      "dngApplied": true,
      "runNWNP": true,
      "weeklyResult": [
        {
          "weekNumber": 1,
          "payDate": "2018-06-16T00:00:00Z",
          "apPayRate": 300,
          "maximumEntitlement": 508,
          "employerEntitlement": 300,
          "grossEntitlement": 300,
          "isTaxable": true,
          "taxDeducted": 60,
          "niDeducted": 16.08,
          "netEntitlement": 223.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 300,
          "grossEntitlementIn4Months": 300,
          "isSelected": false
        },
        {
          "weekNumber": 2,
          "payDate": "2018-06-23T00:00:00Z",
          "apPayRate": 300,
          "maximumEntitlement": 508,
          "employerEntitlement": 0,
          "grossEntitlement": 0,
          "isTaxable": true,
          "taxDeducted": 0,
          "niDeducted": 0,
          "netEntitlement": 0,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 200,
          "grossEntitlementIn4Months": 200,
          "isSelected": false
        }
      ]
    },
    "rP14aResultsList": {
      "inputSource": "rp14a",
      "statutoryMax": 508,
      "dngApplied": true,
      "runNWNP": true,
      "weeklyResult": [
        {
          "weekNumber": 1,
          "payDate": "2018-06-16T00:00:00Z",
          "apPayRate": 300,
          "maximumEntitlement": 508,
          "employerEntitlement": 300,
          "grossEntitlement": 300,
          "isTaxable": true,
          "taxDeducted": 60,
          "niDeducted": 16.08,
          "netEntitlement": 223.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 300,
          "grossEntitlementIn4Months": 300,
          "isSelected": true
        },
        {
          "weekNumber": 2,
          "payDate": "2018-06-23T00:00:00Z",
          "apPayRate": 300,
          "maximumEntitlement": 508,
          "employerEntitlement": 0,
          "grossEntitlement": 0,
          "isTaxable": true,
          "taxDeducted": 0,
          "niDeducted": 0,
          "netEntitlement": 0,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 200,
          "grossEntitlementIn4Months": 200,
          "isSelected": true
        }
	]
    }
  },
  "pa": null
}
"""

@AutomationTest
Scenario: AP Multiple Periods in Claim
# Test include a payload for Arrears Of Pay only
# Tests that when multiple periods are claimed for they are paid out
	When I post to the APPA endpoint with:
"""
{
"rp1NotRequired": false,
"rp14aNotRequired": false,
"ap": [ 
{ 
"inputSource": "rp1", 
"insolvencyDate": "2018-06-30T09:32:03.524Z", 
"employmentStartDate": "2011-02-03T09:32:03.524Z", 
"dismissalDate": "2018-06-30T09:32:03.524Z", 
"dateNoticeGiven": "2018-06-30T09:32:03.524Z", 
"unpaidPeriodFrom": "2018-06-10T09:32:03.525Z", 
"unpaidPeriodTo": "2018-06-16T09:32:03.525Z", 
"apClaimAmount":300, 
"isTaxable": true, 
"payDay": 6, 
"shiftPattern": ["1","2","3","4","5"], 
"weeklyWage": 300.00 },
{ 
"inputSource": "rp1", 
"insolvencyDate": "2018-06-30T09:32:03.524Z", 
"employmentStartDate": "2011-02-03T09:32:03.524Z", 
"dismissalDate": "2018-06-30T09:32:03.524Z", 
"dateNoticeGiven": "2018-06-30T09:32:03.524Z", 
"unpaidPeriodFrom": "2018-06-24T09:32:03.525Z", 
"unpaidPeriodTo": "2018-06-30T09:32:03.525Z", 
"apClaimAmount":300, 
"isTaxable": true, 
"payDay": 6, 
"shiftPattern": ["1","2","3","4","5"], 
"weeklyWage": 300.00 },
{ 
"inputSource": "rp14a", 
"insolvencyDate": "2018-06-30T09:32:03.524Z", 
"employmentStartDate": "2011-02-03T09:32:03.524Z", 
"dismissalDate": "2018-06-30T09:32:03.524Z", 
"dateNoticeGiven": "2018-06-30T09:32:03.524Z", 
"unpaidPeriodFrom": "2018-06-10T09:32:03.525Z", 
"unpaidPeriodTo": "2018-06-16T09:32:03.525Z", 
"apClaimAmount":300, 
"isTaxable": true, 
"payDay": 6, 
"shiftPattern": ["1","2","3","4","5"], 
"weeklyWage": 300.00 },
{ 
"inputSource": "rp14a", 
"insolvencyDate": "2018-06-30T09:32:03.524Z", 
"employmentStartDate": "2011-02-03T09:32:03.524Z", 
"dismissalDate": "2018-06-30T09:32:03.524Z", 
"dateNoticeGiven": "2018-06-30T09:32:03.524Z", 
"unpaidPeriodFrom": "2018-06-24T09:32:03.525Z", 
"unpaidPeriodTo": "2018-06-30T09:32:03.525Z", 
"apClaimAmount":300, 
"isTaxable": true, 
"payDay": 6, 
"shiftPattern": ["1","2","3","4","5"], 
"weeklyWage": 300.00 }
] 
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "ap": {
    "selectedInputSource": "rp1",
    "rP1ResultsList": {
      "inputSource": "rp1",
      "statutoryMax": 508,
      "dngApplied": false,
      "runNWNP": false,
      "weeklyResult": [
        {
          "weekNumber": 1,
          "payDate": "2018-06-16T00:00:00Z",
          "apPayRate": 300,
          "maximumEntitlement": 508,
          "employerEntitlement": 300,
          "grossEntitlement": 300,
          "isTaxable": true,
          "taxDeducted": 60,
          "niDeducted": 16.08,
          "netEntitlement": 223.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 300,
          "grossEntitlementIn4Months": 300,
          "isSelected": false
        },
        {
          "weekNumber": 2,
          "payDate": "2018-06-30T00:00:00Z",
          "apPayRate": 300,
          "maximumEntitlement": 508,
          "employerEntitlement": 300,
          "grossEntitlement": 300,
          "isTaxable": true,
          "taxDeducted": 60,
          "niDeducted": 16.08,
          "netEntitlement": 223.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 300,
          "grossEntitlementIn4Months": 300,
          "isSelected": false
        }
      ]
    },
    "rP14aResultsList": {
      "inputSource": "rp14a",
      "statutoryMax": 508,
      "dngApplied": false,
      "runNWNP": false,
      "weeklyResult": [
        {
          "weekNumber": 1,
          "payDate": "2018-06-16T00:00:00Z",
          "apPayRate": 300,
          "maximumEntitlement": 508,
          "employerEntitlement": 300,
          "grossEntitlement": 300,
          "isTaxable": true,
          "taxDeducted": 60,
          "niDeducted": 16.08,
          "netEntitlement": 223.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 300,
          "grossEntitlementIn4Months": 300,
          "isSelected": true
        },
        {
          "weekNumber": 2,
          "payDate": "2018-06-30T00:00:00Z",
          "apPayRate": 300,
          "maximumEntitlement": 508,
          "employerEntitlement": 300,
          "grossEntitlement": 300,
          "isTaxable": true,
          "taxDeducted": 60,
          "niDeducted": 16.08,
          "netEntitlement": 223.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 300,
          "grossEntitlementIn4Months": 300,
          "isSelected": true
        }	  
	  ]
    }
  },
  "pa": null
}
"""

@AutomationTest
Scenario: AP Multiple Periods Covering Same Week
# Test include a payload for Arrears Of Pay only
# Tests that when multiple periods are claimed for they are paid out
	When I post to the APPA endpoint with:
"""
{
"rp1NotRequired": false,
"rp14aNotRequired": false,
"ap": [ 
{ 
"inputSource": "rp1", 
"insolvencyDate": "2018-06-30T09:32:03.524Z", 
"employmentStartDate": "2011-02-03T09:32:03.524Z", 
"dismissalDate": "2018-06-30T09:32:03.524Z", 
"dateNoticeGiven": "2018-06-30T09:32:03.524Z", 
"unpaidPeriodFrom": "2018-06-24T09:32:03.525Z", 
"unpaidPeriodTo": "2018-06-27T09:32:03.525Z", 
"apClaimAmount":180, 
"isTaxable": true, 
"payDay": 6, 
"shiftPattern": ["1","2","3","4","5"], 
"weeklyWage": 300.00 },
{ 
"inputSource": "rp1", 
"insolvencyDate": "2018-06-30T09:32:03.524Z", 
"employmentStartDate": "2011-02-03T09:32:03.524Z", 
"dismissalDate": "2018-06-30T09:32:03.524Z", 
"dateNoticeGiven": "2018-06-30T09:32:03.524Z", 
"unpaidPeriodFrom": "2018-06-29T09:32:03.525Z", 
"unpaidPeriodTo": "2018-06-30T09:32:03.525Z", 
"apClaimAmount":60, 
"isTaxable": true, 
"payDay": 6, 
"shiftPattern": ["1","2","3","4","5"], 
"weeklyWage": 300.00 },
{ 
"inputSource": "rp14a", 
"insolvencyDate": "2018-06-30T09:32:03.524Z", 
"employmentStartDate": "2011-02-03T09:32:03.524Z", 
"dismissalDate": "2018-06-30T09:32:03.524Z", 
"dateNoticeGiven": "2018-06-30T09:32:03.524Z", 
"unpaidPeriodFrom": "2018-06-24T09:32:03.525Z", 
"unpaidPeriodTo": "2018-06-27T09:32:03.525Z", 
"apClaimAmount":180, 
"isTaxable": true, 
"payDay": 6, 
"shiftPattern": ["1","2","3","4","5"], 
"weeklyWage": 300.00 },
{ 
"inputSource": "rp14a", 
"insolvencyDate": "2018-06-30T09:32:03.524Z", 
"employmentStartDate": "2011-02-03T09:32:03.524Z", 
"dismissalDate": "2018-06-30T09:32:03.524Z", 
"dateNoticeGiven": "2018-06-30T09:32:03.524Z", 
"unpaidPeriodFrom": "2018-06-29T09:32:03.525Z", 
"unpaidPeriodTo": "2018-06-30T09:32:03.525Z", 
"apClaimAmount":60, 
"isTaxable": true, 
"payDay": 6, 
"shiftPattern": ["1","2","3","4","5"], 
"weeklyWage": 300.00 }
] 
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "ap": {
    "selectedInputSource": "rp14a",
    "rP1ResultsList": {
      "inputSource": "rp1",
      "statutoryMax": 508,
      "dngApplied": false,
      "runNWNP": false,
      "weeklyResult": [
        {
          "weekNumber": 1,
          "payDate": "2018-06-30T00:00:00Z",
          "apPayRate": 300,
          "maximumEntitlement": 508,
          "employerEntitlement": 240,
          "grossEntitlement": 240,
          "isTaxable": true,
          "taxDeducted": 48,
          "niDeducted": 8.88,
          "netEntitlement": 183.12,
          "maximumDays": 7,
          "employmentDays": 4,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 240,
          "grossEntitlementIn4Months": 240,
          "isSelected": false
        }
      ]
    },
    "rP14aResultsList": {
      "inputSource": "rp14a",
      "statutoryMax": 508,
      "dngApplied": false,
      "runNWNP": false,
      "weeklyResult": [
        {
          "weekNumber": 1,
          "payDate": "2018-06-30T00:00:00Z",
          "apPayRate": 300,
          "maximumEntitlement": 508,
          "employerEntitlement": 240,
          "grossEntitlement": 240,
          "isTaxable": true,
          "taxDeducted": 48,
          "niDeducted": 8.88,
          "netEntitlement": 183.12,
          "maximumDays": 7,
          "employmentDays": 4,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 240,
          "grossEntitlementIn4Months": 240,
          "isSelected": true
        }	  
	  ]
    }
  },
  "pa": null
}
"""

@AutomationTest
Scenario: AP Multiple Periods Overlapping
# Test include a payload for Arrears Of Pay only
# Tests that when multiple periods overlap  the calculation provides validation to prevent payment
	When I post to the APPA endpoint with:
"""
{
"rp1NotRequired": false,
"rp14aNotRequired": false,
"ap": [ 
{ 
"inputSource": "rp1", 
"insolvencyDate": "2018-06-30T09:32:03.524Z", 
"employmentStartDate": "2011-02-03T09:32:03.524Z", 
"dismissalDate": "2018-06-30T09:32:03.524Z", 
"dateNoticeGiven": "2018-06-30T09:32:03.524Z", 
"unpaidPeriodFrom": "2018-06-24T09:32:03.525Z", 
"unpaidPeriodTo": "2018-06-27T09:32:03.525Z", 
"apClaimAmount":180, 
"isTaxable": true, 
"payDay": 6, 
"shiftPattern": ["1","2","3","4","5"], 
"weeklyWage": 300.00 },
{ 
"inputSource": "rp1", 
"insolvencyDate": "2018-06-30T09:32:03.524Z", 
"employmentStartDate": "2011-02-03T09:32:03.524Z", 
"dismissalDate": "2018-06-30T09:32:03.524Z", 
"dateNoticeGiven": "2018-06-30T09:32:03.524Z", 
"unpaidPeriodFrom": "2018-06-27T09:32:03.525Z", 
"unpaidPeriodTo": "2018-06-30T09:32:03.525Z", 
"apClaimAmount":180, 
"isTaxable": true, 
"payDay": 6, 
"shiftPattern": ["1","2","3","4","5"], 
"weeklyWage": 300.00 }
] 
}
"""
	Then I get a response with status code "400"
	And the response contains "The same day appears in more than one Arrears Of Pay period"


@AutomationTest
Scenario: PA 90 Days Award 7 Day Working Pattern
# Test include a payload for Protective Award only
# Tests that when 90 days have been awarded on a 7 day working pattern then the final week is paid as 6/7s
	When I post to the APPA endpoint with:
"""
{
    "pa": {
    "insolvencyDate": "2017-09-30T11:45:11.791Z",
    "employmentStartDate": "2010-01-11T11:45:11.791Z",
    "dismissalDate": "2017-09-30T11:45:11.791Z",
    "tribunalAwardDate": "2017-09-30T11:45:11.791Z",
    "protectiveAwardStartDate": "2017-10-01T11:45:11.791Z",
    "protectiveAwardDays": 90,
    "payDay": 6,
    "weeklyWage": 350,
    "shiftPattern": ["0","1","2","3","4","5","6"]
  }
}    
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "ap": null,
  "pa": {
    "isTaxable": true,
	"statutoryMax": 489,
    "payLines": [
      {
        "weekNumber": 1,
        "payDate": "2017-10-07T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 70,
        "niDeducted": 22.08,
        "netEntitlement": 257.92,
        "isSelected": true,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 2,
        "payDate": "2017-10-14T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 70,
        "niDeducted": 22.08,
        "netEntitlement": 257.92,
        "isSelected": true,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 3,
        "payDate": "2017-10-21T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 70,
        "niDeducted": 22.08,
        "netEntitlement": 257.92,
        "isSelected": true,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 4,
        "payDate": "2017-10-28T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 70,
        "niDeducted": 22.08,
        "netEntitlement": 257.92,
        "isSelected": true,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 5,
        "payDate": "2017-11-04T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 70,
        "niDeducted": 22.08,
        "netEntitlement": 257.92,
        "isSelected": true,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 6,
        "payDate": "2017-11-11T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 70,
        "niDeducted": 22.08,
        "netEntitlement": 257.92,
        "isSelected": true,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 7,
        "payDate": "2017-11-18T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 70,
        "niDeducted": 22.08,
        "netEntitlement": 257.92,
        "isSelected": true,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 8,
        "payDate": "2017-11-25T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 70,
        "niDeducted": 22.08,
        "netEntitlement": 257.92,
        "isSelected": true,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 9,
        "payDate": "2017-12-02T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 70,
        "niDeducted": 22.08,
        "netEntitlement": 257.92,
        "isSelected": false,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 10,
        "payDate": "2017-12-09T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 70,
        "niDeducted": 22.08,
        "netEntitlement": 257.92,
        "isSelected": false,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 11,
        "payDate": "2017-12-16T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 70,
        "niDeducted": 22.08,
        "netEntitlement": 257.92,
        "isSelected": false,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 12,
        "payDate": "2017-12-23T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 70,
        "niDeducted": 22.08,
        "netEntitlement": 257.92,
        "isSelected": false,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 13,
        "payDate": "2017-12-30T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 300,
        "taxDeducted": 60,
        "niDeducted": 16.08,
        "netEntitlement": 223.92,
        "isSelected": false,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      }
    ]
  }
}         
"""

@AutomationTest
Scenario: PA 90 Days Award 5 Day Working Pattern
# Test include a payload for Protective Award only
# Tests that when 90 days have been awarded on a 5 day working pattern then the final week is paid as a full week
	When I post to the APPA endpoint with:
"""
{
    "pa": {
    "insolvencyDate": "2017-09-30T11:45:11.791Z",
    "employmentStartDate": "2010-01-11T11:45:11.791Z",
    "dismissalDate": "2017-09-30T11:45:11.791Z",
    "tribunalAwardDate": "2017-09-30T11:45:11.791Z",
    "protectiveAwardStartDate": "2017-10-01T11:45:11.791Z",
    "protectiveAwardDays": 90,
    "payDay": 6,
    "weeklyWage": 350,
    "shiftPattern": ["1","2","3","4","5"]
  }
}    
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "ap": null,
  "pa": {
    "isTaxable": true,
	"statutoryMax": 489,
    "payLines": [
      {
        "weekNumber": 1,
        "payDate": "2017-10-07T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 70,
        "niDeducted": 22.08,
        "netEntitlement": 257.92,
        "isSelected": true,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 2,
        "payDate": "2017-10-14T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 70,
        "niDeducted": 22.08,
        "netEntitlement": 257.92,
        "isSelected": true,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 3,
        "payDate": "2017-10-21T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 70,
        "niDeducted": 22.08,
        "netEntitlement": 257.92,
        "isSelected": true,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 4,
        "payDate": "2017-10-28T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 70,
        "niDeducted": 22.08,
        "netEntitlement": 257.92,
        "isSelected": true,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 5,
        "payDate": "2017-11-04T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 70,
        "niDeducted": 22.08,
        "netEntitlement": 257.92,
        "isSelected": true,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 6,
        "payDate": "2017-11-11T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 70,
        "niDeducted": 22.08,
        "netEntitlement": 257.92,
        "isSelected": true,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 7,
        "payDate": "2017-11-18T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 70,
        "niDeducted": 22.08,
        "netEntitlement": 257.92,
        "isSelected": true,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 8,
        "payDate": "2017-11-25T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 70,
        "niDeducted": 22.08,
        "netEntitlement": 257.92,
        "isSelected": true,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 9,
        "payDate": "2017-12-02T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 70,
        "niDeducted": 22.08,
        "netEntitlement": 257.92,
        "isSelected": false,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 10,
        "payDate": "2017-12-09T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 70,
        "niDeducted": 22.08,
        "netEntitlement": 257.92,
        "isSelected": false,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 11,
        "payDate": "2017-12-16T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 70,
        "niDeducted": 22.08,
        "netEntitlement": 257.92,
        "isSelected": false,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 12,
        "payDate": "2017-12-23T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 70,
        "niDeducted": 22.08,
        "netEntitlement": 257.92,
        "isSelected": false,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 13,
        "payDate": "2017-12-30T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 70,
        "niDeducted": 22.08,
        "netEntitlement": 257.92,
        "isSelected": false,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      }
    ]
  }
}         
"""

@AutomationTest
Scenario: PA 60 Days Award
# Test include a payload for Protective Award only
# Tests that when 60 days have been awarded then only 60 calendar days are covered in the payout
	When I post to the APPA endpoint with:
"""
{
    "pa": {
    "insolvencyDate": "2017-09-30T11:45:11.791Z",
    "employmentStartDate": "2010-01-11T11:45:11.791Z",
    "dismissalDate": "2017-09-30T11:45:11.791Z",
    "tribunalAwardDate": "2017-09-30T11:45:11.791Z",
    "protectiveAwardStartDate": "2017-10-01T11:45:11.791Z",
    "protectiveAwardDays": 60,
    "payDay": 6,
    "weeklyWage": 350,
    "shiftPattern": ["1","2","3","4","5"]
  }
}    
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "ap": null,
  "pa": {
    "isTaxable": true,
	"statutoryMax": 489,
    "payLines": [
      {
        "weekNumber": 1,
        "payDate": "2017-10-07T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 70,
        "niDeducted": 22.08,
        "netEntitlement": 257.92,
        "isSelected": true,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 2,
        "payDate": "2017-10-14T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 70,
        "niDeducted": 22.08,
        "netEntitlement": 257.92,
        "isSelected": true,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 3,
        "payDate": "2017-10-21T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 70,
        "niDeducted": 22.08,
        "netEntitlement": 257.92,
        "isSelected": true,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 4,
        "payDate": "2017-10-28T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 70,
        "niDeducted": 22.08,
        "netEntitlement": 257.92,
        "isSelected": true,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 5,
        "payDate": "2017-11-04T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 70,
        "niDeducted": 22.08,
        "netEntitlement": 257.92,
        "isSelected": true,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 6,
        "payDate": "2017-11-11T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 70,
        "niDeducted": 22.08,
        "netEntitlement": 257.92,
        "isSelected": true,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 7,
        "payDate": "2017-11-18T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 70,
        "niDeducted": 22.08,
        "netEntitlement": 257.92,
        "isSelected": true,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 8,
        "payDate": "2017-11-25T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 70,
        "niDeducted": 22.08,
        "netEntitlement": 257.92,
        "isSelected": true,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 9,
        "payDate": "2017-12-02T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 210,
        "taxDeducted": 42,
        "niDeducted": 5.28,
        "netEntitlement": 162.72,
        "isSelected": false,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      }
    ]
  }
}         
"""

@AutomationTest
Scenario: PA Benefits
# Test include a payload for Protective Award only
# Tests that when benefits have been declared the award is adjusted for the weeks declared
	When I post to the APPA endpoint with:
"""
{
    "pa": {
    "insolvencyDate": "2017-09-30T11:45:11.791Z",
    "employmentStartDate": "2010-01-11T11:45:11.791Z",
    "dismissalDate": "2017-09-30T11:45:11.791Z",
    "tribunalAwardDate": "2017-09-30T11:45:11.791Z",
    "protectiveAwardStartDate": "2017-10-01T11:45:11.791Z",
    "protectiveAwardDays": 90,
    "payDay": 6,
    "weeklyWage": 350,
    "shiftPattern": ["1","2","3","4","5"], 
    "benefits": [
      {
        "benefitStartDate": "2017-10-08T11:45:11.791Z",
        "benefitEndDate": "2017-10-21T11:45:11.791Z",
        "benefitAmount": 100
      },
	  {
        "benefitStartDate": "2017-12-10T11:45:11.791Z",
        "benefitEndDate": "2017-12-16T11:45:11.791Z",
        "benefitAmount": 400
      }
	]
  }
}    
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "ap": null,
  "pa": {
    "isTaxable": true,
	"statutoryMax": 489,
    "payLines": [
      {
        "weekNumber": 1,
        "payDate": "2017-10-07T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 70,
        "niDeducted": 22.08,
        "netEntitlement": 257.92,
        "isSelected": true,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 2,
        "payDate": "2017-10-14T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 70,
        "niDeducted": 22.08,
        "netEntitlement": 257.92,
        "isSelected": true,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 3,
        "payDate": "2017-10-21T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 70,
        "niDeducted": 22.08,
        "netEntitlement": 257.92,
        "isSelected": true,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 4,
        "payDate": "2017-10-28T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 70,
        "niDeducted": 22.08,
        "netEntitlement": 257.92,
        "isSelected": true,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 5,
        "payDate": "2017-11-04T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 70,
        "niDeducted": 22.08,
        "netEntitlement": 257.92,
        "isSelected": true,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 6,
        "payDate": "2017-11-11T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 70,
        "niDeducted": 22.08,
        "netEntitlement": 257.92,
        "isSelected": true,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 7,
        "payDate": "2017-11-18T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 70,
        "niDeducted": 22.08,
        "netEntitlement": 257.92,
        "isSelected": true,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 8,
        "payDate": "2017-11-25T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 70,
        "niDeducted": 22.08,
        "netEntitlement": 257.92,
        "isSelected": true,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 9,
        "payDate": "2017-12-02T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 70,
        "niDeducted": 22.08,
        "netEntitlement": 257.92,
        "isSelected": false,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 10,
        "payDate": "2017-12-09T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 70,
        "niDeducted": 22.08,
        "netEntitlement": 257.92,
        "isSelected": false,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 11,
        "payDate": "2017-12-16T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 70,
        "niDeducted": 22.08,
        "netEntitlement": 257.92,
        "isSelected": false,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 12,
        "payDate": "2017-12-23T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 70,
        "niDeducted": 22.08,
        "netEntitlement": 257.92,
        "isSelected": false,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 13,
        "payDate": "2017-12-30T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 70,
        "niDeducted": 22.08,
        "netEntitlement": 257.92,
        "isSelected": false,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      }
    ]
  }
}         
"""

@AutomationTest
Scenario: PA Not Taxable
# Test include a payload for Protective Award only
# Tests that when the dismissal date and tribunal award dates are in different tax years then tax is not applied to the awards
	When I post to the APPA endpoint with:
"""
{
    "pa": {
    "insolvencyDate": "2017-09-30T11:45:11.791Z",
    "employmentStartDate": "2010-01-11T11:45:11.791Z",
    "dismissalDate": "2017-09-30T11:45:11.791Z",
    "tribunalAwardDate": "2018-09-30T11:45:11.791Z",
    "protectiveAwardStartDate": "2017-10-01T11:45:11.791Z",
    "protectiveAwardDays": 90,
    "payDay": 6,
    "weeklyWage": 350,
    "shiftPattern": ["1","2","3","4","5"]
  }
}    
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "ap": null,
  "pa": {
    "isTaxable": false,
	"statutoryMax": 508,
    "payLines": [
      {
        "weekNumber": 1,
        "payDate": "2017-10-07T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 0,
        "niDeducted": 22.08,
        "netEntitlement": 327.92,
        "isSelected": true,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 2,
        "payDate": "2017-10-14T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 0,
        "niDeducted": 22.08,
        "netEntitlement": 327.92,
        "isSelected": true,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 3,
        "payDate": "2017-10-21T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 0,
        "niDeducted": 22.08,
        "netEntitlement": 327.92,
        "isSelected": true,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 4,
        "payDate": "2017-10-28T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 0,
        "niDeducted": 22.08,
        "netEntitlement": 327.92,
        "isSelected": true,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 5,
        "payDate": "2017-11-04T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 0,
        "niDeducted": 22.08,
        "netEntitlement": 327.92,
        "isSelected": true,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 6,
        "payDate": "2017-11-11T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 0,
        "niDeducted": 22.08,
        "netEntitlement": 327.92,
        "isSelected": true,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 7,
        "payDate": "2017-11-18T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 0,
        "niDeducted": 22.08,
        "netEntitlement": 327.92,
        "isSelected": true,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 8,
        "payDate": "2017-11-25T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 0,
        "niDeducted": 22.08,
        "netEntitlement": 327.92,
        "isSelected": true,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 9,
        "payDate": "2017-12-02T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 0,
        "niDeducted": 22.08,
        "netEntitlement": 327.92,
        "isSelected": false,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 10,
        "payDate": "2017-12-09T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 0,
        "niDeducted": 22.08,
        "netEntitlement": 327.92,
        "isSelected": false,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 11,
        "payDate": "2017-12-16T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 0,
        "niDeducted": 22.08,
        "netEntitlement": 327.92,
        "isSelected": false,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 12,
        "payDate": "2017-12-23T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 0,
        "niDeducted": 22.08,
        "netEntitlement": 327.92,
        "isSelected": false,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 13,
        "payDate": "2017-12-30T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 0,
        "niDeducted": 22.08,
        "netEntitlement": 327.92,
        "isSelected": false,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      }
    ]
  }
}         
"""

@AutomationTest
Scenario: PA 4 Month Rule
# Test include a payload for Protective Award only
# Tests that when the claim falls within the 4 month rule this is reflected in the payout
	When I post to the APPA endpoint with:
"""
{
    "pa": {
    "insolvencyDate": "2017-10-07T11:45:11.791Z",
    "employmentStartDate": "2010-01-11T11:45:11.791Z",
    "dismissalDate": "2017-09-30T11:45:11.791Z",
    "tribunalAwardDate": "2017-09-30T11:45:11.791Z",
    "protectiveAwardStartDate": "2017-10-01T11:45:11.791Z",
    "protectiveAwardDays": 90,
    "payDay": 6,
    "weeklyWage": 350,
    "shiftPattern": ["1","2","3","4","5"]
  }
}    
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "ap": null,
  "pa": {
    "isTaxable": true,
	"statutoryMax": 489,
    "payLines": [
      {
        "weekNumber": 1,
        "payDate": "2017-10-07T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 70,
        "niDeducted": 22.08,
        "netEntitlement": 257.92,
        "isSelected": true,
        "maximumEntitlementIn4MonthPeriod": 489,
        "employerEntitlementIn4MonthPeriod": 350,
        "grossEntitlementIn4Months": 350
      },
      {
        "weekNumber": 2,
        "payDate": "2017-10-14T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 70,
        "niDeducted": 22.08,
        "netEntitlement": 257.92,
        "isSelected": true,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 3,
        "payDate": "2017-10-21T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 70,
        "niDeducted": 22.08,
        "netEntitlement": 257.92,
        "isSelected": true,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 4,
        "payDate": "2017-10-28T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 70,
        "niDeducted": 22.08,
        "netEntitlement": 257.92,
        "isSelected": true,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 5,
        "payDate": "2017-11-04T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 70,
        "niDeducted": 22.08,
        "netEntitlement": 257.92,
        "isSelected": true,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 6,
        "payDate": "2017-11-11T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 70,
        "niDeducted": 22.08,
        "netEntitlement": 257.92,
        "isSelected": true,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 7,
        "payDate": "2017-11-18T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 70,
        "niDeducted": 22.08,
        "netEntitlement": 257.92,
        "isSelected": true,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 8,
        "payDate": "2017-11-25T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 70,
        "niDeducted": 22.08,
        "netEntitlement": 257.92,
        "isSelected": true,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 9,
        "payDate": "2017-12-02T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 70,
        "niDeducted": 22.08,
        "netEntitlement": 257.92,
        "isSelected": false,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 10,
        "payDate": "2017-12-09T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 70,
        "niDeducted": 22.08,
        "netEntitlement": 257.92,
        "isSelected": false,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 11,
        "payDate": "2017-12-16T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 70,
        "niDeducted": 22.08,
        "netEntitlement": 257.92,
        "isSelected": false,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 12,
        "payDate": "2017-12-23T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 70,
        "niDeducted": 22.08,
        "netEntitlement": 257.92,
        "isSelected": false,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 13,
        "payDate": "2017-12-30T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 350,
        "taxDeducted": 70,
        "niDeducted": 22.08,
        "netEntitlement": 257.92,
        "isSelected": false,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      }
    ]
  }
}         
"""

@AutomationTest
Scenario: PA Statutory Maximum
# Test include a payload for Protective Award only
# Tests that when the weekly wage is higher than the stat max then only the stat max is paid out
	When I post to the APPA endpoint with:
"""
{
    "pa": {
    "insolvencyDate": "2017-09-30T11:45:11.791Z",
    "employmentStartDate": "2010-01-11T11:45:11.791Z",
    "dismissalDate": "2017-09-30T11:45:11.791Z",
    "tribunalAwardDate": "2017-09-30T11:45:11.791Z",
    "protectiveAwardStartDate": "2017-10-01T11:45:11.791Z",
    "protectiveAwardDays": 90,
    "payDay": 6,
    "weeklyWage": 900,
    "shiftPattern": ["1","2","3","4","5"]
  }
}    
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "ap": null,
  "pa": {
    "isTaxable": true,
	"statutoryMax": 489,
    "payLines": [
      {
        "weekNumber": 1,
        "payDate": "2017-10-07T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 489,
        "taxDeducted": 97.8,
        "niDeducted": 38.76,
        "netEntitlement": 352.44,
        "isSelected": true,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 2,
        "payDate": "2017-10-14T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 489,
        "taxDeducted": 97.8,
        "niDeducted": 38.76,
        "netEntitlement": 352.44,
        "isSelected": true,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 3,
        "payDate": "2017-10-21T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 489,
        "taxDeducted": 97.8,
        "niDeducted": 38.76,
        "netEntitlement": 352.44,
        "isSelected": true,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 4,
        "payDate": "2017-10-28T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 489,
        "taxDeducted": 97.8,
        "niDeducted": 38.76,
        "netEntitlement": 352.44,
        "isSelected": true,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 5,
        "payDate": "2017-11-04T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 489,
        "taxDeducted": 97.8,
        "niDeducted": 38.76,
        "netEntitlement": 352.44,
        "isSelected": true,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 6,
        "payDate": "2017-11-11T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 489,
        "taxDeducted": 97.8,
        "niDeducted": 38.76,
        "netEntitlement": 352.44,
        "isSelected": true,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 7,
        "payDate": "2017-11-18T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 489,
        "taxDeducted": 97.8,
        "niDeducted": 38.76,
        "netEntitlement": 352.44,
        "isSelected": true,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 8,
        "payDate": "2017-11-25T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 489,
        "taxDeducted": 97.8,
        "niDeducted": 38.76,
        "netEntitlement": 352.44,
        "isSelected": true,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 9,
        "payDate": "2017-12-02T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 489,
        "taxDeducted": 97.8,
        "niDeducted": 38.76,
        "netEntitlement": 352.44,
        "isSelected": false,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 10,
        "payDate": "2017-12-09T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 489,
        "taxDeducted": 97.8,
        "niDeducted": 38.76,
        "netEntitlement": 352.44,
        "isSelected": false,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 11,
        "payDate": "2017-12-16T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 489,
        "taxDeducted": 97.8,
        "niDeducted": 38.76,
        "netEntitlement": 352.44,
        "isSelected": false,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 12,
        "payDate": "2017-12-23T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 489,
        "taxDeducted": 97.8,
        "niDeducted": 38.76,
        "netEntitlement": 352.44,
        "isSelected": false,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 13,
        "payDate": "2017-12-30T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 419.14,
        "taxDeducted": 83.83,
        "niDeducted": 30.38,
        "netEntitlement": 304.93,
        "isSelected": false,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      }
    ]
  }
}         
"""

@AutomationTest
Scenario: Composite APPA
# Test include a payload for Arrears of Pay and Protective Award
# Tests that when arrears of pay and protective award are claimed only the best 8 weeks are selected
	When I post to the APPA endpoint with:
"""
{
"rp1NotRequired": false,
"rp14aNotRequired": false,
"ap": [ 
{ 
"inputSource": "rp1", 
"insolvencyDate": "2018-06-23T09:32:03.524Z", 
"employmentStartDate": "2011-02-03T09:32:03.524Z", 
"dismissalDate": "2018-06-23T09:32:03.524Z", 
"dateNoticeGiven": "2018-06-23T09:32:03.524Z", 
"unpaidPeriodFrom": "2018-06-13T09:32:03.525Z", 
"unpaidPeriodTo": "2018-06-23T09:32:03.525Z", 
"apClaimAmount":480, 
"isTaxable": true, 
"payDay": 6, 
"shiftPattern": ["1","2","3","4","5"], 
"weeklyWage": 300.00 },
{ 
"inputSource": "rp14a", 
"insolvencyDate": "2018-06-23T09:32:03.524Z", 
"employmentStartDate": "2011-02-03T09:32:03.524Z", 
"dismissalDate": "2018-06-23T09:32:03.524Z", 
"dateNoticeGiven": "2018-06-23T09:32:03.524Z", 
"unpaidPeriodFrom": "2018-06-13T09:32:03.525Z", 
"unpaidPeriodTo": "2018-06-23T09:32:03.525Z", 
"apClaimAmount":480, 
"isTaxable": true, 
"payDay": 6, 
"shiftPattern": ["1","2","3","4","5"], 
"weeklyWage": 300.00 }
],
    "pa": {
    "insolvencyDate": "2018-06-23T11:45:11.791Z",
    "employmentStartDate": "2011-02-03T11:45:11.791Z",
    "dismissalDate": "2018-06-23T11:45:11.791Z",
    "tribunalAwardDate": "2018-06-24T11:45:11.791Z",
    "protectiveAwardStartDate": "2018-06-24T11:45:11.791Z",
    "protectiveAwardDays": 90,
    "payDay": 6,
    "weeklyWage": 300,
    "shiftPattern": ["1","2","3","4","5"], 
    "benefits": [
      {
        "benefitStartDate": "2018-06-24T11:45:11.791Z",
        "benefitEndDate": "2018-07-14T11:45:11.791Z",
        "benefitAmount": 150
      },
	  {
        "benefitStartDate": "2018-09-02T11:45:11.791Z",
        "benefitEndDate": "2018-09-15T11:45:11.791Z",
        "benefitAmount": 800
      },
	  {
        "benefitStartDate": "2018-09-16T11:45:11.791Z",
        "benefitEndDate": "2018-09-22T11:45:11.791Z",
        "benefitAmount": 50
      }
	]
  }
}    
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "ap": {
	"selectedInputSource": "rp14a",
    "rP1ResultsList": {
      "inputSource": "rp1",
      "statutoryMax": 508,
      "dngApplied": false,
      "runNWNP": false,
      "weeklyResult": [
        {
          "weekNumber": 1,
          "payDate": "2018-06-16T00:00:00Z",
          "apPayRate": 300,
          "maximumEntitlement": 508,
          "employerEntitlement": 180,
          "grossEntitlement": 180,
          "isTaxable": true,
          "taxDeducted": 36,
          "niDeducted": 1.68,
          "netEntitlement": 142.32,
          "maximumDays": 7,
          "employmentDays": 3,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 180,
          "grossEntitlementIn4Months": 180,
          "isSelected": false
        },
        {
          "weekNumber": 2,
          "payDate": "2018-06-23T00:00:00Z",
          "apPayRate": 300,
          "maximumEntitlement": 508,
          "employerEntitlement": 300,
          "grossEntitlement": 300,
          "isTaxable": true,
          "taxDeducted": 60,
          "niDeducted": 16.08,
          "netEntitlement": 223.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 300,
          "grossEntitlementIn4Months": 300,
          "isSelected": false
		  }
	 ]
  },
  "rP14aResultsList": {
	"inputSource": "rp14a",
	"statutoryMax": 508,
	"dngApplied": false,
	"runNWNP": false,
	"weeklyResult": [
        {
          "weekNumber": 1,
          "payDate": "2018-06-16T00:00:00Z",
          "apPayRate": 300,
          "maximumEntitlement": 508,
          "employerEntitlement": 180,
          "grossEntitlement": 180,
          "isTaxable": true,
          "taxDeducted": 36,
          "niDeducted": 1.68,
          "netEntitlement": 142.32,
          "maximumDays": 7,
          "employmentDays": 3,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 180,
          "grossEntitlementIn4Months": 180,
          "isSelected": false
        },
        {
          "weekNumber": 2,
          "payDate": "2018-06-23T00:00:00Z",
          "apPayRate": 300,
          "maximumEntitlement": 508,
          "employerEntitlement": 300,
          "grossEntitlement": 300,
          "isTaxable": true,
          "taxDeducted": 60,
          "niDeducted": 16.08,
          "netEntitlement": 223.92,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 300,
          "grossEntitlementIn4Months": 300,
          "isSelected": true
		  }	
	]
	}
	},
  "pa": {
    "isTaxable": true,
	"statutoryMax": 508,
    "payLines": [
      {
        "weekNumber": 1,
        "payDate": "2018-06-30T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 300,
        "taxDeducted": 60,
        "niDeducted": 16.08,
        "netEntitlement": 223.92,
        "isSelected": true,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 2,
        "payDate": "2018-07-07T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 300,
        "taxDeducted": 60,
        "niDeducted": 16.08,
        "netEntitlement": 223.92,
        "isSelected": true,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 3,
        "payDate": "2018-07-14T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 300,
        "taxDeducted": 60,
        "niDeducted": 16.08,
        "netEntitlement": 223.92,
        "isSelected": true,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 4,
        "payDate": "2018-07-21T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 300,
        "taxDeducted": 60,
        "niDeducted": 16.08,
        "netEntitlement": 223.92,
        "isSelected": true,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 5,
        "payDate": "2018-07-28T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 300,
        "taxDeducted": 60,
        "niDeducted": 16.08,
        "netEntitlement": 223.92,
        "isSelected": true,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 6,
        "payDate": "2018-08-04T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 300,
        "taxDeducted": 60,
        "niDeducted": 16.08,
        "netEntitlement": 223.92,
        "isSelected": true,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 7,
        "payDate": "2018-08-11T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 300,
        "taxDeducted": 60,
        "niDeducted": 16.08,
        "netEntitlement": 223.92,
        "isSelected": true,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 8,
        "payDate": "2018-08-18T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 300,
        "taxDeducted": 60,
        "niDeducted": 16.08,
        "netEntitlement": 223.92,
        "isSelected": false,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 9,
        "payDate": "2018-08-25T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 300,
        "taxDeducted": 60,
        "niDeducted": 16.08,
        "netEntitlement": 223.92,
        "isSelected": false,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 10,
        "payDate": "2018-09-01T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 300,
        "taxDeducted": 60,
        "niDeducted": 16.08,
        "netEntitlement": 223.92,
        "isSelected": false,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 11,
        "payDate": "2018-09-08T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 300,
        "taxDeducted": 60,
        "niDeducted": 16.08,
        "netEntitlement": 223.92,
        "isSelected": false,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 12,
        "payDate": "2018-09-15T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 300,
        "taxDeducted": 60,
        "niDeducted": 16.08,
        "netEntitlement": 223.92,
        "isSelected": false,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      },
      {
        "weekNumber": 13,
        "payDate": "2018-09-22T00:00:00Z",
        "benefitsClaimed": 0,
        "grossEntitlement": 300,
        "taxDeducted": 60,
        "niDeducted": 16.08,
        "netEntitlement": 223.92,
        "isSelected": false,
        "maximumEntitlementIn4MonthPeriod": 0,
        "employerEntitlementIn4MonthPeriod": 0,
        "grossEntitlementIn4Months": 0
      }
    ]
  }
}
"""
@AutomationTest
Scenario: AP RP1 not Required
# Test include a payload for Arrears Of Pay only
# Tests that when the rp1a not required flag is not set and ap contains rp14a then the rp14a can be calculated alone
	When I post to the APPA endpoint with:
"""
{
"rp1NotRequired": true,
"rp14aNotRequired": false,
"ap": [ 
{ 
"inputSource": "rp14a", 
"insolvencyDate": "2018-06-30T09:32:03.524Z", 
"employmentStartDate": "2011-02-03T09:32:03.524Z", 
"dismissalDate": "2018-06-23T09:32:03.524Z", 
"dateNoticeGiven": "2018-06-23T09:32:03.524Z", 
"unpaidPeriodFrom": "2018-06-10T09:32:03.525Z", 
"unpaidPeriodTo": "2018-06-30T09:32:03.525Z", 
"apClaimAmount":1200, 
"isTaxable": true, 
"payDay": 6, 
"shiftPattern": ["1","2","3","4","5"], 
"weeklyWage": 600.00 },
] 
}         
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "ap": {
    "selectedInputSource": "rp14a",
    "rP1ResultsList": {
      "inputSource": "rp1",
      "statutoryMax": 525,
      "dngApplied": false,
      "runNWNP": false,
      "weeklyResult": []
    },
    "rP14aResultsList": {
      "inputSource": "rp14a",
      "statutoryMax": 508,
      "dngApplied": false,
      "runNWNP": false,
      "weeklyResult": [
        {
          "weekNumber": 1,
          "payDate": "2018-06-16T00:00:00Z",
          "apPayRate": 600,
          "maximumEntitlement": 508,
          "employerEntitlement": 600,
          "grossEntitlement": 508,
          "isTaxable": true,
          "taxDeducted": 101.6,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 600,
          "grossEntitlementIn4Months": 508,
          "isSelected": true
        },
        {
          "weekNumber": 2,
          "payDate": "2018-06-23T00:00:00Z",
          "apPayRate": 600,
          "maximumEntitlement": 508,
          "employerEntitlement": 600,
          "grossEntitlement": 508,
          "isTaxable": true,
          "taxDeducted": 101.6,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 600,
          "grossEntitlementIn4Months": 508,
          "isSelected": true
        }
      ]
    }
  },
  "pa": null
}
"""

@AutomationTest
Scenario: AP RP14a not Required
# Test include a payload for Arrears Of Pay only
# Tests that when the rp14a not required flag is not set then the rp1 can be calculated alone
	When I post to the APPA endpoint with:
"""
{
"rp1NotRequired": false,
"rp14aNotRequired": true,
"ap": [ 
{ 
"inputSource": "rp1", 
"insolvencyDate": "2018-06-30T09:32:03.524Z", 
"employmentStartDate": "2011-02-03T09:32:03.524Z", 
"dismissalDate": "2018-06-23T09:32:03.524Z", 
"dateNoticeGiven": "2018-06-23T09:32:03.524Z", 
"unpaidPeriodFrom": "2018-06-10T09:32:03.525Z", 
"unpaidPeriodTo": "2018-06-30T09:32:03.525Z", 
"apClaimAmount":1200, 
"isTaxable": true, 
"payDay": 6, 
"shiftPattern": ["1","2","3","4","5"], 
"weeklyWage": 600.00 },
] 
}         
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "ap": {
    "selectedInputSource": "rp1",
    "rP1ResultsList": {
      "inputSource": "rp1",
      "statutoryMax": 508,
      "dngApplied": false,
      "runNWNP": false,
      "weeklyResult": [
        {
          "weekNumber": 1,
          "payDate": "2018-06-16T00:00:00Z",
          "apPayRate": 600,
          "maximumEntitlement": 508,
          "employerEntitlement": 600,
          "grossEntitlement": 508,
          "isTaxable": true,
          "taxDeducted": 101.6,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 600,
          "grossEntitlementIn4Months": 508,
          "isSelected": true
        },
        {
          "weekNumber": 2,
          "payDate": "2018-06-23T00:00:00Z",
          "apPayRate": 600,
          "maximumEntitlement": 508,
          "employerEntitlement": 600,
          "grossEntitlement": 508,
          "isTaxable": true,
          "taxDeducted": 101.6,
          "niDeducted": 41.04,
          "netEntitlement": 365.36,
          "maximumDays": 7,
          "employmentDays": 5,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 600,
          "grossEntitlementIn4Months": 508,
          "isSelected": true
        }
      ]
    },
    "rP14aResultsList": {
      "inputSource": "rp14a",
      "statutoryMax": 525,
      "dngApplied": false,
      "runNWNP": false,
      "weeklyResult": []
    }
  },
  "pa": null
}
"""

@AutomationTest
Scenario: AP RP14a Required
# Test include a payload for Arrears Of Pay only
# Tests that when the rp14a not required flag is set then validation is displayed
	When I post to the APPA endpoint with:
"""
{
"rp1NotRequired": false,
"rp14aNotRequired": false,
"ap": [ 
{ 
"inputSource": "rp1", 
"insolvencyDate": "2018-06-30T09:32:03.524Z", 
"employmentStartDate": "2011-02-03T09:32:03.524Z", 
"dismissalDate": "2018-06-23T09:32:03.524Z", 
"dateNoticeGiven": "2018-06-23T09:32:03.524Z", 
"unpaidPeriodFrom": "2018-06-10T09:32:03.525Z", 
"unpaidPeriodTo": "2018-06-30T09:32:03.525Z", 
"apClaimAmount":1200, 
"isTaxable": true, 
"payDay": 6, 
"shiftPattern": ["1","2","3","4","5"], 
"weeklyWage": 600.00 },
] 
}         
"""
	Then I get a response with status code "400"
	And the response contains "Arrears Of Pay RP14a data has not been provided"


@AutomationTest
Scenario: AP RP1 Required
# Test include a payload for Arrears Of Pay only
# Tests that when the rp14a not required flag is set then validation is displayed
	When I post to the APPA endpoint with:
"""
{
"rp14aNotRequired": true,
"ap": [ 
{ 
"inputSource": "rp14a", 
"insolvencyDate": "2018-06-30T09:32:03.524Z", 
"employmentStartDate": "2011-02-03T09:32:03.524Z", 
"dismissalDate": "2018-06-23T09:32:03.524Z", 
"dateNoticeGiven": "2018-06-23T09:32:03.524Z", 
"unpaidPeriodFrom": "2018-06-10T09:32:03.525Z", 
"unpaidPeriodTo": "2018-06-30T09:32:03.525Z", 
"apClaimAmount":1200, 
"isTaxable": true, 
"payDay": 6, 
"shiftPattern": ["1","2","3","4","5"], 
"weeklyWage": 600.00 },
] 
}         
"""
	Then I get a response with status code "400"
	And the response contains "Arrears Of Pay RP1 data has not been provided"