public with sharing class reRoutetoContactList {

    private Apexpages.StandardController controller;

    public reRoutetoContactList(ApexPages.StandardController stdController){
        this.controller = stdController;
    }

        public PageReference saveAndRedirect(){

            controller.save();

<<<<<<< HEAD
            PageReference newPage = Page.ListOfAgentsPage;
=======
            PageReference newPage = Page.contactListPage;
>>>>>>> main
            newPage.setRedirect(true);
    
            return newPage;
        }

 }