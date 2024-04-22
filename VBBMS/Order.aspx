<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Order.aspx.cs" Inherits="Order" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Order Page</title>
    <link rel="stylesheet" type="text/css" href="StyleSheet.css">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-image: url('Assets/Order-bg.jpeg');
            background-size: cover;
            background-position: center;
            color: white; /* Ensuring text color is white */
            display: flex;
            flex-direction: column;
            align-items: center;
            height: 100vh; /* Full height */
            font-family: 'Arial', sans-serif; /* Adding a modern font family */
        }
        .container {
            background-color: rgba(0, 0, 0, 0.5); /* Semi-transparent background */
            padding: 20px;
            border-radius: 10px;
            width: 80%;
            margin-top: 50px;
            color: white; /* Ensuring all text inside the container is white */
        }
        .navbar {
            width: 100%;
            background-color: #333;
            color: white;
            padding: 10px 0; /* Adjusted padding for better aesthetic */
            text-align: center;
            box-shadow: 0 4px 8px rgba(0,0,0,0.5); /* Adding shadow for depth */
        }
        .navbar a {
            color: white; /* Ensuring links are white */
            padding: 10px 20px; /* Padding for links for better touch targets */
            text-decoration: none; /* Removing underline from links */
            font-size: 16px; /* Making the font size larger for readability */
        }
        .navbar a:hover, .navbar a.active {
            background-color: #555; /* Darker background on hover and for active link */
            border-radius: 5px; /* Rounded corners for hover and active links */
        }
        .floating-card {
            background-color: #fff;
            color: #333;
            padding: 15px;
            margin: 10px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.3); /* Light shadow for floating effect */
        }
        .table th, .table td {
            color: white; /* Makes text in table headers and cells white */
        }
    </style>
</head>
<body>
    <div class="navbar">
        <a class="active" href="Home.aspx">Home</a>
        <a href="AboutUs.aspx">About Us</a>
        <a href="ContactUs.aspx">Contact Us</a>
    </div>
    <div class="container">
        <form id="form1" runat="server">
            <div class="row">
                <div class="col-md-8">
                    <h3>Available Vegetable Boxes</h3>
                    <asp:GridView ID="gvVegetableBoxes" runat="server" CssClass="table table-striped table-hover"
              AutoGenerateColumns="False" OnRowCommand="gvVegetableBoxes_RowCommand" 
              DataKeyNames="BoxId">
    <Columns>
        <asp:BoundField DataField="BoxId" HeaderText="Box ID" />
        <asp:BoundField DataField="BoxName" HeaderText="Name" />
        <asp:TemplateField HeaderText="Price">
            <ItemTemplate>
                <asp:Label ID="lblPrice" runat="server" Text='<%# Bind("Price", "{0:c}") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField>
            <ItemTemplate>
                <asp:Button ID="btnAddToCart" runat="server" CommandName="AddToCart" 
                            CommandArgument='<%# Container.DataItemIndex %>' Text="Add to Cart" 
                            CssClass="btn btn-primary" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
                </div>
                <div class="col-md-4">
                    <h3>Your Cart</h3>
                    <asp:GridView ID="gvShoppingCart" runat="server" CssClass="table table-bordered" AutoGenerateColumns="false">
                        <Columns>
                            <asp:BoundField DataField="BoxId" HeaderText="Box ID" />
                            <asp:BoundField DataField="BoxName" HeaderText="Name" />
                            <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="{0:c}" />
                        </Columns>
                    </asp:GridView>
                    <asp:Label ID="lblTotal" runat="server" CssClass="h4" Text="Total: $0.00" />
                    <br />
                    <asp:Button ID="btnCheckout" runat="server" Text="Checkout" OnClick="btnCheckout_Click" CssClass="btn btn-success" />
                </div>
            </div>
        </form>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
