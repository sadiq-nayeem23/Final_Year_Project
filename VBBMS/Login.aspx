<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="StyleSheet.css?v=2">
</head>
<body>
    <div class="navbar">
        <a class="active" href="Home.aspx">Home</a>
        <a href="AboutUs.aspx">About Us</a>
        <a href="ContactUs.aspx">Contact Us</a>
    </div>
    <form id="form1" runat="server">
    <div class="container">
        <h2>Login</h2>
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red" EnableViewState="False"></asp:Label>
        <asp:TextBox ID="txtUsername" runat="server" type="Username" placeholder="Username" CssClass="form-control" required></asp:TextBox>
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Password" CssClass="form-control" required></asp:TextBox>
        <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" CssClass="custom-button" />
        <p>Don't have an account? <a href="customer-signup.aspx">Sign up here</a>.</p>
        <p>Return to <a href="Home.aspx">Homepage</a>.</p>
    </div>
</form>
</body>
</html>
