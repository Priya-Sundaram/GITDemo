public class TriggerHandler_Opportunity {
    public static void doPostActions(List<Opportunity> newList, Map<Id,Opportunity> oldMap){
        List<Task> taskList = new List<Task>();
        for(Opportunity thisOpp : newList){
            if(thisOpp.StageName == 'Closed Won' && oldMap.get(thisOpp.id).StageName != thisOpp.StageName){
                /*** Task Creation ***/
                Task newTask = new Task(); 
                newTask.WhatId = thisOpp.id;
                newTask.ActivityDate = system.today();
                newTask.OwnerId = thisOpp.OwnerId;
                newTask.Priority = 'Normal';
                newTask.Status = 'Not Started';
                newTask.Subject = 'Follow up meeting for '+thisOpp.Name+' Deal closure';
                taskList.add(newTask);
                
                /*** Sending Email notification ***/
                Messaging.SingleEmailMessage sEmail = new Messaging.SingleEmailMessage();
                String[] toAddress = new String[]{'priyadsundaram@gmail.com'};
                sEmail.setToAddresses(toAddress);
                sEmail.setSubject('Follow up meeting for '+thisOpp.Name+' Deal closure');
                sEmail.setPlainTextBody('Dear '+thisOpp.Owner.Name+
                                        ' Please follow-up with the opportunity team for deal closure');
                Messaging.sendEmail(new List<Messaging.Email>{sEmail});
            }    
        }
        if(!taskList.isEmpty()){
            Database.insert(taskList);
        }
    }
}