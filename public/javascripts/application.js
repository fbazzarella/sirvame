$(function(){
    
    $('input[placeholder]').each(function(){
        var ph = $(this).attr('placeholder'); $(this).val(ph).css('color', '#666')
            .focus(function(){if($(this).val()==ph)$(this).val('').css('color', '#333')})
            .blur(function(){if(!$(this).val())$(this).val(ph).css('color', '#666')})})

    // $('input[type=text]', '.create-account').popover({placement: 'left', offset: 5, trigger: 'focus', html: true})
    // $('input[type=password]', '.create-account').popover({placement: 'above', offset: 20, trigger: 'focus', html: true})
    // $('.payment-period', '.create-account').popover({placement: 'left', offset: 5, trigger: 'hover', html: true})
})