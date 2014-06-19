# README

Job Board is an online posterboard for members of the General Assembly community to connect with one-another on job opportunities. It was built from the ground up by: [Carlos Pichardo](https://github.com/Pichardito), [Corey Leveen](https://github.com/mntj) and [Ben Karl](https://github.com/BenRKarl).

In the lobby of each of General Assembly's offices lies "The Search Engine," a floor to ceiling tack board on which aspiring technologists pin small slips of paper seeking employment, employees or partners. The board has a distinct style and stands out as one of the first things you see upon entering the space. But for those who don't frequent the General Assembly offices, have terrible handwriting, or just can't spell; what do? Well now there's Job Board - an interactive posterboard that lets you post oppoportunities online where Google can help you spell things properly and sophisticated 'Like' algorithms help you connect more easily with other talented folk. Sign up and post a card about yourself or your company today!

**Sign up using your LinkedIn account and your profile image will appear on any card you create**

**Drag and drop your card anywhere on the page and it will stay there for everyone who visits the site - just like in real life!**

![The Job Board](http://i.imgur.com/6h0Gi9P.png)

**If someone likes one of your cards a notification with their email address will appear on your profile**

**Job Board leverages AJAX to let you edit, move and delete your cards on the page without it needing to refresh, here are some cool examples:**

```javascript
//******** DYNAMICALLY SAVE A CARD'S POSITION WHEN YOU DROP IT ON THE BOARD ********//

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

```
```javascript
//******** EDIT YOUR CARDS RIGHT ON THE BOARD, AND BE SURE THAT ONLY YOU CAN CHANGE YOUR CARDS ********//

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
```
