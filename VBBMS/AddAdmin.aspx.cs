using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddAdmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void SubmitButton_Click(object sender, EventArgs e)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            string sql = "INSERT INTO dbo.Admin (AdminID, Password, Name, ContactNo, Email) VALUES (@AdminID, @Password, @Name, @ContactNo, @Email)";
            using (SqlCommand cmd = new SqlCommand(sql, conn))
            {
                cmd.Parameters.AddWithValue("@AdminID", AdminID.Text);
                cmd.Parameters.AddWithValue("@Password", Password.Text);
                cmd.Parameters.AddWithValue("@Name", Name.Text);
                cmd.Parameters.AddWithValue("@ContactNo", ContactNo.Text);
                cmd.Parameters.AddWithValue("@Email", Email.Text);

                conn.Open();
                int result = cmd.ExecuteNonQuery();
                // Check Error
                if (result < 0)
                    Console.WriteLine("Error inserting data into Database!");
            }
        }
    }
}