$(document).on('ready page:load turbolinks:load', function(){
  initializeVitaminForm();
  setVitaminA();
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

var setVitaminA = function(){
  $(".month_duration").click(function(){
    $(this.form).submit();
  })
}


var submitTimeField = function(){
  $(".datetimepicker" ).datetimepicker({
    format: 'DD-MM-YYYY',
    ignoreReadonly: true,
    allowInputToggle: true
  })
}   