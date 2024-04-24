using System;
using System.Web.UI;

public partial class Admin_Dashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Initial data loading logic can go here if necessary
        }
    }
}