using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Customer_Signup : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSignUp_Click(object sender, EventArgs e)
    {
        // Retrieve user input
        string firstName = txtFirstName.Text;
        string lastName = txtLastName.Text;
        string email = txtEmail.Text;
        string phone = txtPhone.Text;
        string address = txtAddress.Text;
        string password = txtPassword.Text;

        // Insert into the Customers table (Replace connection string with your actual connection string)
        string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=E:\\Project\\VBBMS\\VBBMS\\App_Data\\Database.mdf;Integrated Security=True";
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string insertQuery = "INSERT INTO Customers ([First Name], [Last Name], Email, Phone, Address, Password) " +
                                 "VALUES (@FirstName, @LastName, @Email, @Phone, @Address, @Password)";

            SqlCommand cmd = new SqlCommand(insertQuery, connection);
            cmd.Parameters.AddWithValue("@FirstName", firstName);
            cmd.Parameters.AddWithValue("@LastName", lastName);
            cmd.Parameters.AddWithValue("@Email", email);
            cmd.Parameters.AddWithValue("@Phone", phone);
            cmd.Parameters.AddWithValue("@Address", address);
            cmd.Parameters.AddWithValue("@Password", password);

            connection.Open();
            int rowsAffected = cmd.ExecuteNonQuery();
            connection.Close();

            if (rowsAffected > 0)
            {
                lblMessage.Text = "Sign up successful. You can now log in.";
            }
            else
            {
                lblMessage.Text = "Error signing up. Please try again.";
            }
        }
    }
}