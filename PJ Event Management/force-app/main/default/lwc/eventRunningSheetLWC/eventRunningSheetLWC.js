import { LightningElement, wire, api } from 'lwc';
import getEventDetails from '@salesforce/apex/EventRunningSheetController.getEventDetails';
import getTasks from '@salesforce/apex/EventRunningSheetController.getTasks';

export default class EventRunningSheetLWC extends LightningElement {
    eventName;
    eventDate;
    @api recordId;
    taskList = [];

    // Load event details and tasks using wire service
    @wire(getEventDetails, {recordId: '$recordId'})
    wiredEventDetails({ error, data }) {
        if (data) {
            // set this.eventName using Event_Name__c
            // this.eventDate using Event_Date__c;
        }
    }

    @wire(getTasks, {recordId: '$recordId'})
    wiredTasks({ error, data }) {
        if (data) {
            //set this.taskList using data
        }
    }
}