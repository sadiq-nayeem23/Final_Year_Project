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
            // Bind Suppliers data on initial load
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
        // Check if the insertion was successful
        if (e.Exception == null || e.AffectedRows > 0)
        {
            // Display a success message (you can customize this part)
            

            // Reset the DetailsView to the default mode
            dvNewSupplier.ChangeMode(DetailsViewMode.Insert);

            // Refresh the GridView to show the new data
            BindSuppliersData();
        }
        else
        {
            // Display an error message
            

            // Set the ExceptionHandled property to true to prevent the exception from being propagated
            e.ExceptionHandled = true;
        }
    }

    protected void gvSuppliers_RowEditing(object sender, GridViewEditEventArgs e)
    {
        // Set the GridView's EditIndex to the index of the row being edited
        gvSuppliers.EditIndex = e.NewEditIndex;
        BindSuppliersData();
    }

    protected void gvSuppliers_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        // Cancel the editing mode
        gvSuppliers.EditIndex = -1;
        BindSuppliersData();
    }

    protected void gvSuppliers_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        // Retrieve the values from the GridView row being updated
        int supplierId = Convert.ToInt32(gvSuppliers.DataKeys[e.RowIndex].Value);
        string supplierName = (e.NewValues["SupplierName"] ?? string.Empty).ToString();
        string contactPerson = (e.NewValues["ContactPerson"] ?? string.Empty).ToString();
        string email = (e.NewValues["Email"] ?? string.Empty).ToString();
        string phone = (e.NewValues["Phone"] ?? string.Empty).ToString();
        string address = (e.NewValues["Address"] ?? string.Empty).ToString();

        // Implement the database update operation here
        UpdateSupplier(supplierId, supplierName, contactPerson, email, phone, address);

        // Reset the edit index and rebind the GridView to show the updated data
        gvSuppliers.EditIndex = -1;
        BindSuppliersData();
    }

    protected void gvSuppliers_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        // Delete the row
        int supplierId = Convert.ToInt32(gvSuppliers.DataKeys[e.RowIndex].Values["SupplierId"]);

        // Placeholder method for deleting a supplier from the database
        DeleteSupplier(supplierId);

        BindSuppliersData();
    }

    // Placeholder method for updating a supplier in the database
    private void UpdateSupplier(int supplierId, string supplierName, string contactPerson, string email, string phone, string address)
    {
        // Implement your database update logic here
        // Example: Call a stored procedure or execute a SQL command to update the supplier
        // SqlConnection, SqlCommand, etc.
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

    // Placeholder method for deleting a supplier from the database
    private void DeleteSupplier(int supplierId)
    {
        // Implement your database delete logic here
        // Example: Call a stored procedure or execute a SQL command to delete the supplier
        // SqlConnection, SqlCommand, etc.

        // Example using SqlCommand (replace with your actual delete logic)
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