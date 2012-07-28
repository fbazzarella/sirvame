//= require jquery
//= require jquery-lionbars
//= require fancybox
//= require_tree ./plugins/

$(function(){

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

  function normalizeParams(params, direction){
    if(!params) return '';

    params = decodeURI(params.replace(/,|\s|\++/gi, '+')).split('+');

    for(i = params.length; i >= 0; i--){
      if(!params[i]){ params.splice(i, 1) } };

    switch(direction){
      case 'go':   return params.join('+');
      case 'back': return params.join(' ') } };

  var searchForm = $('.search form');
  var spinContainer = searchForm.find('.add-on');
  var zoomTool = spinContainer.html();

  searchForm.submit(function(e){
    e.preventDefault();

    firstLoad = false;

    var searchField = $(this).find('input');

    if(searchField.val() != searchField.attr('placeholder')){
      var spinner = new Spinner({
        lines: 15, length: 5, width: 2, radius: 6, color: '#000',
        speed: 1, trail: 30, shadow: false }).spin(spinContainer.empty()[0]);

      var sp = normalizeParams(searchField.val(), 'go');
      var searchUrl = '/encontrar' + (sp ? '/' + sp : '');
      var routerUrl = sp ? '!/encontrar/' + sp : '';

      SirvaMeRouting.navigate(routerUrl);

      $.ajax({
        url: encodeURI(searchUrl + '.js'),
        type: 'GET',
        dataType: 'html',
        success: function(data){
          $('#search-results').quicksand($(data).find('li'), {adjustHeight: 'dynamic'}, function(){
            checkLionbars();
            spinContainer.html(zoomTool) }) } }) } });

  window.SirvaMeRouting = new (Backbone.Router.extend({
    routes: {
      '':                       'home',
      '!/encontrar':            'search',
      '!/encontrar/:encontrar': 'search' },

    home: function(){
      searchForm.find('input').blur().val('');
      if(!firstLoad){ searchForm.submit() }
      checkPlaceHolders() },

    search: function(searchParams){
      searchForm.find('input').blur().val(normalizeParams(searchParams, 'back'));
      searchForm.submit();
      checkPlaceHolders() } }) );

  window.firstLoad = true;

  checkLionbars();
  checkPlaceHolders();

  Backbone.history.start();

  $('.addthis').show();

  $('.cover a, .images a').fancybox({
    openEffect: 'elastic', closeEffect: 'fade', prevEffect: 'fade', nextEffect: 'fade',
    padding: 2, helpers: {title: {type: 'over'}} });

});