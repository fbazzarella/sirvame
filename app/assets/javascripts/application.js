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

            $(this).focus(function(){
                if($(this).val()==ph){ $(this).val('').css('color', '#333') };
            }).blur(function(){
                if(!$(this).val()){ $(this).val(ph).css('color', '#666') }; }); }); };

    function normalizeSearchParams(params, direction){
        if(!params) return '';

        params = decodeURI(params.replace(/,|\s|\++/gi, '+'));
        switch(direction){
            case 'go':   params = params.replace(/\++/gi, '+');  break;
            case 'back': params = params.replace(/\++/gi, ', '); break; }
        return params };
    
    var searchForm = $('.search form');

    searchForm.submit(function(e){
        e.preventDefault();
        sp = $(this).find('input').val();
        searchUrl = '/encontrar' + (sp ? '/' + sp : '');

        SirvaMeRouting.navigate('!' + normalizeSearchParams(searchUrl, 'go'));

        $.ajax({
            url: encodeURI(searchUrl + '.js'),
            type: 'GET',
            dataType: 'html',
            success: function(data){
                $('.search-results').quicksand($(data).find('li'), {adjustHeight: 'dynamic'}); } }); });

    window.SirvaMeRouting = new (Backbone.Router.extend({
        routes: {
            '':                       'search',
            '!/encontrar':            'search',
            '!/encontrar/:encontrar': 'search' },

        search: function(searchParams){
            searchForm.find('input').val(normalizeSearchParams(searchParams, 'back'));
            searchForm.submit();
            checkPlaceHolders(); } }) );

    checkPlaceHolders();
    Backbone.history.start();

});