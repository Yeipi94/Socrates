
function addRowDT(data) {
    tabla = null;
    tabla = $("#tbl_personas").DataTable({
        "aaSorting": [[0, 'desc']],
        "bSort": true,
        "bDestroy": true,
        "aoColumns": [
            null,
            null,
            null,
            null,
            null,

            //{ "bSortable": false },
            //{ "bSortable": false, "bVisible": false },
            { "bSortable": false }
        ]
    });












    //tabla = $("#tbl_menus").DataTable();
    tabla.fnClearTable();

    for (var i = 0; i < data.length; i++) {
        tabla.fnAddData([
            //data[i].id,
            //data[i].Entidad,
            //data[i].Nombre,
            //data[i].F_Afil,
            data[i].clave,
            data[i].Nombre_Comp,
            data[i].colonia,
            data[i].municipio,
            data[i].entidad,
            '<button type="button" value="Seleccionar" title="Seleccionar" class="btn btn-primary btn-edit" data-target="#imodal" data-toggle="modal"><i class="fa fa-check-square-o" aria-hidden="true"></i></button>&nbsp;' 
            //'<button type="button" value="Eliminar" title="Eliminar" class="btn btn-danger btn-delete"><i class="fa fa-minus-square-o" aria-hidden="true"></i></button>'

        ]);
    }
}


var tabla, data;

function sendDataAjax() {
    $.ajax({
        type: "POST",
        url: "../Catalogos.asmx/ListarPersonas",
        data: {},
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (data) {
            addRowDT(data.d);
        }
    });
}


function templateRow() {
    var template = "<tr>";
    template += ("<td>" + "AVFLCR80011419H800" + "</td>");
    template += ("<td>" + "CARLOS ALBERTO AVILA FLORES" + "</td>");
    template += ("<td>" + "COL VALLE DE STO DOMINGO" + "</td>");
    template += ("<td>" + "SAN NICOLAS DE LOS GARZA" + "</td>");
    template += ("<td>" + "19" + "</td>");
    //template += ("<td>" + "123" + "</td>");
    //template += ("<td>" + "123" + "</td>");
    template += "</tr>";
    return template;
}

function addRow() {
    var template = templateRow();
    for (var i = 0; i < 10; i++) {
        $("#tbl_body_table").append(template);
    }
}

//var tabla, data;

//function addRowDT(data) {
//    tabla = $("#tbl_personas").DataTable({
//        "aaSorting": [[0, 'desc']],
//        "bSort": true,
//        "bDestroy": true,
//        "aoColumns": [
//            null,
//            null,
//            null,
//            null,
//            null,
//            null,
//            { "bSortable": false }
//        ]
//    });

//    tabla.fnClearTable();

//    for (var i = 0; i < data.length; i++) {
//        tabla.fnAddData([
//            data[i].id,
//            data[i].Entidad,
//            data[i].Nombre,
//            data[i].F_Afil,
//            '<button type="button" value="Actualizar" title="Actualizar" class="btn btn-primary btn-edit" data-target="#imodal" data-toggle="modal"><i class="fa fa-check-square-o" aria-hidden="true"></i></button>&nbsp;' +
//            '<button type="button" value="Eliminar" title="Eliminar" class="btn btn-danger btn-delete"><i class="fa fa-minus-square-o" aria-hidden="true"></i></button>'

//        ]);
//    }
//    //  ((data[i].Estado == true) ? "Activo" : "Inactivo")
//}

function sendDataAjax() {
    $.ajax({
        type: "POST",
        url: "../Catalogos.asmx/ListarPersonas",
        data: {},
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (data) {
            addRowDT(data.d);
        }
    });
}

function updateDataAjax() {

    var obj = JSON.stringify({ id: JSON.stringify(data[0]), direccion: $("#txtModalDireccion").val() });

    $.ajax({
        type: "POST",
        url: "Catalogos.asmx/ActualizarDatosPersonas",
        data: obj,
        dataType: "json",
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (response) {
            if (response.d) {
                alert("Registro actualizado de manera correcta.");
            } else {
                alert("No se pudo actualizar el registro.");
            }
        }
    });
}

function deleteDataAjax(data) {

    var obj = JSON.stringify({ id: JSON.stringify(data) });

    $.ajax({
        type: "POST",
        url: "Catalogos.asmx/EliminarDatosPersonas",
        data: obj,
        dataType: "json",
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (response) {
            if (response.d) {
                alert("Registro eliminado de manera correcta.");
            } else {
                alert("No se pudo eliminar el registro.");
            }
        }
    });
}

// evento click para boton actualizar
$(document).on('click', '.btn-edit', function (e) {
    e.preventDefault();

    var row = $(this).parent().parent()[0];
    data = tabla.fillModalData(row);
    fillModalData();

});

// evento click para boton eliminar
$(document).on('click', '.btn-delete', function (e) {
    e.preventDefault();

    //primer método: eliminar la fila del datatble
    var row = $(this).parent().parent()[0];
    var dataRow = tabla.fnGetData(row);

    //segundo método: enviar el codigo del paciente al servidor y eliminarlo, renderizar el datatable
    // paso 1: enviar el id al servidor por medio de ajax
    deleteDataAjax(dataRow[0]);
    // paso 2: renderizar el datatable
    sendDataAjax();

});


// cargar datos en el modal
function fillModalData() {
    $("#txtFullName").val(data[1] + " " + data[2]);
    $("#txtModalDireccion").val(data[5]);
}

// enviar la informacion al servidor
$("#btnactualizar").click(function (e) {
    e.preventDefault();
    updateDataAjax();
});

$(document).ready(function () {
    $('#txtbuscador').autocomplete({
        source: 'NombresHandler.ashx'
    });
});


// Llamando a la funcion de ajax al cargar el documento
sendDataAjax();