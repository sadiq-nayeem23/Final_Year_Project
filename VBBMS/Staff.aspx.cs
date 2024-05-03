using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Staff : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindStaffData();
        }
    }
    protected void BindStaffData()
    {
        using (SqlConnection connection = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=E:\\Project\\VBBMS\\VBBMS\\App_Data\\Database.mdf;Integrated Security=True"))
        {
            SqlDataAdapter adapter = new SqlDataAdapter("SELECT * FROM Staff", connection);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            gvStaff.DataSource = dt;
            gvStaff.DataBind();
        }
    }
    protected void dvNewStaff_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        if (e.Exception == null || e.AffectedRows > 0)
        {
            dvNewStaff.ChangeMode(DetailsViewMode.Insert);
            BindStaffData();
        }
        else
        {
            e.ExceptionHandled = true;
        }
    }
    protected void gvStaff_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvStaff.EditIndex = e.NewEditIndex;
        BindStaffData();
    }
    protected void gvStaff_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvStaff.EditIndex = -1;
        BindStaffData();
    }
    protected void gvStaff_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int staffId = Convert.ToInt32(gvStaff.DataKeys[e.RowIndex].Value);
        string firstName = (e.NewValues["First Name"] ?? string.Empty).ToString();
        string lastName = (e.NewValues["Last Name"] ?? string.Empty).ToString();
        string email = (e.NewValues["Email"] ?? string.Empty).ToString();
        string phone = (e.NewValues["Phone"] ?? string.Empty).ToString();
        string address = (e.NewValues["Address"] ?? string.Empty).ToString();

        UpdateStaff(staffId, firstName, lastName, email, phone, address);

        gvStaff.EditIndex = -1;
        BindStaffData();
    }
    protected void gvStaff_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int staffId = Convert.ToInt32(gvStaff.DataKeys[e.RowIndex].Values["StaffID"]);

        DeleteStaff(staffId);

        BindStaffData();
    }
    private void UpdateStaff(int staffId, string firstName, string lastName, string email, string phone, string address)
    {
        using (SqlConnection connection = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=E:\\Project\\VBBMS\\VBBMS\\App_Data\\Database.mdf;Integrated Security=True"))
        {
            connection.Open();

            string updateQuery = "UPDATE Staff SET [First Name] = @FirstName, [Last Name] = @LastName, Email = @Email, Phone = @Phone, Address = @Address WHERE StaffID = @StaffID";

            using (SqlCommand cmd = new SqlCommand(updateQuery, connection))
            {
                cmd.Parameters.AddWithValue("@StaffID", staffId);
                cmd.Parameters.AddWithValue("@FirstName", firstName);
                cmd.Parameters.AddWithValue("@LastName", lastName);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Phone", phone);
                cmd.Parameters.AddWithValue("@Address", address);

                cmd.ExecuteNonQuery();
            }
        }
    }
    private void DeleteStaff(int staffId)
    {
        using (SqlConnection connection = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=E:\\Project\\VBBMS\\VBBMS\\App_Data\\Database.mdf;Integrated Security=True"))
        {
            connection.Open();

            string deleteQuery = "DELETE FROM Staff WHERE StaffID = @StaffID";

            using (SqlCommand cmd = new SqlCommand(deleteQuery, connection))
            {
                cmd.Parameters.AddWithValue("@StaffID", staffId);
                cmd.ExecuteNonQuery();
            }
        }
    }
}