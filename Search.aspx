<%@ Page Title="" Language="C#" MasterPageFile="~/SolarisMaster.master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Search" EnableEventValidation="false" %>
<%--<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>--%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

	<%-- <link href="Content/themes/base/all.css" rel="stylesheet" />  
    <script src="Scripts/jquery-2.1.4.js"></script>  
    <script src="Scripts/jquery-ui-1.11.4.js"></script>  --%>

	

	<script type="text/javascript"> 
		function pageLoad() {
			$("#<%=ddlEstados_Cat.ClientID%>").select2({
				placeholder: "Seleccionar Estado",
			})
		}
		function SetContextKey() {
			
			$find('<%=AutoCompleteExtender1.ClientID %>').set_contextKey($get("<%=ddlEstados_Cat.ClientID %>").value);
			<%--var dni = $get("<%=ddlEstados_Cat.ClientID %>").value;
			alert(dni);--%>
		}

		<%--function valoReturn() {
			
				var dni2 = $get("<%=txtNombre.ClientID %>").value;
				alert(dni2);
			
		}
		//evento change
		var texboxNombre = document.getElementById("<%=txtNombre.ClientID %>");
		texboxNombre.addEventListener('change', valoReturn);
	--%>
		function mayus(e) {
			e.value = e.value.toUpperCase();
		}

		<%--function selectItem() {
			var comletionList = $find("#<%=txtNombre.ClientID%>").get_completionList();
			for (i = 0; i < comletionList.childNodes.length; i++) {

				var _value = comletionList.childNodes[i]._value;
				comletionList.childNodes[i]._value = _value.substring(_value.lastIndexOf('|') + 1);
				_value = _value.substring(0, _value.lastIndexOf('|'));
				comletionList.childNodes[i].innerHTML = _value.replace('|', '<br />');
			}
		}
		--%>

	

	</script>


