public with sharing class HireMe_CC {

    // look at sending pagerefe to this function to cut down on repeat code methods, abstract out the one change
    public Boolean DisplayConfirm {get;set;}
    public ApexPages.StandardController c1;

    public Contact neuHire{
        get{
            if (neuHire == null) {
                neuHire = new Contact();
            }
            return neuHire;
        }
        set;
    }

    public Case nCase{ /////////////////////////////// REMBER TO ADD CASE OWNER WHEN WE GO TO SAVE
        get{
            if (nCase == null) {
                nCase = new Case();
            }
            return nCase;
        }
        set;
    }
    //*/
    //DisplayConfirm = true;
    public PageReference save(){

       
        c1.save();
        DisplayConfirm = true;
        PageReference newPage = Page.HireMePage;
        newPage.setRedirect(false);

        return newPage;

    }
}