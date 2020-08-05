<%@ Page Language="C#" AutoEventWireup="true" CodeFile="autocompletar.aspx.cs" Inherits="autocompletar" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css" rel="stylesheet" type="text/css" />
    <link href="css/bootstrap.css" rel="stylesheet" />
    <%--    <link href="http://code.jquery.com/ui/1.11.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>--%>
    <script src="jquery-1.6.2.js" type="text/javascript"></script>
    <script src="ui/jquery.ui.core.js" type="text/javascript"></script>
    <script src="ui/jquery.ui.widget.js" type="text/javascript"></script>
    <script src="ui/jquery.ui.position.js" type="text/javascript"></script>
    <script src="ui/jquery.ui.autocomplete.js" type="text/javascript"></script>



    <%--    <script src="js/jquery-1.6.2.min.js"  type="text/javascript"></script>
    <script src="js/jquery-ui-1.8.16.custom.min.js" type="text/javascript"></script>
    <link href="js/jquery-ui-1.8.16.custom.css" rel="stylesheet"  type="text/css" />--%>
    <script type="text/javascript">

        $(document).ready(function () {

            $.ajax({
                type: "POST",
                url: "autocompletar.aspx/AutocompleteMethod",
                dataType: "json",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    if (data.d) {
                        //alert(data.d);
                        var datafromServer = data.d.split(":");
                        $('#<%= txciudades.ClientID %>').autocomplete({
                            source: datafromServer
                        });
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(textStatus);
                }
            });

        });

        $(document).ready(function () {
            $('#txtbuscador').autocomplete({
                source: 'NombresHandler.ashx'
            });
        });

        //$(document).ready(function () {
        //    $('#txtbuscador').autocomplete({
        //        source: 'NombresHandler.ashx',
        //        minLength: 3,
        //        select: function (event, ui) {
        //            $('#txtbuscador').val(ui.item.value);
        //        }
        //    });
        //    $('#txtbuscador').data('ui-autocomplete')._renderItem = function (ul, item) {
        //        var $li = $('');
        //$li.attr('data-value', item.value);
        //        $li.append("" + item[1]);
        //        console.log(item);
        //        return $li.appendTo(ul);
        //    }
        //});


        //$(document).ready(function () {
        //    SearchText();
        //});
        //function SearchText() {
        //    $(".autosuggest").autocomplete({
        //        source: function (recuest, response) {
        //            $.ajax({
        //                type: "POST",
        //                contentType: 'application/json;charset=utf-8',
        //                url: 'autocompletar.aspx/getCustomerNames',
        //                data: "{'prefixText':'" + document.getElemenById('/*txtAutoComplete*/'),
        //                dataType: 'json',
        //                success: function (data) {
        //                    response(data.d);
        //                },
        //                error: function (err) {
        //                    alert(err);
        //                }

        //            });

        //        }
        //    });
        //}
        //    $('#txtNomInteg').autocomplete({
        //        //minLength: 2,
        //        source: function (request, response) {
        //            $.ajax({
        //                url: 'AutocompletarService.asmx/GetNombres',
        //                method: 'post',
        //                contentType: 'application/json;charset=utf-8',
        //                data: JSON.stringify({ nombre_comp: request.nombre_comp }),
        //                dataType: 'json',
        //                success: function (data) {
        //                    response(data.d);
        //                },
        //                error: function (err) {
        //                    alert(err);
        //                }
        //            });
        //        }
        //    });
        //});



        //      $(function () {
        //	var tabName = $("[id*=TabName]").val() != "" ? $("[id*=TabName]").val() : "tab_content1";
        //          $('#Tabs a[href="#' + tabName + '"]').tab('show');
        //          $("#Tabs a").click(function () {
        //              $("[id*=TabName]").val($(this).attr("href").replace("#", ""));
        //          });
        //});

        //$(document).ready(function () {
        //    $('#txtNomInteg').autocomplete({
        //        minLength: 2,
        //        source: function (request, response) {
        //            $.ajax({
        //                url: 'AutocompletarService.asmx/nom_autocompletar',
        //                method: 'post',
        //                contentType: 'application/json;charset=utf-8',
        //                data: JSON.stringify({ term: request.term }),
        //                dataType: 'json',
        //                success: function (data) {
        //                    response(data.d);
        //                },
        //                error: function (err) {
        //                    alert(err);
        //                }
        //            });
        //        }
        //    });
        //});

		$(document).ready(function () {
            $('#txtNomInteg').autocomplete({
                //minLength: 2,
                source: function (request, response) {
                    $.ajax({
						url: 'AutocompletarService.asmx/getIneNacional',
                        method: 'post',
                        contentType: 'application/json;charset=utf-8',
                        data: JSON.stringify({ nombre_comp: request.nombre_comp }),
                        dataType: 'json',
                        success: function (data) {
                            response(data.d);
                        },
                        error: function (err) {
                            alert(err);
                        }
                    });
                }
            });
        });
        //buscar con NombresHnadler.ashx
    <%--    
      

       $(document).ready(function () {

            $.ajax({
                type: "POST",
                url: "autocompletar.aspx/GetAutoCompleteData",
                dataType: "json",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    if (data.d) {
                        alert(data.d);
                        var datafromServer = data.d.split(":");
                        $('#<%= txtNomInteg.ClientID %>').autocomplete({
                            source: datafromServer
                        });
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(textStatus);
                }
            });

          });--%>

        function tbDrugName_OnChange() {
            var txtVal = document.getElementById("<%= tbDrugName.ClientID %>").value;
<%--             document.getElementById("<%=lbllist.ClientID %>").innerText = txtVal;--%>
         }
	</script>

    <%--<script type="text/javascript">
        $(function () {
            SearchText();
        });
        function SearchText() {
            $(".autosuggest").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "jQueryAutoCompleteTextbox.aspx/GetAutoCompleteData",
                        data: "{'username':'" + $('#txtSearch').val() + "'}",
                        dataType: "json",
                        success: function (data) {
                            if (data.d.length > 0) {
                                response($.map(data.d, function (item) {
                                    return {
                                        label: item.split('/')[0],
                                        val: item.split('/')[1]
                                    }
                                }));
                            }
                            else {
                                response([{ label: 'No Records Found', val: -1 }]);
                            }
                        },
                        error: function (result) {
                            alert("Error");
                        }
                    });
                },
                select: function (event, ui) {
                    if (ui.item.val == -1) {
                        return false;
                    }
                    $('#lblUserId').text(ui.item.val);
                }
            });
        }
    </script>--%>
