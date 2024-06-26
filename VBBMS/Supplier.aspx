﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Supplier.aspx.cs" Inherits="Supplier" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Suppliers Page</title>
    <link rel="stylesheet" type="text/css" href="StyleSheet.css?v=2" />
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background-image: url('Assets/freshvegetables.jpg');
            background-size: cover;
            background-position: center;
            color: black;
            background-attachment: fixed;
        }

        .navbar {
            margin-bottom: 20px;
            background-color: rgba(255, 255, 255, 0.5);
        }

            .navbar a {
                text-decoration: none;
                color: black;
                background-color: lightblue;
                padding: 10px 20px;
                border-radius: 5px;
                margin-right: 10px;
                transition: background-color 0.3s ease;
            }

                .navbar a:hover {
                    background-color: deepskyblue;
                    color: white;
                }

        .gridview .GridViewEditRow {
            max-width: 100%;
            overflow: hidden;
        }

        input[type=text], input[type=email], input[type=phone] {
            width: 100%;
            overflow: hidden;
        }
    </style>
</head>
<body>
    <div class="navbar bg-light">
        <a href="Admin-Dashboard.aspx">Admin Dashboard</a>
        <a href="Login.aspx">Logout</a>
    </div>
    <div class="container mt-3">
        <h2>Suppliers Information</h2>
        <form id="form1" runat="server">
            <asp:GridView ID="gvSuppliers" runat="server" CssClass="gridview" AutoGenerateColumns="False" DataKeyNames="SupplierId"
                OnRowEditing="gvSuppliers_RowEditing"
                OnRowCancelingEdit="gvSuppliers_RowCancelingEdit"
                OnRowUpdating="gvSuppliers_RowUpdating"
                OnRowDeleting="gvSuppliers_RowDeleting"
                GridLines="None" CellPadding="4">
                <Columns>
                    <asp:BoundField DataField="SupplierId" HeaderText="Supplier ID" ReadOnly="true" SortExpression="SupplierId" />
                    <asp:BoundField DataField="SupplierName" HeaderText="Supplier Name" SortExpression="SupplierName" />
                    <asp:BoundField DataField="ContactPerson" HeaderText="Contact Person" SortExpression="ContactPerson" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" ButtonType="Button" />
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
                    <asp:CommandField ShowInsertButton="True" ButtonType="Button" />
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
        </form>
    </div>
</body>
</html>
