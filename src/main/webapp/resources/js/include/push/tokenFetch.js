let fetchToken = (token,device) => {
	   fetch('/push/save-token?token=' + token + '&device=' + device)
       .then(response => {
       return response.text();
    }).then(text => {
          if(text == 'success'){
             PushOnSuccess(device);
          }else if(text == 'fail'){
             PushFail(device);                    
          }
       }).catch(error => {
       		PushFail(device);
    })
   }

    