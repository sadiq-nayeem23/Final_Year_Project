using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ContactUs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string name = txtName.Text.Trim();
        string email = txtEmail.Text.Trim();
        string message = txtMessage.Text.Trim();

        if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(email) || string.IsNullOrEmpty(message))
        {
            lblMessage.Text = "Please fill in all fields.";
            return;
        }

        string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=E:\\Project\\VBBMS\\VBBMS\\App_Data\\Database.mdf;Integrated Security=True"; // Update with your connection string
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string insertQuery = "INSERT INTO Contacts (Name, Email, Message, SubmissionDate) VALUES (@Name, @Email, @Message, @SubmissionDate)";
            SqlCommand command = new SqlCommand(insertQuery, connection);
            command.Parameters.AddWithValue("@Name", name);
            command.Parameters.AddWithValue("@Email", email);
            command.Parameters.AddWithValue("@Message", message);
            command.Parameters.AddWithValue("@SubmissionDate", DateTime.Now);

            try
            {
                connection.Open();
                command.ExecuteNonQuery();
                lblMessage.Text = "Your message has been submitted successfully!";
                lblMessage.CssClass = "success";
                ClearForm();
            }
            catch (Exception ex)
            {
                lblMessage.Text = "An error occurred while submitting your message. Please try again later.";
                lblMessage.CssClass = "error";
                Console.WriteLine(ex.ToString());
            }
        }
    }
    private void ClearForm()
    {
        txtName.Text = "";
        txtEmail.Text = "";
        txtMessage.Text = "";
    }
}