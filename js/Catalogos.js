$(document).ready(function () {
   
    $.ajax({
        type: "POST",
        dataType: "json",
        url: "Catalogos.asmx/GetStudents",
        success: function (data) {
            var datatableVariable = $('#studentTable').DataTable({
                data: data,
                autoFill: true,
                columns: [
                    { 'data': 'clave_elector' },
                    { 'data': 'nombre' },
                    { 'data': 'fecha_nac' },
                    { 'data': 'calle' },
                    { 'data': 'num_ext' },
                    

                ],
                "language": {
                    "url": "//cdn.datatables.net/plug-ins/1.10.21/i18n/Spanish.json"
                }
                

                
               
            });
            $('#studentTable tfoot th').each(function () {
                var placeHolderTitle = $('#studentTable thead th').eq($(this).index()).text();
                $(this).html('<input type="text" class="form-control input input-sm" placeholder = "Buscar ' + placeHolderTitle + '" />');
            });
            datatableVariable.columns().every(function () {
                var column = this;
                $(this.footer()).find('input').on('keyup change', function () {
                    column.search(this.value).draw();
                });
            });
            $('.showHide').on('click', function () {
                var tableColumn = datatableVariable.column($(this).attr('data-columnindex'));
                tableColumn.visible(!tableColumn.visible());
            });

           


        }
    });
    

    
    

});