</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<div class="row">
		<div class="col-12">
			<div class="alert alert-danger alert-dismissible fade in" role="alert" id="msgError" runat="server" style="display: none; background-color: #ad0a0a; color: #fff"></div>
		</div>
		        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
		<div class="col-12">

			<div class="card">

				<div class="card-body">
					
					<div class="row">
						<div class="col-xs-3 col-lg-3">
							<div class="form-group">
								<label>Estados</label>
								<asp:DropDownList ID="ddlEstados_Cat" runat="server"  CssClass="form-control" Width="100%" OnSelectedIndexChanged="ddlEstados_Cat_SelectedIndexChanged" >
							<asp:ListItem Text="Todos los Estados" Value="0"></asp:ListItem>
							<asp:ListItem Text="AGUASCALIENTES2" Value="1"></asp:ListItem>
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
								<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" ControlToValidate="ddlEstados_Cat" ErrorMessage="Obligatorio." ForeColor="Red"></asp:RequiredFieldValidator>
							</div>
						</div>

						


						<div class="col-xs-9 col-lg-9" runat="server">
							<div class="form-group">
								<label>Nombre(s)</label>			
								<asp:TextBox ID="txtNombre" CssClass="form-control" runat="server" OnTextChanged="txtName_TextChanged" AutoPostBack="true"  placeholder="Nombre Completo" onkeyup="SetContextKey()"></asp:TextBox>
								<asp:AutoCompleteExtender ServiceMethod="SearchCustomers"  
									CompletionListCssClass="autocomplete_completionListElement" 
									CompletionListItemCssClass="autocomplete_listItem"
									CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
									MinimumPrefixLength="2"
									CompletionInterval="500" 
									EnableCaching="true" 
									CompletionSetCount="20"  
									TargetControlID="txtNombre" 
									UseContextKey="true"
									ID="AutoCompleteExtender1" 
									runat="server" 
									FirstRowSelected="false"
									ShowOnlyCurrentWordInCompletionListItem="true"></asp:AutoCompleteExtender>

							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-7 align-self-center">
							<h4 class="card-title mb-3">REGISTROS INE <small><asp:Label runat="server" ID="Label2"></asp:Label></small></h4>

						</div>
					
					</div>
          
					
					<div style="width: 100%; height: auto; max-height: 400px; overflow-y: scroll" class="table-responsive">
						<asp:GridView ID="GridView1"  class="table table-bordered  text-center" ShowHeaderWhenEmpty="true"  EmptyDataText="No se encontraron registros con los criterios de búsqueda."  runat="server" OnPageIndexChanging="GridView1_PageIndexChanging" AutoGenerateColumns="false" DataKeyNames="CVE" PagerSettings-Position="Top" OnRowDataBound="GridView1_RowDataBound" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" HeaderStyle-VerticalAlign="Top">
							
							<HeaderStyle CssClass="bg-danger text-white" />
							
							<Columns>
								<asp:BoundField DataField="CVE" HeaderText="clave" ReadOnly="True" SortExpression="CVE" Visible="false" />
								<asp:BoundField DataField="Nombre_Comp" HeaderText="Nombre Completo" SortExpression="Nombre_Comp" />
								<asp:BoundField DataField="FechaN" HeaderText="Fecha Nac." SortExpression="FechaN" />
								<asp:BoundField DataField="edad" HeaderText="Edad" SortExpression="edad" />
								<asp:BoundField DataField="calle" HeaderText="Calle" SortExpression="calle" />
								<asp:BoundField DataField="num_exterior" HeaderText="Num." SortExpression="num_exterior" />
								<asp:BoundField DataField="colonia" HeaderText="Colonia" SortExpression="colonia" />
								<asp:BoundField DataField="E" HeaderText="Entidad" SortExpression="E" />
								<asp:BoundField DataField="d_estado" HeaderText="Estado" SortExpression="d_estado" />
								<asp:CommandField ButtonType="Link" ControlStyle-CssClass="btn btn-success btn-danger" ShowSelectButton="true" />
							</Columns>
							<HeaderStyle />
							<PagerSettings Mode="NumericFirstLast" Position="Bottom" FirstPageText="1" LastPageText="2" NextPageText="3" PreviousPageText="" Visible="false" />
							<PagerStyle VerticalAlign="Bottom" />
						</asp:GridView>
						<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SISTEM_ALIADOSConnectionString %>" OnSelected="registro1"></asp:SqlDataSource>
					</div>

					<asp:HiddenField ID="TabName" runat="server" />

				</div>



			</div>
			

			<div class="card">

				<div class="card-body">
					<div class="row">
						<div class="col-7 align-self-center">
							<h4 class="card-title mb-3">INE MONTERREY <small><asp:Label runat="server" ID="Label3"></asp:Label></small></h4>

						</div>
					
					</div>
					



					<div style="width: 100%; height: auto; max-height: 400px; overflow-y: scroll" class="table-responsive">
						<asp:GridView ID="GvwMonterrey" class="table table-bordered  text-center" runat="server" OnPageIndexChanging="GvwMonterrey_PageIndexChanging" EmptyDataText="No se encontraron registros con los criterios de búsqueda."  AutoGenerateColumns="false" DataKeyNames="id" DataSourceID="SqlDataSource2" PagerSettings-Position="Top" OnRowDataBound="GvwMonterrey_RowDataBound" OnSelectedIndexChanged="GvwMonterrey_SelectedIndexChanged" HeaderStyle-CssClass="info">
							<HeaderStyle CssClass="bg-danger text-white" />
							<Columns>
								<asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" Visible="false" />
								<asp:BoundField DataField="Nombre_Comp" HeaderText="Nombre Completo" SortExpression="Nombre_Comp" />
								<asp:BoundField DataField="edad" HeaderText="Edad" SortExpression="edad" />
								<asp:BoundField DataField="direccion_comp" HeaderText="direccion_comp" SortExpression="direccion_comp" />
								<asp:BoundField DataField="municipio" HeaderText="Municipio" SortExpression="municipio" />
								<asp:BoundField DataField="INE_Origen" HeaderText="INE_Origen" SortExpression="INE_Origen" Visible="false" />
								<asp:CommandField ButtonType="Link" ControlStyle-CssClass="btn btn-rounded btn-danger" ShowSelectButton="true" />
							</Columns>
							<HeaderStyle />
							<PagerSettings Mode="NumericFirstLast" Position="Bottom" FirstPageText="1" LastPageText="2" NextPageText="3" PreviousPageText="" Visible="false" />
							<PagerStyle VerticalAlign="Bottom" />
						</asp:GridView>
						<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SISTEM_ALIADOSConnectionString %>" OnSelected="registro2"></asp:SqlDataSource>
					</div>
				</div>

				<asp:HiddenField ID="HiddenField1" runat="server" />

			</div>
			<%--TABLA DE PRUEBA COON WEB SERVICES--%>
			<div class="card">

				<div class="card-body">
					<div style="width: 100%; height: auto; max-height: 400px; overflow-y: scroll" class="table-responsive">
						<asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="false">
						<Columns>
							<asp:TemplateField HeaderText="Id" ItemStyle-Width="50">
								<ItemTemplate>
									<asp:Label ID="lblId" runat="server" Text='<%# Eval("CLAVE_ELECT") %>'></asp:Label>
								</ItemTemplate>
							</asp:TemplateField>
							<asp:TemplateField HeaderText="Name" ItemStyle-Width="150">
								<ItemTemplate>
									<asp:Label ID="lblName" runat="server" Text='<%# Eval("NOMBRE_COMP") %>'></asp:Label>
								</ItemTemplate>
							</asp:TemplateField>
							<asp:TemplateField HeaderText="Country" ItemStyle-Width="150">
								<ItemTemplate>
									<asp:Label ID="lblCountry" runat="server" Text='<%# Eval("COLONIA") %>'></asp:Label>
								</ItemTemplate>
							</asp:TemplateField>
						</Columns>
					</asp:GridView>
					</div>
				</div>
			</div>
		</div>





		
	</div>

	 
