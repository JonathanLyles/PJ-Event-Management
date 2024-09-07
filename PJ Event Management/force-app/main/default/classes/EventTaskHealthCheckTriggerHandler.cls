public with sharing class EventTaskHealthCheckTriggerHandler {
    public EventTaskHealthCheckTriggerHandler() {

    }
    public void handlerAfterInsert(List<Event_Task__c> newEventTasks) {
        // Logic for after insert operation
        // Call the updateEventFlags method and pass newEventTasks
        
    }
    
    public void handlerAfterUpdate(List<Event_Task__c> newEventTasks, Map<Id, Event_Task__c> oldEventTasks) {
        // Logic for after update operation
        // Call the updateEventFlags method and pass newEventTasks
        // Additional logic if needed
    }
    
    public void handlerAfterDelete(List<Event_Task__c> deletedEventTasks) {
        // Logic for after delete operation
        // Call the updateEventFlags method and pass deletedEventTasks with a flag for delete
        // Additional logic if needed
    }
    
    private void updateEventFlags(List<Event_Task__c> eventTasks) {
        // Get the Event Plan Id
        Id theEventId = eventTasks.get(0).Event_Plan__c;
        // Get the Event Plan object
        Event_Plan__c theEvent = [SELECT Id, Name, Event_Date__c FROM Event_Plan__c WHERE Id = :theEventId];
        // Get the Event Plan's Event Date
        Date theEventDate = theEvent.Event_Date__c.date();
        // Are we within 7 days of the Event Date?
        if(Date.today().daysBetween(Date.today().addDays(7)) <= 7){
            //If yes, check if more than 50% of tasks are not completed
            //Sum of Tasks
            //List<AggregateResult> 
            List<AggregateResult> countTasks = [
                SELECT COUNT(Id) totalCount
                FROM Event_Task__c
                WHERE Event_Plan__c = :theEventId
            ];
        }  
    }  
    // Other methods if needed
}