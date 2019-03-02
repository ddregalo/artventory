ready = function() {
    $('#hamburgerMenu').hide();
        
    $('#sidebarCollapse').on('click', function () {
        $('#sidebar').toggleClass('active');
        $(this).fadeOut('fast', () => {
            $(this).toggleClass('active');
            $('#hamburgerMenu').toggleClass('active').fadeIn('fast');
        }); 
    });
    
    $('#hamburgerMenu').on('click', function () {
        $('#sidebar').toggleClass('active');
        $(this).toggleClass('active').fadeOut('fast', () => {
            $('#sidebarCollapse').fadeIn('fast');
            $('#sidebarCollapse').toggleClass('active');  
        });
    });
};

$(document).on('turbolinks:load', ready);