
//app/assets/javascripts/orders.js

$(function() {

  var item = {
    $el: $("form#new_order"),
    addItem: function(e) {
      e.preventDefault();
      var template = { timestamp : $.now() }
      item.$el.find('#items').append(selleck($("script#item").html(), template));
    },

    deleteItem: function(e) {
      e.preventDefault();
      var $parent = $(this).closest('li');

      if (!$parent.find('input.destroy').val()) {
        $parent.remove();
      }
      else {
        $parent.hide().find('input.destroy').val('true');
      }
    },

    init: function() {
      item.$el.on("click.addItem", "a#add_item", item.addItem);
      item.$el.on("click.deleteItem", "a.delete", item.deleteItem);
    }
  };

  item.init();

});
