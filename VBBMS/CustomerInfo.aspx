<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CustomerInfo.aspx.cs" Inherits="CustomerInfo" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customers Page</title>
    <link rel="stylesheet" type="text/css" href="StyleSheet.css?v=2" />
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
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
        <h2>Customers Information</h2>
        <form id="form1" runat="server">
            <asp:GridView ID="gvCustomers" runat="server" CssClass="gridview" AutoGenerateColumns="False" DataKeyNames="CustomerID"
                OnRowEditing="gvCustomers_RowEditing"
                OnRowCancelingEdit="gvCustomers_RowCancelingEdit"
                OnRowUpdating="gvCustomers_RowUpdating"
                OnRowDeleting="gvCustomers_RowDeleting"
                GridLines="None" CellPadding="4">
                <Columns>
                    <asp:BoundField DataField="CustomerID" HeaderText="Customer ID" ReadOnly="true" SortExpression="CustomerID" />
                    <asp:BoundField DataField="First Name" HeaderText="First Name" SortExpression="First Name" />
                    <asp:BoundField DataField="Last Name" HeaderText="Last Name" SortExpression="Last Name" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" ButtonType="Button" />
                </Columns>
            </asp:GridView>
        </form>
    </div>
</body>
</html>
