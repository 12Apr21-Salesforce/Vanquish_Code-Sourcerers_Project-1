public with sharing class AgentsController {

    // Represents the main Agents list
    public List<ContactWrapper> agentList {
        get {
            if (agentList == null) {
                agentList = new List<ContactWrapper>();
                for (Contact agent : [SELECT Id, Name, City__c, State__c, Phone, Email
                                           FROM Contact]) {
                    agentList.add(new ContactWrapper(agent));
                }
            }
            return agentList;
        }
        set;
    }

    // Contains only the Agents selected
    public Map<Id, ContactWrapper> selectedAgents {
        get {
            if (selectedAgents == null) {
                selectedAgents = new Map<Id, ContactWrapper>();
            }
            return selectedAgents;
        }
        private set;
    }

    // Action triggered from the "See Your Selected Agents" button
    public PageReference listAgents() {

        // First clear out any previously selected Agents
        selectedAgents.clear();

        // Add the newly selected Agents to the map
        for (ContactWrapper cw : agentList) {
            if (cw.checked) {
                selectedAgents.put(cw.agents.Id, cw);
            }
        }

        if(selectedAgents.size() > 0) {
            return Page.SelectedAgentsPage;
        } else {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Please select at least one Agent'));
            return null;
        }
        
    }


     public List<Contact> agents {
         get {
             if(agents == null) {
                 agents = new List<Contact>([SELECT Id, Name, City__c, State__c, Phone, Email
                                                             FROM Contact
                                                             WHERE Id IN :selectedAgents.keySet()
                                                             ORDER BY Name]);
             }
             return agents;
         } 
         private set;   
     }

    
    public Pagereference newSearch() {
        Pagereference newPage = Page.ListOfAgentsPage;
        newPage.setRedirect(true);
        return newPage;
    }

    // Wrapper class
    public class ContactWrapper {
        public Contact agents {get; set;}
        public Boolean checked {get; set;}

        public ContactWrapper(Contact c) {
            agents = c;
            checked = false;
        }
    }
}