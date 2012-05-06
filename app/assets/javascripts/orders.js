
//app/assets/javascripts/orders.js

$(function() {

  var item = {
    addItem: function() {
      var template = { timestamp : $.now() }
      $('#items').append(selleck($("script#item").html(), template));
    },

    init: function() {
      $('a#add_item').click(item.addItem);
    }
  };


  item.init();

});
