<%@ Page Title="" Language="C#" MasterPageFile="~/Prueba.master" AutoEventWireup="true" CodeFile="GestoriaCap.aspx.cs" Inherits="GestoriaCap" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">


	<script type="text/javascript">
		function SetContextKey() {
			$find('AutoCompleteExtender1').set_contextKey($get("<%=ddlCountries.ClientID %>").value);
		}
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


	<div>
		<asp:DropDownList ID="ddlCountries" runat="server">
			<asp:ListItem Text="Todos los Estados" Value="0"></asp:ListItem>
			<asp:ListItem Text="AGUASCALIENTES" Value="1"></asp:ListItem>
			<asp:ListItem Text="BAJA CALIFORNIA" Value="2"></asp:ListItem>
			<asp:ListItem Text="BAJA CALIFORNIA SUR" Value="3"></asp:ListItem>
			<asp:ListItem Text="CAMPECHE" Value="4"></asp:ListItem>
			<asp:ListItem Text="COAHUILA DE ZARAGOZA" Value="5"></asp:ListItem>
			<asp:ListItem Text="COLIMA" Value="6"></asp:ListItem>
			<asp:ListItem Text="CHIAPAS" Value="7"></asp:ListItem>
			<asp:ListItem Text="CHIHUAHUA" Value="8"></asp:ListItem>
			<asp:ListItem Text="DISTRITO FEDERAL" Value="9"></asp:ListItem>
			<asp:ListItem Text="DURANGO" Value="10"></asp:ListItem>
			<asp:ListItem Text="GUANAJUATO" Value="11"></asp:ListItem>
			<asp:ListItem Text="GUERRERO" Value="12"></asp:ListItem>
			<asp:ListItem Text="HIDALGO" Value="13"></asp:ListItem>
			<asp:ListItem Text="JALISCO" Value="14"></asp:ListItem>
			<asp:ListItem Text="MEXICO" Value="15"></asp:ListItem>
			<asp:ListItem Text="MICHOACAN DE OCAMPO" Value="16"></asp:ListItem>
			<asp:ListItem Text="MORELOS" Value="17"></asp:ListItem>
			<asp:ListItem Text="NAYARIT" Value="18"></asp:ListItem>
			<asp:ListItem Text="NUEVO LEON" Value="19"></asp:ListItem>
			<asp:ListItem Text="OAXACA" Value="20"></asp:ListItem>
			<asp:ListItem Text="PUEBLA" Value="21"></asp:ListItem>
			<asp:ListItem Text="QUERETARO" Value="22"></asp:ListItem>
			<asp:ListItem Text="QUINTANA ROO" Value="23"></asp:ListItem>
			<asp:ListItem Text="SAN LUIS POTOSI" Value="24"></asp:ListItem>
			<asp:ListItem Text="SINALOA" Value="25"></asp:ListItem>
			<asp:ListItem Text="SONORA" Value="26"></asp:ListItem>
			<asp:ListItem Text="TABASCO" Value="27"></asp:ListItem>
			<asp:ListItem Text="TAMAULIPAS" Value="28"></asp:ListItem>
			<asp:ListItem Text="TLAXCALA" Value="29"></asp:ListItem>
			<asp:ListItem Text="VERACRUZ DE IGNACIO DE LA LLAVE" Value="30"></asp:ListItem>
			<asp:ListItem Text="YUCATAN" Value="31"></asp:ListItem>
			<asp:ListItem Text="ZACATECAS" Value="32"></asp:ListItem>
		</asp:DropDownList>
		<asp:ScriptManager ID="ScriptManager1" runat="server"
			EnablePageMethods="true">
			<Services>
				<asp:ServiceReference Path="AutocompletarService.asmx" />
			</Services>
		</asp:ScriptManager>

		<asp:TextBox ID="txtContactsSearch" runat="server" onkeyup="SetContextKey()"></asp:TextBox>
		<%--<asp:AutoCompleteExtender ID="AutoCompleteExtender1"  ServicePath="~/AutocompletarService.asmx" ServiceMethod="SearchCustomers"
			MinimumPrefixLength="2"
			CompletionInterval="100" EnableCaching="false" CompletionSetCount="10" 
			TargetControlID="txtContactsSearch" UseContextKey="true"
			runat="server" FirstRowSelected="false">
		</asp:AutoCompleteExtender>--%>
		<asp:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server"
                TargetControlID="txtContactsSearch"
                ServiceMethod="SearchCustomers"
                ServicePath="GestoriaCap.aspx"
                MinimumPrefixLength="2"
                CompletionInterval="1000"
                EnableCaching="true"
                CompletionSetCount="12" >
		</asp:AutoCompleteExtender>
	</div>

	<%--	<script src="js/autocomplete_twittert.js"></script>--%>
</asp:Content>

