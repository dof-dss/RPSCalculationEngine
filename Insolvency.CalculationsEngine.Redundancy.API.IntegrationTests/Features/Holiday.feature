Feature: Holiday Composite
  scenarios around automated testing of the Holiday Composite Calculation via the Gateway API

@AutomationTest
Scenario: Test PingGet Method
  Given I want to test "aggpinggethpa" method
  When I make a request to the Holiday Composite Endpoint
  Then I get a response with status code "200"
  And the response contains "PingGet response from RPS Api Holiday"

@AutomationTest
Scenario: HTNP Tax Set to False
# Test includes Holiday Taken Not Paid payload only
# Tests that when isTaxable is set to False then no tax or ni are charged
	When I post to the Holiday endpoint with:
"""
{
"rp1NotRequired": false,
"rp14aNotRequired": false,
"htnp": [ 
{ 
"inputSource": "rp1",
"insolvencyDate": "2018-08-04T09:32:03.524Z",
"dismissalDate": "2018-10-05T09:32:03.524Z",
"unpaidPeriodFrom": "2018-07-28T09:32:03.525Z",
"unpaidPeriodTo": "2018-08-04T09:32:03.525Z",
"payDay": 6,
"shiftPattern": ["1","2","3","4","5"],
"weeklyWage": 446.57,
"isTaxable": false 
},
{ 
"inputSource": "rp14a",
"insolvencyDate": "2018-08-04T09:32:03.524Z",
"dismissalDate": "2018-10-05T09:32:03.524Z",
"unpaidPeriodFrom": "2018-07-28T09:32:03.525Z",
"unpaidPeriodTo": "2018-08-04T09:32:03.525Z",
"payDay": 6,
"shiftPattern": ["1","2","3","4","5"],
"weeklyWage": 446.57,
"isTaxable": false 
},
]
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
    "hpa": null,
    "htnp": {
        "selectedInputSource": "rp14a",
        "rP1ResultsList": {
            "inputSource": "rp1",
            "statutoryMax": 508,
            "weeklyResult": [
			                {
                    "weekNumber": 1,
                    "payDate": "2018-08-04T00:00:00Z",
                    "maximumEntitlement": 508,
                    "employerEntitlement": 446.57,
                    "isTaxable": false,
                    "maximumDays": 7,
                    "employmentDays": 5,
                    "grossEntitlement": 446.57,
                    "taxDeducted": 0,
                    "niDeducted": 0,
                    "netEntitlement": 446.57,
                    "grossEntitlementIn4Months": 446.57,
                    "isSelected": false,
                    "maximumEntitlementIn4MonthPeriod": 508,
                    "employerEntitlementIn4MonthPeriod": 446.57
                }
			]
        },
        "rP14aResultsList": {
            "inputSource": "rp14a",
            "statutoryMax": 508,
            "weeklyResult": [
                {
                    "weekNumber": 1,
                    "payDate": "2018-08-04T00:00:00Z",
                    "maximumEntitlement": 508,
                    "employerEntitlement": 446.57,
                    "isTaxable": false,
                    "maximumDays": 7,
                    "employmentDays": 5,
                    "grossEntitlement": 446.57,
                    "taxDeducted": 0,
                    "niDeducted": 0,
                    "netEntitlement": 446.57,
                    "grossEntitlementIn4Months": 446.57,
                    "isSelected": true,
                    "maximumEntitlementIn4MonthPeriod": 508,
                    "employerEntitlementIn4MonthPeriod": 446.57
                }
            ]
        }
    }
}
"""

@AutomationTest
Scenario: HTNP Tax Set to True
# Test includes Holiday Taken Not Paid payload only
# Tests that when isTaxable is set to True then tax and ni are charged
	When I post to the Holiday endpoint with:
"""
{
"rp1NotRequired": false,
"rp14aNotRequired": false,
"htnp": [ 
{ 
"inputSource": "rp1",
"insolvencyDate": "2018-08-04T09:32:03.524Z",
"dismissalDate": "2018-10-05T09:32:03.524Z",
"unpaidPeriodFrom": "2018-07-28T09:32:03.525Z",
"unpaidPeriodTo": "2018-08-04T09:32:03.525Z",
"payDay": 6,
"shiftPattern": ["1","2","3","4","5"],
"weeklyWage": 446.57,
"isTaxable": true 
},
{ 
"inputSource": "rp14a",
"insolvencyDate": "2018-08-04T09:32:03.524Z",
"dismissalDate": "2018-10-05T09:32:03.524Z",
"unpaidPeriodFrom": "2018-07-28T09:32:03.525Z",
"unpaidPeriodTo": "2018-08-04T09:32:03.525Z",
"payDay": 6,
"shiftPattern": ["1","2","3","4","5"],
"weeklyWage": 446.57,
"isTaxable": true 
},
]
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
    "hpa": null,
    "htnp": {
        "selectedInputSource": "rp14a",
        "rP1ResultsList": {
            "inputSource": "rp1",
            "statutoryMax": 508,
            "weeklyResult": [
			{
                    "weekNumber": 1,
                    "payDate": "2018-08-04T00:00:00Z",
                    "maximumEntitlement": 508,
                    "employerEntitlement": 446.57,
                    "isTaxable": true,
                    "maximumDays": 7,
                    "employmentDays": 5,
                    "grossEntitlement": 446.57,
                    "taxDeducted": 89.31,
                    "niDeducted": 33.67,
                    "netEntitlement": 323.59,
                    "grossEntitlementIn4Months": 446.57,
                    "isSelected": false,
                    "maximumEntitlementIn4MonthPeriod": 508,
                    "employerEntitlementIn4MonthPeriod": 446.57
                }
			]
        },
        "rP14aResultsList": {
            "inputSource": "rp14a",
            "statutoryMax": 508,
            "weeklyResult": [
                {
                    "weekNumber": 1,
                    "payDate": "2018-08-04T00:00:00Z",
                    "maximumEntitlement": 508,
                    "employerEntitlement": 446.57,
                    "isTaxable": true,
                    "maximumDays": 7,
                    "employmentDays": 5,
                    "grossEntitlement": 446.57,
                    "taxDeducted": 89.31,
                    "niDeducted": 33.67,
                    "netEntitlement": 323.59,
                    "grossEntitlementIn4Months": 446.57,
                    "isSelected": true,
                    "maximumEntitlementIn4MonthPeriod": 508,
                    "employerEntitlementIn4MonthPeriod": 446.57
                }
            ]
        }
    }
}
"""

Scenario: HTNP Shorter Period Selected
# Test includes Holiday Taken Not Paid payload only
# Tests that when the rp1 and the rp14a provides different period lengths then the shortest is selected
	When I post to the Holiday endpoint with:
