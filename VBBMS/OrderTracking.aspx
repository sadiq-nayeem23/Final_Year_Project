<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrderTracking.aspx.cs" Inherits="OrderTracking" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Order Tracking</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .bg-custom {
            background-image: url('Assets/order_bg.jpg');
            background-size: cover;
            height: 100vh;
            width: 100%;
        }
    </style>
</head>
<body>
    <div class="bg-custom d-flex justify-content-center align-items-center">
        <div class="card p-5">
            <h2 class="card-title text-center">Track Your Order</h2>
            <form id="form1" runat="server">
                <div class="form-group">
                    <label for="OrderId">Order ID:</label>
                    <asp:TextBox ID="OrderId" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <asp:Button ID="TrackButton" runat="server" Text="Track Order" CssClass="btn btn-primary" OnClick="TrackButton_Click" />
            
            <asp:Panel ID="ResultsPanel" runat="server" Visible="false" CssClass="mt-4">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>Customer ID</th>
                            <th>Order Date</th>
                            <th>Delivery Date</th>
                            <th>Total Amount</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Literal ID="ResultsLiteral" runat="server"></asp:Literal>
                    </tbody>
                </table>
            </asp:Panel>
            <asp:HyperLink ID="BackHome" runat="server" Text="Back to Home" CssClass="btn btn-info m-2" NavigateUrl="Home.aspx" />
                </form>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>