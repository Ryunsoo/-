let deleteFetch = (device) => {
	   fetch('/push/delete-token?device=' + device)
       .then(response => {
       return response.text();
    }).then(text => {
          if(text == 'success'){
             PushOffSuccess(device);
          }else if(text == 'fail'){
             PushFail(device);                    
          }
       }).catch(error => {
       		PushFail(device);
    })
   }

    