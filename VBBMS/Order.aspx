<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Order.aspx.cs" Inherits="Order" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Order Page</title>
    <link rel="stylesheet" type="text/css" href="StyleSheet.css">
    <style>
        body {
            background-image: url('Assets/Order-bg.jpeg');
            background-size: cover;
            background-position: center;
            color: white;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        /* Navigation bar styles */
        #navbar {
            width: 100%;
            background-color: #333;
            color: white;
            padding: 15px;
            text-align: center;
        }

        /* Main container styles */
        #main-container {
            display: flex;
            justify-content: flex-end;
            width: 100%;
        }

        /* Style for the right content (vegetable details) */
        #vegetableDetails {
            width: 50%; /* Adjust the width as needed */
            margin-left: 20px; /* Add some margin between the two sections */
        }

        /* Style for the left content (shopping cart or other content) */
        #shoppingCart {
            width: 30%; /* Adjust the width as needed */
        }

        /* Floating card styles */
        .floating-card {
            border: 1px solid #ddd;
            padding: 15px;
            margin: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #fff;
        }
        /* Shopping cart styles */
        #cart-container {
            padding: 10px;
            border: 1px solid #ddd;
            margin-top: 20px;
            background-color: #f9f9f9;
            color: black;
        }

        .cart-item {
            margin-bottom: 10px;
        }

        .cart-total {
            margin-top: 10px;
            font-weight: bold;
            color: black;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <a class="active" href="Home.aspx">Home</a>
        <a href="AboutUs.aspx">About Us</a>
        <a href="ContactUs.aspx">Contact Us</a>
    </div>
   <form id="form1" runat="server">
        <div>
            <asp:GridView ID="gvVegetableBoxes" runat="server" AutoGenerateColumns="false" OnRowCommand="gvVegetableBoxes_RowCommand" DataKeyNames="BoxId">
    <Columns>
        <asp:BoundField DataField="BoxId" HeaderText="Box ID" />
        <asp:BoundField DataField="BoxName" HeaderText="Name" />
        <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="{0:c}" />
        <asp:TemplateField>
            <ItemTemplate>
                <asp:Button ID="btnAddToCart" runat="server" CommandName="AddToCart" Text="Add to Cart"
                            CommandArgument='<%# Container.DataItemIndex %>' />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
            <br />
            <asp:GridView ID="gvShoppingCart" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="BoxId" HeaderText="Box ID" />
                    <asp:BoundField DataField="BoxName" HeaderText="Name" />
                    <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="{0:c}" />
                </Columns>
            </asp:GridView>
            <br />
            <asp:Label ID="lblTotal" runat="server" Text="Total: $0.00"></asp:Label>
        </div>
       <asp:Button ID="btnCheckout" runat="server" Text="Checkout" OnClick="btnCheckout_Click" />
    </form>
</body>
</html>
