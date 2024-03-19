<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Supplier.aspx.cs" Inherits="Supplier" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Suppliers Page</title>
    <!-- Include any necessary styles or scripts -->
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Suppliers Information</h2>

            <!-- Display Suppliers -->
            <asp:GridView ID="gvSuppliers" runat="server" AutoGenerateColumns="False" DataKeyNames="SupplierId">
                <Columns>
                    <asp:BoundField DataField="SupplierId" HeaderText="Supplier ID" ReadOnly="true" SortExpression="SupplierId" />
                    <asp:BoundField DataField="SupplierName" HeaderText="Supplier Name" SortExpression="SupplierName" />
                    <asp:BoundField DataField="ContactPerson" HeaderText="Contact Person" SortExpression="ContactPerson" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:CommandField ShowInsertButton="True" ShowEditButton="True" ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>

            <!-- Add New Supplier -->
            <h2>Add New Supplier</h2>
            <asp:DetailsView ID="dvNewSupplier" runat="server" AutoGenerateRows="False" DefaultMode="Insert"
                OnItemInserted="dvNewSupplier_ItemInserted" DataSourceID="dsSuppliers">
                <Fields>
                    <asp:BoundField DataField="SupplierId" HeaderText="Supplier ID" ReadOnly="true" SortExpression="SupplierId" />
                    <asp:BoundField DataField="SupplierName" HeaderText="Supplier Name" SortExpression="SupplierName" />
                    <asp:BoundField DataField="ContactPerson" HeaderText="Contact Person" SortExpression="ContactPerson" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:CommandField ShowInsertButton="True" ShowEditButton="True" ShowDeleteButton="True" />
                </Fields>
            </asp:DetailsView>

            <!-- Data Source -->
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
