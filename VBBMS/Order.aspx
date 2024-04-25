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
            width: 100%;
            background-color: #333;
            color: white;
            padding: 10px 0;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0,0,0,0.5);
        }

            .navbar a {
                color: white;
                padding: 10px 20px;
                text-decoration: none;
                font-size: 16px;
            }

                .navbar a:hover, .navbar a.active {
                    background-color: #555;
                    border-radius: 5px;
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
        <a href="Home.aspx">Home</a>
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