"""
{
"rp1NotRequired": false,
"rp14aNotRequired": false,
"htnp": [ 
{ 
"inputSource": "rp1",
"insolvencyDate": "2018-08-11T09:32:03.524Z",
"dismissalDate": "2018-10-05T09:32:03.524Z",
"unpaidPeriodFrom": "2018-07-28T09:32:03.525Z",
"unpaidPeriodTo": "2018-08-11T09:32:03.525Z",
"payDay": 6,
"shiftPattern": ["1","2","3","4","5"],
"weeklyWage": 446.57,
"isTaxable": true 
},
{ 
"inputSource": "rp14a",
"insolvencyDate": "2018-08-11T09:32:03.524Z",
"dismissalDate": "2018-10-05T09:32:03.524Z",
"unpaidPeriodFrom": "2018-07-28T09:32:03.525Z",
"unpaidPeriodTo": "2018-08-04T09:32:03.525Z",
"payDay": 6,
"shiftPattern": ["1","2","3","4","5"],
"weeklyWage": 446.57,
"isTaxable": false 
},
]
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
    "hpa": null,
    "htnp": {
        "selectedInputSource": "rp14a",
        "rP1ResultsList": {
            "inputSource": "rp1",
            "statutoryMax": 508,
            "weeklyResult": [
				{
                    "weekNumber": 1,
                    "payDate": "2018-08-04T00:00:00Z",
                    "maximumEntitlement": 508,
                    "employerEntitlement": 446.57,
                    "isTaxable": true,
                    "maximumDays": 7,
                    "employmentDays": 5,
                    "grossEntitlement": 446.57,
                    "taxDeducted": 89.31,
                    "niDeducted": 33.67,
                    "netEntitlement": 323.59,
                    "grossEntitlementIn4Months": 446.57,
                    "isSelected": false,
                    "maximumEntitlementIn4MonthPeriod": 508,
                    "employerEntitlementIn4MonthPeriod": 446.57
                },
				{
                    "weekNumber": 2,
                    "payDate": "2018-08-11T00:00:00Z",
                    "maximumEntitlement": 508,
                    "employerEntitlement": 446.57,
                    "isTaxable": true,
                    "maximumDays": 7,
                    "employmentDays": 5,
                    "grossEntitlement": 446.57,
                    "taxDeducted": 89.31,
                    "niDeducted": 33.67,
                    "netEntitlement": 323.59,
                    "grossEntitlementIn4Months": 446.57,
                    "isSelected": false,
                    "maximumEntitlementIn4MonthPeriod": 508,
                    "employerEntitlementIn4MonthPeriod": 446.57
                }

			]
        },
        "rP14aResultsList": {
            "inputSource": "rp14a",
            "statutoryMax": 508,
            "weeklyResult": [
                {
                    "weekNumber": 1,
                    "payDate": "2018-08-04T00:00:00Z",
                    "maximumEntitlement": 508,
                    "employerEntitlement": 446.57,
                    "isTaxable": false,
                    "maximumDays": 7,
                    "employmentDays": 5,
                    "grossEntitlement": 446.57,
                    "taxDeducted": 0,
                    "niDeducted": 0,
                    "netEntitlement": 446.57,
                    "grossEntitlementIn4Months": 446.57,
                    "isSelected": true,
                    "maximumEntitlementIn4MonthPeriod": 508,
                    "employerEntitlementIn4MonthPeriod": 446.57
                }
            ]
        }
    }
}
"""

@AutomationTest
Scenario: HPA IP Confirmed Days 0
# Test includes Holiday Pay Accrued payload only
# Tests that when ipConfirmed Days is equal to 0 then no financial payout is awarded
	When I post to the Holiday endpoint with:
"""
{
"hpa": { 
"insolvencyDate": "2018-08-04",
"empStartDate": "2016-02-16",
"dismissalDate": "2018-8-04",
"contractedHolEntitlement": 28,
"holidayYearStart": "2018-01-01T01:00:00",
"isTaxable": "true",
"payDay": 6,
"shiftPattern": ["1","2","3","4","5"],
"weeklyWage":446.57 ,
"daysCFwd":0,
"daysTaken": 0,
"ipConfirmedDays": 0
}
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
    "hpa": {
        "statutoryMax": 508,
        "holidaysOwed": 28,
        "businessDaysInClaim": 261,
        "workingDaysInClaim": 155,
        "proRataAccruedDays": 0,
        "weeklyResults": []
    }
}
"""

@AutomationTest
Scenario: HPA All Days Taken
# Test includes Holiday Pay Accrued payload only
# Tests that when daysTaken is equal to the ipConfirmed Days then no financial payout is awarded
	When I post to the Holiday endpoint with:
"""
{
"hpa": { 
"insolvencyDate": "2018-08-04",
"empStartDate": "2016-02-16",
"dismissalDate": "2018-8-04",
"contractedHolEntitlement": 28,
"holidayYearStart": "2018-01-01T01:00:00",
"isTaxable": "true",
"payDay": 6,
"shiftPattern": ["1","2","3","4","5"],
"weeklyWage":446.57 ,
"daysCFwd":0,
"daysTaken": 28,
"ipConfirmedDays": 28
}
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
    "hpa": {
        "statutoryMax": 508,
        "holidaysOwed": 28,
        "businessDaysInClaim": 261,
        "workingDaysInClaim": 155,
        "proRataAccruedDays": 0,
        "weeklyResults": []
    }
}
"""

@AutomationTest
Scenario: HPA Limit Based on 5 Days
# Test includes Holiday Pay Accrued payload only
# Tests that when daysTaken is more than 6 times the shift pattern then only that is paid out
	When I post to the Holiday endpoint with:
"""
{
"hpa": { 
"insolvencyDate": "2018-12-31",
"empStartDate": "2016-02-16",
"dismissalDate": "2018-12-31",
"contractedHolEntitlement": 50,
"holidayYearStart": "2018-01-01T01:00:00",
"isTaxable": "true",
"payDay": 6,
"shiftPattern": ["1","2","3","4","5"],
"weeklyWage":500,
"daysCFwd":0,
"daysTaken": 0,
"ipConfirmedDays": 50
}
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
    "hpa": {
        "statutoryMax": 508,
        "holidaysOwed": 50,
        "businessDaysInClaim": 261,
        "workingDaysInClaim": 261,
        "proRataAccruedDays": 30,
        "weeklyResults": [
		{
		"weekNumber": 1,
		"maximumEntitlement": 508,
		"employerEntitlement": 500,
		"isTaxable": true,
		"preferentialClaim": 500,
		"nonPreferentialClaim": 0,
		"grossEntitlement": 500,
		"taxDeducted": 100,
		"niDeducted": 40.08,
		"netEntitlement":359.92
		},
		{
		"weekNumber": 2,
		"maximumEntitlement": 508,
		"employerEntitlement": 500,
		"isTaxable": true,
		"preferentialClaim": 500,
		"nonPreferentialClaim": 0,
		"grossEntitlement": 500,
		"taxDeducted": 100,
		"niDeducted": 40.08,
		"netEntitlement":359.92
		},
		{
		"weekNumber": 3,
		"maximumEntitlement": 508,
		"employerEntitlement": 500,
		"isTaxable": true,
		"preferentialClaim": 500,
		"nonPreferentialClaim": 0,
		"grossEntitlement": 500,
		"taxDeducted": 100,
		"niDeducted": 40.08,
		"netEntitlement":359.92
		},
		{
		"weekNumber": 4,
		"maximumEntitlement": 508,
		"employerEntitlement": 500,
		"isTaxable": true,
		"preferentialClaim": 500,
		"nonPreferentialClaim": 0,
		"grossEntitlement": 500,
		"taxDeducted": 100,
		"niDeducted": 40.08,
		"netEntitlement":359.92
		},
		{
		"weekNumber": 5,
		"maximumEntitlement": 508,
		"employerEntitlement": 500,
		"isTaxable": true,
		"preferentialClaim": 500,
		"nonPreferentialClaim": 0,
		"grossEntitlement": 500,
		"taxDeducted": 100,
		"niDeducted": 40.08,
		"netEntitlement":359.92
		},
		{
		"weekNumber": 6,
		"maximumEntitlement": 508,
		"employerEntitlement": 500,
		"isTaxable": true,
		"preferentialClaim": 500,
		"nonPreferentialClaim": 0,
		"grossEntitlement": 500,
		"taxDeducted": 100,
		"niDeducted": 40.08,
		"netEntitlement":359.92
		}
		]
    },
	"htnp": null
}
"""

