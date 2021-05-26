public with sharing class HireMeEXT {

    private final Contact con;
    // use this to get the stadard controller of the page to call its save function
    private ApexPages.StandardController c1;
    public String confrimMes = '';

    
    // The extension constructor initializes the private member
    // variable con by using the getRecord method from the standard
    // controller.
    public HireMeEXT(ApexPages.StandardController stdController) {
        this.con = (Contact)stdController.getRecord();
        this.c1 = stdController;
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


    // save 2 prevents the standard saves redirect functionality
    public PageReference save2(){

        c1.save();
        PageReference newPage = Page.HireMePage;
        newPage.setRedirect(false);
        confrimMes = 'Information succesfully added';

        return newPage;

    }
    public String getGreeting() {

        return confrimMes ;
    }
}
