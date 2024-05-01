<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddAdmin.aspx.cs" Inherits="AddAdmin" %>

<!DOCTYPE html>
<html>
<head>
    <title>Add New Admin</title>
    <link rel="stylesheet" type="text/css" href="StyleSheet.css?v=2" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
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
</style>
</head>
<body>
    <div class="navbar bg-light">
    <a href="Admin-Dashboard.aspx">Admin Dashboard</a>
    <a href="Login.aspx">Logout</a>
</div>
        <div class="col-md-6 mt-5">
            <div class="card">
                <div class="card-header">
                    <h3 class="text-center">Add New Admin</h3>
                </div>
                <div class="card-body">
                    <form id="form1" runat="server">
                        <div class="form-group">
                            <label for="AdminID">Admin ID:</label>
                            <asp:TextBox ID="AdminID" CssClass="form-control" runat="server" MaxLength="8" />
                        </div>
                        <div class="form-group">
                            <label for="Password">Password:</label>
                            <asp:TextBox ID="Password" CssClass="form-control" runat="server" TextMode="Password" MaxLength="50" />
                        </div>
                        <div class="form-group">
                            <label for="Name">Name:</label>
                            <asp:TextBox ID="Name" CssClass="form-control" runat="server" MaxLength="30" />
                        </div>
                        <div class="form-group">
                            <label for="ContactNo">Contact Number:</label>
                            <asp:TextBox ID="ContactNo" CssClass="form-control" runat="server" MaxLength="11" />
                        </div>
                        <div class="form-group">
                            <label for="Email">Email:</label>
                            <asp:TextBox ID="Email" CssClass="form-control" runat="server" MaxLength="50" />
                        </div>
                        <div class="form-group">
                            <asp:Button ID="SubmitButton" CssClass="btn btn-primary" runat="server" Text="Add Admin" OnClick="SubmitButton_Click" />
                        </div>
                    </form>
                </div>
            </div>
        </div>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