@AutomationTest
Scenario: HPA Limit Based on 7 Days
# Test includes Holiday Pay Accrued payload only
# Tests that when daysTaken is more than 6 times the shift pattern then only that is paid out
	When I post to the Holiday endpoint with:
"""
{
"hpa": { 
"insolvencyDate": "2018-12-31",
"empStartDate": "2016-02-16",
"dismissalDate": "2018-12-31",
"contractedHolEntitlement": 50,
"holidayYearStart": "2018-01-01T01:00:00",
"isTaxable": "true",
"payDay": 6,
"shiftPattern": ["0","1","2","3","4","5","6"],
"weeklyWage":500,
"daysCFwd":0,
"daysTaken": 0,
"ipConfirmedDays": 50
}
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
    "hpa": {
        "statutoryMax": 508,
        "holidaysOwed": 50,
        "businessDaysInClaim": 365,
        "workingDaysInClaim": 365,
        "proRataAccruedDays": 42,
        "weeklyResults": [
		{
		"weekNumber": 1,
		"maximumEntitlement": 508,
		"employerEntitlement": 500,
		"isTaxable": true,
		"preferentialClaim": 500,
		"nonPreferentialClaim": 0,
		"grossEntitlement": 500,
		"taxDeducted": 100,
		"niDeducted": 40.08,
		"netEntitlement":359.92
		},
		{
		"weekNumber": 2,
		"maximumEntitlement": 508,
		"employerEntitlement": 500,
		"isTaxable": true,
		"preferentialClaim": 500,
		"nonPreferentialClaim": 0,
		"grossEntitlement": 500,
		"taxDeducted": 100,
		"niDeducted": 40.08,
		"netEntitlement":359.92
		},
		{
		"weekNumber": 3,
		"maximumEntitlement": 508,
		"employerEntitlement": 500,
		"isTaxable": true,
		"preferentialClaim": 500,
		"nonPreferentialClaim": 0,
		"grossEntitlement": 500,
		"taxDeducted": 100,
		"niDeducted": 40.08,
		"netEntitlement":359.92
		},
		{
		"weekNumber": 4,
		"maximumEntitlement": 508,
		"employerEntitlement": 500,
		"isTaxable": true,
		"preferentialClaim": 500,
		"nonPreferentialClaim": 0,
		"grossEntitlement": 500,
		"taxDeducted": 100,
		"niDeducted": 40.08,
		"netEntitlement":359.92
		},
		{
		"weekNumber": 5,
		"maximumEntitlement": 508,
		"employerEntitlement": 500,
		"isTaxable": true,
		"preferentialClaim": 500,
		"nonPreferentialClaim": 0,
		"grossEntitlement": 500,
		"taxDeducted": 100,
		"niDeducted": 40.08,
		"netEntitlement":359.92
		},
		{
		"weekNumber": 6,
		"maximumEntitlement": 508,
		"employerEntitlement": 500,
		"isTaxable": true,
		"preferentialClaim": 500,
		"nonPreferentialClaim": 0,
		"grossEntitlement": 500,
		"taxDeducted": 100,
		"niDeducted": 40.08,
		"netEntitlement":359.92
		}
		]
    },
	"htnp": null
}
"""

@AutomationTest
Scenario: HPA Limit Based on 5 Days Dismissed 1/3 of the Year Through
# Test includes Holiday Pay Accrued payload only
# Tests that when dismissed 1/3 of the year through the payment is pro-rata
	When I post to the Holiday endpoint with:
"""
{
"hpa": { 
"insolvencyDate": "2018-12-31",
"empStartDate": "2016-02-16",
"dismissalDate": "2018-05-01",
"contractedHolEntitlement": 50,
"holidayYearStart": "2018-01-01T01:00:00",
"isTaxable": "true",
"payDay": 6,
"shiftPattern": ["1","2","3","4","5"],
"weeklyWage":500,
"daysCFwd":0,
"daysTaken": 0,
"ipConfirmedDays": 50
}
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
    "hpa": {
        "statutoryMax": 508,
        "holidaysOwed": 50,
        "businessDaysInClaim": 261,
        "workingDaysInClaim": 87,
        "proRataAccruedDays": 16.6667,
        "weeklyResults": [
		{
		"weekNumber": 1,
		"maximumEntitlement": 508,
		"employerEntitlement": 500,
		"isTaxable": true,
		"preferentialClaim": 500,
		"nonPreferentialClaim": 0,
		"grossEntitlement": 500,
		"taxDeducted": 100,
		"niDeducted": 40.08,
		"netEntitlement":359.92
		},
		{
		"weekNumber": 2,
		"maximumEntitlement": 508,
		"employerEntitlement": 500,
		"isTaxable": true,
		"preferentialClaim": 500,
		"nonPreferentialClaim": 0,
		"grossEntitlement": 500,
		"taxDeducted": 100,
		"niDeducted": 40.08,
		"netEntitlement":359.92
		},
		{
		"weekNumber": 3,
		"maximumEntitlement": 508,
		"employerEntitlement": 500,
		"isTaxable": true,
		"preferentialClaim": 500,
		"nonPreferentialClaim": 0,
		"grossEntitlement": 500,
		"taxDeducted": 100,
		"niDeducted": 40.08,
		"netEntitlement":359.92
		},
		{
		"weekNumber": 4,
		"maximumEntitlement": 193.52,
		"employerEntitlement": 166.67,
		"isTaxable": true,
		"preferentialClaim": 166.67,
		"nonPreferentialClaim": 0,
		"grossEntitlement": 166.67,
		"taxDeducted": 33.33,
		"niDeducted": 0.08,
		"netEntitlement":133.26
		}
		]
    },
	"htnp": null
}
"""

@AutomationTest
Scenario: HPA IP Confirmed Days Higher than Claimed Days with Carried Forward Days
# Test includes Holiday Pay Accrued payload only
# Tests that when the ipConfirmedDays is higher than the claimed days with days carried forward added on.
	When I post to the Holiday endpoint with:
