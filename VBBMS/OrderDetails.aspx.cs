using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class OrderDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Optionally, bind data here if not using SqlDataSource directly.
        }
    }

    protected void gvOrders_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvOrders.EditIndex = e.NewEditIndex;
        gvOrders.DataBind(); // Rebind your grid if necessary
    }

    protected void gvOrders_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        // Implement logic to update the database
        gvOrders.EditIndex = -1;
        gvOrders.DataBind();
    }

    protected void gvOrders_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        // Implement logic to delete the record from the database
        gvOrders.DataBind();
    }

    protected void gvOrders_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvOrders.EditIndex = -1;
        gvOrders.DataBind();
    }
}
