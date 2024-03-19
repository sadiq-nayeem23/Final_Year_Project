<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin-Dashboard.aspx.cs" Inherits="Admin_Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" type="text/css" href="StyleSheet.css">
    <style>
        body {
            background-image: url('Assets/websiteheader-1080x576.jpg'); /* Replace with the path to your admin login background image */
            background-size: cover;
            background-position: center;
            color: black;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Welcome to Admin Dashboard</h1>
            
            <h2>Order Information</h2>
            <asp:GridView ID="gvOrders" runat="server" AutoGenerateColumns="False" DataSourceID="dsOrders">
                <Columns>
                    <asp:BoundField DataField="OrderID" HeaderText="Order ID" SortExpression="OrderID" />
                    <asp:BoundField DataField="CustomerID" HeaderText="Customer ID" SortExpression="CustomerID" />
                    <asp:BoundField DataField="OrderDate" HeaderText="Order Date" SortExpression="OrderDate" DataFormatString="{0:d}" />
                    <asp:BoundField DataField="DeliveryDate" HeaderText="Delivery Date" SortExpression="DeliveryDate" DataFormatString="{0:d}" />
                    <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                    <asp:BoundField DataField="TotalAmount" HeaderText="Total Amount" SortExpression="TotalAmount" DataFormatString="{0:C}" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="dsOrders" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\Project\VBBMS\VBBMS\App_Data\Database.mdf;Integrated Security=True" SelectCommand="SELECT * FROM Orders"></asp:SqlDataSource>

            <h2>Supplier Information</h2>
            <asp:GridView ID="gvSuppliers" runat="server" AutoGenerateColumns="False" DataSourceID="dsSuppliers">
                <Columns>
                    <asp:BoundField DataField="SupplierID" HeaderText="Supplier ID" SortExpression="SupplierID" />
                    <asp:BoundField DataField="SupplierName" HeaderText="Supplier Name" SortExpression="SupplierName" />
                    <asp:BoundField DataField="ContactPerson" HeaderText="Contact Person" SortExpression="ContactPerson" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="dsSuppliers" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\Project\VBBMS\VBBMS\App_Data\Database.mdf;Integrated Security=True" SelectCommand="SELECT * FROM Suppliers"></asp:SqlDataSource>
            <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" CssClass="custom-button" />
        </div>
    </form>
</body>
</html>