</head>
<body>


    <form id="form1" runat="server">
        <div class="row ">
           
                <div class="col-md-4 form-group">
                    <asp:Label ID="Label4" runat="server"  CssClass="form-control" Text="valor 1"></asp:Label>
                    <asp:TextBox ID="txtval1" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                 <div class="col-md-4 form-group">
                     <asp:Label ID="Label5" runat="server"  CssClass="form-control" Text="Valor 2" ></asp:Label>
    <asp:TextBox ID="txtval2" runat="server" CssClass="form-control"></asp:TextBox>
    
    
    
               
            </div>
             <asp:Button ID="btnAdd" runat="server"  CssClass="form-control" Text="Add" />
             <asp:TextBox ID="txtresultado" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="row">
            <div class="col-md-12">
            <asp:Label ID="Label1" runat="server" Text="busca y acompleta segundo texbox"></asp:Label>
            <asp:TextBox ID="txtIntegrante" runat="server" AutoPostBack="True" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
            <asp:AutoCompleteExtender ID="IDExtensor" ServiceMethod="docentes" ServicePath="../AutocompletarService.asmx" DelimiterCharacters="" Enabled="True" MinimumPrefixLength="1" CompletionInterval="10" EnableCaching="false" CompletionSetCount="1" TargetControlID="txtIntegrante" runat="server" FirstRowSelected="false"></asp:AutoCompleteExtender>
            <div class="col-md-4"><asp:TextBox ID="TextBox2" runat="server" AutoPostBack="True"></asp:TextBox></div>
            <div class="col-md-4"><asp:TextBox ID="txtclave" runat="server" AutoPostBack="True"></asp:TextBox></div>
            </div>
            
            
            
             
        </div>


        <div class="row col-md-12">
                
        <asp:Label Text=" funcionandoDigite ciudades: " runat="server" CssClass="Green" />
                <asp:TextBox ID="txciudades" runat="server" CssClass="Green" />

        </div>
        <div class="row col-md-12">
            <hr />
            
            <asp:Label Text=" funcionando NombresHnadler: " runat="server" CssClass="Green" />
            <asp:TextBox ID="txtbuscador" runat="server"></asp:TextBox>
            <hr />
        </div>
        <div class="row col-md-12">
            <input id="resName" type="text" />
        </div>
        <div class="row col-md-12">
            <asp:HiddenField ID="hdnId" runat="server" />
            <div class="ui-widget">
                <label for="tbAuto">Enter UserName: </label>
