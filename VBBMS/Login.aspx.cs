using System;
using System.Data.SqlClient;
using System.Web.UI;

public partial class Login : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    private string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=E:\\Project\\VBBMS\\VBBMS\\App_Data\\Database.mdf;Integrated Security=True";

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string username = txtUsername.Text.Trim();
        string password = txtPassword.Text.Trim();

        if (AuthenticateCustomer(username, password))
        {
            // Redirect customers to the ordering page
            Response.Redirect("Home.aspx");
        }
        else if (AuthenticateAdmin(username, password))
        {
            // Redirect admins to the dashboard
            Response.Redirect("Admin-Dashboard.aspx");
        }
        else
        {
            lblMessage.Text = "Invalid username or password";
        }
    }

    private bool AuthenticateCustomer(string email, string password)
    {
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();
            string query = "SELECT CustomerID FROM Customers WHERE Email = @Email AND Password = @Password";
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@Email", email);
                command.Parameters.AddWithValue("@Password", password);

                object result = command.ExecuteScalar();
                if (result != null)
                {
                    Session["UserID"] = result;  // Store CustomerID in session
                    Session["UserRole"] = "Customer";  // Indicate role
                    return true;
                }
                return false;
            }
        }
    }

    private bool AuthenticateAdmin(string adminID, string password)
    {
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();
            string query = "SELECT AdminID FROM Admin WHERE AdminID = @AdminID AND Password = @Password";
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@AdminID", adminID);
                command.Parameters.AddWithValue("@Password", password);

                object result = command.ExecuteScalar();
                if (result != null)
                {
                    Session["AdminID"] = result;  // Store AdminID in session
                    Session["UserRole"] = "Admin";  // Indicate role
                    return true;
                }
                return false;
            }
        }
    }
}
