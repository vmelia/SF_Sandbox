import { LightningElement } from "lwc";

export default class ComplaintCaseNatureGrid extends LightningElement {
    dataLoaded = false;
    data;

    picklistOptions(){   
        return [
            {
                field: 'yyyy',
                value: 'zzzz',
            }];     
    }

    connectedCallback() {   
        this.data = generateData();
        this.dataLoaded = true;
        console.log('this.data: ' + JSON.stringify( this.data ) );
    }

    outcomeChanged(event) {
        console.log('event = ' + event);  
    }
}

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