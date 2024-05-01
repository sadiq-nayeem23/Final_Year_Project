<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin-Dashboard.aspx.cs" Inherits="Admin_Dashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Dashboard</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-image: url('Assets/freshvegetables.jpg'); /* Ensure the path is correct */
            background-size: cover;
            background-position: center;
            color: black;
            background-attachment:fixed;
        }

        .navbar {
            margin-bottom: 20px;
            background-color: rgba(255, 255, 255, 0.5); /* Make navbar transparent */
        }

        .navbar a {
            text-decoration: none;
            color: black;
            background-color: lightblue;
            padding: 10px 20px;
            border-radius: 5px;
            margin-right: 10px;
            transition: background-color 0.3s ease; /* Smooth transition for background color */
        }

        .navbar a:hover {
            background-color: deepskyblue; /* Change color on hover */
            color: white;
        }

        .container-fluid {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 80vh; /* Adjust height to use the full vertical center alignment */
        }

        .btn-dashboard {
            width: 100%;
            padding: 20px;
            font-size: 20px;
            margin-bottom: 20px;
        }

        .section {
            padding: 20px;
            background-color: #f8f9fa;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <div class="navbar bg-light">
        <a class="active" href="Admin-Dashboard.aspx">Admin Dashboard</a>
        <a href="Login.aspx">Logout</a>
    </div>
    <div class="container-fluid">
        <form id="form1" runat="server">
            <div class="row">
                <div class="col-md-4">
                    <button type="button" class="btn btn-primary btn-dashboard" onclick="window.location.href='OrderDetails.aspx'">Order Details</button>
                </div>
                <div class="col-md-4">
                    <button type="button" class="btn btn-primary btn-dashboard" onclick="window.location.href='Stock.aspx'">Stock</button>
                </div>
                <div class="col-md-4">
                    <button type="button" class="btn btn-primary btn-dashboard" onclick="window.location.href='CustomerInfo.aspx'">Customer Info</button>
                </div>
                <div class="col-md-4">
                    <button type="button" class="btn btn-primary btn-dashboard" onclick="window.location.href='Staff.aspx'">Staff</button>
                </div>
                <div class="col-md-4">
                    <button type="button" class="btn btn-primary btn-dashboard" onclick="window.location.href='Supplier.aspx'">Suppliers</button>
                </div>
                <div class="col-md-4">
                    <button type="button" class="btn btn-primary btn-dashboard" onclick="window.location.href='ContactInfo.aspx'">Contact Info</button>
                </div>
            </div>
        </form>
    </div>

</body>
</html>