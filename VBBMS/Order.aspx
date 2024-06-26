﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Order.aspx.cs" Inherits="Order" %>

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
            background-attachment: fixed;
            color: white;
            display: flex;
            flex-direction: column;
            align-items: center;
            height: 100vh;
            font-family: 'Arial', sans-serif;
        }

        .container {
            background-color: rgba(0, 0, 0, 0.5);
            padding: 20px;
            border-radius: 10px;
            width: 80%;
            margin-top: 50px;
            color: white;
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

        .floating-card {
            background-color: #fff;
            color: #333;
            padding: 15px;
            margin: 10px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.3);
        }

        .table th, .table td {
            color: white;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <div>
            <a href="Home.aspx">Home</a>
            <a href="AboutUs.aspx">About Us</a>
            <a href="ContactUs.aspx">Contact Us</a>
        </div>
        <div class="navbar-right">
            <a href="Login.aspx">Logout</a>
        </div>
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
                            <asp:BoundField DataField="StockQuantity" HeaderText="Stock" />
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
                    <asp:GridView ID="gvShoppingCart" runat="server" CssClass="table table-bordered" AutoGenerateColumns="false"
                        OnRowCommand="gvShoppingCart_RowCommand">
                        <Columns>
                            <asp:BoundField DataField="BoxId" HeaderText="Box ID" />
                            <asp:BoundField DataField="BoxName" HeaderText="Name" />
                            <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="{0:c}" />
                            <asp:TemplateField HeaderText="Quantity">
                                <ItemTemplate>
                                    <asp:Button ID="btnDecrease" runat="server" CommandName="Decrease" CommandArgument='<%# Container.DataItemIndex %>'
                                        Text="-" CssClass="btn btn-danger btn-sm" />
                                    <%# Eval("Quantity") %>
                                    <asp:Button ID="btnIncrease" runat="server" CommandName="Increase" CommandArgument='<%# Container.DataItemIndex %>'
                                        Text="+" CssClass="btn btn-success btn-sm" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Total Price">
                                <ItemTemplate>
                                    <%# Eval("Price", "{0:c}") %> x <%# Eval("Quantity") %> = <%# (Convert.ToDecimal(Eval("Price")) * Convert.ToInt32(Eval("Quantity"))).ToString("c") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="btnRemove" runat="server" CommandName="Remove" CommandArgument='<%# Container.DataItemIndex %>'
                                        Text="Remove" CssClass="btn btn-warning btn-sm" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:Label ID="lblTotal" runat="server" CssClass="h4" Text="Total: £0.00" />
                    <br />
                    <div class="form-group">
                        <label for="txtEmail">Email:</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <asp:Label ID="lblErrorMessage" runat="server" CssClass="text-danger"></asp:Label>
                    <asp:Button ID="btnCheckout" runat="server" Text="Checkout" OnClick="btnCheckout_Click" CssClass="btn btn-success" />
                </div>
            </div>
        </form>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
