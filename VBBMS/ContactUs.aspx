<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="ContactUs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Contact Us</title>
    <link rel="stylesheet" type="text/css" href="StyleSheet.css">
</head>
<body>
    <div class="navbar">
        <a class="active" href="Home.aspx">Home</a>
        <a href="AboutUs.aspx">About Us</a>
        <a href="ContactUs.aspx">Contact Us</a>
    </div>
    <div class="container">
        <h1>Contact Us</h1>
        <div>
            <form id="form1" runat="server">
                <p>If you have any questions or inquiries, please feel free to contact us using the form below:</p>
                <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
                <asp:TextBox ID="txtName" runat="server" placeholder="Your Name" CssClass="textbox"></asp:TextBox><br />
                <asp:TextBox ID="txtEmail" runat="server" placeholder="Your Email" CssClass="textbox"></asp:TextBox><br />
                <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="4" placeholder="Your Message" CssClass="textbox"></asp:TextBox><br />
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" CssClass="button" />
            </form>
        </div>
    </div>
</body>
</html>
