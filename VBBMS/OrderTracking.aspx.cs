using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class OrderTracking : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void TrackButton_Click(object sender, EventArgs e)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT OrderId, CustomerID, OrderDate, DeliveryDate, TotalAmount, Status FROM Orders WHERE OrderId = @OrderId", con))
            {
                cmd.Parameters.AddWithValue("@OrderId", OrderId.Text.Trim());
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    ResultLabel.Text = $"Order ID: {reader["OrderId"]}, Customer ID: {reader["CustomerID"]}, Order Date: {reader["OrderDate"]}, Delivery Date: {reader["DeliveryDate"]}, Total Amount: {reader["TotalAmount"]}, Status: {reader["Status"]}";
                    ResultLabel.CssClass += " alert-success";
                }
                else
                {
                    ResultLabel.Text = "Order not found.";
                    ResultLabel.CssClass += " alert-danger";
                }
                ResultLabel.Visible = true;
                reader.Close();
                con.Close();
            }
        }
    }
}