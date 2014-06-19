$(function(){

//******** SAVE CARD POSITION TO DATABASE WITH AJAX FUNCTIONS ********//

  $('.prospect-card').draggable({
    containment: "document",
    refreshPositions: true,
    stop: function(event, ui){
      var cardId = $(this).data('id');
      var topPos = ui.offset.top;
      var leftPos = ui.offset.left;
      $.ajax({
          url: '/prospect_cards/' + cardId,
          method: 'put',
          dataType: 'json',
          data: { prospect_card: { left_pos: leftPos, top_pos: topPos } },
          success: function(data){
            console.log(data);
          }
        });
      }
    });

  $('.recruiter-card').draggable({
    containment: "document",
    refreshPositions: true,
    stop: function(event, ui){
    var cardId = $(this).data('id');
    var topPos = ui.offset.top;
    var leftPos = ui.offset.left;
    $.ajax({
        url: '/recruiter_cards/' + cardId,
        method: 'put',
        dataType: 'json',
        data: { recruiter_card: { left_pos: leftPos, top_pos: topPos } },
        success: function(data){
          console.log(data);
        }
      });
    }
  });

$('.delete-pcard').on("click", function(e){
  e.preventDefault();
  var that = this;
  var cardId = $(this).parents('.prospect-card').data('id');
  $.ajax({
      url: '/prospect_cards/'+ cardId,
      method: 'delete',
      dataType: 'json',
      data: {recruiter_card: this.recruiter_card},
      success: function(data){
        $(that).parents('.prospect-card').remove()
      }
    });
  return false;
});

$('.delete-rcard').on("click", function(e){
  e.preventDefault();
  var that = this;
  var rcardId = $(this).parents('.recruiter-card').data('id');
  $.ajax({
      url: '/recruiter_cards/'+ rcardId,
      method: 'delete',
      dataType: 'json',
      data: {recruiter_card: this.recruiter_card},
      success: function(data){
        $(that).parents('.recruiter-card').remove()
      }
    });
  return false;
});

//******** LIKE CARDS WITH AJAX FUNCTIONS ********//

$('.like-pcard').on("click", function(e){
  e.preventDefault();
  var target = e.target;
  var that = this;
  var cardId = $(this).parents('.prospect-card').data('id');
  $.ajax({
      url: '/prospect_cards/'+ cardId + '/like',
      method: 'post',
      dataType: 'json',
      data: {prospect_card: this.prospect_card},
      success: function(data){
        $(target).html('Liked');
      }
    });
  return false;
});

$('.like-rcard').on("click", function(e){
  e.preventDefault();
  var target = e.target;
  var that = this;
  var cardId = $(this).parents('.recruiter-card').data('id');
  $.ajax({
    url: '/recruiter_cards/'+ cardId + '/like',
    method: 'post',
    dataType: 'json',
    data: {recruiter_card: this.recruiter_card},
    success: function(data){
      $(target).html('Liked');    
    }
  });
  return false;
});

//********* EDIT CARDS WITH AJAX FUNCTIONS**********//

$(".card-text").each(function(ele){
    var cardId = parseInt(this.parentElement.dataset.id);
    var cardUserID = parseInt(this.parentElement.dataset.userId);
    var currentuserid = parseInt(currentUser.id);
    if (cardUserID === currentuserid){
    $(this).editInPlace({
        callback: function(unused, enteredText){
          $.ajax({
                url: '/prospect_cards/'+ cardId,
                method: 'put',
                dataType: 'json',
                data: {prospect_card: {
                  title: $(this).parent().find('.card-title').html(),
                  description: $(this).parent().find('.card-description').html(),
                  looking_for: $(this).parent().find('.card-looking_for').html()
                }},
                success: function(data){
                  console.log(data)
                }
          })
          return enteredText;
        }

    });
  }
})

$(".rcard-text").each(function(ele){
    var cardId = parseInt(this.parentElement.dataset.id);
    var cardUserID = parseInt(this.parentElement.dataset.userId);
    var currentuserid = parseInt(currentUser.id);
    if (cardUserID === currentuserid){
    $(this).editInPlace({
        callback: function(unused, enteredText){
          $.ajax({
                url: '/recruiter_cards/'+ cardId,
                method: 'put',
                dataType: 'json',
                data: {recruiter_card: {
                  title: $(this).parent().find('.card-title').html(),
                  description: $(this).parent().find('.card-description').html(),
                  looking_for: $(this).parent().find('.card-looking_for').html()
                }},
                success: function(data){
                  console.log(data)
                }
          })
          return enteredText;
        },
    });
  }
});

//********PREVENT TEXT OVERFLOW ON CARD TEXT FIELDS**********//

  var headers = $('.card-header strong');
  $.each(headers, function(idx, nameEl){
    var overNine = /.{9,}/;
    var fontSize = parseInt($(nameEl).css('font-size'));
    if ( overNine.test($(nameEl).html()) ){
      $(nameEl).css('font-size', 12);
    }
  });

  // var cardTexts = $('.card-text card-description', '.card-text card-looking_for', '.card-text card-title');
  // $.each(cardTexts, function(idx, textEl){
  //   while ( $(textEl).height() > 100 ) {
  //     var fontSize = parseInt($(textEl).css('font-size'));
  //     fontSize = fontSize - 5;
  //     $(textEl).css('font-size', fontSize);
  //   };
  // });

  // var cardTexts = $('.card-text');
  // $.each(cardTexts, function(idx, textEl){
  //   while ( $(textEl).height() > 100 ) {
  //     var fontSize = parseInt($(textEl).css('font-size'));
  //     fontSize = fontSize - 5;
  //     $(textEl).css('font-size', fontSize);
  //   };
  // });

});
