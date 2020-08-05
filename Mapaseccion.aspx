<%@ Page Title="" Language="C#" MasterPageFile="~/SolarisMaster.master" AutoEventWireup="true" CodeFile="Mapaseccion.aspx.cs" Inherits="Mapaseccion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <style>
       /* Set the size of the div element that contains the map */
      #map {
        height: 500px;  /* The height is 500 pixels */
        width: 100%;  /* The width is the width of the web page */
       }
    </style>
  
    
    <script>
        var map, infoWindow;
        function initMap() {
            map = new google.maps.Map(document.getElementById("map"), {
                center: { lat: 25.686613, lng: -100.316116 },
                zoom: 15
            });
            infoWindow = new google.maps.InfoWindow();

            // Try HTML5 geolocation.
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(
                    function (position) {
                        var pos = {
                            lat: position.coords.latitude,
                            lng: position.coords.longitude
                        };

                        infoWindow.setPosition(pos);
                        infoWindow.setContent("Location found.");
                        infoWindow.open(map);
                        map.setCenter(pos);
                    },
                    function () {
                        handleLocationError(true, infoWindow, map.getCenter());
                    }
                );
            } else {
                // Browser doesn't support Geolocation
                handleLocationError(false, infoWindow, map.getCenter());
            }
        }

        function handleLocationError(browserHasGeolocation, infoWindow, pos) {
            infoWindow.setPosition(pos);
            infoWindow.setContent(
                browserHasGeolocation
                    ? "Error: The Geolocation service failed."
                    : "Error: Your browser doesn't support geolocation."
            );
            infoWindow.open(map);
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
                                <asp:TextBox ID="TextPendiente" disabled CssClass="form-control form-control-sm" runat="server"></asp:TextBox>                
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

</asp:Content>

