using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    private string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=E:\\Project\\VBBMS\\VBBMS\\App_Data\\Database.mdf;Integrated Security=True";

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string username = txtUsername.Text;
        string password = txtPassword.Text;

        // Check customer table
        if (IsCustomer(username, password))
        {
            // Redirect to customer ordering page
            Response.Redirect("Order.aspx");
        }
        // Check admin table
        else if (IsAdmin(username, password))
        {
            // Redirect to admin panel page
            Response.Redirect("Admin-Dashboard.aspx");
        }
        else
        {
            lblMessage.Text = "Invalid username or password";
        }
    }

    private bool IsCustomer(string email, string password)
    {
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();
            string query = "SELECT COUNT(*) FROM Customers WHERE Email = @Email AND Password = @Password";
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@Email", email);
                command.Parameters.AddWithValue("@Password", password);

                int count = Convert.ToInt32(command.ExecuteScalar());
                return count > 0;
            }
        }
    }

    private bool IsAdmin(string adminID, string password)
    {
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();
            string query = "SELECT COUNT(*) FROM Admin WHERE AdminID = @AdminID AND Password = @Password";
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@AdminID", adminID);
                command.Parameters.AddWithValue("@Password", password);

                int count = Convert.ToInt32(command.ExecuteScalar());
                return count > 0;
            }
        }

    }
}