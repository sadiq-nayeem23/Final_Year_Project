<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Checkout.aspx.cs" Inherits="Checkout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Checkout</title>
    <link rel="stylesheet" type="text/css" href="StyleSheet.css">
</head>
<body>
     <form id="form1" runat="server">
        <div>
            <h2>Checkout</h2>
            <asp:Label ID="Label1" runat="server" Text="Name:"></asp:Label>
            <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label2" runat="server" Text="Address:"></asp:Label>
            <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine"></asp:TextBox>
            <br />

            <!-- Payment Information -->
            <h3>Payment Information</h3>
            <asp:Label ID="lblCardNumber" runat="server" Text="Card Number:"></asp:Label>
            <asp:TextBox ID="txtCardNumber" runat="server" MaxLength="16"></asp:TextBox>
            <br />
            <asp:Label ID="lblExpiryDate" runat="server" Text="Expiry Date (MM/YY):"></asp:Label>
            <asp:TextBox ID="txtExpiryDate" runat="server" MaxLength="5"></asp:TextBox>
            <br />
            <asp:Label ID="lblCVV" runat="server" Text="CVV:"></asp:Label>
            <asp:TextBox ID="txtCVV" runat="server" MaxLength="4"></asp:TextBox>
            <br />
            <asp:Button ID="btnSubmitOrder" runat="server" Text="Submit Order" OnClick="btnSubmitOrder_Click" />
        </div>
    </form>
</body>
</html>
