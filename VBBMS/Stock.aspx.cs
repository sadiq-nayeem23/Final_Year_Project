using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Stock : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void gvVegetableBoxes_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvVegetableBoxes.EditIndex = e.NewEditIndex;
        // Rebind data to show edit row
    }

    protected void gvVegetableBoxes_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        // Retrieve updated data from GridView and update the database
        // Reset EditIndex and rebind updated data
    }

    protected void gvVegetableBoxes_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        // Delete the record from the database and rebind data
    }

    protected void gvVegetableBoxes_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvVegetableBoxes.EditIndex = -1;
        // Rebind data to cancel edit
    }
}