<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' />
    <title>College Bus Management</title>

    <link
        rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Roboto:400,700" />
    <!-- https://fonts.google.com/specimen/Open+Sans -->
    <link rel="stylesheet" href="css/fontawesome.min.css" />
    <!-- https://fontawesome.com/ -->
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <!-- https://getbootstrap.com/ -->
    <link rel="stylesheet" href="css/templatemo-style.css">
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
            <script type="text/javascript">
                if (navigator.geolocation) {
                    navigator.geolocation.getCurrentPosition(function (position) {
                        var latitude = position.coords.latitude;
                        var longitude = position.coords.longitude;
                        document.getElementById("<%=hfLat.ClientID %>").value = latitude;
                                            document.getElementById("<%=hfLon.ClientID %>").value = longitude;
                                            var coords = new google.maps.LatLng(latitude, longitude);
                                            var mapOptions = {
                                                zoom: 15,
                                                center: coords,
                                                mapTypeControl: true,
                                                navigationControlOptions: {
                                                    style: google.maps.NavigationControlStyle.SMALL
                                                },
                                                mapTypeId: google.maps.MapTypeId.ROADMAP
                                            };
                                            map = new google.maps.Map(
                                                document.getElementById("mapContainer"), mapOptions
                                            );
                                            var marker = new google.maps.Marker({
                                                position: coords,
                                                map: map,
                                                title: "Your current location!"
                                            });

                                        });
                } else {
                    alert("Geolocation API is not supported in your browser.");
                }

                function GetAddress() {
                    var lat = parseFloat(document.getElementById("<%=hfLat.ClientID %>").value);
                                        var lng = parseFloat(document.getElementById("<%=hfLon.ClientID %>").value);
                                        var latlng = new google.maps.LatLng(lat, lng);
                                        var geocoder = geocoder = new google.maps.Geocoder();
                                        geocoder.geocode({ 'latLng': latlng }, function (results, status) {
                                            if (status == google.maps.GeocoderStatus.OK) {
                                                if (results[1]) {
                                                    document.getElementById("<%=hfAddress.ClientID %>").value = results[1].formatted_address;
                                                    Address = results[1].formatted_address;
                                                    localStorage.setItem("Address", Address);
                                                }
                                            }
                                        });
                }

                function GetAddressDetails() {
                    GetAddress();
                    document.getElementById("<%=hfAddress.ClientID%>").value = localStorage.getItem("Address");
                    localStorage.removeItem("Address");
                }
            </script>
            <style type="text/css">
                #mapContainer {
                    height: 300px;
                    width: 500px;
                    border: 10px solid #eaeaea;
                }
            </style>
            <%--<div id="mapContainer">
    </div>--%>
            <asp:HiddenField ID="hfLat" runat="server" />
            <asp:HiddenField ID="hfLon" runat="server" />
            <asp:HiddenField ID="hfAddress" runat="server" />

            <asp:Label ID="lblLatitude" runat="server" Visible="false" />
            <asp:Label ID="lblLongitude" runat="server" Visible="false" />


            <div class="container tm-mt-big tm-mb-big">
                <div class="row">
                    <div class="col-12 mx-auto tm-login-col">
                        <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                            <div class="row">
                                <div class="col-12 text-center">
                                    <h2 class="tm-block-title mb-4">Login</h2>
                                </div>
                            </div>
                            <div class="row mt-2">
                                <div class="col-12">

                                    <div class="form-group">
                                        <label for="username">Login As</label>
                                        <asp:DropDownList ID="cmblogin_as" runat="server" CssClass="form-control">
                                            <asp:ListItem>Select</asp:ListItem>
                                            <asp:ListItem>Student</asp:ListItem>
                                            <asp:ListItem>Driver</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>

                                    <div class="form-group">
                                        <label for="username">Mobile No.</label>
                                        <asp:TextBox ID="txtmobile" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="username">Password</label>
                                        <asp:TextBox ID="txtpassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                    </div>

                                    <div class="form-group mt-4">
                                        <asp:Button ID="btnlogin" runat="server" Text="login" CssClass="btn btn-primary btn-block text-uppercase" OnClick="btnlogin_Click" />
                                        <br />
                                        <asp:Label ID="lblmsg" runat="server"></asp:Label>
                                        <asp:Label ID="lblbus_no" runat="server" Visible="false"></asp:Label>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
