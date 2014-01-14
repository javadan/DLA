//= require jquery
//= require jquery_ujs
//= require foundation
//= require wysihtml5
//= require parser_rules/simple
//= require readmore
//= require_tree .

$(function(){
  $(document).foundation();
  
  $('.js-readmore').each(function() {
    var height = $(this).attr('data-max-height');
    if(!height) { height = 60 }
    $(this).readmore({ maxHeight: height });
  });
});