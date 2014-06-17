$(function(){
  $('.prospect-card').draggable();
  $('.recruiter-card').draggable();

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
})
