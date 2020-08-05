$(document).ready(function () {
    




    $.ajax({
        type: "POST",
        dataType: "json",
        // url: "../../Ws_MostrarIncidencias.asmx/Usp_MostrarIncidentes",
        url: "../Catalogos.asmx/ListarPersonas",
        success: function (data) {

            var datatableVariable = $('#tbl_personas').DataTable({

                data: data,
                
                columns: [

                    { 'data': 'clave' },
                    { 'data': 'Nombre_Comp' },
                    { 'data': 'colonia' },
                    { 'data': 'municipio' },
                    { 'data': 'entidad' },
                    //{ 'data': 'Estado' },
                    //{ 'data': 'Ver' }


                ],
                "language": {
                    "url": "//cdn.datatables.net/plug-ins/1.10.21/i18n/Spanish.json"
                }

            });


            //$('#tbl_personas tfoot th').each(function () {
            //    var placeHolderTitle = $('#tbl_personas thead th').eq($(this).index()).text();
            //    $(this).html('<input type="text" class="form-control input input-sm" placeholder = "Buscar ' + placeHolderTitle + '" />');
            //});


            //datatableVariable.columns().every(function () {
            //    var column = this;
            //    $(this.footer()).find('input').on('keyup change', function () {
            //        column.search(this.value).draw();
            //    });
            //});
            //$('.showHide').on('click', function () {
            //    var tableColumn = datatableVariable.column($(this).attr('data-columnindex'));
            //    tableColumn.visible(!tableColumn.visible());
            //});
        }
    });




});


function searchPacienteDni() {

    //event.preventDefault();

    // obtener los datos del texto de dni
    var dni = $("#txtName").val();

    var obj = JSON.stringify({ dni: dni });

    if (dni.length > 0) {
        // llamada a ajax
        $.ajax({
            type: "POST",
            url: "Search.aspx/BuscarPersonas",
            data: obj,
            contentType: 'application/json; charset=utf-8',
            error: function (xhr, ajaxOptions, thrownError) {
                console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
            },
            success: function (data) {
                //console.log("éxito", data);
                if (data.d !== null) {
                    listHorarios(data.d.IdMedico);
                } else {
                    alert('No exite el paciente con dni' + dni);
                }
            }
        });
    } else {
        console.log("No ha ingresado un dni.");
    }
}

function listHorarios(idmedico) {

    var obj = JSON.stringify({ idmedico: idmedico });

    $.ajax({
        type: "POST",
        url: "Search.aspx/BuscarPersonas",
        data: obj,
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (data) {
            //console.log("éxito", data);
            tabla.fnClearTable();
            for (var i = 0; i < data.d.length; i++) {
                addRow(data.d[i]);
            }
        }
    });

}
$("#btnactualizar").on("click", function (event) {
    var fecha, hora, idmedico;
    fecha = $("#ddlEstado").val();
    alert = ("" + fecha);
});
function greeting() {
    //var countryId = $("#ddlEstado option:selected").val();
   
   
   
    ListaDistritos();
}


function ListaDistritos() {

    $.ajax({
        type: "POST",
        dataType: "json",
        // url: "../../Ws_MostrarIncidencias.asmx/Usp_MostrarIncidentes",
        url: "../Catalogos.asmx/ListarPersonas",
        success: function (data) {

            var datatableVariable = $('#tbl_personas').DataTable({

                data: data,

                columns: [

                    { 'data': 'clave' },
                    { 'data': 'Nombre_Comp' },
                    { 'data': 'colonia' },
                    { 'data': 'municipio' },
                    { 'data': 'entidad' },
                    {
                        'data': '<button type="button" value="Actualizar" title="Actualizar" class="btn btn-primary btn-edit" data-target="#imodal" data-toggle="modal"><i class="fa fa-check-square-o" aria-hidden="true"></i></button>&nbsp;' +
                            '<button type="button" value="Eliminar" title="Desactivar" class="btn btn-danger btn-delete"><i class="fa fa-minus-square-o" aria-hidden="true"></i></button>'
                    },
                    //{ 'data': 'Ver' }


                ],
                "language": {
                    "url": "//cdn.datatables.net/plug-ins/1.10.21/i18n/Spanish.json"
                }

            });


            //$('#tbl_personas tfoot th').each(function () {
            //    var placeHolderTitle = $('#tbl_personas thead th').eq($(this).index()).text();
            //    $(this).html('<input type="text" class="form-control input input-sm" placeholder = "Buscar ' + placeHolderTitle + '" />');
            //});


            //datatableVariable.columns().every(function () {
            //    var column = this;
            //    $(this.footer()).find('input').on('keyup change', function () {
            //        column.search(this.value).draw();
            //    });
            //});
            //$('.showHide').on('click', function () {
            //    var tableColumn = datatableVariable.column($(this).attr('data-columnindex'));
            //    tableColumn.visible(!tableColumn.visible());
            //});
        }
    });
}
