import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';
import CASE_OBJECT from '@salesforce/schema/Case';
import PRIORITY_FIELD from '@salesforce/schema/Case.Priority';
import getCases from '@salesforce/apex/CaseController.getCases';

const COLS = [
    { label: 'Case Number', fieldName: 'CaseNumber', type: 'Text' },
    { label: 'Subject', fieldName: 'Subject', type: 'Text' },
    {
        label: 'Priority',  
        fieldName: 'Priority', 
        type: 'priorityPicklist',
        typeAttributes: {
            options: { fieldName: 'picklistOptions' },
            value: { fieldName: 'Priority' },
            placeholder: 'Choose Priority',
        }
    },
    { label: 'Status', fieldName: 'Status', type: 'Text' },
];

// const DATA = [
//     {
//         CaseNumber: 'Lending',
//         Subject: 'Lending Review',
//         Priority: 'High',
//         Status: 'New',
//     },       
//     {
//         CaseNumber: 'Contract Management',
//         Subject: 'Agreement terms/CCA',
//         Priority: 'Medium',
//         Status: 'In Progress',
//     },      
//     {
//         CaseNumber: 'Contract Management',
//         Subject: 'Application process',
//         Priority: 'Low',
//         Status: 'Completed',
//     },       

// ];

export default class CaseLwcTable extends LightningElement {
    columns = COLS;
    data = [];
    casePriority = [];

    // connectedCallback() {
    //     this.data = DATA;
    // }

    @wire(getObjectInfo, {ObjectApiName: CASE_OBJECT })
    caseObjectMetaData;

    @wire(getPicklistValues, {
        recordTypeId: '$caseObjectMetaData.data.defaultRecordTypeId',
        fieldApiName: PRIORITY_FIELD,
    })
    casePriorityPicklist({data, error}){
        if (data){
            this.casePriority = data.values;
            this.fetchCases();
            this.error = undefined;
        } else if (error){
            this.casePriority = undefined;
            this.error = error;
        }
    }

    fetchCases({data, error}){
        if (data){
            let options = [];
            for(var key in this.casePriority){
                options.push(
                    { label: this.casePriority[key].label, value: this.casePriority[key].value} );
            }
            this.cases = data.map((record) => {
                return{
                    ...record, 
                    'picklistOptions': options
                };
            });
            this.error = undefined;
        } else if (error){
            this.cases = undefined;
            this.error = error;
        }
    }

    @wire(getCases)
    listOfCases({data, error}){
        if (data){
            this.casePriority = data.values;
            this.fetchCases();
            this.error = undefined;
        } else if (error){
            this.casePriority = undefined;
            this.error = error;
        }
    }
}