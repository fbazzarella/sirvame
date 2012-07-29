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

function normalizeParams(params, direction){
  if(!params) return '';

  params = decodeURI(params.replace(/,|\s|\++/gi, '+')).split('+');

  for(i = params.length; i >= 0; i--){
    if(!params[i]){ params.splice(i, 1) } };

  switch(direction){
    case 'go':   return params.join('+');
    case 'back': return params.join(' ') } };

function ableToScroll(){
  return pageScrolling &&
    nextPage <= maxPages &&
    $('.result').length % 3 == 0 &&
    $(window).scrollTop() > $(document).height() - $(window).height() - 50 };