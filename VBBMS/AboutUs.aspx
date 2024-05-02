<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AboutUs.aspx.cs" Inherits="AboutUs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>About Us</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="StyleSheet.css">
    <style>
        body {
            padding-top: 20px;
            background-color: #f4f4f4;
        }

        .navbar {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }

            .navbar a {
                padding: 10px 15px;
                color: black;
                background-color: transparent;
                text-decoration: none;
                border-radius: 5px;
            }

                .navbar a.active,
                .navbar a:hover {
                    background-color: #04AA6D;
                    color: white;
                }

        .navbar-right {
            align-items: center;
        }

            .navbar-right a:hover {
                background-color: orangered;
                color: white;
            }
    </style>
</head>
<body>
    <div class="navbar">
        <div>
            <a href="Home.aspx">Home</a>
            <a class="active" href="AboutUs.aspx">About Us</a>
            <a href="ContactUs.aspx">Contact Us</a>
        </div>
        <div class="navbar-right">
            <a href="Login.aspx">Logout</a>
        </div>
    </div>
    <div class="container">
        <h1>About Us</h1>
        <p>Welcome to the Vegetable Box Business Management System (VBBMS)!</p>
        <p>VBBMS is a comprehensive software solution designed to help vegetable box businesses manage their operations efficiently. Whether you're a small-scale local vendor or a large-scale distributor, VBBMS provides tools to streamline your processes, optimize inventory management, track orders, manage customer relationships, and more.</p>
        <p>Our mission is to empower vegetable box businesses with the technology they need to succeed in today's competitive market. With VBBMS, you can focus on delivering fresh produce to your customers while we take care of the rest.</p>
        <p>Thank you for choosing VBBMS for your business needs!</p>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
