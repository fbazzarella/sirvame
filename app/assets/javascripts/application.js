// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree ./plugins/
//= require_tree ./twitter/

$(function(){
    
    $('input[placeholder]').each(function(){
        var ph = $(this).attr('placeholder');

        if(!$(this).val()){ $(this).val(ph).css('color', '#666') };

        $(this).focus(function(){
            if($(this).val()==ph){ $(this).val('').css('color', '#333') };
        }).blur(function(){
            if(!$(this).val()){ $(this).val(ph).css('color', '#666') };
        });
    });

    $('.search form').submit(function(e){
        e.preventDefault();
        sp = $(this).find('input').val();
        search_url = $(this).attr('action') + (sp ? '/' + sp : '') + '.js';

        $.ajax({
            url: search_url,
            type: 'GET',
            dataType: 'html',
            success: function(data){
                $('.search-results').quicksand($(data).find('li'), {adjustHeight: 'dynamic'});
            }
        });
    });

    // $('input[type=text]', '.create-account').popover({placement: 'left', offset: 5, trigger: 'focus', html: true})
    // $('input[type=password]', '.create-account').popover({placement: 'above', offset: 20, trigger: 'focus', html: true})
    // $('.payment-period', '.create-account').popover({placement: 'left', offset: 5, trigger: 'hover', html: true})
});