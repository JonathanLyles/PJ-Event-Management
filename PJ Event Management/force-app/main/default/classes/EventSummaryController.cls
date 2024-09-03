public with sharing class EventSummaryController {
    public EventSummaryController() {
    }
    public static Map<String, Integer> getTaskStatusSummary(Id eventPlanId){
        Map<String, Integer> taskStatusSummary = new Map<String, Integer>();
        //Write SOQL query and aggregate function here
        //use GROUP BY to group results by Task_Status__c
        //Use COUNT() to calculate task counts
        return taskStatusSummary;
    }
}