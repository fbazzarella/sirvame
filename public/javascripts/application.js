$(function(){
    
    $('input[placeholder]').each(function(){
        var ph = $(this).attr('placeholder')
        if(!$(this).val()) $(this).val(ph).css('color', '#666')
        $(this).focus(function(){if($(this).val()==ph)$(this).val('').css('color', '#333')})
            .blur(function(){if(!$(this).val())$(this).val(ph).css('color', '#666')})})

    $('.search form').submit(function(e){
        e.preventDefault()
        sp = $(this).find('input').val()
        search_url = $(this).attr('action') + (sp ? '/' + sp : '') + '.js'

        $.ajax({
            url: search_url,
            type: 'GET',
            dataType: 'html',
            success: function(data){
                $('.search-results').quicksand($(data).find('li'), {adjustHeight: 'dynamic'})}})})

    // $('input[type=text]', '.create-account').popover({placement: 'left', offset: 5, trigger: 'focus', html: true})
    // $('input[type=password]', '.create-account').popover({placement: 'above', offset: 20, trigger: 'focus', html: true})
    // $('.payment-period', '.create-account').popover({placement: 'left', offset: 5, trigger: 'hover', html: true})
})