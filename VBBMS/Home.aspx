<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home</title>
    <link rel="stylesheet" type="text/css" href="StyleSheet.css">

</head>
<body>
    <div class="navbar">
    <a class="active" href="Home.aspx">Home</a>
    <a href="AboutUs.aspx">About Us</a>
    <a href="ContactUs.aspx">Contact Us</a>
</div>
    <form id="form1" runat="server">
        
        <div class="container">
            <h1>Welcome to Vegetable Box Business Management System</h1>
            <div class="login-options">
                <asp:HyperLink ID="lnkAdminLogin" runat="server" NavigateUrl="Login.aspx">Admin Login</asp:HyperLink>
                <asp:HyperLink ID="lnkCustomerLogin" runat="server" NavigateUrl="Login.aspx">Customer Login</asp:HyperLink>
            </div>
        </div>
    </form>
</body>
</html>
