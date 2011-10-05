$(function(){
    
    $('input[placeholder]').each(function(){
        var ph = $(this).attr('placeholder'); $(this).val(ph).css('color', '#666')
            .focus(function(){if($(this).val()==ph)$(this).val('').css('color', '#333')})
            .blur(function(){if(!$(this).val())$(this).val(ph).css('color', '#666')})})

/*
    $('#teste').spin({
        lines:  15,     // The number of lines to draw
        length: 2,      // The length of each line
        width:  2,      // The line thickness
        radius: 5,      // The radius of the inner circle
        color:  '#000', // #rgb or #rrggbb
        speed:  1.5,    // Rounds per second
        trail:  60,     // Afterglow percentage
        shadow: false   // Whether to render a shadow
    })
*/

})