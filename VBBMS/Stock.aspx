<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Stock.aspx.cs" Inherits="Stock" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Stock Managment</title>
    <link rel="stylesheet" type="text/css" href="StyleSheet.css?v=2"/>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <div class="navbar bg-light">
        <a class="navbar-brand" href="Admin-Dashboard.aspx">Admin Dashboard</a>
        <a class="navbar-brand" href="Supplier.aspx">Suppliers</a>
        <a class="navbar-brand" href="OrderDetails.aspx">Order Details</a>
        <a class="navbar-brand" href="Stock.aspx">Stock</a>
        <a class="nav-link" href="Logout.aspx">Logout</a>
    </div>
    <div class="container mt-3">
        <h2>Vegetable Boxes Stock Management</h2>
        <form id="form1" runat="server">
        <asp:GridView ID="gvVegetableBoxes" runat="server" CssClass="table table-hover" AutoGenerateColumns="False"
            DataKeyNames="BoxId" DataSourceID="SqlDataSource1"
            OnRowEditing="gvVegetableBoxes_RowEditing" OnRowDeleting="gvVegetableBoxes_RowDeleting" OnRowUpdating="gvVegetableBoxes_RowUpdating"
            OnRowCancelingEdit="gvVegetableBoxes_RowCancelingEdit">
            <Columns>
                <asp:BoundField DataField="BoxId" HeaderText="Box ID" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="BoxName" HeaderText="Box Name" />
                <asp:BoundField DataField="Description" HeaderText="Description" />
                <asp:TemplateField HeaderText="Price">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Eval("Price", "{0:C}") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtPrice" runat="server" Text='<%# Bind("Price") %>' CssClass="form-control"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="StockQuantity" HeaderText="Stock Quantity" />
                <asp:BoundField DataField="SupplierID" HeaderText="Supplier ID" />
                <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" ButtonType="Button" />
            </Columns>
        </asp:GridView>

        <asp:DetailsView ID="dvVegetableBox" runat="server" CssClass="table table-bordered" Height="50px" Width="125px"
            AutoGenerateRows="False" DefaultMode="Insert" DataSourceID="SqlDataSource1">
            <Fields>
                <asp:BoundField DataField="BoxName" HeaderText="Box Name" />
                <asp:BoundField DataField="Description" HeaderText="Description" />
                <asp:BoundField DataField="Price" HeaderText="Price" />
                <asp:BoundField DataField="StockQuantity" HeaderText="Stock Quantity" />
                <asp:BoundField DataField="SupplierID" HeaderText="Supplier ID" />
                <asp:CommandField ShowInsertButton="True" InsertText="Add New Box" />
            </Fields>
        </asp:DetailsView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\Project\VBBMS\VBBMS\App_Data\Database.mdf;Integrated Security=True"
            SelectCommand="SELECT * FROM [VegetableBoxes]"
            InsertCommand="INSERT INTO [VegetableBoxes] ([BoxName], [Description], [Price], [StockQuantity], [SupplierID]) VALUES (@BoxName, @Description, @Price, @StockQuantity, @SupplierID)"
            UpdateCommand="UPDATE [VegetableBoxes] SET [BoxName] = @BoxName, [Description] = @Description, [Price] = @Price, [StockQuantity] = @StockQuantity, [SupplierID] = @SupplierID WHERE [BoxId] = @BoxId"
            DeleteCommand="DELETE FROM [VegetableBoxes] WHERE [BoxId] = @BoxId">
            <InsertParameters>
                <asp:Parameter Name="BoxName" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Price" Type="Decimal" />
                <asp:Parameter Name="StockQuantity" Type="Int32" />
                <asp:Parameter Name="SupplierID" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="BoxId" Type="Int32" />
            </UpdateParameters>
            <DeleteParameters>
                <asp:Parameter Name="BoxId" Type="Int32" />
            </DeleteParameters>
        </asp:SqlDataSource>
        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