<%--	    <script src="js/Personas.js" type="text/javascript"></script>--%>

	<script>
		



		$(document).ready(function () {
		
		 

			

			$("#<%=ddlEstados_Cat.ClientID%>").select2({

				placeholder: "Seleccionar Estado",
				//allowClear: true

			});




		});



		//function ShowSelected() {
		//	/* Para obtener el valor */
		//	var cod = document.getElementById("ddlEstados").value;
		//	alert(cod);

		//	/* Para obtener el texto */
		//	var combo = document.getElementById("ddlEstados");
		//	var selected = combo.options[combo.selectedIndex].text;
		//	alert(selected);
		//}



		//$('#txtName').change(function () {
		//	e.preventDefault();

		//	var dni = $("#txtName").val();
		//	alert(dni);
		//	searchPacienteDni(dni);
		//});

		//$('#txtName').keyup(function (event) {
		//	//Aqui le indico que cuando le de enter realice la accion siguiente
		//	if (event.keyCode == 13) {
		//		//Aqui obligo a que valla al servidor a ejecutar el evento asociado al TextBox
		//		__doPostBack('txtName', '');
		//		var dni = $("#txtName").val();
		//		alert(dni);
		//		searchPacienteDni(dni);
		//	}
		//	else
		//	{
		//		return true;
		//	}
		//});
		function Changed(textControl) {
			//e.preventDefault();

			var dni = textControl.value;
			alert(dni);
			searchPacienteDni();

			//alert(textControl.value);
		}

		//function searchPacienteDni(dni) {

		//	var data = JSON.stringify({ dni: dni });
		//	$.ajax({
		//		type: "POST",
		//		url: "Search.aspx/BuscarPersonas",
		//		data: data,
		//		contentType: 'application/json; charset=utf-8',
		//		error: function (xhr, ajaxOptions, thrownError) {
		//			console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
		//		},
		//		success: function (data) {
		//			if (data.d == null) {
		//				alert('No exite el paciente con dni' + dni);
		//				//limpiarDatosPaciente();
		//			} else {
		//				var datatableVariable = $('#tbl_personas').DataTable({

		//					data: data,

		//					columns: [

		//						{ 'data': 'clave' },
		//						{ 'data': 'Nombre_Comp' },
		//						{ 'data': 'colonia' },
		//						{ 'data': 'municipio' },
		//						{ 'data': 'entidad' },
		//						//{ 'data': 'Estado' },
		//						//{ 'data': 'Ver' }


		//					],
		//					"language": {
		//						"url": "//cdn.datatables.net/plug-ins/1.10.21/i18n/Spanish.json"
		//					}

		//				});
		//				//llenarDatosPaciente(data.d);
		//			}

		//		}
		//	});




		//}

		

		//function llenarDatosPaciente(obj) {
		//	$("#clave").val(obj.clave);
		//	$("#Nombre_Comp").val(obj.Nombre_Comp);
		//	$("#colonia").val(obj.colonia);
		//	$("#municipio").val(obj.municipio);
		//	$("#entidad").val(obj.entidad);
		//	//$("#txtSexo").val((obj.Sexo == 'M') ? 'Masculino' : 'Femenino');
		//}

		//function limpiarDatosPaciente() {
		//	$("#clave").val("0");
		//	$("#Nombre_Comp").val("");
		//	$("#colonia").val("");
		//	$("#municipio").val("");
		//	$("#entidad").val("");
		//	//$("#txtSexo").val("");
		//}
		
		
	</script>
</asp:Content>

