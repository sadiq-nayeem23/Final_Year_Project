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

            if (Request.QueryString["customerId"] != null)
            {
                int customerId;
                if (int.TryParse(Request.QueryString["customerId"], out customerId))
                {
                    lblCustomerId.Text = $"Customer ID: {customerId}";
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
            if (Request.QueryString["boxId"] != null && Request.QueryString["boxName"] != null && Request.QueryString["quantity"] != null)
            {
                string boxId = Request.QueryString["boxId"];
                string boxName = Request.QueryString["boxName"];
                string quantity = Request.QueryString["quantity"];

                lblOrderSummary.Text += $"Box ID: {boxId}, Box Name: {boxName}, Quantity: {quantity}<br/>";
            }
        }
    }
    protected void submitOrder_Click(object sender, EventArgs e)
    {
        string boxId = Request.QueryString["boxId"];
        int customerId = Convert.ToInt32(Request.QueryString["customerId"]);
        string quantity = Request.QueryString["quantity"];
        decimal totalAmount = Convert.ToDecimal(Request.QueryString["totalAmount"]);

        string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            try
            {
                con.Open();

                string orderInsertQuery = "INSERT INTO Orders (CustomerID, OrderDate, DeliveryDate, BoxID, Quantity, TotalAmount) " +
                                          "VALUES (@CustomerID, @OrderDate, @DeliveryDate, @BoxID, @Quantity, @TotalAmount); " +
                                          "SELECT SCOPE_IDENTITY();";

                SqlCommand cmd = new SqlCommand(orderInsertQuery, con);
                cmd.Parameters.AddWithValue("@CustomerID", customerId);
                cmd.Parameters.AddWithValue("@OrderDate", DateTime.Now);
                cmd.Parameters.AddWithValue("@DeliveryDate", DateTime.Now.AddDays(7));
                cmd.Parameters.AddWithValue("@BoxID", boxId);
                cmd.Parameters.AddWithValue("@Quantity", quantity);
                cmd.Parameters.AddWithValue("@TotalAmount", totalAmount);

                object result = cmd.ExecuteScalar();
                if (result != null)
                {
                    int orderId = Convert.ToInt32(result);
                    Session["LastOrderId"] = orderId;
                }
                else
                {
                    throw new Exception("Order ID was not generated.");
                }
            }
            catch (Exception ex)
            {
                // Handle the exception
                // Redirect to an error page or display the error on the current page
                Response.Write("Error occurred: " + ex.Message);
            }
        }

        // Redirect to thank you page
        Response.Redirect("Thank You.aspx");
    }
}