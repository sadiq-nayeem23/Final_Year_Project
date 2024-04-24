<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home</title>
    <!-- Link to Bootstrap CSS for styling -->
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
            width: 50%;
            margin-left: auto;
            margin-right: auto;
        }
        .navbar {
            display: flex;
            justify-content: space-between; /* This will align navbar items */
            padding: 10px;
            background-color: #f8f9fa;
        }
        .navbar a {
            padding: 10px;
            text-decoration: none;
            color: black;
        }
        .navbar-right {
            align-items: center;
        }
    </style>
</head>
<body>
     <div class="navbar">
        <div>
            <a class="active" href="Home.aspx">Home</a>
            <a href="AboutUs.aspx">About Us</a>
            <a href="ContactUs.aspx">Contact Us</a>
        </div>
        <div class="navbar-right">
            <!-- Logout button on the right side of the navbar -->
            <a href="Login.aspx">Logout</a>
        </div>
    </div>
    <form id="form1" runat="server">
        <div class="container text-center">
            <h1>Welcome to Vegetable Box Business Management System</h1>
            <div class="login-options">
                <asp:HyperLink ID="lnkPlaceOrder" runat="server" NavigateUrl="Order.aspx" Text="Place Order" CssClass="btn btn-success btn-lg m-2" />
                <asp:HyperLink ID="lnkTrackOrder" runat="server" NavigateUrl="TrackOrder.aspx" Text="Track Order" CssClass="btn btn-info btn-lg m-2" />
            </div>
        </div>
    </form>
    <!-- Link to Bootstrap JS and dependencies for interactive components -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
