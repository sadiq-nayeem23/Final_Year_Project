<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Supplier.aspx.cs" Inherits="Supplier" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Suppliers Page</title>
    <link rel="stylesheet" type="text/css" href="StyleSheet.css?v=2" />
    <style>
        h2 {
            color: white;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <a href="Admin-Dashboard.aspx">Admin Dashboard</a>
        <a class="active" href="Supplier.aspx">Suppliers</a>
        <a href="OrderDetails.aspx">Order Details</a>
        <a href="Stock.aspx">Stock</a>
        <a href="Login.aspx">Logout</a>
    </div>
    <form id="form1" runat="server">
        <div>
            <h2>Suppliers Information</h2>
            <asp:GridView ID="gvSuppliers" runat="server" CssClass="gridview" AutoGenerateColumns="False" DataKeyNames="SupplierId"
                OnRowEditing="gvSuppliers_RowEditing"
                OnRowCancelingEdit="gvSuppliers_RowCancelingEdit"
                OnRowUpdating="gvSuppliers_RowUpdating"
                OnRowDeleting="gvSuppliers_RowDeleting">
                <Columns>
                    <asp:BoundField DataField="SupplierId" HeaderText="Supplier ID" ReadOnly="true" SortExpression="SupplierId" />
                    <asp:BoundField DataField="SupplierName" HeaderText="Supplier Name" SortExpression="SupplierName" />
                    <asp:BoundField DataField="ContactPerson" HeaderText="Contact Person" SortExpression="ContactPerson" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>

            <h2>Add New Supplier</h2>
            <asp:DetailsView ID="dvNewSupplier" runat="server" AutoGenerateRows="False" DefaultMode="Insert"
                OnItemInserted="dvNewSupplier_ItemInserted" DataSourceID="dsSuppliers" CssClass="details-view">
                <Fields>
                    <asp:BoundField DataField="SupplierId" HeaderText="Supplier ID" ReadOnly="true" SortExpression="SupplierId" />
                    <asp:BoundField DataField="SupplierName" HeaderText="Supplier Name" SortExpression="SupplierName" />
                    <asp:BoundField DataField="ContactPerson" HeaderText="Contact Person" SortExpression="ContactPerson" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:CommandField ShowInsertButton="True" />
                </Fields>
            </asp:DetailsView>

            <asp:SqlDataSource ID="dsSuppliers" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\Project\VBBMS\VBBMS\App_Data\Database.mdf;Integrated Security=True"
                SelectCommand="SELECT * FROM Suppliers" InsertCommand="INSERT INTO Suppliers (SupplierName, ContactPerson, Email, Phone, Address) VALUES (@SupplierName, @ContactPerson, @Email, @Phone, @Address)"
                UpdateCommand="UPDATE Suppliers SET SupplierName = @SupplierName, ContactPerson = @ContactPerson, Email = @Email, Phone = @Phone, Address = @Address WHERE SupplierId = @SupplierId"
                DeleteCommand="DELETE FROM Suppliers WHERE SupplierId = @SupplierId">
                <InsertParameters>
                    <asp:Parameter Name="SupplierName" Type="String" />
                    <asp:Parameter Name="ContactPerson" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="Phone" Type="String" />
                    <asp:Parameter Name="Address" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="SupplierName" Type="String" />
                    <asp:Parameter Name="ContactPerson" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="Phone" Type="String" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="SupplierId" Type="Int32" />
                </UpdateParameters>
                <DeleteParameters>
                    <asp:Parameter Name="SupplierId" Type="Int32" />
                </DeleteParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
