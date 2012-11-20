function checkLionbars(){
  $('#search-results .data').lionbars() }

function checkPlaceHolders(){
  $('input[placeholder]').each(function(){
    var ph = $(this).attr('placeholder');

    if(!$(this).val()){ $(this).val(ph).css('color', '#666') };

    $(this).bind('focus click', function(){
      if($(this).val()==ph){ $(this).val('').css('color', '#333') }
    }).blur(function(){
      if(!$(this).val()){ $(this).val(ph).css('color', '#666') } }) }) };

function loadFancyBox(){
  $('.cover a, .images a').fancybox({
    openEffect: 'elastic', closeEffect: 'fade', prevEffect: 'fade', nextEffect: 'fade',
    padding: 2, helpers: {title: {type: 'over'}} }) };

function loadPopovers(){
  var popOvers = $('a[rel=popover]');

  popOvers.show().click(function(e){
    setTimeout(function(){ $('.fix-phone input').mask('(99) 9999-9999') }, 10);
    $('a[rel=popover]').not(this).popover('hide');
    e.preventDefault() });

  popOvers.popover({
    html:      true,
    placement: 'top',
    title:     'Enviar Sugestão de Correção',
    content:   $('#fix-phone-sugestion').html() }) };

function loadFixPhone(){
  $('.fix-phone .sugestion button').live('click', function(){
    var spinContainer  = $(this).parent();
    var phoneSugestion = spinContainer.prev().attr('disabled', 'disabled');
    var spinner        = new Spinner(spinOptions).spin(spinContainer.empty()[0]);

    $.ajax({
      url: '/companies/' + spinContainer.closest('li').data('id') + '/fix_phone',
      type: 'POST',
      data: {phone_sugestion: phoneSugestion.val()},
      dataType: 'html',
      complete: function(xhr, status){
        spinContainer.closest('.fix-phone').slideUp('high', function(){
          $(this).empty().append($('#fix-phone-' + status).html()).slideDown('high') }) } }) 
  });

  $('.fix-phone .success button').live('click', function(){
    $(this).closest('.popover').prev().popover('hide') });

  $('.fix-phone .error button').live('click', function(){
    $(this).closest('.fix-phone').slideUp('high', function(){
      $(this).empty().append($('template .fix-phone').html()).slideDown('high') }) }) };

function sanitize(params, direction){
  if(!params) return '';

  params = decodeURI(params.replace(/,|\s|\++/gi, '+')).split('+');

  for(i = params.length; i >= 0; i--){
    if(!params[i]){ params.splice(i, 1) } };

  switch(direction){
    case 'go':   return params.join('+');
    case 'back': return params.join(' ') } };

function ableToScroll(){
  return $('body').hasClass('catalog') &&
    !$('#none-companies')[0] &&
    pageScrolling &&
    nextPage <= maxPages &&
    $('.result').length % 3 == 0 &&
    $(window).scrollTop() > $(document).height() - $(window).height() - 20 };

function paginate(){
  if(ableToScroll()){
    pageScrolling = false;

    $.ajax({
      url: encodeURI(searchUrl + '.js?page=' + nextPage),
      type: 'GET',
      dataType: 'html',
      success: function(data){
        $('#search-results').css('height', '').append($(data).find('li').hide()).find('li').slideDown();
        checkLionbars();
        loadPopovers();
        nextPage++ },
      complete: function(){
        pageScrolling = true } }) } };
