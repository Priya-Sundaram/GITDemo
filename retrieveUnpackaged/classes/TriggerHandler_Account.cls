public class TriggerHandler_Account {
    public static void updateShippingAddress(List<Account> newList){
        for(Account thisAccount : newList){
            if(thisAccount.Match_Billing_Address__c){
            	thisAccount.ShippingPostalCode = thisAccount.BillingPostalCode; 		    
            }
        }    
    }
}