$(document).on('ready page:load turbolinks:load', function(){
  initializeVitaminForm();
  setVitaminA();
  submitFeedingForm();
  submitCareForm();
  submitFeedingFormBreastMilk();
  submitCareFormField();
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

var submitFeedingForm = function(){
  $(".breast_milk").click(function(){
    $(this.form).submit();  
  })
}

var submitCareForm = function(){
  $(".breast_milk").click(function(){
    $(this.form).submit();  
  })
}

var submitFeedingFormBreastMilk = function(){
  $("").on("click keyup", function(){
    $(this.form).submit();  
  })
}

var submitCareFormField = function(){
  $(".breast_milk").on("click", function(){
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