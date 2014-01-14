//= require jquery
//= require jquery_ujs
//= require foundation
//= require wysihtml5
//= require parser_rules/simple
//= require readmore
//= require_tree .

$(function(){
  $(document).foundation();
  $('.js-readmore').readmore({ maxHeight: 30 });
});