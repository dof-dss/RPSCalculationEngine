Feature: Refund of Notional Tax
	 scenarios around automated testing of the Refund of Notional Tax via the Gateway

@AutomationTest
Scenario:  Test PingGet Method
# Tests that the endpoint is active and responding
	Given I want to test "aggpinggetront" method
	When I make a request to the Refund of Notional Tax Endpoint
	Then I get a response with status code "200"
	And the response contains "PingGet response from RPS Api RefundOfNotionalTax"

@AutomationTest
Scenario: Taxable Allowance Driven Maximum Refund Limit
# Tests that the maximum refund limit is the difference between the tax allowance and the taxable earnings and that the refund amount does not exceed this.
	When I post to the Refund Of Notional Tax endpoint with:
"""
{
  "taxableEarnings": 11450,
  "taxAllowance": 11500,
  "maximumCNPEntitlement": 10500,
  "cnpPaid": 10250,
  "cnpTaxDeducted": 2050
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "taxableEarning": 11450,
  "taxAllowance": 11500,
  "maximumCNPEntitlement": 10500,
  "cnpPaid": 10250,
  "cnpTaxDeducted": 2050,
  "maximumRefundLimit": 50,
  "cnpPaidAfterRefund": 10300,
  "refundAmount": 50
}         
"""

@AutomationTest
Scenario: Maximum CNP Allowance Driven Maximum Refund Limit
# Tests that the maximum refund limit is the difference between the maximum CNP Entitlement and the cnp Paid and that the refund amount does not exceed this.
	When I post to the Refund Of Notional Tax endpoint with:
"""
{
  "taxableEarnings": 11450,
  "taxAllowance": 11500,
  "maximumCNPEntitlement": 10275,
  "cnpPaid": 10250,
  "cnpTaxDeducted": 2050
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "taxableEarning": 11450,
  "taxAllowance": 11500,
  "maximumCNPEntitlement": 10275,
  "cnpPaid": 10250,
  "cnpTaxDeducted": 2050,
  "maximumRefundLimit": 25,
  "cnpPaidAfterRefund": 10275,
  "refundAmount": 25
}         
"""

@AutomationTest
Scenario: Taxable Earnings More Than Tax Allowance
# Tests that when the taxable earnings exceeds the tax allowance no refund is allowed or paid out.
	When I post to the Refund Of Notional Tax endpoint with:
"""
{
  "taxableEarnings": 11550,
  "taxAllowance": 11500,
  "maximumCNPEntitlement": 10500,
  "cnpPaid": 10250,
  "cnpTaxDeducted": 2050
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "taxableEarning": 11550,
  "taxAllowance": 11500,
  "maximumCNPEntitlement": 10500,
  "cnpPaid": 10250,
  "cnpTaxDeducted": 2050,
  "maximumRefundLimit": 0,
  "cnpPaidAfterRefund": 10250,
  "refundAmount": 0
}         
"""

@AutomationTest
Scenario: CNP Paid Higher Than Maximum CNP Entitlement
# Tests that when the cnp paid exceeds the maximum cnp allowance no refund is allowed or paid out.
	When I post to the Refund Of Notional Tax endpoint with:
"""
{
  "taxableEarnings": 11450,
  "taxAllowance": 11500,
  "maximumCNPEntitlement": 10250,
  "cnpPaid": 11250,
  "cnpTaxDeducted": 2050
}
"""
	Then I get a response with status code "200"
	And the response is:
"""
{
  "taxableEarning": 11450,
  "taxAllowance": 11500,
  "maximumCNPEntitlement": 10250,
  "cnpPaid": 11250,
  "cnpTaxDeducted": 2050,
  "maximumRefundLimit": 0,
  "cnpPaidAfterRefund": 11250,
  "refundAmount": 0
}         
"""
