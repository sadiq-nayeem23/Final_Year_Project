using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string AdminID = txtAdminID.Text;
        string password = txtPassword.Text;

        
        string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=E:\\Project\\VBBMS\\VBBMS\\App_Data\\Database.mdf;Integrated Security=True";

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            
            string query = "SELECT COUNT(*) FROM Admin WHERE AdminID = @AdminID AND Password = @Password";

            using (SqlCommand cmd = new SqlCommand(query, connection))
            {
                cmd.Parameters.AddWithValue("@AdminID", AdminID);
                cmd.Parameters.AddWithValue("@Password", password);

                connection.Open();
                int count = Convert.ToInt32(cmd.ExecuteScalar());
                connection.Close();

                if (count > 0)
                {
                    Response.Redirect("Admin-Dashboard.aspx");
                }
                else
                {
                    lblMessage.Text = "Invalid AdminID or Password. Please try again.";
                }
            }
        }
    }
}