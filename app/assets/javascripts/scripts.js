$(function(){
  $('.prospect-card').draggable();
  $('.recruiter-card').draggable();

  var headers = $('.card-header');

  $.each(headers, function(idx, headerEl){
    while ( $(headerEl).width() > 250 ) {
      var fontSize = parseInt($(headerEl).css('font-size'));
      fontSize = fontSize - 5;
      $(headerEl).css('font-size', fontSize);
    };
  });

  var cardTexts = $('.card-text');

  $.each(cardTexts, function(idx, textEl){
    while ( $(textEl).height() > 100 ) {
      var fontSize = parseInt($(textEl).css('font-size'));
      fontSize = fontSize - 5;
      $(textEl).css('font-size', fontSize);
    };
  });

  $('.main-board-container').droppable({
    drop: function(event, position){
      var cardId = position.draggable.data('id');
      var cardType = position.draggable.attr('class').split(' ')[0];
      var topPos = position.position.top
      var leftPos = position.position.left
      if ( cardType == 'prospect-card' ){
        $.ajax({
            url: '/prospect_cards/' + cardId,
            method: 'patch',
            dataType: 'json',
            data: { prospect_card: { left_pos: leftPos, top_pos: topPos } },
            success: function(data){
              console.log(data);
            }
        })
      } else {
        $.ajax({
            url: '/recruiter_cards/' + cardId,
            method: 'put',
            dataType: 'json',
            data: { recruiter_card: { left_pos: leftPos, top_pos: topPos } },
            success: function(data){
              console.log(data);
            }
        })
      } //End of if/else
    } //End of Drop function
  }); //End of Droppable event




  $('.delete-pcard').on("click", function(e){

    // $(this).parents('.prospect-card').remove()
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
    })

    return false;

  })

  $('.delete-rcard').on("click", function(e){

    // $(this).parents('.recruiter-card').remove()
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
    })

    return false;

  })

  $('.like-pcard').on("click", function(e){

    // $(this).parents('.prospect-card').remove()
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
    })

    return false;

  })

});
