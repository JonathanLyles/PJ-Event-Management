public with sharing class EventRunningSheetController {
    @AuraEnabled(cacheable=true)
    public static Event_Plan__c getEventDetails(Id recordId) {
       // return [SOQL on Event_Plan__c to return Event_Name__c, Event_Date__c applying filter as Id =:recordId ];
       return [SELECT Event_Name__c, Event_Date__c FROM Event_Plan__c WHERE Id = :recordId];
    }


    @AuraEnabled(cacheable=true)
    public static List<Event_Task__c> getTasks(Id recordId) {
       // return [SOQL on Event_Task__c to retun Name,Task_Name__c, Due_Date__c, Assigned_To__c applying filter as Event_Plan__c =:recordId and ORDER BY Due_Date__c];
       return [SELECT Name, Task_Name__c, Due_Date__c, Assigned_To__c FROM Event_Task__c WHERE Event_Plan__c = :recordId ORDER BY Due_Date__c];
    }
}