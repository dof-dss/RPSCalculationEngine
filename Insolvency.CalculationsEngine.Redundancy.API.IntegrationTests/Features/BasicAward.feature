Feature: Basic Award
  scenarios around automated testing of the Basic Award calulatuin via the Gateway API

@AutomationTest 
Scenario: Test PingGet Method
# Tests that the endpoint is active and responding
    Given I want to test "aggpinggetba" method 
    When I make a request to the Basic Award Endpoint
    Then I get a response with status code "200"
    And the response contains "PingGet response from RPS Api BasicAward"

@AutomationTest 
Scenario: Tax Set to False
# Tests that when the isTaxable field is set to false no tax or ni are deducted from the award
    When I post to the Basic Award Endpoint with:
	"""
{
	"basicAwardAmount": 5000,
	"isTaxable": false
}
	"""
    Then I get a response with status code "200"
    And the response is:
	"""
{
  "grossEntitlement": 5000,
  "isTaxable": false,
  "taxDeducted": 0,
  "niDeducted": 0,
  "netEntitlement": 5000,
  "preferentialClaim": 0,
  "nonPreferentialClaim": 5000
}
	"""

@AutomationTest 
Scenario: Tax Set to True Below NI Threshold
# Tests that when the Award is equal or less than the ni Threshold (166 in this example) then no NI is deducted 
    When I post to the Basic Award Endpoint with:
	"""
{
  "basicAwardAmount": 166,
  "isTaxable": true
}
	"""
    Then I get a response with status code "200"
    And the response is:
	"""
{
  "grossEntitlement": 166,
  "isTaxable": true,
  "taxDeducted": 33.2,
  "niDeducted": 0,
  "netEntitlement": 132.8,
  "preferentialClaim": 0,
  "nonPreferentialClaim": 166
}
	"""

@AutomationTest 
Scenario: Tax Set to True
# Tests that when the isTaxable flag is set to true then tax and ni are deducted from the award
    When I post to the Basic Award Endpoint with:
	"""
{
  "basicAwardAmount": 500,
  "isTaxable": true
}
	"""
    Then I get a response with status code "200"
    And the response is:
	"""
{
  "grossEntitlement": 500,
  "isTaxable": true,
  "taxDeducted": 100,
  "niDeducted": 40.08,
  "netEntitlement": 359.92,
  "preferentialClaim": 0,
  "nonPreferentialClaim": 500
}
	"""

@AutomationTest 
Scenario: Tax Set to True Above NI Threshold
# Tests that when the Award is equal or above the ni Threshold (962 in this example) then NI is deducted at a different rate (currently 0.02)
    When I post to the Basic Award Endpoint with:
	"""
{
  "basicAwardAmount": 1000000,
  "isTaxable": true
}
	"""
    Then I get a response with status code "200"
    And the response is:
	"""
{
  "grossEntitlement": 1000000,
  "isTaxable": true,
  "taxDeducted": 200000,
  "niDeducted": 20076.28,
  "netEntitlement": 779923.72,
  "preferentialClaim": 0,
  "nonPreferentialClaim": 1000000
}
	"""