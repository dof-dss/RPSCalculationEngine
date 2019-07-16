Feature: Apportionment
  scenarios around automated testing of the Apportionment calculator via the Gateway API

@AutomationTest
Scenario: Test PingGet Method
  Given I want to test "pinggetApportionment" method
  When I make a request to the Apportionment Endpoint
  Then I get a response with status code "200"
  And the response contains "PingGet response from RPS Api Apportionment"

@AutomationTest 
Scenario: Pref Claim Under 800 Without TUPE
# Tests that when the total paid is under 800 without tupe then all of the paid is a preferential claim
  When I post to the Apportionment Endpoint with: 
	"""
  {
  "grossEntitlement": 800,
  "totalClaimedInFourMonth": 800,
  "grossPaidInFourMonth": 799.99,
  "tupeStatus": false
  }
   """
   Then I get a response with status code "200"
    And the response is:
   """
  {
  "prefClaim": 799.99,
  "nonPrefClaim": 0.01,
  "apportionmentPercentage": 100,
  "tupeStatus": false
  }
   """	

@AutomationTest 
Scenario: Pref Claim Over 800 Without TUPE
# Tests that when the total paid is over 800 without tupe then only up to 800 is preferential
  When I post to the Apportionment Endpoint with:  
	"""
{
  "grossEntitlement": 800.01,
  "totalClaimedInFourMonth": 800.01,
  "grossPaidInFourMonth": 800.01,
  "tupeStatus": false
}
	"""
    Then I get a response with status code "200"
    And the response is:
	"""
{
  "prefClaim": 800,
  "nonPrefClaim": 0.01,
  "apportionmentPercentage": 100,
  "tupeStatus": false
}
	"""
	
@AutomationTest  
Scenario: Pref Claim Over 800 Based on Percentage Without TUPE
# Tests that when the total paid is over 800 without tupe that the preferential is 800 multiplied by the percentage.
   When I post to the Apportionment Endpoint with: 
	"""
{
  "grossEntitlement": 1927.39,
  "totalClaimedInFourMonth": 1927.39,
  "grossPaidInFourMonth": 1450.12,
  "tupeStatus": false
}
	"""
    Then I get a response with status code "200"
    And the response is:
	"""
{
  "prefClaim": 601.9,
  "nonPrefClaim": 1325.49,
  "apportionmentPercentage": 75.2375,
  "tupeStatus": false
}
	"""

@AutomationTest  
Scenario: Pref Claim Over 800 With TUPE
# Tests that when the total paid is over 800 with tupe that the preferential is 800
   When I post to the Apportionment Endpoint with: 
	"""
{
  "grossEntitlement": 1927.39,
  "totalClaimedInFourMonth": 1927.39,
  "grossPaidInFourMonth": 1450.12,
  "tupeStatus": true
}
	"""
    Then I get a response with status code "200"
    And the response is:
	"""
{
  "prefClaim": 800,
  "nonPrefClaim": 1127.39,
  "apportionmentPercentage": 100,
  "tupeStatus": true
}
	"""