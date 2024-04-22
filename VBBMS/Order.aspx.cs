using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Order : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindVegetableBoxes();
            InitializeCart();
        }
    }

    private void BindVegetableBoxes()
    {
        string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT BoxId, BoxName, Price FROM VegetableBoxes", conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            gvVegetableBoxes.DataSource = dt;
            gvVegetableBoxes.DataBind();
        }
    }

    private void InitializeCart()
    {
        if (Session["ShoppingCart"] == null)
        {
            Session["ShoppingCart"] = new List<Vegetable>();
        }
        else
        {
            BindShoppingCart(); // Bind existing cart items if session is not new
            UpdateTotalPrice(); // Update total price based on existing items in the cart
        }
    }

    protected void gvVegetableBoxes_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "AddToCart")
        {
            int rowIndex = Convert.ToInt32(e.CommandArgument);
            AddItemToCart(rowIndex);
        }
    }

    private void AddItemToCart(int rowIndex)
    {
        // Retrieve the BoxId from the DataKey of the GridView at the specified rowIndex
        int boxId = Convert.ToInt32(gvVegetableBoxes.DataKeys[rowIndex].Value);

        // Use FindControl to find the Label control within the GridView row
        Label lblPrice = gvVegetableBoxes.Rows[rowIndex].FindControl("lblPrice") as Label;

        // Check if the label is found; throw an exception if not
        if (lblPrice == null)
        {
            throw new InvalidOperationException("Failed to find the price label in GridView row.");
        }

        // Convert the text of the lblPrice to a decimal
        decimal price = Decimal.Parse(lblPrice.Text, System.Globalization.NumberStyles.Currency);

        // Create and add the vegetable to the shopping cart
        List<Vegetable> cart = Session["ShoppingCart"] as List<Vegetable>;
        if (cart == null)
        {
            cart = new List<Vegetable>();
            Session["ShoppingCart"] = cart;
        }
        cart.Add(new Vegetable { BoxId = boxId, BoxName = gvVegetableBoxes.Rows[rowIndex].Cells[1].Text, Price = price });
        Session["ShoppingCart"] = cart;

        BindShoppingCart();
        UpdateTotalPrice();
    }




    private void BindShoppingCart()
    {
        List<Vegetable> cart = (List<Vegetable>)Session["ShoppingCart"];
        gvShoppingCart.DataSource = cart;
        gvShoppingCart.DataBind();
    }

    private void UpdateTotalPrice()
    {
        List<Vegetable> cart = (List<Vegetable>)Session["ShoppingCart"];
        decimal totalPrice = 0;
        foreach (Vegetable veg in cart)
        {
            totalPrice += veg.Price;
        }
        lblTotal.Text = "Total: $" + totalPrice.ToString("N2");
    }

    protected void btnCheckout_Click(object sender, EventArgs e)
    {
        // Redirect to the Checkout page
        Response.Redirect("Checkout.aspx");
    }
}

public class Vegetable
{
    public int BoxId { get; set; }
    public string BoxName { get; set; }
    public decimal Price { get; set; }
}
