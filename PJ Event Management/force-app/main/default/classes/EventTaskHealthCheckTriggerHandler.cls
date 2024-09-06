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
        // Your existing logic here
        // ...
    }
    
    // Other methods if needed
    
}