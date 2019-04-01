$(function() {
  $('#login-submit').on('click', function() {
    $('#login-prompt').modal({
      relatedTarget: this,
      onConfirm: function(e) {
       
      },
      onCancel: function(e) {
        
      }
    });
  });
  
  $('#register-submit').on('click', function() {
  	
    $('#register-prompt').modal({
      relatedTarget: this,
      onConfirm: function(e) {
       
      },
      onCancel: function(e) {
        
      }
    });
  });
  
});