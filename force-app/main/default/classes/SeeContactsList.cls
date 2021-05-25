public with sharing class SeeContactsList {

    public String searchText {
        get {
            return searchText;
        }
        set {
            searchText = value;
        }
    }

    public Boolean matches {
        get {
            return ((contactList != null) && (contactList.size() != 0));
        }
        set;
    }

    public Boolean searched {get; set;}

    public ApexPages.StandardSetController setCon {get; set;}

    // Create a variable to hold a list of contacts pulled in through a query if no list is found
      public List<Contact> contactList {

            get {
                if (contactList == null) {
                    contactList = new List<Contact>();
                    for (Contact con : [SELECT Name, Phone, Email, Account.Name
                                            FROM Contact]) {
                        contactList.add(con);
                    }

                if (setCon != null) {
                    return (List<Contact>)setCon.getRecords();

                    }

            }
            return contactList;
        }
        set;
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

            setCon = new ApexPages.StandardSetController(contacts);
            setCon.setPageNumber(1);
            setCon.setPageSize(10);

            searched = true;


        } else {
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,
                                'Please enter search text at least two characters long'));
        }
    }


    
}