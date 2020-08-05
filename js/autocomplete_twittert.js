$(document).ready(function () {
    BindControls();
});

function BindControls() {
    $('#myBooks').typeahead({
        source: function (request, response) {
            $.ajax({
                url: "api/NacionalPersona/" + request,
                dataType: "json",
                type: "GET",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    var arrBooks = [];
                    response($.map(data, function (item) {
                        arrBooks.push(item.Persona);
                    }))
                    response(arrBooks);

                    // SET THE WIDTH AND HEIGHT OF UI AS "auto" ALONG WITH FONT.
                    // YOU CAN CUSTOMIZE ITS PROPERTIES.
                    $(".dropdown-menu").css("width", "auto");
                    $(".dropdown-menu").css("height", "auto");
                    $(".dropdown-menu").css("font", "15px Verdana");
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(textStatus);
                }
            });
        },
        hint: true,             // SHOW HINT (DEFAULT IS "true").
        highlight: true,        // HIGHLIGHT (SET <strong> or <b> BOLD). DEFAULT IS "true".
        minLength: 1            // MINIMUM 1 CHARACTER TO START WITH.
    });
}


