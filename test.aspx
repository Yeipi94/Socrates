﻿<%@ Page Language="VB" AutoEventWireup="false" CodeFile="test.aspx.vb" Inherits="test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title></title>
	<%--<style>
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
			</style>--%>
</head>
<body>
	

			
			<%--<div class="embed-container">
				<iframe name="survey123webform" width="500" height="400" frameborder="0" marginheight="0" marginwidth="0" title="Socrates" src="//survey123.arcgis.com/share/23b7905139b74eb3bbc8844a30d816a9?hide=navbar,header" allow="geolocation https://survey123.arcgis.com; camera https://survey123.arcgis.com"></iframe>
			</div>
	<script>
		var survey123webform = document.getElementsByName('survey123webform')[0];
		window.addEventListener("message", e => {
			if (e.data) {
				var t = JSON.parse(e.data);
				"survey123:onFormLoaded" === t.event && t.contentHeight && (survey123webform.parentNode.style.height = t.contentHeight + "px") && (survey123webform.parentNode.style["padding-bottom"] = "unset")
			}
		});</script>--%>

	<style>.embed-container {position: relative; padding-bottom: 80%; height: 0; max-width: 100%;} .embed-container iframe, .embed-container object, .embed-container iframe{position: absolute; top: 0; left: 0; width: 100%; height: 100%;} small{position: absolute; z-index: 40; bottom: 0; margin-bottom: -15px;}</style><div class="embed-container"><iframe width="500" height="400" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" title="mapa y puntos" src="//ssolariss777.maps.arcgis.com/apps/Embed/index.html?webmap=e3bbd4f7385f4715b5cca6d5b04d31d7&extent=-100.3967,25.6657,-100.2699,25.7138&home=true&zoom=true&previewImage=false&scale=true&legend=true&disable_scroll=true&theme=light"></iframe></div>

</body>
</html>



