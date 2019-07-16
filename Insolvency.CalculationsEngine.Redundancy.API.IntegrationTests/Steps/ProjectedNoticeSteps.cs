using Insolvency.CalculationsEngine.Redundancy.API.IntegrationTests.Common;
using Cms.RpsCalculations.HttpAggregator.DTOs.ProjectedNoticeDate;
using System;
using System.Collections.Generic;
using System.Text;
using TechTalk.SpecFlow;

namespace Insolvency.CalculationsEngine.Redundancy.API.IntegrationTests.Steps
{
    [Binding]
    [Scope(Feature = "Projected Notice")]
    public class ProjectedNoticeSteps : CoreSteps<ProjectedNoticeDateResponseDto>
    {
        public ProjectedNoticeSteps(ScenarioContext scenarioContext, CalculationEngineClient calculationEngineClient) 
            : base(scenarioContext, calculationEngineClient, "aggpnd")
        {
        }
    }
}
