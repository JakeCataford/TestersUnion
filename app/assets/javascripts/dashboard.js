//= require jqueryform

function success(response) {
  if(response == "good") {
    location.reload(true)
  } else {
    alert("failed to add release")
  }
}

$(document).ready(function() {
          var options = {
              beforeSubmit: function(arr, $form, options) { 
                return confirm("Warning, this will email everyone notifying them of a release. Continue?");               
              },
              success: success
          };

          $('#release').ajaxForm(options);
});