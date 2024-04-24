<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrderDetails.aspx.cs" Inherits="OrderDetails" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Order Details Management</title>
    <link rel="stylesheet" type="text/css" href="StyleSheet.css">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="navbar">
        <a href="Admin-Dashboard.aspx">Admin Dashboard</a>
        <a href="Supplier.aspx">Suppliers</a>
        <a class="active" href="OrderDetails.aspx">Order Details</a>
        <a href="Stock.aspx">Stock</a>
    </div>
    <div class="container mt-3">
        <h2>Order Details Management</h2>
        <form id="form1" runat="server">
            <asp:GridView ID="gvOrders" runat="server" CssClass="table table-hover" AutoGenerateColumns="False"
                DataKeyNames="OrderId" DataSourceID="SqlDataSourceOrders"
                OnRowEditing="gvOrders_RowEditing" OnRowDeleting="gvOrders_RowDeleting"
                OnRowUpdating="gvOrders_RowUpdating" OnRowCancelingEdit="gvOrders_RowCancelingEdit">
                <Columns>
                    <asp:BoundField DataField="OrderId" HeaderText="Order ID" ReadOnly="True" />
                    <asp:BoundField DataField="CustomerID" HeaderText="Customer ID" />
                    <asp:BoundField DataField="OrderDate" HeaderText="Order Date" DataFormatString="{0:yyyy-MM-dd}" HtmlEncode="False" />
                    <asp:BoundField DataField="DeliveryDate" HeaderText="Delivery Date" DataFormatString="{0:yyyy-MM-dd}" HtmlEncode="False" />
                    <asp:BoundField DataField="Status" HeaderText="Status" />
                    <asp:BoundField DataField="TotalAmount" HeaderText="Total Amount" DataFormatString="{0:C}" />
                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
            
            <asp:SqlDataSource ID="SqlDataSourceOrders" runat="server"
                ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
                SelectCommand="SELECT * FROM [Orders]"
                DeleteCommand="DELETE FROM [Orders] WHERE [OrderId] = @OrderId"
                UpdateCommand="UPDATE [Orders] SET [CustomerID] = @CustomerID, [OrderDate] = @OrderDate, [DeliveryDate] = @DeliveryDate, [Status] = @Status, [TotalAmount] = @TotalAmount WHERE [OrderId] = @OrderId"
                InsertCommand="INSERT INTO [Orders] ([CustomerID], [OrderDate], [DeliveryDate], [Status], [TotalAmount]) VALUES (@CustomerID, @OrderDate, @DeliveryDate, @Status, @TotalAmount)">
                <DeleteParameters>
                    <asp:Parameter Name="OrderId" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="CustomerID" Type="Int32" />
                    <asp:Parameter DbType="Date" Name="OrderDate" />
                    <asp:Parameter DbType="Date" Name="DeliveryDate" />
                    <asp:Parameter Name="Status" Type="String" />
                    <asp:Parameter Name="TotalAmount" Type="Decimal" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </form>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
