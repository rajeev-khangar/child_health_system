$(document).on('ready page:load turbolinks:load', function(){
  initializeVitaminForm();
  submitTimeField();
});

var initializeVitaminForm = function(){
  $("#setBaby").change(function(){
    iD = $(this).val();
    $.ajax({
    method: "GET",
    url: "/babies/"+ iD + "/vitamin_as/new"
  });
  })
}




var submitTimeField = function(){
  $(".datetimepicker" ).datetimepicker({
    format: 'DD-MM-YYYY',
    ignoreReadonly: true,
    allowInputToggle: true
  })
}   