"""
{
"hpa": { 
"insolvencyDate": "2018-12-31",
"empStartDate": "2016-02-16",
"dismissalDate": "2018-12-31",
"contractedHolEntitlement": 28,
"holidayYearStart": "2018-01-01",
"isTaxable": "true",
"payDay": 6,
"shiftPattern": ["1","2","3","4","5"],
"weeklyWage":500,
"daysCFwd":1,
"daysTaken": 0,
"ipConfirmedDays": 99
}
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
    "hpa": {
        "statutoryMax": 508,
        "holidaysOwed": 28,
        "businessDaysInClaim": 261,
        "workingDaysInClaim": 261,
        "proRataAccruedDays": 29,
        "weeklyResults": [
		{
		"weekNumber": 1,
		"maximumEntitlement": 508,
		"employerEntitlement": 500,
		"isTaxable": true,
		"preferentialClaim": 500,
		"nonPreferentialClaim": 0,
		"grossEntitlement": 500,
		"taxDeducted": 100,
		"niDeducted": 40.08,
		"netEntitlement":359.92
		},
		{
		"weekNumber": 2,
		"maximumEntitlement": 508,
		"employerEntitlement": 500,
		"isTaxable": true,
		"preferentialClaim": 500,
		"nonPreferentialClaim": 0,
		"grossEntitlement": 500,
		"taxDeducted": 100,
		"niDeducted": 40.08,
		"netEntitlement":359.92
		},
		{
		"weekNumber": 3,
		"maximumEntitlement": 508,
		"employerEntitlement": 500,
		"isTaxable": true,
		"preferentialClaim": 500,
		"nonPreferentialClaim": 0,
		"grossEntitlement": 500,
		"taxDeducted": 100,
		"niDeducted": 40.08,
		"netEntitlement":359.92
		},
		{
		"weekNumber": 4,
		"maximumEntitlement": 508,
		"employerEntitlement": 500,
		"isTaxable": true,
		"preferentialClaim": 500,
		"nonPreferentialClaim": 0,
		"grossEntitlement": 500,
		"taxDeducted": 100,
		"niDeducted": 40.08,
		"netEntitlement":359.92
		},
		{
		"weekNumber": 5,
		"maximumEntitlement": 508,
		"employerEntitlement": 500,
		"isTaxable": true,
		"preferentialClaim": 500,
		"nonPreferentialClaim": 0,
		"grossEntitlement": 500,
		"taxDeducted": 100,
		"niDeducted": 40.08,
		"netEntitlement":359.92
		},
		{
		"weekNumber": 6,
		"maximumEntitlement": 362.86,
		"employerEntitlement": 400,
		"isTaxable": true,
		"preferentialClaim": 362.86,
		"nonPreferentialClaim": 0,
		"grossEntitlement": 362.86,
		"taxDeducted": 72.57,
		"niDeducted": 23.62,
		"netEntitlement":266.67
		}
		]
    },
	"htnp": null
}
"""

@AutomationTest
Scenario: HPA Minimum Days 
# Test includes Holiday Pay Accrued payload only
# Tests that when the holidays owed is lower than the statutory minimum days then the minimum days are awarded
	When I post to the Holiday endpoint with:
"""
{
"hpa": { 
"insolvencyDate": "2018-12-31",
"empStartDate": "2016-02-16",
"dismissalDate": "2018-12-31",
"contractedHolEntitlement": 15,
"holidayYearStart": "2018-01-01",
"isTaxable": "true",
"payDay": 6,
"shiftPattern": ["1","2","3","4","5"],
"weeklyWage":500,
"daysCFwd":0,
"daysTaken": 0,
"ipConfirmedDays": 99
}
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
    "hpa": {
        "statutoryMax": 508,
        "holidaysOwed": 28,
        "businessDaysInClaim": 261,
        "workingDaysInClaim": 261,
        "proRataAccruedDays": 28,
        "weeklyResults": [
		{
		"weekNumber": 1,
		"maximumEntitlement": 508,
		"employerEntitlement": 500,
		"isTaxable": true,
		"preferentialClaim": 500,
		"nonPreferentialClaim": 0,
		"grossEntitlement": 500,
		"taxDeducted": 100,
		"niDeducted": 40.08,
		"netEntitlement":359.92
		},
		{
		"weekNumber": 2,
		"maximumEntitlement": 508,
		"employerEntitlement": 500,
		"isTaxable": true,
		"preferentialClaim": 500,
		"nonPreferentialClaim": 0,
		"grossEntitlement": 500,
		"taxDeducted": 100,
		"niDeducted": 40.08,
		"netEntitlement":359.92
		},
		{
		"weekNumber": 3,
		"maximumEntitlement": 508,
		"employerEntitlement": 500,
		"isTaxable": true,
		"preferentialClaim": 500,
		"nonPreferentialClaim": 0,
		"grossEntitlement": 500,
		"taxDeducted": 100,
		"niDeducted": 40.08,
		"netEntitlement":359.92
		},
		{
		"weekNumber": 4,
		"maximumEntitlement": 508,
		"employerEntitlement": 500,
		"isTaxable": true,
		"preferentialClaim": 500,
		"nonPreferentialClaim": 0,
		"grossEntitlement": 500,
		"taxDeducted": 100,
		"niDeducted": 40.08,
		"netEntitlement":359.92
		},
		{
		"weekNumber": 5,
		"maximumEntitlement": 508,
		"employerEntitlement": 500,
		"isTaxable": true,
		"preferentialClaim": 500,
		"nonPreferentialClaim": 0,
		"grossEntitlement": 500,
		"taxDeducted": 100,
		"niDeducted": 40.08,
		"netEntitlement":359.92
		},
		{
		"weekNumber": 6,
		"maximumEntitlement": 290.29,
		"employerEntitlement": 300,
		"isTaxable": true,
		"preferentialClaim": 290.29,
		"nonPreferentialClaim": 0,
		"grossEntitlement": 290.29,
		"taxDeducted": 58.06,
		"niDeducted": 14.91,
		"netEntitlement":217.32
		}
		]
    },
	"htnp": null
}
"""

@AutomationTest
Scenario: HPA Half of the Days Taken
# Test includes Holiday Pay Accrued payload only
# Tests that when the holidays owed is lower than the statutory minimum days then the minimum days are awarded
	When I post to the Holiday endpoint with:
"""
{
"hpa": { 
"insolvencyDate": "2018-12-31",
"empStartDate": "2016-02-16",
"dismissalDate": "2018-12-31",
"contractedHolEntitlement": 30,
"holidayYearStart": "2018-01-01",
"isTaxable": "true",
"payDay": 6,
"shiftPattern": ["1","2","3","4","5"],
"weeklyWage":500,
"daysCFwd":0,
"daysTaken": 15,
"ipConfirmedDays": 30
}
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
    "hpa": {
        "statutoryMax": 508,
        "holidaysOwed": 30,
        "businessDaysInClaim": 261,
        "workingDaysInClaim": 261,
        "proRataAccruedDays": 15,
        "weeklyResults": [
		{
		"weekNumber": 1,
		"maximumEntitlement": 508,
		"employerEntitlement": 500,
		"isTaxable": true,
		"preferentialClaim": 500,
		"nonPreferentialClaim": 0,
		"grossEntitlement": 500,
		"taxDeducted": 100,
		"niDeducted": 40.08,
		"netEntitlement":359.92
		},
		{
		"weekNumber": 2,
		"maximumEntitlement": 508,
		"employerEntitlement": 500,
		"isTaxable": true,
		"preferentialClaim": 500,
		"nonPreferentialClaim": 0,
		"grossEntitlement": 500,
		"taxDeducted": 100,
		"niDeducted": 40.08,
		"netEntitlement":359.92
		},
		{
		"weekNumber": 3,
		"maximumEntitlement": 435.43,
		"employerEntitlement": 500,
		"isTaxable": true,
		"preferentialClaim": 435.43,
		"nonPreferentialClaim": 0,
		"grossEntitlement": 435.43,
		"taxDeducted": 87.09,
		"niDeducted": 32.33,
		"netEntitlement":316.01
		}
		]
    },
	"htnp": null
}
"""

@AutomationTest
Scenario: HTNP Only rp1 Provided
# Test includes Holiday Taken Not Paid payload only
# Tests that when an rp1 is provided in isolation then a validation message is displayed
	When I post to the Holiday endpoint with:
"""
{
"rp1NotRequired": false,
"rp14aNotRequired": false,
"htnp": [ 
{ 
"inputSource": "rp1",
"insolvencyDate": "2018-08-04T09:32:03.524Z",
"dismissalDate": "2018-10-05T09:32:03.524Z",
"unpaidPeriodFrom": "2018-07-01T09:32:03.525Z",
"unpaidPeriodTo": "2018-07-28T09:32:03.525Z",
"payDay": 6,
"shiftPattern": ["1","2","3","4","5"],
"weeklyWage": 446.57,
"isTaxable": false 
},
]
}
"""
	Then I get a response with status code "400"
	And the response contains "Holiday Taken Not Paid RP14a data has not been provided"


