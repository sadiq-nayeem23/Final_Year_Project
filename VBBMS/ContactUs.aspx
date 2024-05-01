<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="ContactUs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Contact Us</title>
    <!-- Adding Bootstrap 4 CDN -->
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

        .container {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,.1);
        }

        .textbox {
            width: 100%;
            padding: 8px;
            margin: 10px 0;
            box-sizing: border-box;
            border-radius: 4px;
            border: 1px solid #ccc;
        }

        .button {
            width: 100%;
            background-color: #007bff;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

            .button:hover {
                background-color: #0056b3;
            }
    </style>
</head>
<body>
    <div class="navbar">
        <div>
            <a href="Home.aspx">Home</a>
            <a href="AboutUs.aspx">About Us</a>
            <a class="active" href="ContactUs.aspx">Contact Us</a>
        </div>
        <div class="navbar-right">
            <a href="Login.aspx">Logout</a>
        </div>
    </div>
    <div class="container">
        <h1>Contact Us</h1>
        <div>
            <form id="form1" runat="server" class="needs-validation" novalidate>
                <p>If you have any questions or inquiries, please feel free to contact us using the form below:</p>
                <div class="form-group">
                    <asp:Label ID="lblMessage" runat="server" Text="" CssClass="form-text text-muted"></asp:Label>
                    <asp:TextBox ID="txtName" runat="server" placeholder="Your Name" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:TextBox ID="txtEmail" runat="server" placeholder="Your Email" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="4" placeholder="Your Message" CssClass="form-control"></asp:TextBox>
                </div>
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" CssClass="btn btn-primary" />
            </form>
        </div>
    </div>
    <!-- Adding Bootstrap 4 JS and its dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
