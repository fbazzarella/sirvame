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
            case 'back': return params.join(', '); } };

    function markMatches(params) {
        if(!params) return false;
        
        params = params.split('+');

        $('li.result').each(function(){
            var result = $(this);
            $.each(params, function(i, val){
                result.html(result.html().replace(new RegExp('(' + val + ')', 'gi'), '<span class="matched">$1</span>')) }) }) }
    
    var searchForm = $('.search form');

    searchForm.submit(function(e){
        e.preventDefault();

        var opts = {
            lines: 15, length: 5, width: 2, radius: 6, color: '#000',
            speed: 1, trail: 30, shadow: false };

        var spinContainer = $(this).find('.add-on');
        var zoomTool = spinContainer.html();
        var spinner = new Spinner(opts).spin(spinContainer.empty()[0]);

        var sp = normalizeSearchParams($(this).find('input').val(), 'go');
        var searchUrl = '/encontrar' + (sp ? '/' + sp : '');

        SirvaMeRouting.navigate('!' + searchUrl);

        $.ajax({
            url: encodeURI(searchUrl + '.js'),
            type: 'GET',
            dataType: 'html',
            success: function(data){
                $('.search-results').quicksand($(data).find('li'), {adjustHeight: 'dynamic'}, function(){
                    markMatches(sp);
                    spinContainer.html(zoomTool); }) } }) });

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