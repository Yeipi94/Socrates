<%@ Page Title="" Language="C#" MasterPageFile="~/SolarisMaster.master" AutoEventWireup="true" CodeFile="Encuesta.aspx.cs" Inherits="Encuesta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	<style>
		.embed-container {
			position: relative;
			height: 0;
			padding-bottom: 80%;
			max-width: 100%;
		}

			.embed-container iframe, .embed-container object, .embed-container iframe {
				position: absolute;
				top: 0;
				left: 0;
				width: 100%;
				height: 100%;
			}

		small {
			position: absolute;
			z-index: 40;
			bottom: 0;
			margin-bottom: -15px;
		}
	</style>
	
	<div class="embed-container">
		<iframe name="survey123webform" width="500" height="400" frameborder="0" marginheight="0" marginwidth="0" title="Solaris" src="//survey123.arcgis.com/share/71a6fe9b16ce45fb8a419a9763ea673e?hide=navbar,header" allow="geolocation https://survey123.arcgis.com; camera https://survey123.arcgis.com"></iframe>
	</div>
	<script>

		var survey123webform = document.getElementsByName('survey123webform')[0];
		window.addEventListener("message", e => {
			if (e.data)
			{
				var t = JSON.parse(e.data);
				"survey123:onFormLoaded" === t.event && t.contentHeight && (survey123webform.parentNode.style.height = t.contentHeight + "px") && (survey123webform.parentNode.style["padding-bottom"] = "unset")
			}		

		});

		//document.getElementsByTagName('/xls-71a6fe9b16ce45fb8a419a9763ea673e/datos_personales/nombre_s').disabled = false;
		//window.addEventListener('load', function () {

		//	if (nombre_s.length >1) {
		//		alert("The name may have no more than 10 characters");
		//		submitOK = "false";
		//	}

		//}
	
		//document.getElementsByName("/xls-71a6fe9b16ce45fb8a419a9763ea673e/datos_personales/nombre_s").values = "enlace ";


		

	</script>
</asp:Content>

