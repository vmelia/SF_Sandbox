import { LightningElement } from 'lwc';
import generateData from './sampleTableData';

const columns = [
    { label: 'Complaint Class', fieldName: 'complaintClass' },
    { label: 'Complaint Type', fieldName: 'complaintType' },
    { label: 'Complaint Sub Type', fieldName: 'complaintSubType' },    
    { label: 'Complaint Outcome', fieldName: 'complaintOutcome' },
];

export default class BasicDatatable extends LightningElement {
    data = [];
    columns = columns;

    connectedCallback() {
        this.data = generateData();
    }
}