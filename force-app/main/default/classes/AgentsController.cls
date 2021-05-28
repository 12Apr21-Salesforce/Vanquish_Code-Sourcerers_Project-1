public with sharing class AgentsController {

<<<<<<< HEAD
    
    // Wrapper class
    public class ContactWrapper {
        public Contact agents {get; set;}
        public Boolean checked {get; set;}

        public ContactWrapper(Contact c) {
            agents = c;
            checked = false;
        }
    }

    // Represents the main Agents list
=======
    /**
     *  This controller is used by both the SearchCoursesPage & ListCourseDeliveriesPage
     *  VF pages. Users will select courses using the checkboxes and then click
     *  to see the upcoming course deliveries for those courses.
     */

    // Represents the main course list
>>>>>>> main
    public List<ContactWrapper> agentList {
        get {
            if (agentList == null) {
                agentList = new List<ContactWrapper>();
<<<<<<< HEAD
                for (Contact agent : [SELECT Id, Name, City__c, State__c, Phone, Email
=======
                for (Contact agent : [SELECT Name, Phone, Email
>>>>>>> main
                                           FROM Contact]) {
                    agentList.add(new ContactWrapper(agent));
                }
            }
            return agentList;
        }
        set;
    }

<<<<<<< HEAD
    // Contains only the Agents selected
=======
    // Contains only the course selected
>>>>>>> main
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

<<<<<<< HEAD
        // First clear out any previously selected Agents
        selectedAgents.clear();

        // Add the newly selected Agents to the map
=======
        // First clear out any previously selected courses
        selectedAgents.clear();

        // Add the newly selected courses to the map
>>>>>>> main
        for (ContactWrapper cw : agentList) {
            if (cw.checked) {
                selectedAgents.put(cw.agents.Id, cw);
            }
        }

<<<<<<< HEAD
        // if there are agents selected, return navigate to the Selected Agents Page
        if(selectedAgents.size() > 0) {
            return Page.SelectedAgentsPage;
        } else {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Please select at least one Agent'));
            return null;
        }
        
    }

        // if the ContactWrapper is empty, query the object and return only results of those records added to the Selected Agents Map
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

        // When button is activated, return user to List of Agents Page
        public Pagereference newSearch() {
            Pagereference newPage = Page.ListOfAgentsPage;
            newPage.setRedirect(true);
            return newPage;
        }
=======
        /** TODO #1: Write an If-else statement that implements the following algorithm:
         *             -- If the size of the selectedCourses property is greater than 0
         *                -- return Page.ListCourseDeliveriesPage
         *             -- else:
         *                -- call the addMessage method of the ApexPages class passing in
         *                   a newly constructed instance of the ApexPages.message class.
         *                   The ApexPages.Message class constructor should be passed
         *                   two parameters:
         *                   -- the enumerated value ApexPages.Severity.ERROR
         *                   -- the String 'Please select at least one Course'
         *                   -- return null
         */
    //     if(selectedAgents.size() > 0) {
    //         return Page.SelectedAgentsPage;
    //     } else {
    //         ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Please select at least one Agent'));
    //         return null;
    //     }
    return null;
    }

    /** TODO #2: Declare a read-only property, whose type is a List of
     *		Course_Delivery__c sObjects named deliveries and have it include:
     *      -- an if statement that, if the deliveries property is null
     *         -- Assign the deliveries to a new instance of a list of 
     *				Course_Delivery__c sObjects that will accept as a
     *				parameter a SOQL query that:
     *              -- Selects the Name, Course__r.Name, Instructor__r.Name,
     *                        Location__c, Start_Date__c, Status__c fields
     *              -- From the Course_Delivery__c sObject
     *              -- Where the value of the Course__c field is in the KeySet
     *					for the selectedCourses property and the Status__c is
     *					not equal to 'Cancelled' and the Start_Date__c is
     *					greater to or equal to the keyword TODAY.
     *              -- Order by Start_Date__c
     *              -- Return the deliveries property
     *             Be sure to include the set property and make it private.
    //  */
    // public List<Contact> agents {
    //     get {
    //         if(agents == null) {
    //             agents = new List<Contact>([SELECT Name, Phone, Email
    //                                                         FROM Contact
    //                                                         WHERE Name IN :selectedAgents.keySet()
    //                                                         ORDER BY Name]);
    //         }
    //         return agents;
    //     } 
    //     private set;   
    // }

    /** TODO #3: Declare a method whose return type is PageReference named
     *		newSearch. Within the method:
     *      -- Declare a variable whose type is a PageReference named newPage &
     *      	assign it a value of Page.SearchCoursesPage.
     *      -- Call the setRedirect (true) method of the newPage property
     *      -- return the newPage property
     */
    // public Pagereference newSearch() {
    //     Pagereference newPage = Page.ListOfAgents;
    //     newPage.setRedirect(true);
    //     return newPage;
    // }

    // Wrapper class
    public class ContactWrapper {
        public Contact agents {get; set;}
        public Boolean checked {get; set;}

        public ContactWrapper(Contact c) {
            agents = c;
            checked = false;
        }
    }
>>>>>>> main
}