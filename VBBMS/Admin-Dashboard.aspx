<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin-Dashboard.aspx.cs" Inherits="Admin_Dashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Dashboard</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-image: url('Assets/websiteheader-1080x576.jpg'); /* Ensure the path is correct */
            background-size: cover;
            background-position: center;
            color: black;
        }

        .navbar {
            margin-bottom: 20px;
        }

        .section {
            padding: 20px;
            background-color: #f8f9fa;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <div class="navbar bg-light">
        <a class="navbar-brand" href="Admin-Dashboard.aspx">Admin Dashboard</a>
        <a class="navbar-brand" href="Supplier.aspx">Suppliers</a>
        <a class="navbar-brand" href="OrderDetails.aspx">Order Details</a>
        <a class="navbar-brand" href="Stock.aspx">Stock</a>
        <a class="nav-link" href="Logout.aspx">Logout</a>
    </div>
    <div class="container-fluid">
        <form id="form1" runat="server">
            <div class="row">
                <div class="col-md-6">
                    <div class="section">
                        <h2>Order Information</h2>
                        <asp:GridView ID="gvOrders" runat="server" AutoGenerateColumns="False" CssClass="table table-striped" DataSourceID="dsOrders">
                            <Columns>
                                <asp:BoundField DataField="OrderID" HeaderText="Order ID" />
                                <asp:BoundField DataField="CustomerID" HeaderText="Customer ID" />
                                <asp:BoundField DataField="OrderDate" HeaderText="Order Date" DataFormatString="{0:d}" />
                                <asp:BoundField DataField="DeliveryDate" HeaderText="Delivery Date" DataFormatString="{0:d}" />
                                <asp:BoundField DataField="Status" HeaderText="Status" />
                                <asp:BoundField DataField="TotalAmount" HeaderText="Total Amount" DataFormatString="{0:C}" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="dsOrders" runat="server"
                            ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\Project\VBBMS\VBBMS\App_Data\Database.mdf;Integrated Security=True"
                            SelectCommand="SELECT * FROM Orders" />
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="section">
                        <h2>Supplier Information</h2>
                        <asp:GridView ID="gvSuppliers" runat="server" AutoGenerateColumns="False" CssClass="table table-striped" DataSourceID="dsSuppliers">
                            <Columns>
                                <asp:BoundField DataField="SupplierId" HeaderText="Supplier ID" />
                                <asp:BoundField DataField="SupplierName" HeaderText="Supplier Name" />
                                <asp:BoundField DataField="ContactPerson" HeaderText="Contact Person" />
                                <asp:BoundField DataField="Email" HeaderText="Email" />
                                <asp:BoundField DataField="Phone" HeaderText="Phone" />
                                <asp:BoundField DataField="Address" HeaderText="Address" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="dsSuppliers" runat="server"
                            ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\Project\VBBMS\VBBMS\App_Data\Database.mdf;Integrated Security=True"
                            SelectCommand="SELECT * FROM Suppliers" />
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="section">
                        <h2>Stock Information</h2>
                        <asp:GridView ID="gvStock" runat="server" AutoGenerateColumns="False" CssClass="table table-striped" DataSourceID="dsStock">
                            <Columns>
                                <asp:BoundField DataField="BoxId" HeaderText="Box ID" />
                                <asp:BoundField DataField="BoxName" HeaderText="Box Name" />
                                <asp:BoundField DataField="Description" HeaderText="Description" />
                                <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="{0:C}" />
                                <asp:BoundField DataField="StockQuantity" HeaderText="Stock Quantity" />
                                <asp:BoundField DataField="SupplierID" HeaderText="Supplier ID" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="dsStock" runat="server"
                            ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\Project\VBBMS\VBBMS\App_Data\Database.mdf;Integrated Security=True"
                            SelectCommand="SELECT * FROM VegetableBoxes" />
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="section">
                        <h2>Contact Information</h2>
                        <asp:GridView ID="gvContacts" runat="server" AutoGenerateColumns="False" CssClass="table table-striped" DataSourceID="dsContacts">
                            <Columns>
                                <asp:BoundField DataField="ContactID" HeaderText="Contact ID" />
                                <asp:BoundField DataField="Name" HeaderText="Name" />
                                <asp:BoundField DataField="Email" HeaderText="Email" />
                                <asp:BoundField DataField="Message" HeaderText="Message" />
                                <asp:BoundField DataField="SubmissionDate" HeaderText="Submission Date" DataFormatString="{0:d}" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="dsContacts" runat="server"
                            ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\Project\VBBMS\VBBMS\App_Data\Database.mdf;Integrated Security=True"
                            SelectCommand="SELECT * FROM Contacts" />
                    </div>
                </div>
            </div>
        </form>
    </div>

</body>
</html>
