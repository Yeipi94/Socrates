<%@ Page Title="" Language="C#" MasterPageFile="~/SolarisMaster.master" AutoEventWireup="true" CodeFile="cascada.aspx.cs" Inherits="cascada" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.10.0.min.js" type="text/javascript"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.9.2/jquery-ui.min.js" type="text/javascript"></script>
<link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.9.2/themes/blitzer/jquery-ui.css"
rel="Stylesheet" type="text/css" />
<script type="text/javascript">
$(function () {
    $("[id$=txtCountry]").autocomplete({
        source: function (request, response) {
            AjaxCall("cascada.aspx/GetCountries", request.term, 0, response)
        },
        select: function (e, i) {
            $("[id$=hfCountry]").val(i.item.val);
            //$("[id$=txtState]").removeAttr("disabled");
            //$("[id$=txtState]").focus();
        },
        minLength: 1
    });
 
    //$("[id$=txtState]").autocomplete({
    //    source: function (request, response) {
    //        AjaxCall("Default.aspx/GetStates", request.term, $("[id$=hfCountry]").val(), response)
    //    },
    //    select: function (e, i) {
    //        $("[id$=hfState]").val(i.item.val);
    //        $("[id$=txtCity]").removeAttr("disabled");
    //        $("[id$=txtCity]").focus();
    //    },
    //    minLength: 1
    //});
 
    //$("[id$=txtCity]").autocomplete({
    //    source: function (request, response) {
    //        AjaxCall("Default.aspx/GetCities", request.term, $("[id$=hfState]").val(), response)
    //    },
    //    select: function (e, i) {
    //        $("[id$=hfCity]").val(i.item.val);
    //    },
    //    minLength: 1
    //});
});
 
function AjaxCall(url, prefix, parentId, response) {
    $.ajax({
        url: url,
        data: "{ 'prefix': '" + prefix + "', parentId: " + parentId + "}",
        dataType: "json",
        type: "POST",
        contentType: "application/json; charset=utf-8",
        success: function (r) {
            response($.map(r.d, function (item) {
                return {
                    label: item.split('-')[0],
                    val: item.split('-')[1]
                }
            }))
        },
        error: function (r) {
            alert(r.responseText);
        },
        failure: function (r) {
            alert(r.responseText);
        }
    });
}
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <tr>
            <td>SelectCountry  
            </td>
            <td>

                <asp:DropDownList ID="ddlCountry" runat="server" Width="100px">
                </asp:DropDownList>
                <asp:CascadingDropDown ID="CountryCascading" runat="server" Category="Country" TargetControlID="ddlCountry" LoadingText="Loading Countries..." PromptText="Select Country" ServiceMethod="BindCountry" ServicePath="../AutocompletarService.asmx"></asp:CascadingDropDown>

            </td>
        </tr>
        <tr>
            <td>SelectState  
            </td>
            <td></td>
        </tr>
        <tr>
            <td>SelectCity  
            </td>
            <td></td>

        </tr>
    </table>

    <div class="col-lg-6">
        <div class="card">
            <div class="card-body">
                <h4 class="card-title">ASIGNACION TERRITORIAL</h4>
                <div class="row">
                    <div class="col-xs-12 col-lg-3">
                        <div class="form-group">
                            <label>Estados</label>
                            <asp:DropDownList ID="ddlEstad" runat="server" CssClass="form-control form-control-sm"></asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" ControlToValidate="ddlEstad" ErrorMessage="Obligatorio." ForeColor="Red" ValidationGroup="FrmRequerido"></asp:RequiredFieldValidator>
                            <asp:CascadingDropDown ID="CascadingDropDown3" runat="server" Category="Estados" TargetControlID="ddlEstad" LoadingText="Cargando Estados.." ServicePath="../AutocompletarService.asmx" ServiceMethod="Get_ListEstado" PromptText="Seleccionar Estado"></asp:CascadingDropDown>

                        </div>
                    </div>
                    <div class="col-xs-12 col-lg-3">
                        <div class="form-group">
                            <label>Municipios</label>
                            <asp:DropDownList ID="ddlMunicipio" runat="server" CssClass="form-control form-control-sm"></asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="ddlMunicipio" ErrorMessage="Obligatorio." ForeColor="Red" ValidationGroup="FrmRequerido"></asp:RequiredFieldValidator>
                            <asp:CascadingDropDown ID="StateCascading" runat="server" Category="Municipios" TargetControlID="ddlMunicipio" ParentControlID="ddlEstad" LoadingText="Cargando Municipios..." ServiceMethod="Get_ListMunicipio" ServicePath="../AutocompletarService.asmx" PromptText="Seleccionar Municipios" ></asp:CascadingDropDown>

                        </div>
                    </div>
                    <div class="col-xs-12 col-lg-3">
                        <div class="form-group">
                            <label>Colonias</label>
                            <asp:DropDownList ID="ddlColonia" runat="server" CssClass="form-control form-control-sm"></asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ControlToValidate="ddlColonia" ErrorMessage="Obligatorio." ForeColor="Red" ValidationGroup="FrmRequerido"></asp:RequiredFieldValidator>
                            <asp:CascadingDropDown ID="CityCascading" runat="server" Category="Colonias" TargetControlID="ddlColonia" ParentControlID="ddlMunicipio" LoadingText="Cargando Colonias..."  ServiceMethod="Get_ListColonia" ServicePath="../AutocompletarService.asmx" PromptText="Seleccionar Colonias"></asp:CascadingDropDown>
                        </div>
                    </div>

                     <div class="col-md-3">
                            <div class="form-group">
                                 <label>Nombre(s)</label>
                                <asp:TextBox ID="txtValor" CssClass="form-control" runat="server"></asp:TextBox>
                                <asp:AutoCompleteExtender ID="IDExtensor" runat="server" DelimiterCharacters="" Enabled="True" ServicePath="../AutocompletarService.asmx" MinimumPrefixLength="1"  ServiceMethod="BuscarINE" EnableCaching="true" TargetControlID="txtValor" CompletionInterval="0"></asp:AutoCompleteExtender>
                            </div>
                        </div>

                    <div class="col-md-9">
                        <div class="form-group">
                            <label>AUTOCOMPLETAR</label>
                            <asp:TextBox ID="txtCountry" runat="server" />
                            <asp:HiddenField ID="hfCountry" runat="server" />

                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>


</asp:Content>

