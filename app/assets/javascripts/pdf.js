ready = () => {
    console.log("hi");
    $('#submit').click(() => {
        var isChecked = $("input[type=checkbox]").is(":checked");
        if (!isChecked) {
             alert("Please select at least 1 artwork");
             return false;
         }
    });
};

$(document).on('turbolinks:load', ready);