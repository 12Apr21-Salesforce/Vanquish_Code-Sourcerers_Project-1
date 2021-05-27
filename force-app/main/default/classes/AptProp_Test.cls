@isTest
public class AptProp_Test {
    @isTest static void aptTest(){    
        NewApartmentAndUnits controller = new NewApartmentAndUnits(); 
        PageReference pageRef = Page.NewApartment;
        Test.setCurrentPage(pageRef);
        
        
        Apartment__c aptAdd = new Apartment__c(Name = 'Lake View Apartments', Total_SqFt_of_the_Building__c=30000, Total_No_Of_Units__c=20,Cost_of_Building__c=6000000);
        Test.StartTest();  
        try{
        	system.debug('before insert');
            insert aptAdd ; 
			system.debug('after insert');
        } catch(Exception e){
            System.Debug('Insert error '+e.getMessage());
        }
        
        String aptDetailsPage = controller.newApartment().getUrl();
        System.assertEquals('/apex/ApartmentDetails',aptDetailsPage);
        
        controller = new NewApartmentAndUnits(); 
        Property__c propAdd = new Property__c(Apartment_Name__c=aptAdd.Name, Name='TwoBed Flat', 
                                               Property_ID__c='LV101',Area_in_Sqft__c=1000);
        System.debug('Property Insert');
        String newPropPage = controller.newProperties().getUrl();
        system.assertEquals('/apex/newProperties',newPropPage);
        
        insert propAdd;
        String propDetailsPage = controller.saveProperties().getUrl();
        system.assertEquals('/apex/PropList',propDetailsPage);
        Test.stopTest();
    }
}