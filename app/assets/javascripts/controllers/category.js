$(document).ready(function() {
  $('.service-select').change(function() {
      $.ajax({
        url: "/update_categories",
        data: {
          service : $('.service-select').val()
        },
        dataType: "script"
      });
  });
})
