public with sharing class HireMe_CC {

    // look at sending pagerefe to this function to cut down on repeat code methods, abstract out the one change

    public Candidate__c neuHire{

        get{
            if (neuHire == null) {

                neuHire = new Candidate__c();
            }
            return neuHire;

        }
        private set;

    }
    public PageReference Redirect2Client(){

        PageReference newPage = Page.NewClientPage;
        newPage.setRedirect(true);

        return newPage;
    }
    public PageReference Redirect2PropAdd(){

        PageReference newPage = Page.addAPropertyPage;
        newPage.setRedirect(true);

        return newPage;
    }

    
}
