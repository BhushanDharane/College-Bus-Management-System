<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SVIT Campus Online Bus Management System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Visitors Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
    Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link href="css/style.css" rel='stylesheet' type='text/css' />
    <link href="css/style-responsive.css" rel="stylesheet" />
    <link href='//fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic' rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="css/font.css" type="text/css" />
    <link href="css/font-awesome.css" rel="stylesheet" />
    <script src="js/jquery2.0.3.min.js"></script>
    <link rel="shortcut icon" href="../images/nashikestate_logo.ico" type="image/x-icon" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="log-w3">
                <div class="w3layouts-main">
                    <h2>SVIT Campus Online Bus Management System</h2>
                    <h2>Admin Login</h2>
                    Username / Mobile No.
    <asp:TextBox ID="txtmobile_no" runat="server" CssClass="form-control"></asp:TextBox>
                    <br />
                    Password
    <asp:TextBox ID="txtpassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                    <div class="clearfix"></div>
                    <asp:Button ID="btnsubmit" runat="server" Text="SUBMIT" CssClass="btn btn-primary" OnClick="btnsubmit_Click" />
                    <%--<p>Don't Have an Account ?<a href="signup.aspx">Create an account</a></p>--%>
                    <asp:Label ID="lblname" runat="server" Visible="false"></asp:Label>
                    <asp:Label ID="lblid" runat="server" Visible="false"></asp:Label>
                </div>
            </div>
        </div>
    </form>
</body>

<script src="js/bootstrap.js"></script>
<script src="js/jquery.dcjqaccordion.2.7.js"></script>
<script src="js/scripts.js"></script>
<script src="js/jquery.slimscroll.js"></script>
<script src="js/jquery.nicescroll.js"></script>
<!--[if lte IE 8]><script language="javascript" type="text/javascript" src="js/flot-chart/excanvas.min.js"></script><![endif]-->
<script src="js/jquery.scrollTo.js"></script>

</html>
