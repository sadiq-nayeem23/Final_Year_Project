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
                if (reader.HasRows)
                {
                    ResultsLiteral.Text = "";
                    while (reader.Read())
                    {
                        ResultsLiteral.Text += $"<tr><td>{reader["OrderId"]}</td><td>{reader["CustomerID"]}</td><td>{Convert.ToDateTime(reader["OrderDate"]).ToShortDateString()}</td><td>{Convert.ToDateTime(reader["DeliveryDate"]).ToShortDateString()}</td><td>${reader["TotalAmount"]}</td><td>{reader["Status"]}</td></tr>";
                    }
                    ResultsPanel.Visible = true;
                }
                else
                {
                    ResultsPanel.Visible = false;
                }
                reader.Close();
                con.Close();
            }
        }
    }
}