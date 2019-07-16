Feature: Projected Notice
	 scenarios around automated testing of the Projected Notice via the Gateway

@AutomationTest
Scenario:  Test PingGet Method
# Tests that the endpoint is active and responding
	Given I want to test "aggpinggetpnd" method
	When I make a request to the Projected Notice Endpoint
	Then I get a response with status code "200"
	And the response contains "PingGet response from RPS Api ProjectedNoticeDate"

@AutomationTest
Scenario: Employed for 1 Month
# Tests that when the employee has one month of employment then 1 week of notice is projected
	When I post to the Projected Notice Endpoint with:
"""
{
"employmentStartDate": "2018-11-01",
"dismissalDate": "2018-12-01",
"dateNoticeGiven": "2018-12-01"
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
"projectedNoticeDate": "2018-12-08T00:00:00",
"noticeStartDate": "2018-12-02"
}
"""

@AutomationTest
Scenario: Employed for 13 Years
# Tests that when an employee has 13 years of employment then 12 weeks of notice are projected
	When I post to the Projected Notice Endpoint with:
"""
{
  "employmentStartDate": "2005-12-01",
  "dismissalDate": "2018-12-01",
  "dateNoticeGiven": "2018-12-01"
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "projectedNoticeDate": "2019-02-23T00:00:00",
  "noticeStartDate": "2018-12-02"
}
"""

@AutomationTest
Scenario: Employed for less than 1 month
# Tests that when an employee has less than one month of employment then weeks of notice are not projected
	When I post to the Projected Notice Endpoint with:
"""
{
  "employmentStartDate": "2018-12-02",
  "dismissalDate": "2018-12-01",
  "dateNoticeGiven": "2018-12-01"
}
"""
	Then I get a response with status code "400"
	And the response contains "'Dismissal Date' must be at least 1 month later than 'Employment Start Date'"

@AutomationTest
Scenario: Date Notice Given Declared as Later Than Dismissal Date
# Tests that when an employee declares the date notice given as later than the dismissal date then the projected notice date is calculated based on the dismissal date
	When I post to the Projected Notice Endpoint with:
"""
{
  "employmentStartDate": "2018-11-01",
  "dismissalDate": "2018-12-01",
  "dateNoticeGiven": "2018-12-04"
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "projectedNoticeDate": "2018-12-08T00:00:00",
  "noticeStartDate": "2018-12-02"
}
"""

@AutomationTest
Scenario: Dismissal Date Declared as Later Than Date Notice Given
# Tests that when an employee declares the dismissal date as later than the date notice given then the projected notice date is calculated based on the date notice given
	When I post to the Projected Notice Endpoint with:
"""
{
  "employmentStartDate": "2018-11-01",
  "dismissalDate": "2018-12-04",
  "dateNoticeGiven": "2018-12-01"
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "projectedNoticeDate": "2018-12-08T00:00:00",
  "noticeStartDate": "2018-12-02T00:00:00"
}
"""
