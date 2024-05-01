<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Customer-Signup.aspx.cs" Inherits="Customer_Signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customer SignUp</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="StyleSheet.css?v=2">
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Customer Sign Up</h2>
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red" EnableViewState="False"></asp:Label>
            <asp:TextBox ID="txtFirstName" runat="server" placeholder="First Name" CssClass="form-control" required></asp:TextBox>
            <asp:TextBox ID="txtLastName" runat="server" placeholder="Last Name" CssClass="form-control" required></asp:TextBox>
            <asp:TextBox ID="txtEmail" runat="server" type="email" placeholder="Email" CssClass="form-control" required></asp:TextBox>
            <asp:TextBox ID="txtPhone" runat="server" placeholder="Phone" CssClass="form-control" required></asp:TextBox>
            <asp:TextBox ID="txtAddress" runat="server" placeholder="Address" CssClass="form-control" required></asp:TextBox>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Password" CssClass="form-control" required></asp:TextBox>
            <asp:Button ID="btnSignUp" runat="server" Text="Sign Up" OnClick="btnSignUp_Click" CssClass="custom-button" />
            <p>Already have an account? <a href="Login.aspx">Login here</a>.</p>
        </div>
    </form>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
