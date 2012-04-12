// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree ./plugins/

$(function(){

    function checkPlaceHolders(){
        $('input[placeholder]').each(function(){
            var ph = $(this).attr('placeholder');

            if(!$(this).val()){ $(this).val(ph).css('color', '#666') };

            $(this).bind('focus click', function(){
                if($(this).val()==ph){ $(this).val('').css('color', '#333') }
            }).blur(function(){
                if(!$(this).val()){ $(this).val(ph).css('color', '#666') } }) }) };

    function normalizeSearchParams(params, direction){
        if(!params) return '';

        params = decodeURI(params.replace(/,|\s|\++/gi, '+')).split('+');

        for(i = params.length; i >= 0; i--){
            if(!params[i]){ params.splice(i, 1) } };

        switch(direction){
            case 'go':   return params.join('+');
            case 'back': return params.join(', ') } };

    var searchForm = $('.search form');
    var spinContainer = searchForm.find('.add-on');
    var zoomTool = spinContainer.html();

    searchForm.submit(function(e){
        e.preventDefault();

        var spinner = new Spinner({
            lines: 15, length: 5, width: 2, radius: 6, color: '#000',
            speed: 1, trail: 30, shadow: false }).spin(spinContainer.empty()[0]);

        var sp = normalizeSearchParams($(this).find('input').val(), 'go');
        var searchUrl = '/encontrar' + (sp ? '/' + sp : '');

        SirvaMeRouting.navigate('!' + searchUrl);

        if(typeof mixpanel != 'undefined' && sp){
            mixpanel.track('Search', {'City': 'Valença'}) };

        $.ajax({
            url: encodeURI(searchUrl + '.js'),
            type: 'GET',
            dataType: 'html',
            success: function(data){
                $('.search-results').quicksand($(data).find('li'), {adjustHeight: 'dynamic'}, function(){
                    spinContainer.html(zoomTool) }) } }) });

    window.SirvaMeRouting = new (Backbone.Router.extend({
        routes: {
            '':                       'search',
            '!/encontrar':            'search',
            '!/encontrar/:encontrar': 'search' },

        search: function(searchParams){
            searchForm.find('input').blur().val(normalizeSearchParams(searchParams, 'back'));
            searchForm.submit();
            checkPlaceHolders() } }) );

    checkPlaceHolders();
    Backbone.history.start();

});