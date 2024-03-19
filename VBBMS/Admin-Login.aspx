<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin-Login.aspx.cs" Inherits="Admin_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Login</title>
    <link rel="stylesheet" type="text/css" href="StyleSheet.css">
    <style>
        body {
            background-image: url('Assets/websiteheader-1080x576.jpg'); /* Replace with the path to your admin login background image */
            background-size: cover;
            background-position: center;
            color: black;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Admin Login</h2>
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red" EnableViewState="False"></asp:Label>
            <asp:TextBox ID="txtAdminID" runat="server" placeholder="AdminID" CssClass="form-control" required></asp:TextBox>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Password" CssClass="form-control" required></asp:TextBox>
            <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" CssClass="custom-button" />
            <p>Return to <a href="Home.aspx">Homepage</a>.</p>
        </div>
    </form>
</body>
</html>
