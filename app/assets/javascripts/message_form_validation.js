  $("#message_message_body").bind('input propertychange', function() {
    calculate();
  });

  $(document).ready(function(){
    calculate();
  });

  function calculate() {
    var mLength = parseInt($("#message_message_body").val().length);
    var remLength = 150 - mLength;
    var overLength = mLength - 150;
    $("h4.remaining").text(remLength);
    if (remLength < 0) {
      $(".send-message").prop("disabled", true);
      $("#error-form").removeClass("hidden").text("Your message is "+overLength+" characters too long");
    }
    else if (remLength == 150){
      $("#error-form").removeClass("hidden").text("You must enter at least 1 character to send a message");
      $(".send-message").prop("disabled", true);
    }
    else {
      $("#error-form").addClass("hidden")
      $(".send-message").prop("disabled", false);
    }
  }