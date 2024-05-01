using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CustomerInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindCustomersData();
        }
    }

    protected void BindCustomersData()
    {
        using (SqlConnection connection = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=E:\\Project\\VBBMS\\VBBMS\\App_Data\\Database.mdf;Integrated Security=True"))
        {
            SqlDataAdapter adapter = new SqlDataAdapter("SELECT * FROM Customers", connection);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            gvCustomers.DataSource = dt;
            gvCustomers.DataBind();
        }
    }

    protected void gvCustomers_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvCustomers.EditIndex = e.NewEditIndex;
        BindCustomersData();
    }

    protected void gvCustomers_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvCustomers.EditIndex = -1;
        BindCustomersData();
    }

    protected void gvCustomers_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int customerId = Convert.ToInt32(gvCustomers.DataKeys[e.RowIndex].Value);
        string firstName = (e.NewValues["First Name"] ?? string.Empty).ToString();
        string lastName = (e.NewValues["Last Name"] ?? string.Empty).ToString();
        string email = (e.NewValues["Email"] ?? string.Empty).ToString();
        string phone = (e.NewValues["Phone"] ?? string.Empty).ToString();
        string address = (e.NewValues["Address"] ?? string.Empty).ToString();
        string password = (e.NewValues["Password"] ?? string.Empty).ToString();

        UpdateCustomer(customerId, firstName, lastName, email, phone, address, password);

        gvCustomers.EditIndex = -1;
        BindCustomersData();
    }

    protected void gvCustomers_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int customerId = Convert.ToInt32(gvCustomers.DataKeys[e.RowIndex].Values["CustomerID"]);
        DeleteCustomer(customerId);
        BindCustomersData();
    }

    private void UpdateCustomer(int customerId, string firstName, string lastName, string email, string phone, string address, string password)
    {
        using (SqlConnection connection = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=E:\\Project\\VBBMS\\VBBMS\\App_Data\\Database.mdf;Integrated Security=True"))
        {
            connection.Open();

            string updateQuery = "UPDATE Customers SET [First Name] = @FirstName, [Last Name] = @LastName, Email = @Email, Phone = @Phone, Address = @Address, Password = @Password WHERE CustomerID = @CustomerID";

            using (SqlCommand cmd = new SqlCommand(updateQuery, connection))
            {
                cmd.Parameters.AddWithValue("@CustomerID", customerId);
                cmd.Parameters.AddWithValue("@FirstName", firstName);
                cmd.Parameters.AddWithValue("@LastName", lastName);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Phone", phone);
                cmd.Parameters.AddWithValue("@Address", address);
                cmd.Parameters.AddWithValue("@Password", password);

                cmd.ExecuteNonQuery();
            }
        }
    }

    private void DeleteCustomer(int customerId)
    {
        using (SqlConnection connection = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=E:\\Project\\VBBMS\\VBBMS\\App_Data\\Database.mdf;Integrated Security=True"))
        {
            connection.Open();

            string deleteQuery = "DELETE FROM Customers WHERE CustomerID = @CustomerID";

            using (SqlCommand cmd = new SqlCommand(deleteQuery, connection))
            {
                cmd.Parameters.AddWithValue("@CustomerID", customerId);
                cmd.ExecuteNonQuery();
            }
        }
    }
}