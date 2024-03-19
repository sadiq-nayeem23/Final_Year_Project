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
    <form id="form1" runat="server">
        <div id="navbar">
            <h1>Vegetable Box Details</h1>
        </div>
        <div id="main-container">
            <div id="vegetableboxDetails">
                <h1>Vegetable Box Details</h1>
                <asp:GridView ID="gvVegetableBoxes" runat="server" AutoGenerateColumns="False" DataSourceID="dsVegetableBoxes" OnSelectedIndexChanged="gvVegetableBoxes_SelectedIndexChanged" DataKeyNames="BoxId" AutoPostBack="false">
                    <Columns>
                        <asp:BoundField DataField="BoxId" HeaderText="Box Id" SortExpression="BoxId" />
                        <asp:BoundField DataField="BoxName" HeaderText="Box Name" SortExpression="BoxName" />
                        <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" DataFormatString="{0:C}" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="btnAddToCart" runat="server" Text="Add to Cart" CommandName="AddToCart" CommandArgument='<%# Eval("BoxId") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="dsVegetableBoxes" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\Project\VBBMS\VBBMS\App_Data\Database.mdf;Integrated Security=True" SelectCommand="SELECT * FROM VegetableBoxes"></asp:SqlDataSource>
                <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" CssClass="custom-button" />
            </div>
            <div id="shoppingCart" class="floating-card">
                    <div id="cart-container">
                    <h2>Shopping Cart</h2>

                    <asp:GridView ID="gvShoppingCart" runat="server" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="BoxName" HeaderText="Box Name" SortExpression="BoxName" />
                            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" DataFormatString="{0:C}" />
                        </Columns>
                    </asp:GridView>

                    <div class="cart-total">
                        <asp:Label ID="lblTotal" runat="server" Text="Total: £0.00"></asp:Label>
                    </div>
                </div>
            </div>
       </div>
    </form>
</body>
</html>
