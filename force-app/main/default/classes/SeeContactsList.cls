public class SeeContactsList {

    public String searchText {
        get {
            return searchText;
        }
        set {
            searchText = value;
        }
    }

    // public Boolean matches {
    //     get {
    //         return ((contactList != null) && (contactList.size() != 0));
    //     }
    //     set;
    // }

    public Boolean searched {get; set;}

    //public ApexPages.StandardSetController setCon {get; set;}

    // Create a variable to hold a list of contacts pulled in through a query if no list is found
      public ApexPages.StandardSetController contactList {

            get {
                if (contactList == null) {
                    contactList = new ApexPages.StandardSetController(Database.getQueryLocator(
                        [SELECT Id, Name, Phone, Email, Account.Name FROM Contact]
                    ));
                    }
                    return contactList;
                }       
                set;
    }

        public List<Contact> getContacts() {
            return (List<Contact>) contactList.getRecords();
        }


    public void Search() {

       if (String.isNotBlank(searchText) && searchtext.length() > 1) {
            
            if(!searchText.endsWith('*')) {
                searchText = searchText + '*';
            }

            List<Contact> contacts = [FIND :searchText
                                        IN ALL FIELDS
                                        RETURNING Contact (Id, Name, Email,
                                        Phone, Account.Name)][0];

            contactList = new ApexPages.StandardSetController(contacts);
            contactList.setPageNumber(1);
            contactList.setPageSize(10);

            searched = true;


        } else {
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,
                                'Please enter search text at least two characters long'));
        }
    }


    
}