@AutomationTest
Scenario: HTNP Only rp14a Provided
# Test includes Holiday Taken Not Paid payload only
# Tests that when an rp14a is provided in isolation then a validation message is displayed
	When I post to the Holiday endpoint with:
"""
{
"rp1NotRequired": false,
"rp14aNotRequired": false,
"htnp": [ 
{ 
"inputSource": "rp14a",
"insolvencyDate": "2018-08-04T09:32:03.524Z",
"dismissalDate": "2018-10-05T09:32:03.524Z",
"unpaidPeriodFrom": "2018-07-01T09:32:03.525Z",
"unpaidPeriodTo": "2018-07-28T09:32:03.525Z",
"payDay": 6,
"shiftPattern": ["1","2","3","4","5"],
"weeklyWage": 446.57,
"isTaxable": false 
},
]
}
"""
	Then I get a response with status code "400"
	And the response contains "Holiday Taken Not Paid RP1 data has not been provided"


@AutomationTest
Scenario: HTNP Only rp1 Provided Flag Set to True
# Test includes Holiday Taken Not Paid payload only
# Tests that when rp14a not required is set to true an rp1 can be accepted alone
	When I post to the Holiday endpoint with:
"""
{
"rp1NotRequired": false,
"rp14aNotRequired": true,
"htnp": [ 
{ 
"inputSource": "rp1",
"insolvencyDate": "2018-08-04T09:32:03.524Z",
"dismissalDate": "2018-10-05T09:32:03.524Z",
"unpaidPeriodFrom": "2018-07-28T09:32:03.525Z",
"unpaidPeriodTo": "2018-08-04T09:32:03.525Z",
"payDay": 6,
"shiftPattern": ["1","2","3","4","5"],
"weeklyWage": 446.57,
"isTaxable": false 
}
]
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
    "hpa": null,
    "htnp": {
        "selectedInputSource": "rp1",
        "rP1ResultsList": {
            "inputSource": "rp1",
            "statutoryMax": 508,
            "weeklyResult": [
			     {
                    "weekNumber": 1,
                    "payDate": "2018-08-04T00:00:00Z",
                    "maximumEntitlement": 508,
                    "employerEntitlement": 446.57,
                    "isTaxable": false,
                    "maximumDays": 7,
                    "employmentDays": 5,
                    "grossEntitlement": 446.57,
                    "taxDeducted": 0,
                    "niDeducted": 0,
                    "netEntitlement": 446.57,
                    "grossEntitlementIn4Months": 446.57,
                    "isSelected": true,
                    "maximumEntitlementIn4MonthPeriod": 508,
                    "employerEntitlementIn4MonthPeriod": 446.57
                }
			]
        },
		"rP14aResultsList": {
			"inputSource": "rp14a",
			"statutoryMax": 508,
			"weeklyResult": []
		}
    }
}
"""

@AutomationTest
Scenario: HTNP Only rp1 not required Flag Set to True
# Test includes Holiday Taken Not Paid payload only
# Tests that when rp1 not required is set to true an rp14a can be accepted alone
	When I post to the Holiday endpoint with:
"""
{
"rp1NotRequired": true,
"rp14aNotRequired": "false",
"htnp": [ 
{ 
"inputSource": "rp14a",
"insolvencyDate": "2018-08-04T09:32:03.524Z",
"dismissalDate": "2018-10-05T09:32:03.524Z",
"unpaidPeriodFrom": "2018-07-28T09:32:03.525Z",
"unpaidPeriodTo": "2018-08-04T09:32:03.525Z",
"payDay": 6,
"shiftPattern": ["1","2","3","4","5"],
"weeklyWage": 446.57,
"isTaxable": false 
}
]
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "hpa": null,
  "htnp": {
    "selectedInputSource": "rp14a",
    "rP1ResultsList": {
      "inputSource": "rp1",
      "statutoryMax": 508,
      "weeklyResult": []
    },
    "rP14aResultsList": {
      "inputSource": "rp14a",
      "statutoryMax": 508,
      "weeklyResult": [
        {
          "weekNumber": 1,
          "payDate": "2018-08-04T00:00:00Z",
          "maximumEntitlement": 508,
          "employerEntitlement": 446.57,
          "isTaxable": false,
          "maximumDays": 7,
          "employmentDays": 5,
          "grossEntitlement": 446.57,
          "taxDeducted": 0,
          "niDeducted": 0,
          "netEntitlement": 446.57,
          "grossEntitlementIn4Months": 446.57,
          "isSelected": true,
          "maximumEntitlementIn4MonthPeriod": 508,
          "employerEntitlementIn4MonthPeriod": 446.57
        }
      ]
    }
  }
}
"""

@AutomationTest
Scenario: Holiday Composite More Holiday Taken than Accrued
# Test includes Holiday Pay Accrued and Holiday Taken Not Paid payloads
# Tests that when the holiday taken is greater than the holiday accrued then no HPA is paid out
	When I post to the Holiday endpoint with:
