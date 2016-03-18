$(document).ready(function () {
    $(document).on('mouseenter','.spec', function(){
      $('.side-buttons', this).css('visibility','visible');
    }).on('mouseleave', '.spec', function() {
        $('.side-buttons', this).css('visibility','hidden');
    });  
    
    
    
    $(document).on('click','.edit-button', function(){

        var btnElem = $(this).parent().parent().next('.spec-buttons').first();
        $('.spec-buttons').not(btnElem).hide();
        
        btnElem.toggle('fast');
        btnElem.find('[data-toggle="tooltip"]').tooltip();
        
        var tagElem = $(this).siblings('.tags').find('.delete_tag');
        var ticketElem = $(this).siblings('.tickets').find('.delete_tag');
        
        $('.delete_tag').not(tagElem.add(ticketElem)).hide();
        tagElem.toggle('fast');
        ticketElem.toggle('fast');
    });
    
});

function toggleTagEdit() {
    var tagElem = $('.delete_tag')
    if ( tagElem.hasClass('hidden')){
        tagElem.removeClass('hidden');
    }
    else {
        tagElem.addClass('hidden');
    }
}

function toggleEdit(tagElem) {
    if ( tagElem.hasClass('hidden')){
        tagElem.removeClass('hidden');
    }
    else {
        tagElem.addClass('hidden');
    }
}