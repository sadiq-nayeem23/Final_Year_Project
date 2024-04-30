<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Thank You.aspx.cs" Inherits="Thank_You" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Thank You</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="StyleSheet.css">
    <style>
        body {
            background-image: url('Assets/freshvegetables.jpg');
            background-size: cover;
            background-position: center;
            height: 100vh;
        }
        .container {
            background-color: rgba(255, 255, 255, 0.8);
            border-radius: 10px;
            padding: 40px;
            margin-top: 100px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container text-center">
            <h2>Thank you for your order!</h2>
            <p>Your order has been received and is being processed.</p>
            <asp:Label ID="lblOrderId" runat="server" CssClass="alert alert-success"></asp:Label>
            <br />
            <p>Keep your order id for tracking the status.</p>
            <asp:HyperLink ID="hlBackToHome" runat="server" NavigateUrl="Home.aspx" Text="Back to Home Page" CssClass="btn btn-primary" />
        </div>
    </form>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
