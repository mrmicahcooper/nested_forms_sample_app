
//app/assets/javascripts/orders.js

$(function() {

  var item = {

    $el: $("form#order"),

    addItem: function(e) {
      e.preventDefault();
      var template = { timestamp : $.now() }
      var selleck_template = selleck($("script#item").html(), template);
      item.$el.find('#items').append(selleck_template);
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
      $('a#add_item').click(item.addItem);
      item.$el.on("click.deleteItem", "a.delete", item.deleteItem);
    }
  };

  item.init();

});
