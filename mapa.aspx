<%@ Page Title="" Language="C#" MasterPageFile="~/SolarisMaster.master" AutoEventWireup="true" CodeFile="mapa.aspx.cs" Inherits="mapa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <style>       
      #map {
        height: 500px; 
        width: 100%;  
       }
    </style> 
           
    <script>
        
        function initMap() {
            
            var mty = { lat: 25.686613, lng: -100.316116 };            
            var map = new google.maps.Map(
                document.getElementById('map'), { zoom: 15, center: mty });            
            var marker = new google.maps.Marker({ position: mty, map: map, title: "Monterrey (La ciudad de las montañas)" });
            
            var contentString =
                '<div id="content">' +
                '<div id="siteNotice">' +
                "</div>" +
                '<h1 id="firstHeading" class="firstHeading">Monterrey</h1>' +
                '<div id="bodyContent">' +
                "<p><b>Monterrey</b>, tambien conocida como <b>la ciudad de las montañas</b>, </p>" +
                '<p>Referencia: Monterrey, <a href="https://es.wikipedia.org/wiki/Monterrey">' +                
                "https://es.wikipedia.org/wiki/Monterrey</a>" +
                "</div>" +
                "</div>";

            var infowindow = new google.maps.InfoWindow({
                content: contentString
            });

            marker.addListener("click", function () {
                infowindow.open(map, marker);
            });
           
        }

	</script>
                                                     
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCxW-VPfw8x42DIwrfQ9gL8sh-iu42QhCY&callback=initMap">
    </script>
     
      <div class="row">
          <div class="col-12">         
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title"><i class="fa fa-bars">DATOS DE LA COLONIA</i><small>
                        <asp:Label runat="server" ID="Label2"></asp:Label></small></h4>
                                
                <div class="form-body">                     
                    <div class="row">   

                    <div class="col-md-4">
                        <div class="form-group">
                             <label>Estado</label>
                                <asp:TextBox ID="txtEstado" CssClass="form-control form-control-sm" runat="server"></asp:TextBox>                
                        </div>      
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                             <label>Municipio</label>
                                <asp:TextBox ID="TextMunicipio" CssClass="form-control form-control-sm" runat="server"></asp:TextBox>                
                        </div>      
                    </div>                                           
                                                   
                    <div class="col-md-4">
                        <div class="form-group">
                             <label>Colonia</label>
                                <asp:TextBox ID="TextColonia" CssClass="form-control form-control-sm" runat="server"></asp:TextBox>                
                        </div>      
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                             <label>Estatus</label>
                                <asp:TextBox ID="TextEstatus" CssClass="form-control form-control-sm" runat="server"></asp:TextBox>                
                        </div>      
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                             <label>Tipo</label>
                                <asp:TextBox ID="TextTipo" CssClass="form-control form-control-sm" runat="server"></asp:TextBox>                
                        </div>      
                    </div> 
                    <div class="col-md-4">
                        <div class="form-group">
                             <label>Pendiente</label>
                                <asp:TextBox ID="TextPendiente" disabled="1" CssClass="form-control form-control-sm" runat="server"></asp:TextBox>                
                        </div>      
                    </div>  

                    </div>      
                    </div>  

               </div>      
               </div>   
          </div>      
         </div>  
                        
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">                                               
                                <div id="map"></div>   
                            </div>     
                        </div>                  
                    </div>     
                </div> 

                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body"> 
        <iframe width="720" height="480" src="https://www.openstreetmap.org/export/embed.html?bbox=-100.32450914382936%2C25.684632641956544%2C-100.3155505657196%2C25.68889648668488&amp;layer=mapnik&amp;marker=25.686764583398162%2C-100.32002985477448" style="border: 1px solid black"></iframe><br/>
                                <small><a href="https://www.openstreetmap.org/?mlat=25.68676&amp;mlon=-100.32003#map=18/25.68676/-100.32003">Ver mapa más grande</a></small>
                            </div>     
                        </div>                  
                    </div>     
                </div> 

</asp:Content>

