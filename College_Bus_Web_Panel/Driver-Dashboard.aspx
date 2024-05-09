<%@ Page Title="" Language="C#" MasterPageFile="~/DriverMasterPage.master" AutoEventWireup="true" CodeFile="Driver-Dashboard.aspx.cs" Inherits="Driver_Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <style type="text/css">
        html {
            height: 100%
        }

        body {
            height: 100%;
            margin: 0;
            padding: 0
        }

        #map_canvas {
            height: 100%
        }
    </style>
    <script type="text/javascript"
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC6v5-2uaq_wusHDktM9ILcqIrlPtnZgEk&sensor=false">
    </script>
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false&libraries=places">
    </script>
    <script type="text/javascript">
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(success);
        } else {
            alert("Geo Location is not supported on your current browser!");
        }
        function success(position) {
            var lat = position.coords.latitude;
            var long = position.coords.longitude;
            var city = position.coords.locality;
            var myLatlng = new google.maps.LatLng(lat, long);
            var myOptions = {
                center: myLatlng,
                zoom: 12,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
            var marker = new google.maps.Marker({
                position: myLatlng,
                title: "lat: " + lat + " long: " + long
            });
            marker.setMap(map);
            var infowindow = new google.maps.InfoWindow({ content: "<b>User Address</b><br/> Latitude:" + lat + "<br /> Longitude:" + long + "" });
            infowindow.open(map, marker);
        }
    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:Label ID="lblmobile" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblbus_no" runat="server" Visible="false"></asp:Label>

    <asp:Label ID="lbllat" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lbllong" runat="server" Visible="false"></asp:Label>



    <div class="container tm-mt-big tm-mb-big">
        <div class="row">
            <div class="col-12 mx-auto tm-login-col">
                <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                    <div class="row">
                        <div class="col-12 text-center">
                            <h2 class="tm-block-title mb-4">My Current Location</h2>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col ddiv">


                            <div class="form-group">

                                <asp:Button ID="btnview_location" runat="server" Text="View On Map" CssClass="btn btn-primary" OnClick="btnview_location_Click" />

                                <%--<div id="map_canvas" style="width: 100%; height: 200px"></div>--%>


                                


                            </div>



                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

