
//app/assets/javascripts/orders.js

$(function() {

  var item = {
    addItem: function() {
      var template = { timestamp : $.now() }
      $('#items').append(selleck($("script#item").html(), template));
    },

    deleteItem: function(){
      var parent = $(this).closest('fieldset');

      if (!parent.find('input.destroy').val()){
        parent.remove();
      }else{
        parent.css('display','none');
        parent.find('input.destroy').val('true');
      }
    },

    init: function() {
      $('a#add_item').click(item.addItem);
      $('body > section').delegate('div.delete a', 'click', item.deleteItem);
    }
  };

  item.init();

});
