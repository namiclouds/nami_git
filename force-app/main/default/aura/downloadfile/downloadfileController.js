({
	doInit : function(cmp, event, helper) {
        var action = cmp.get("c.displayUploadedFilesURL");
        console.log('method called');
        action.setParams({

            parentId : cmp.get('v.recordId'),
        })
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var res= response.getReturnValue();
                var attachmneturl =[];
               
                for( var i = 0; i < res.length; i++){
                    var imaobject={
                     img:'data:' +res[i].fileextention+';base64,'+res[i].filecontent,
                     alt:res[i].fileName

                    }
                    attachmneturl.push(imaobject);



                }
                
                cmp.set("v.attachmnetlist",attachmneturl);
                console.log('attachmnetlist',cmp.get("v.attachmnetlist"));
            }
            else{
              console.log('error message'+ response.getError() ); 
            }
            
        })
        $A.enqueueAction(action);
    },
})
