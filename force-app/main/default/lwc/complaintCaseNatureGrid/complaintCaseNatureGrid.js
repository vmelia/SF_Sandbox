import { LightningElement, wire } from "lwc";
import { getPicklistValues } from "lightning/uiObjectInfoApi";
import OUTCOME_FIELD from "@salesforce/schema/Complaint_Case_Nature__c.Outcome__c";
import { calculateOverallOutcome } from "./overallOutcomesCalculator";

export default class ComplaintCaseNatureGrid extends LightningElement {
    data;
    outcomes;
    
    @wire(getPicklistValues, { recordTypeId: '012000000000000AAA', fieldApiName: OUTCOME_FIELD })
    picklistValues({ error, data }) {
        if (data) {
            this.outcomes = data.values;
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.outcomes = undefined;
        }
    }

    picklistOptions(){        
        return this.outcomes.map(o => { return {field: o, value: o}});
    }

    connectedCallback() {
        let outcomes = [];
        let overallOutcome = calculateOverallOutcome(outcomes);
        console.log('**** overallOutcome = ' + overallOutcome);  

        console.log('**** connectedCallback');        
        console.log('this.outcomes: ' + JSON.stringify( this.outcomes ) );
        this.data = generateData();
    }

    outcomeChanged(event) {
        console.log('**** event = ' + event);  
    }
}

//ToDo: Remove test code.
function generateData() {
  const data = [
      {
          complaintClass: 'Lending',
          complaintType: 'Lending Review',
          complaintSubType: 'Responsible Lending',
          complaintOutcome: 'Upheld',
      },        
      {
          complaintClass: 'Contract Management',
          complaintType: 'Agreement terms/CCA',
          complaintSubType: 'APR / Interest Charged',
          complaintOutcome: 'Not Upheld',
      },       
      {
          complaintClass: 'Contract Management',
          complaintType: 'Application process',
          complaintSubType: 'Broker Communication',
          complaintOutcome: 'Partially Upheld',
      },        
      {
          complaintClass: 'Account Management',
          complaintType: 'Collections',
          complaintSubType: 'Bankrupt/IVA',
          complaintOutcome: 'Out Of Jurisdiction',
      },        
      {
          complaintClass: 'Account Management',
          complaintType: 'Direct Debit',
          complaintSubType: 'Bank account details held incorrect',
          complaintOutcome: 'Withdrawn',
      },        
  ];

  return data;
}