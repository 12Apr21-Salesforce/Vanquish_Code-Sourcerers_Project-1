@isTest
public class AptProp_Test {
    @isTest static void aptTest(){    
    
    	Apartment__c aptAdd = new Apartment__c(Name = 'Lake View Apartments', 
                       Total_SqFt_of_the_Building__c=30000, Cost_of_Building__c=6000000, Total_No_Of_Units__c=20);
        Test.startTest();
        Database.SaveResult aptSave = Database.insert(aptAdd,true);
        Test.stopTest();
        System.assert(aptSave.isSuccess());
        
}
        //Unit_Type__c='2Bed 2Bath',
        
        @isTest static void propTest(){
			Apartment__c aptAdd = new Apartment__c(Name = 'Lake View Apartments', 
                         Total_SqFt_of_the_Building__c=30000, Cost_of_Building__c=6000000, Total_No_Of_Units__c=20);
    		insert aptAdd;
       
        	Property__c propAdd = new Property__c(Apartment_Name__c=aptAdd.Id, Property_ID__c='DD212', 
                              Name='LakeView Flat', Area_in_SqFt__c=1000);
        	Test.startTest();
            Database.SaveResult propSave = Database.insert(propAdd,true);
        	Test.stopTest();
        	System.assert(propSave.isSuccess());
        
    }
    
/*
 * @isTest 
public class ControllerTestClass 
{
	 static testMethod void withPhoneNumber() 
	 {
		Account testAccount = new Account();
		testAccount.Name='Test Account' ;
		insert testAccount;

		Contact cont = new Contact ();
		cont.FirstName = 'FirstName';
		cont.LastName = 'LastName';
		cont.Email='email@email.com';
		cont.phone='12345678';
		insert cont;
		
		Test.StartTest(); 

			PageReference pageRef = Page.AccountPlan; // Add your VF page Name here
			pageRef.getParameters().put('phone', '234567');
			pageRef.getParameters().put('orderId', String.valueOf(testAccount.Id));
			Test.setCurrentPage(pageRef);

			ListContactDetailOnCallController testAccPlan = new ListContactDetailOnCallController();
			testAccPlan.redirPage();	
		Test.StopTest();
	 }
*/
}