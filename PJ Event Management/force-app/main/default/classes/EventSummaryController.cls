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
    public List<Event_Task__c> getOpenTasks(Id eventPlanId){
        List<Event_Task__c> openTasks = new List<Event_Task__c>();
        //Write SOQL query here
        //add WHERE clause to filter tasks by status "Not Started"
        //Use ORDER BY to sort tasks by Due_Date__c in descending order
        return openTasks;
    }
    public Map<String, Decimal> getExpensesByCategory(Id eventPlanId){
        Map<String, Decimal> expenseByCategory = new Map<String, Decimal>();
        //Write SOQL query and aggregate function here
        //Use GROUP BY to group results by Category__c
        //Use SUM() to calculate total expenses
        return expenseByCategory;
    }
}