"""
{
"rp1NotRequired": false,
"rp14aNotRequired": false,
"hpa": { 
"insolvencyDate": "2018-12-31",
"empStartDate": "2000-02-16",
"dismissalDate": "2018-12-31",
"contractedHolEntitlement": 30,
"holidayYearStart": "2018-01-01",
"isTaxable": "true",
"payDay": 6,
"shiftPattern": ["1","2","3","4","5"],
"weeklyWage":500,
"daysCFwd":0,
"daysTaken": 15,
"ipConfirmedDays":30
},
"htnp": [
{ 
"inputSource": "rp1",
"insolvencyDate": "2018-12-31T09:32:03.524Z",
"dismissalDate": "2018-12-31T09:32:03.524Z",
"unpaidPeriodFrom": "2018-07-02T09:32:03.525Z",
"unpaidPeriodTo": "2018-08-17T09:32:03.525Z",
"payDay": 6,
"shiftPattern": ["1","2","3","4","5"],
"weeklyWage": 500,
"isTaxable": true 
},
{ 
"inputSource": "rp14a",
"insolvencyDate": "2018-12-31T09:32:03.524Z",
"dismissalDate": "2018-12-31T09:32:03.524Z",
"unpaidPeriodFrom": "2018-07-02T09:32:03.525Z",
"unpaidPeriodTo": "2018-08-17T09:32:03.525Z",
"payDay": 6,
"shiftPattern": ["1","2","3","4","5"],
"weeklyWage": 500,
"isTaxable": true
}
]
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
    "hpa": {
        "statutoryMax": 508,
        "holidaysOwed": 30,
        "businessDaysInClaim": 261,
        "workingDaysInClaim": 261,
        "proRataAccruedDays": 0,
        "weeklyResults": []
    },
    "htnp": {
        "selectedInputSource": "rp14a",
        "rP1ResultsList": {
            "inputSource": "rp1",
            "statutoryMax": 508,
            "weeklyResult": [
			                {
                    "weekNumber": 1,
                    "payDate": "2018-07-07T00:00:00Z",
                    "maximumEntitlement": 508,
                    "employerEntitlement": 500,
                    "isTaxable": true,
                    "maximumDays": 7,
                    "employmentDays": 5,
                    "grossEntitlement": 500,
                    "taxDeducted": 100,
					"niDeducted": 40.08,
					"netEntitlement":359.92,
                    "grossEntitlementIn4Months": 0,
                    "isSelected": false,
                    "maximumEntitlementIn4MonthPeriod": 0,
                    "employerEntitlementIn4MonthPeriod": 0
                },
                {
                    "weekNumber": 2,
                    "payDate": "2018-07-14T00:00:00Z",
                    "maximumEntitlement": 508,
                    "employerEntitlement": 500,
                    "isTaxable": true,
                    "maximumDays": 7,
                    "employmentDays": 5,
                    "grossEntitlement": 500,
                    "taxDeducted": 100,
					"niDeducted": 40.08,
					"netEntitlement":359.92,
                    "grossEntitlementIn4Months": 0,
                    "isSelected": false,
                    "maximumEntitlementIn4MonthPeriod": 0,
                    "employerEntitlementIn4MonthPeriod": 0
                },
                {
                    "weekNumber": 3,
                    "payDate": "2018-07-21T00:00:00Z",
                    "maximumEntitlement": 508,
                    "employerEntitlement": 500,
                    "isTaxable": true,
                    "maximumDays": 7,
                    "employmentDays": 5,
                    "grossEntitlement": 500,
                    "taxDeducted": 100,
					"niDeducted": 40.08,
					"netEntitlement":359.92,
                    "grossEntitlementIn4Months": 0,
                    "isSelected": false,
                    "maximumEntitlementIn4MonthPeriod": 0,
                    "employerEntitlementIn4MonthPeriod": 0
                },
                {
                    "weekNumber": 4,
                    "payDate": "2018-07-28T00:00:00Z",
                    "maximumEntitlement": 508,
                    "employerEntitlement": 500,
                    "isTaxable": true,
                    "maximumDays": 7,
                    "employmentDays": 5,
                    "grossEntitlement": 500,
                    "taxDeducted": 100,
					"niDeducted": 40.08,
					"netEntitlement":359.92,
                    "grossEntitlementIn4Months": 0,
                    "isSelected": false,
                    "maximumEntitlementIn4MonthPeriod": 0,
                    "employerEntitlementIn4MonthPeriod": 0
                },
                {
                    "weekNumber": 5,
                    "payDate": "2018-08-04T00:00:00Z",
                    "maximumEntitlement": 508,
                    "employerEntitlement": 500,
                    "isTaxable": true,
                    "maximumDays": 7,
                    "employmentDays": 5,
                    "grossEntitlement": 500,
                    "taxDeducted": 100,
					"niDeducted": 40.08,
					"netEntitlement":359.92,
                    "grossEntitlementIn4Months": 0,
                    "isSelected": false,
                    "maximumEntitlementIn4MonthPeriod": 0,
                    "employerEntitlementIn4MonthPeriod": 0
                },
                {
                    "weekNumber": 6,
                    "payDate": "2018-08-11T00:00:00Z",
                    "maximumEntitlement": 508,
                    "employerEntitlement": 500,
                    "isTaxable": true,
                    "maximumDays": 7,
                    "employmentDays": 5,
                    "grossEntitlement": 500,
                    "taxDeducted": 100,
					"niDeducted": 40.08,
					"netEntitlement":359.92,
                    "grossEntitlementIn4Months": 0,
                    "isSelected": false,
                    "maximumEntitlementIn4MonthPeriod": 0,
                    "employerEntitlementIn4MonthPeriod": 0
                },
                {
                    "weekNumber": 7,
                    "payDate": "2018-08-18T00:00:00Z",
                    "maximumEntitlement": 508,
                    "employerEntitlement": 500,
                    "isTaxable": true,
                    "maximumDays": 7,
                    "employmentDays": 5,
                    "grossEntitlement": 500,
                    "taxDeducted": 100,
					"niDeducted": 40.08,
					"netEntitlement":359.92,
                    "grossEntitlementIn4Months": 0,
                    "isSelected": false,
                    "maximumEntitlementIn4MonthPeriod": 0,
                    "employerEntitlementIn4MonthPeriod": 0
                }
				]
        },
        "rP14aResultsList": {
            "inputSource": "rp14a",
            "statutoryMax": 508,
            "weeklyResult": [
                {
                    "weekNumber": 1,
                    "payDate": "2018-07-07T00:00:00Z",
                    "maximumEntitlement": 508,
                    "employerEntitlement": 500,
                    "isTaxable": true,
                    "maximumDays": 7,
                    "employmentDays": 5,
                    "grossEntitlement": 500,
                    "taxDeducted": 100,
					"niDeducted": 40.08,
					"netEntitlement":359.92,
                    "grossEntitlementIn4Months": 0,
                    "isSelected": false,
                    "maximumEntitlementIn4MonthPeriod": 0,
                    "employerEntitlementIn4MonthPeriod": 0
                },
                {
                    "weekNumber": 2,
                    "payDate": "2018-07-14T00:00:00Z",
                    "maximumEntitlement": 508,
                    "employerEntitlement": 500,
                    "isTaxable": true,
                    "maximumDays": 7,
                    "employmentDays": 5,
                    "grossEntitlement": 500,
                    "taxDeducted": 100,
					"niDeducted": 40.08,
					"netEntitlement":359.92,
                    "grossEntitlementIn4Months": 0,
                    "isSelected": true,
                    "maximumEntitlementIn4MonthPeriod": 0,
                    "employerEntitlementIn4MonthPeriod": 0
                },
                {
                    "weekNumber": 3,
                    "payDate": "2018-07-21T00:00:00Z",
                    "maximumEntitlement": 508,
                    "employerEntitlement": 500,
                    "isTaxable": true,
                    "maximumDays": 7,
                    "employmentDays": 5,
                    "grossEntitlement": 500,
                    "taxDeducted": 100,
					"niDeducted": 40.08,
					"netEntitlement":359.92,
                    "grossEntitlementIn4Months": 0,
                    "isSelected": true,
                    "maximumEntitlementIn4MonthPeriod": 0,
                    "employerEntitlementIn4MonthPeriod": 0
                },
                {
                    "weekNumber": 4,
                    "payDate": "2018-07-28T00:00:00Z",
                    "maximumEntitlement": 508,
                    "employerEntitlement": 500,
                    "isTaxable": true,
                    "maximumDays": 7,
                    "employmentDays": 5,
                    "grossEntitlement": 500,
                    "taxDeducted": 100,
					"niDeducted": 40.08,
					"netEntitlement":359.92,
                    "grossEntitlementIn4Months": 0,
                    "isSelected": true,
                    "maximumEntitlementIn4MonthPeriod": 0,
                    "employerEntitlementIn4MonthPeriod": 0
                },
                {
                    "weekNumber": 5,
                    "payDate": "2018-08-04T00:00:00Z",
                    "maximumEntitlement": 508,
                    "employerEntitlement": 500,
                    "isTaxable": true,
                    "maximumDays": 7,
                    "employmentDays": 5,
                    "grossEntitlement": 500,
                    "taxDeducted": 100,
					"niDeducted": 40.08,
					"netEntitlement":359.92,
                    "grossEntitlementIn4Months": 0,
                    "isSelected": true,
                    "maximumEntitlementIn4MonthPeriod": 0,
                    "employerEntitlementIn4MonthPeriod": 0
                },
                {
                    "weekNumber": 6,
                    "payDate": "2018-08-11T00:00:00Z",
                    "maximumEntitlement": 508,
                    "employerEntitlement": 500,
                    "isTaxable": true,
                    "maximumDays": 7,
                    "employmentDays": 5,
                    "grossEntitlement": 500,
                    "taxDeducted": 100,
					"niDeducted": 40.08,
					"netEntitlement":359.92,
                    "grossEntitlementIn4Months": 0,
                    "isSelected": true,
                    "maximumEntitlementIn4MonthPeriod": 0,
                    "employerEntitlementIn4MonthPeriod": 0
                },
                {
                    "weekNumber": 7,
                    "payDate": "2018-08-18T00:00:00Z",
                    "maximumEntitlement": 508,
                    "employerEntitlement": 500,
                    "isTaxable": true,
                    "maximumDays": 7,
                    "employmentDays": 5,
                    "grossEntitlement": 500,
                    "taxDeducted": 100,
					"niDeducted": 40.08,
					"netEntitlement":359.92,
                    "grossEntitlementIn4Months": 0,
                    "isSelected": true,
                    "maximumEntitlementIn4MonthPeriod": 0,
                    "employerEntitlementIn4MonthPeriod": 0
                }
            ]
        }
    }
}
"""

