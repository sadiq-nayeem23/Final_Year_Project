<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ContactInfo.aspx.cs" Inherits="ContactInfo" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Information</title>
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
    <form runat="server">
        <div class="container mt-5">
            <h2>Contact Information</h2>
            <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="ContactID" HeaderText="ContactID" />
                    <asp:BoundField DataField="Name" HeaderText="Name" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="Message" HeaderText="Message" HtmlEncode="False" />
                    <asp:BoundField DataField="SubmissionDate" HeaderText="SubmissionDate" DataFormatString="{0:dd/MM/yyyy}" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
