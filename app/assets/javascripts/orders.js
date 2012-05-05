$(function() {

  var item_template = { timestamp : $.now() }

  var item = {
    addItem: function() {
      $('ul.items').append(selleck($("script#item").html(), item_template));
    },
    init: function() {
      $('a#add_item').click(item.addItem);
    }
  };


  item.init();

});
