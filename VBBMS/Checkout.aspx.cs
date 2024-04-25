using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web.UI;

public partial class Checkout : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["totalAmount"] != null)
            {
                decimal totalAmount;
                if (Decimal.TryParse(Request.QueryString["totalAmount"], out totalAmount))
                {
                    lblTotalAmount.Text = $"Total Amount: {totalAmount:C}";
                }
                else
                {
                    // Handle invalid input
                }
            }
            else
            {
                // Handle missing query parameter
            }

            // Display order summary
            if (Request.QueryString["boxId"] != null && Request.QueryString["boxName"] != null &&
                Request.QueryString["price"] != null && Request.QueryString["quantity"] != null)
            {
                string boxId = Request.QueryString["boxId"];
                string boxName = Request.QueryString["boxName"];
                string price = Request.QueryString["price"];
                string quantity = Request.QueryString["quantity"];

                lblOrderSummary.Text += $"Box ID: {boxId}, Box Name: {boxName}, Price: {price}, Quantity: {quantity}<br/>";
            }
        }
    }



}
