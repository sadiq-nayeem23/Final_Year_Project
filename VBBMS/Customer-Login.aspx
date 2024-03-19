<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Customer-Login.aspx.cs" Inherits="Customer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customer Login</title>
    <link rel="stylesheet" type="text/css" href="StyleSheet.css"/>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Customer Login</h2>
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red" EnableViewState="False"></asp:Label>
            <asp:TextBox ID="txtEmail" runat="server" type="email" placeholder="Email" CssClass="form-control" required></asp:TextBox>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Password" CssClass="form-control" required></asp:TextBox>
            <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" CssClass="custom-button" />
            <p>Don't have an account? <a href="customer-signup.aspx">Sign up here</a>.</p>
            <p>Return to <a href="Home.aspx">Homepage</a>.</p>
        </div>
    </form>
</body>
</html>
