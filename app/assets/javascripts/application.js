//= require jquery
//= require jquery-lionbars
//= require fancybox
//= require_tree ./plugins/
//= require helpers

$(function(){

  firstLoad     = true;
  searchForm    = $('.search form');
  searchField   = searchForm.find('input');
  spinContainer = searchForm.find('.add-on');
  zoomTool      = spinContainer.html();
  searchUrl     = '/encontrar';
  spinOptions   = {
    lines: 15, length: 5, width: 2, radius: 6, color: '#000',
    speed: 1, trail: 30, shadow: false };

  searchForm.submit(function(e){
    e.preventDefault();

    firstLoad = false;

    if(searchField.val() != searchField.attr('placeholder')){
      var spinner = new Spinner(spinOptions).spin(spinContainer.empty()[0]);
      var sp      = normalizeParams(searchField.val(), 'go');

      SirvaMeRouting.navigate(sp ? '!/encontrar/' + sp : '');

      searchUrl = '/encontrar' + (sp ? '/' + sp : '');

      $.ajax({
        url: encodeURI(searchUrl + '.js'),
        type: 'GET',
        dataType: 'html',
        success: function(data){
          $('#search-results').quicksand($(data).find('li'), {adjustHeight: 'dynamic'}, function(){
            checkLionbars();
            spinContainer.html(zoomTool) }) } }) } });

  SirvaMeRouting = new (Backbone.Router.extend({
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

  checkLionbars();
  checkPlaceHolders();
  loadFancyBox();
  Backbone.history.start();

  $('.addthis').show();
  $('.pagination').remove();

});