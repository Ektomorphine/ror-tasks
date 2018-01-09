// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require jquery
//= require_tree .

$(document).ready(function(){
  $('.send-button').click(function(event) {
    event.preventDefault();    
    var value = $('.input').val();
    $.ajax({
      type:'POST',
      url:'/remotes',
      beforeSend: beforeSend,
      data: { remote: { text: value } },
      dataType: 'json',
      success: function (data) {        
        $('.right').append(
            '<h3>' + 
              data.text +
              '<span class="date">' + data.date + '</span>' + 
            '</h3>'
        );
        var itemsLength = $('h3').length;
        $('#counter').text(itemsLength);      
        if (itemsLength == 0 || itemsLength > 4) {
          $('#pluralize').text('запросов');
        } else if (itemsLength >= 2 && itemsLength <= 4) {
          $('#pluralize').text('запроса');        
        } else $('#pluralize').text('запрос');
        $('.input').val('');
      }
    })
  })
})

function beforeSend(xhr) {
  xhr.setRequestHeader('X-CSRF-Token',
    $('meta[name="csrf-token"]').attr('content')
  )
}
