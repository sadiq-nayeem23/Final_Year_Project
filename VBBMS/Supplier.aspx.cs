using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Supplier : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindSuppliersData();
        }
    }
    protected void BindSuppliersData()
    {
        using (SqlConnection connection = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=E:\\Project\\VBBMS\\VBBMS\\App_Data\\Database.mdf;Integrated Security=True"))
        {
            SqlDataAdapter adapter = new SqlDataAdapter("SELECT * FROM Suppliers", connection);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            gvSuppliers.DataSource = dt;
            gvSuppliers.DataBind();
        }
    }
    protected void dvNewSupplier_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        if (e.Exception == null || e.AffectedRows > 0)
        {
            dvNewSupplier.ChangeMode(DetailsViewMode.Insert);
            BindSuppliersData();
        }
        else
        {
            e.ExceptionHandled = true;
        }
    }
    protected void gvSuppliers_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvSuppliers.EditIndex = e.NewEditIndex;
        BindSuppliersData();
    }
    protected void gvSuppliers_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvSuppliers.EditIndex = -1;
        BindSuppliersData();
    }
    protected void gvSuppliers_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int supplierId = Convert.ToInt32(gvSuppliers.DataKeys[e.RowIndex].Value);
        string supplierName = (e.NewValues["SupplierName"] ?? string.Empty).ToString();
        string contactPerson = (e.NewValues["ContactPerson"] ?? string.Empty).ToString();
        string email = (e.NewValues["Email"] ?? string.Empty).ToString();
        string phone = (e.NewValues["Phone"] ?? string.Empty).ToString();
        string address = (e.NewValues["Address"] ?? string.Empty).ToString();

        UpdateSupplier(supplierId, supplierName, contactPerson, email, phone, address);

        gvSuppliers.EditIndex = -1;
        BindSuppliersData();
    }
    protected void gvSuppliers_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int supplierId = Convert.ToInt32(gvSuppliers.DataKeys[e.RowIndex].Values["SupplierId"]);

        DeleteSupplier(supplierId);

        BindSuppliersData();
    }
    private void UpdateSupplier(int supplierId, string supplierName, string contactPerson, string email, string phone, string address)
    {
        using (SqlConnection connection = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=E:\\Project\\VBBMS\\VBBMS\\App_Data\\Database.mdf;Integrated Security=True"))
        {
            connection.Open();

            string updateQuery = "UPDATE Suppliers SET SupplierName = @SupplierName, ContactPerson = @ContactPerson, Email = @Email, Phone = @Phone, Address = @Address WHERE SupplierId = @SupplierId";

            using (SqlCommand cmd = new SqlCommand(updateQuery, connection))
            {
                cmd.Parameters.AddWithValue("@SupplierId", supplierId);
                cmd.Parameters.AddWithValue("@SupplierName", supplierName);
                cmd.Parameters.AddWithValue("@ContactPerson", contactPerson);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Phone", phone);
                cmd.Parameters.AddWithValue("@Address", address);

                cmd.ExecuteNonQuery();
            }
        }
    }
    private void DeleteSupplier(int supplierId)
    {
        using (SqlConnection connection = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=E:\\Project\\VBBMS\\VBBMS\\App_Data\\Database.mdf;Integrated Security=True"))
        {
            connection.Open();

            string deleteQuery = "DELETE FROM Suppliers WHERE SupplierId = @SupplierId";

            using (SqlCommand cmd = new SqlCommand(deleteQuery, connection))
            {
                cmd.Parameters.AddWithValue("@SupplierId", supplierId);
                cmd.ExecuteNonQuery();
            }
        }
    }
}