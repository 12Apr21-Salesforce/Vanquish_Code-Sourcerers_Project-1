public with sharing class reRoutetoContactList {

    private Apexpages.StandardController controller;

    public reRoutetoContactList(ApexPages.StandardController stdController){
        this.controller = stdController;
    }

        public PageReference saveAndRedirect(){

            controller.save();

            PageReference newPage = Page.contactListPage;
            newPage.setRedirect(true);
    
            return newPage;
        }

 }

