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
//= require activestorage
//= require turbolinks
//= require jquery-3.4.0.min.js
//= require jquery.mask
//= require cocoon
//= require_tree .

function masked_function() {
  $('#date_field').mask('00/00/0000');
  $('#cpf_field').mask('000.000.000-00');
  $('#cnpj_field').mask('00.000.000/0000-00');
  $('#phone_field').mask('(00) 0000-0000');
  $('#cellphone_field').mask('(00) 0 0000-0000');
  $('#zipcode_field').mask('00000-000');
  $('#time_field').mask('00:00:00');
  $('#datetime_field').mask('00/00/0000 00:00:00');
  $('#car_plate_field').mask('AAA-0000')
  $('#hexacolor_field').mask('#xxxxxx' , {
    translation: {
      'x': {
        pattern: /[a-fA-F0-9]/
      },
      '#' : ''
    }
  });
}
