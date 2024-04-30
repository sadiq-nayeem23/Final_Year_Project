using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Thank_You : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["LastOrderId"] != null)
            {
                lblOrderId.Text = "Your order ID is: " + Session["LastOrderId"].ToString();
                Session.Remove("LastOrderId"); // Optional: Clear the session after displaying the ID
            }
            else
            {
                lblOrderId.Text = "There was an error retrieving your order ID.";
            }
        }
    }

}