@AutomationTest
Scenario: Holiday Composite HPA Only Pays Non HTNP Claim
# Test includes Holiday Pay Accrued and Holiday Taken Not Paid payloads
# Tests that when the holiday taken is claimed then the HTNP is paid first and the remainder of the claim is paid as HPA
	When I post to the Holiday endpoint with:
"""
{
"rp1NotRequired": false,
"rp14aNotRequired": false,
"hpa": { 
"insolvencyDate": "2018-12-31",
"empStartDate": "2000-02-16",
"dismissalDate": "2018-12-31",
"contractedHolEntitlement": 30,
"holidayYearStart": "2018-01-01",
"isTaxable": "true",
"payDay": 6,
"shiftPattern": ["1","2","3","4","5"],
"weeklyWage":500,
"daysCFwd":0,
"daysTaken": 0,
"ipConfirmedDays":30
},
"htnp": [
{ 
"inputSource": "rp1",
"insolvencyDate": "2018-12-31T09:32:03.524Z",
"dismissalDate": "2018-12-31T09:32:03.524Z",
"unpaidPeriodFrom": "2018-07-02T09:32:03.525Z",
"unpaidPeriodTo": "2018-07-21T09:32:03.525Z",
"payDay": 6,
"shiftPattern": ["1","2","3","4","5"],
"weeklyWage": 500,
"isTaxable": true 
},
{ 
"inputSource": "rp14a",
"insolvencyDate": "2018-12-31T09:32:03.524Z",
"dismissalDate": "2018-12-31T09:32:03.524Z",
"unpaidPeriodFrom": "2018-07-02T09:32:03.525Z",
"unpaidPeriodTo": "2018-07-21T09:32:03.525Z",
"payDay": 6,
"shiftPattern": ["1","2","3","4","5"],
"weeklyWage": 500,
"isTaxable": true
}
]
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
    "hpa": {
        "statutoryMax": 508,
        "holidaysOwed": 30,
        "businessDaysInClaim": 261,
        "workingDaysInClaim": 261,
        "proRataAccruedDays": 15,
        "weeklyResults": [
		{
		"weekNumber": 1,
		"maximumEntitlement": 508,
		"employerEntitlement": 500,
		"isTaxable": true,
		"preferentialClaim": 500,
		"nonPreferentialClaim": 0,
		"grossEntitlement": 500,
		"taxDeducted": 100,
		"niDeducted": 40.08,
		"netEntitlement":359.92
		},
		{
		"weekNumber": 2,
		"maximumEntitlement": 508,
		"employerEntitlement": 500,
		"isTaxable": true,
		"preferentialClaim": 500,
		"nonPreferentialClaim": 0,
		"grossEntitlement": 500,
		"taxDeducted": 100,
		"niDeducted": 40.08,
		"netEntitlement":359.92
		},
		{
		"weekNumber": 3,
		"maximumEntitlement": 435.43,
		"employerEntitlement": 500,
		"isTaxable": true,
		"preferentialClaim": 435.43,
		"nonPreferentialClaim": 0,
		"grossEntitlement": 435.43,
		"taxDeducted": 87.09,
		"niDeducted": 32.33,
		"netEntitlement":316.01
		}
		]
    },
    "htnp": {
        "selectedInputSource": "rp14a",
        "rP1ResultsList": {
            "inputSource": "rp1",
            "statutoryMax": 508,
            "weeklyResult": [
			                {
                    "weekNumber": 1,
                    "payDate": "2018-07-07T00:00:00Z",
                    "maximumEntitlement": 508,
                    "employerEntitlement": 500,
                    "isTaxable": true,
                    "maximumDays": 7,
                    "employmentDays": 5,
                    "grossEntitlement": 500,
                    "taxDeducted": 100,
					"niDeducted": 40.08,
					"netEntitlement":359.92,
                    "grossEntitlementIn4Months": 0,
                    "isSelected": false,
                    "maximumEntitlementIn4MonthPeriod": 0,
                    "employerEntitlementIn4MonthPeriod": 0
                },
                {
                    "weekNumber": 2,
                    "payDate": "2018-07-14T00:00:00Z",
                    "maximumEntitlement": 508,
                    "employerEntitlement": 500,
                    "isTaxable": true,
                    "maximumDays": 7,
                    "employmentDays": 5,
                    "grossEntitlement": 500,
                    "taxDeducted": 100,
					"niDeducted": 40.08,
					"netEntitlement":359.92,
                    "grossEntitlementIn4Months": 0,
                    "isSelected": false,
                    "maximumEntitlementIn4MonthPeriod": 0,
                    "employerEntitlementIn4MonthPeriod": 0
                },
                {
                    "weekNumber": 3,
                    "payDate": "2018-07-21T00:00:00Z",
                    "maximumEntitlement": 508,
                    "employerEntitlement": 500,
                    "isTaxable": true,
                    "maximumDays": 7,
                    "employmentDays": 5,
                    "grossEntitlement": 500,
                    "taxDeducted": 100,
					"niDeducted": 40.08,
					"netEntitlement":359.92,
                    "grossEntitlementIn4Months": 0,
                    "isSelected": false,
                    "maximumEntitlementIn4MonthPeriod": 0,
                    "employerEntitlementIn4MonthPeriod": 0
                }
				]
        },
        "rP14aResultsList": {
            "inputSource": "rp14a",
            "statutoryMax": 508,
            "weeklyResult": [
                {
                    "weekNumber": 1,
                    "payDate": "2018-07-07T00:00:00Z",
                    "maximumEntitlement": 508,
                    "employerEntitlement": 500,
                    "isTaxable": true,
                    "maximumDays": 7,
                    "employmentDays": 5,
                    "grossEntitlement": 500,
                    "taxDeducted": 100,
					"niDeducted": 40.08,
					"netEntitlement":359.92,
                    "grossEntitlementIn4Months": 0,
                    "isSelected": true,
                    "maximumEntitlementIn4MonthPeriod": 0,
                    "employerEntitlementIn4MonthPeriod": 0
                },
                {
                    "weekNumber": 2,
                    "payDate": "2018-07-14T00:00:00Z",
                    "maximumEntitlement": 508,
                    "employerEntitlement": 500,
                    "isTaxable": true,
                    "maximumDays": 7,
                    "employmentDays": 5,
                    "grossEntitlement": 500,
                    "taxDeducted": 100,
					"niDeducted": 40.08,
					"netEntitlement":359.92,
                    "grossEntitlementIn4Months": 0,
                    "isSelected": true,
                    "maximumEntitlementIn4MonthPeriod": 0,
                    "employerEntitlementIn4MonthPeriod": 0
                },
                {
                    "weekNumber": 3,
                    "payDate": "2018-07-21T00:00:00Z",
                    "maximumEntitlement": 508,
                    "employerEntitlement": 500,
                    "isTaxable": true,
                    "maximumDays": 7,
                    "employmentDays": 5,
                    "grossEntitlement": 500,
                    "taxDeducted": 100,
					"niDeducted": 40.08,
					"netEntitlement":359.92,
                    "grossEntitlementIn4Months": 0,
                    "isSelected": true,
                    "maximumEntitlementIn4MonthPeriod": 0,
                    "employerEntitlementIn4MonthPeriod": 0
                }
            ]
        }
    }
}
"""

