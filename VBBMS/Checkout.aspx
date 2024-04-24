<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Checkout.aspx.cs" Inherits="Checkout" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Checkout</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Order Summary</h2>
            <asp:Label ID="lblOrderDate" runat="server" Text="" />
            <br />
            <asp:Label ID="lblTotalAmount" runat="server" Text="" />
            <br />
            <asp:Label ID="lblStatus" runat="server" Text="" />
            <br />
            <asp:GridView ID="gvOrderDetails" runat="server" AutoGenerateColumns="False" CssClass="table table-striped">
                <Columns>
                    <asp:BoundField DataField="BoxName" HeaderText="Product Name" SortExpression="BoxName" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                    <asp:BoundField DataField="Subtotal" HeaderText="Subtotal" SortExpression="Subtotal" DataFormatString="{0:c}" HtmlEncode="False" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
