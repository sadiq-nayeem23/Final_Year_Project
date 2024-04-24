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
            if (Session["CartOrderID"] != null)
            {
                LoadOrderDetails();
            }
            else
            {
                // Optionally handle the scenario where no order ID is present
                lblStatus.Text = "No valid order found to display.";
            }
        }
    }

    private void LoadOrderDetails()
    {
        int orderId = Convert.ToInt32(Session["CartOrderID"]);
        string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM Orders WHERE OrderID = @OrderID", conn);
            cmd.Parameters.AddWithValue("@OrderID", orderId);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dtOrder = new DataTable();
            da.Fill(dtOrder);

            if (dtOrder.Rows.Count > 0)
            {
                lblOrderDate.Text = "Order Date: " + Convert.ToDateTime(dtOrder.Rows[0]["OrderDate"]).ToString("yyyy-MM-dd");
                lblTotalAmount.Text = "Total Amount: $" + Convert.ToDecimal(dtOrder.Rows[0]["TotalAmount"]).ToString("N2");
                lblStatus.Text = "Order Status: " + dtOrder.Rows[0]["Status"].ToString().Trim();

                // Load Order Details
                SqlCommand cmdDetails = new SqlCommand("SELECT OD.*, VB.BoxName FROM OrderDetails OD INNER JOIN VegetableBoxes VB ON OD.BoxID = VB.BoxId WHERE OrderID = @OrderID", conn);
                cmdDetails.Parameters.AddWithValue("@OrderID", orderId);

                SqlDataAdapter daDetails = new SqlDataAdapter(cmdDetails);
                DataTable dtDetails = new DataTable();
                daDetails.Fill(dtDetails);

                gvOrderDetails.DataSource = dtDetails;
                gvOrderDetails.DataBind();
            }
            else
            {
                lblStatus.Text = "Order details could not be loaded.";
            }
        }
    }

    protected void btnSubmitOrder_Click(object sender, EventArgs e)
    {
        // Clear cart after submitting order
        Session["ShoppingCart"] = null;
        Session["CartOrderID"] = null; // Also clear the order ID from session
        Response.Redirect("ThankYou.aspx"); // Redirect to a thank you page
    }
}
