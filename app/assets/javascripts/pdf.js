ready = () => {
    console.log("hi");
    $('#submit').click(() => {
        var checked = $("input[type=chcekbox]:checked").length;
        if (!checked) {
            alert("Please select at least 1 artwork");
            return false;
        }
    });
};

$(document).on('turbolinks:load', ready);