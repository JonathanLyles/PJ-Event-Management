public with sharing class EventTaskHealthCheckTriggerHandler {
    public EventTaskHealthCheckTriggerHandler() {

    }
    public void handlerAfterInsert(List<Event_Task__c> newEventTasks) {
        // Logic for after insert operation
        // Call the updateEventFlags method and pass newEventTasks
        this.updateEventFlags(newEventTasks);
        
    }
    
    public void handlerAfterUpdate(List<Event_Task__c> newEventTasks, Map<Id, Event_Task__c> oldEventTasks) {
        // Logic for after update operation
        // Call the updateEventFlags method and pass newEventTasks
        this.updateEventFlags(newEventTasks);
        // Additional logic if needed
    }
    
    public void handlerAfterDelete(List<Event_Task__c> deletedEventTasks) {
        // Logic for after delete operation
        // Call the updateEventFlags method and pass deletedEventTasks with a flag for delete
        this.updateEventFlags(deletedEventTasks);
        // Additional logic if needed
    }
    
    public void updateEventFlags(List<Event_Task__c> eventTasks) {
        // Get the Event Plan Id
        Id theEventId = eventTasks.get(0).Event_Plan__c;
        System.debug(theEventId);
        // Get the Event Plan object
        Event_Plan__c theEvent = [SELECT Id, Name, Event_Date__c FROM Event_Plan__c WHERE Id = :theEventId];
        System.debug(theEvent);
        // Get the Event Plan's Event Date
        Date theEventDate = theEvent.Event_Date__c.date();
        System.debug(theEventDate);
        // Are we within 7 days of the Event Date?
        if(Date.today().daysBetween(Date.today().addDays(7)) <= 7){
            System.debug('Less than 7 days');
            Integer totalTasks = 0;
            Integer totalCompleted = 0;
            Decimal percentCompleted = 0.00;
            //If yes, check if more than 50% of tasks are not completed
            //Sum of Tasks
            //List<AggregateResult> 
            List<AggregateResult> countTasks = [
                SELECT Task_Status__c, COUNT(Id) totalCount
                FROM Event_Task__c
                WHERE Event_Plan__c = :theEventId
                GROUP BY Task_Status__c
            ];
            //count the total of all tasks for each status
            for (AggregateResult ar : countTasks) {
                totalTasks += (Integer) ar.get('totalCount');
            }
            for (AggregateResult ar : countTasks) {
                String status = (String) ar.get('Task_Status__c');
                Integer total = (Integer) ar.get('totalCount');
                if(status == 'Completed'){
                    totalCompleted = total;
                }           
               // System.debug('Task Status: ' + status + ', Total: ' + total);
            }
            percentCompleted = totalCompleted / totalTasks;
            if(percentCompleted == 1.0){
                theEvent.Event_Flag__c = 'Completed';
            }else if(percentCompleted < 0.50){
                theEvent.Event_Flag__c = 'Critical';
            }else{
                theEvent.Event_Flag__c = 'On Track';
            }            
            upsert theEvent;     
        }  
    }  
    // Other methods if needed
}