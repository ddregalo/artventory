ready = function() {
    $('#hamburgerMenu').hide();
        
    $('#sidebarCollapse').on('click', function () {
        $('#sidebar').toggleClass('active');
        $(this).toggleClass('active');
        $('#hamburgerMenu').toggleClass('active').fadeIn(800);
    });
    
    $('#hamburgerMenu').on('click', function () {
        $('#sidebar').toggleClass('active');
        $('#sidebarCollapse').toggleClass('active');  
        $(this).toggleClass('active').fadeOut(400);
    });
};

$(document).on('turbolinks:load', ready);