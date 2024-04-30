<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Staff.aspx.cs" Inherits="Staff" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Staff Page</title>
    <link rel="stylesheet" type="text/css" href="StyleSheet.css?v=2" />
    <style>
        h2 {
            color: white;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="navbar">
                <a href="Admin-Dashboard.aspx">Admin Dashboard</a>
                <a href="OrderDetails.aspx">Order Details</a>
                <a href="Stock.aspx">Stock</a>
                <a href="Staff.aspx">Staff</a>
                <a href="Supplier.aspx">Suppliers</a>
                <a href="Login.aspx">Logout</a>
            </div>
            <h2>Staff Information</h2>
            <asp:GridView ID="gvStaff" runat="server" CssClass="gridview" AutoGenerateColumns="False" DataKeyNames="StaffID"
                OnRowEditing="gvStaff_RowEditing"
                OnRowCancelingEdit="gvStaff_RowCancelingEdit"
                OnRowUpdating="gvStaff_RowUpdating"
                OnRowDeleting="gvStaff_RowDeleting">
                <Columns>
                    <asp:BoundField DataField="StaffID" HeaderText="Staff ID" ReadOnly="true" SortExpression="StaffID" />
                    <asp:BoundField DataField="First Name" HeaderText="First Name" SortExpression="First Name" />
                    <asp:BoundField DataField="Last Name" HeaderText="Last Name" SortExpression="Last Name" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>

            <h2>Add New Staff</h2>
            <asp:DetailsView ID="dvNewStaff" runat="server" AutoGenerateRows="False" DefaultMode="Insert"
                OnItemInserted="dvNewStaff_ItemInserted" DataSourceID="dsStaff" CssClass="details-view">
                <Fields>
                    <asp:BoundField DataField="First Name" HeaderText="First Name" SortExpression="First Name" />
                    <asp:BoundField DataField="Last Name" HeaderText="Last Name" SortExpression="Last Name" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:CommandField ShowInsertButton="True" />
                </Fields>
            </asp:DetailsView>

            <asp:SqlDataSource ID="dsStaff" runat="server" ConnectionString="Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=E:\\Project\\VBBMS\\VBBMS\\App_Data\\Database.mdf;Integrated Security=True"
                SelectCommand="SELECT * FROM Staff" InsertCommand="INSERT INTO Staff (First Name, Last Name, Email, Phone, Address) VALUES (@FirstName, @LastName, @Email, @Phone, @Address)"
                UpdateCommand="UPDATE Staff SET First Name = @FirstName, Last Name = @LastName, Email = @Email, Phone = @Phone, Address = @Address WHERE StaffID = @StaffID"
                DeleteCommand="DELETE FROM Staff WHERE StaffID = @StaffID">
                <InsertParameters>
                    <asp:Parameter Name="FirstName" Type="String" />
                    <asp:Parameter Name="LastName" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="Phone" Type="String" />
                    <asp:Parameter Name="Address" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="FirstName" Type="String" />
                    <asp:Parameter Name="LastName" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="Phone" Type="String" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="StaffID" Type="Int32" />
                </UpdateParameters>
                <DeleteParameters>
                    <asp:Parameter Name="StaffID" Type="Int32" />
                </DeleteParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
