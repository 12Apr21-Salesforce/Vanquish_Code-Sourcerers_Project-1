public class NewApartmentAndUnits {
    public WrapAptProp wApt {get;set;}
   
    public String Idkey {get;set;}
    
    public NewApartmentAndUnits(){
        wApt = new WrapAptProp(new Apartment__c(), new List<Property__c>());
        system.debug(ApexPages.currentPage().getParameters());
        Idkey = ApexPages.currentPage().getParameters().get('id');
        System.debug('idkey '+idkey);
        if(Idkey != null){
            wApt.apt = [select Id, Name, Total_SqFt_of_the_Building__c,Cost_of_Building__c, 
                       Cons_Cost_per_SqFt__c,Total_No_Of_Units__c from Apartment__c where id=:Idkey limit 1];
       }    
        System.debug('After If '+wApt.apt);
 		wApt.prop.add(new Property__c(Apartment_Name__c=wApt.apt.id));  
    }
//adds new row for every new unit to add
    public void addrow(){
        	wApt.prop.add(new Property__c(Apartment_Name__c=wApt.apt.id));  
    }
    
    public PageReference newApartment(){
        insert wApt.apt;
        PageReference aptPage = new PageReference('/apex/NewProperties?&id='+wApt.apt.Id);
        aptPage.setRedirect(true);
        return aptPage;
    }
  
    public PageReference saveProperties(){     
        insert wApt.prop;
        return new PageReference('/apex/PropList'); 
    }     
    
    public class wrapAptProp {
	    public Apartment__c apt {get; set;}
    	public List<Property__c> prop {get; set;} 

        public wrapAptProp(Apartment__c aptList, List<Property__c> propList) {
            apt = aptList;
            prop = propList;
        }
    } 
}