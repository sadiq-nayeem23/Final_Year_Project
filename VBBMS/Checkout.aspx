﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Checkout.aspx.cs" Inherits="Checkout" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Checkout</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background-image: url('Assets/freshvegetables.jpg');
            background-size: cover;
            background-position: center;
            color: white;
            font-family: 'Arial', sans-serif;
        }

        .container {
            padding-top: 50px;
            padding-bottom: 50px;
        }

        .card {
            background-color: rgba(0, 0, 0, 0.7);
            border: none;
            color: white;
        }
    </style>
</head>
<body>
    <form id="checkoutForm" runat="server">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="card">
                        <div class="card-body">
                            <h2 class="card-title text-center mb-4">Checkout</h2>
                            <div class="card-text">
                                <div class="mb-4">
                                    <h4>Order Summary</h4>
                                    <asp:Label ID="lblCustomerId" runat="server" CssClass="text-white"></asp:Label>
                                    <asp:Label ID="lblOrderSummary" runat="server" CssClass="text-white"></asp:Label>
                                    <asp:Label ID="lblTotalAmount" runat="server" CssClass="text-white"></asp:Label>
                                </div>
                                <div class="form-group">
                                    <label for="txtCardNumber">Card Number</label>
                                    <input type="text" class="form-control" id="txtCardNumber" placeholder="Enter Card Number" required>
                                </div>
                                <div class="form-group">
                                    <label for="txtExpiry">Expiry Date</label>
                                    <input type="text" class="form-control" id="txtExpiry" placeholder="MM/YYYY" required>
                                </div>
                                <div class="form-group">
                                    <label for="txtCVV">CVV</label>
                                    <input type="text" class="form-control" id="txtCVV" placeholder="CVV" required>
                                </div>
                                <asp:Button ID="btnSubmitOrder" runat="server" Text="Submit Order" CssClass="btn btn-success btn-block" OnClick="submitOrder_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