<%--                <input type="text" id="txtSearch" class="autosuggest" />--%>
            </div>
        </div>




        <div class="row col-md-12">
            <asp:Label ID="Label2" runat="server" Text="GetAutoCompleteData metodo"></asp:Label>

            <asp:TextBox ID="txtNomInteg" runat="server"></asp:TextBox>
        </div>
       

        <div class="col-md-12">
                                <div class="form-group">
                                    <label>Consultar nombre(s)</label>
                                    <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" placeholder="Autocompletando con Servicios Web"></asp:TextBox>
        <asp:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" DelimiterCharacters="" Enabled="True" ServicePath="../AutocompletarService.asmx" MinimumPrefixLength="1" ServiceMethod="BuscarINE" EnableCaching="true" TargetControlID="TextBox1" CompletionInterval="0"></asp:AutoCompleteExtender>
                            </div>
                            </div>

        <div class="row col-md-12">
            EJEMPLO D
            <asp:TextBox ID="tbDrugName" runat="server" CssClass="form-control" />
        <asp:AutoCompleteExtender ID="AutoCompleteDrugID" runat="server" DelimiterCharacters="" Enabled="True"  ServicePath="../AutocompletarService.asmx"  MinimumPrefixLength="1" ServiceMethod="Get_NameCom" EnableCaching="true" TargetControlID="tbDrugName"    CompletionInterval="0" UseContextKey="True">
        </asp:AutoCompleteExtender>

        <div>

        </div>


        
           



        </div>


        <div class="row col-md-12">
            <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>


        <asp:TextBox ID="txtSearch" CssClass="textBlackBold" runat="server"       Width="350px"></asp:TextBox>
<asp:DropDownList ID="ddlType" runat="server"                                AutoPostBack="True" onselectedindexchanged="ddlType_SelectedIndexChanged">
<asp:ListItem Value="0">Country</asp:ListItem>
<asp:ListItem Value="1">Companies</asp:ListItem>
</asp:DropDownList>
<asp:AutoCompleteExtender ID="AutoCompleteExtender2" runat="server"
CompletionListCssClass="autocomplete_completionListElement"
CompletionListItemCssClass="autocomplete_listItem"
CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
EnableCaching="true" ContextKey="Products" UseContextKey="true"
TargetControlID="txtSearch" MinimumPrefixLength="1"
ServiceMethod="GetInfo" ServicePath="~/WebService.asmx" >
</asp:AutoCompleteExtender>




        </div>



        <script type="text/javascript">
      <%--  $(document).ready(function () {

            $.ajax({
                type: "POST",
                url: "autocompletar.aspx/AutocompleteMethod",
                dataType: "json",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    if (data.d) {
                        alert(data.d);
                        var datafromServer = data.d.split(":");
                        $('#<%= txciudades.ClientID %>').autocompletar({
                            source: datafromServer
                        });
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(textStatus);
                }
            });

        });--%>

        //$('input:text').autocomplete({
        //    source: function (request, response) {
        //        var pString = '{ "nombre_comp": "' + request.term + '" }';
        //        $.ajax({
        //            url: "AutocompletarService.asmx/GetNombres",
        //            /* same root as the page? */
        //            data: pString,
        //            dataType: "jsond",
        //            type: "POST",
        //            contentType: "application/json",
        //            /* simplify */
        //            converters: { /* avoid the d or no d issue, works with 3.5 or prior this way */
        //                "json jsond": function (msg) {
        //                    return msg.hasOwnProperty('d') ? msg.d : msg;
        //                }
        //            },
        //            success: function (data) { /* assumes data always returned and it IS called item in the JSON */
        //                response($.map(data, function (item) {
        //                    return {
        //                        value: item.name,
        //                        label: item.name
        //                    };
        //                }));
        //            },
        //            minLength: 2,
        //            error: function (xhr, textStatus, errorThrown) {
        //                var errorMessage = "Ajax error: " + this.url + " : " + textStatus + " : " + errorThrown + " : " + xhr.statusText + " : " + xhr.status;
        //                if (xhr.status != "0" || errorThrown != "abort") {
        //                    alert(errorMessage);
        //                }
        //            }
        //        });
        //    }
        //});



        //$(document).ready(function () {
        //    SearchText();
        //});
        //function SearchText() {
        //    $(".autosuggest").autocomplete({
        //        source: function (recuest, response) {
        //            $.ajax({
        //                type: "POST",
        //                contentType: 'application/json;charset=utf-8',
        //                url: 'autocompletar.aspx/getCustomerNames',
        //                data: "{'prefixText':'" + document.getElemenById('txtAutoComplete'),
        //                dataType: 'json',
        //                success: function (data) {
        //                    response(data.d);
        //                },
        //                error: function (err) {
        //                    alert(err);
        //                }

        //            });

        //        }
        //    });
        //}



        </script>
    </form>
</body>

</html>
