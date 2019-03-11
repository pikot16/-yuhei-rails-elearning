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
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

// toggle password visibility
$(function () {
    $('#eye').click(function () {
        if ($(this).hasClass('fa-eye-slash')) {
            $(this).removeClass('fa-eye-slash');
            $(this).addClass('fa-eye');
            $('#password').attr('type', 'text');
        } else {
            $(this).removeClass('fa-eye');
            $(this).addClass('fa-eye-slash');
            $('#password').attr('type', 'password');
        }
    });
});

$(function () {
    $('#eye2').click(function () {
        if ($(this).hasClass('fa-eye-slash')) {
            $(this).removeClass('fa-eye-slash');
            $(this).addClass('fa-eye');
            $('#password2').attr('type', 'text');
        } else {
            $(this).removeClass('fa-eye');
            $(this).addClass('fa-eye-slash');
            $('#password2').attr('type', 'password');
        }
    });
});