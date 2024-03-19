<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Thank You.aspx.cs" Inherits="Thank_You" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Thank You</title>
    <link rel="stylesheet" type="text/css" href="StyleSheet.css">
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align:center; padding-top:50px;">
            <h2>Thank you for your order!</h2>
            <p>Your order has been received and is being processed.</p>
            <asp:HyperLink ID="hlBackToHome" runat="server" NavigateUrl="Order.aspx" Text="Back to Home Page" />
            <!-- Alternatively, you can use a Button control to redirect users via server-side code -->
        </div>
    </form>
</body>
</html>