@AutomationTest
Scenario: HPA Validation Holiday Year Start More Than 12 Months Prior
# Test includes Holiday Pay Accrued payload only
# Tests that when the holiday year start is more than 12 months prior to the dimsissal date and the insolvency date
	When I post to the Holiday endpoint with:
"""
{
"hpa": { 
"insolvencyDate": "2019-03-01",
"empStartDate": "2016-02-16",
"dismissalDate": "2019-03-01",
"contractedHolEntitlement": 30,
"holidayYearStart": "2018-01-01",
"isTaxable": "true",
"payDay": 6,
"shiftPattern": ["1","2","3","4","5"],
"weeklyWage":500,
"daysCFwd":0,
"daysTaken": 15,
"ipConfirmedDays": 30
}
}
"""
	Then I get a response with status code "400"
	And the response contains "Holiday year start date must be no more than a year prior to the dismissal date/insolvency date"

@AutomationTest
Scenario: HPA Based on 3 days worked non consecutively
# Test includes Holiday Pay Accrued payload only
# Tests that when the final week is calculated the correct amount of stat max is applied
	When I post to the Holiday endpoint with:
"""
{
"hpa": { 
"insolvencyDate": "2018-08-01",
"empStartDate": "2018-01-01",
"dismissalDate": "2018-08-01",
"contractedHolEntitlement": 20,
"holidayYearStart": "2018-01-01",
"isTaxable": "false",
"payDay": 6,
"shiftPattern": ["1","3","5"],
"weeklyWage":600,
"daysCFwd":0,
"daysTaken": 0,
"ipConfirmedDays": 8
}
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
    "hpa": {
        "statutoryMax": 508,
        "holidaysOwed": 20,
        "businessDaysInClaim": 157,
        "workingDaysInClaim": 92,
        "proRataAccruedDays": 8,
        "weeklyResults": [
		{
		"weekNumber": 1,
		"maximumEntitlement": 508,
		"employerEntitlement": 600,
		"isTaxable": false,
		"preferentialClaim": 508,
		"nonPreferentialClaim": 0,
		"grossEntitlement": 508,
		"taxDeducted": 0,
		"niDeducted": 0,
		"netEntitlement":508
		},
		{
		"weekNumber": 2,
		"maximumEntitlement": 508,
		"employerEntitlement": 600,
		"isTaxable": false,
		"preferentialClaim": 508,
		"nonPreferentialClaim": 0,
		"grossEntitlement": 508,
		"taxDeducted": 0,
		"niDeducted": 0,
		"netEntitlement":508
		},
		{
		"weekNumber": 3,
		"maximumEntitlement": 290.29,
		"employerEntitlement": 400,
		"isTaxable": false,
		"preferentialClaim": 290.29,
		"nonPreferentialClaim": 0,
		"grossEntitlement": 290.29,
		"taxDeducted": 0,
		"niDeducted": 0,
		"netEntitlement":290.29
		}
		]
    },
	"htnp": null
}
"""

@AutomationTest
Scenario: HPA Partial Day to be Calculated
# Test includes Holiday Pay Accrued payload only
# Tests that when a partial day is to be calculated, that the partial day is correctly calculated in the stat max
	When I post to the Holiday endpoint with:
"""
{
"hpa": { 
"insolvencyDate": "2018-12-31",
"empStartDate": "2016-02-16",
"dismissalDate": "2018-05-01",
"contractedHolEntitlement": 50,
"holidayYearStart": "2018-01-01",
"isTaxable": "true",
"payDay": 6,
"shiftPattern": ["1","3","5"],
"weeklyWage":600,
"daysCFwd":0,
"daysTaken": 0,
"ipConfirmedDays": 50
}
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
    "hpa": {
        "statutoryMax": 508,
        "holidaysOwed": 50,
        "businessDaysInClaim": 157,
        "workingDaysInClaim": 52,
        "proRataAccruedDays": 16.5605,
        "weeklyResults": [
		{
		"weekNumber": 1,
		"maximumEntitlement": 508,
		"employerEntitlement": 600,
		"isTaxable": true,
		"preferentialClaim": 508,
		"nonPreferentialClaim": 0,
		"grossEntitlement": 508,
		"taxDeducted": 101.6,
		"niDeducted": 41.04,
		"netEntitlement":365.36
		},
		{
		"weekNumber": 2,
		"maximumEntitlement": 508,
		"employerEntitlement": 600,
		"isTaxable": true,
		"preferentialClaim": 508,
		"nonPreferentialClaim": 0,
		"grossEntitlement": 508,
		"taxDeducted": 101.6,
		"niDeducted": 41.04,
		"netEntitlement":365.36
		},
		{
		"weekNumber": 3,
		"maximumEntitlement": 508,
		"employerEntitlement": 600,
		"isTaxable": true,
		"preferentialClaim": 508,
		"nonPreferentialClaim": 0,
		"grossEntitlement": 508,
		"taxDeducted": 101.6,
		"niDeducted": 41.04,
		"netEntitlement":365.36
		},
		{
		"weekNumber": 4,
		"maximumEntitlement": 508,
		"employerEntitlement": 600,
		"isTaxable": true,
		"preferentialClaim": 508,
		"nonPreferentialClaim": 0,
		"grossEntitlement": 508,
		"taxDeducted": 101.6,
		"niDeducted": 41.04,
		"netEntitlement":365.36
		},
		{
		"weekNumber": 5,
		"maximumEntitlement": 508,
		"employerEntitlement": 600,
		"isTaxable": true,
		"preferentialClaim": 508,
		"nonPreferentialClaim": 0,
		"grossEntitlement": 508,
		"taxDeducted": 101.6,
		"niDeducted": 41.04,
		"netEntitlement":365.36
		},
		{
		"weekNumber": 6,
		"maximumEntitlement": 185.82,
		"employerEntitlement": 312.1,
		"isTaxable": true,
		"preferentialClaim": 185.82,
		"nonPreferentialClaim": 0,
		"grossEntitlement": 185.82,
		"taxDeducted": 37.16,
		"niDeducted": 2.38,
		"netEntitlement":146.28
		}
	]
	},
	"htnp": null
}
"""


@AutomationTest
Scenario: HPA Validation No IP Confirmed Days Data Input
# Test includes Holiday Pay Accrued payload only
# Tests that when no IP Confirmed Days data is input the calculation gives a validation
	When I post to the Holiday endpoint with:
"""
{
"hpa": { 
"insolvencyDate": "2019-03-01",
"empStartDate": "2016-02-16",
"dismissalDate": "2019-03-01",
"contractedHolEntitlement": 30,
"holidayYearStart": "2018-01-01",
"isTaxable": "true",
"payDay": 6,
"shiftPattern": ["1","2","3","4","5"],
"weeklyWage":500,
"daysCFwd":0,
"daysTaken": 15,
"ipConfirmedDays": 
}
}
"""
	Then I get a response with status code "400"
	And the response contains "The input was not valid"