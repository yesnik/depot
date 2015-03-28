$(function () { 
  $('.store .entry > img').on('click', function () {
    $(this).parent().find(':submit').click();
  });
});
