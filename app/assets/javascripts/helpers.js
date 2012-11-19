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
    $('a[rel=popover]').not(this).popover('hide');
    e.preventDefault() });

  popOvers.popover({
    html:      true,
    placement: 'bottom',
    title:     'Enviar Sugestão de Correção',
    content:   $('template#fix-phone').html() }) };

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
