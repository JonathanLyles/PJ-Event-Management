public with sharing class EventSummaryController {
    public EventSummaryController() {
    }
    public static Map<String, Integer> getTaskStatusSummary(Id eventPlanId){
        Map<String, Integer> taskStatusSummary = new Map<String, Integer>();
        //Write SOQL query and aggregate function here
        //List<Event_Task__c> myEventTasks = [SELECT Event_Plan__c, Task_Status__c FROM Event_Task__c];
        //System.debug(myEventTasks);
        List<AggregateResult> myResults = [SELECT Task_Status__c, COUNT(Id) totalCount FROM Event_Task__c WHERE Event_Plan__c = :eventPlanId GROUP BY Task_Status__c];
        System.debug(myResults);
        for(AggregateResult myResult : myResults){
            String mapKey = (String) myResult.get('Task_Status__c');
            Integer mapValue = (Integer) myResult.get('totalCount');
            taskStatusSummary.put(mapKey, mapValue);

        }
        System.debug(taskStatusSummary);
        //use GROUP BY to group results by Task_Status__c
        //Use COUNT() to calculate task counts
        return taskStatusSummary;
    }
    public static List<Event_Task__c> getOpenTasks(Id eventPlanId){
        List<Event_Task__c> openTasks = new List<Event_Task__c>();
        //Write SOQL query here
        openTasks = [SELECT Name, Id, Due_Date__c FROM Event_Task__c WHERE Event_Plan__c = :eventPlanId AND Task_Status__c = 'Not Started' ORDER BY Due_Date__c DESC];
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
    public Event_Expense__c getMostExpensiveExpense(Id eventPlanId){
        Event_Expense__c mostExpensiveExpense;
        //Write SOQL query here
        //Use ORDER BY to sort expenses by Amount__c in descending order
        //Use LIMIT to retrieve only one record
        return mostExpensiveExpense;
    }
}