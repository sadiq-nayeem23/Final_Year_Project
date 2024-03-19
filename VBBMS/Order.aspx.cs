using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Order : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindVegetableDetails();
            // Initialize shopping cart session to ensure it's available even before adding items
            Session["ShoppingCart"] = new List<Vegetable>();
        }
    }

    protected void BindVegetableDetails()
    {
        List<Vegetable> vegetables = new List<Vegetable>
        {
            new Vegetable { BoxId = 1, BoxName = "Potatoes", Price = 1.89 },
            new Vegetable { BoxId = 2, BoxName = "Carrots", Price = 2.50 },
            // Add more vegetables as needed
        };

        gvVegetableBoxes.DataSource = vegetables;
        gvVegetableBoxes.DataBind();
    }

    protected void gvVegetableBoxes_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "AddToCart")
        {
            int rowIndex = Convert.ToInt32(e.CommandArgument);
            int boxId = Convert.ToInt32(gvVegetableBoxes.DataKeys[rowIndex].Value);
            Vegetable selectedVegetable = GetVegetableDetails(boxId);

            AddToCart(selectedVegetable);
            BindShoppingCart();
            UpdateTotalPrice();
        }
    }

    private Vegetable GetVegetableDetails(int boxId)
    {
        // This method should ideally fetch details from a real database
        // For demonstration, returning a dummy vegetable
        return new Vegetable
        {
            BoxId = boxId,
            BoxName = $"Sample Vegetable {boxId}",
            Price = 2.99 // Sample price
        };
    }


    private void AddToCart(Vegetable vegetable)
    {
        List<Vegetable> shoppingCart = Session["ShoppingCart"] as List<Vegetable>;
        shoppingCart.Add(vegetable);
        Session["ShoppingCart"] = shoppingCart;
    }

    private void BindShoppingCart()
    {
        gvShoppingCart.DataSource = Session["ShoppingCart"] as List<Vegetable>;
        gvShoppingCart.DataBind();
    }

    private void UpdateTotalPrice()
    {
        double totalPrice = 0;
        List<Vegetable> shoppingCart = Session["ShoppingCart"] as List<Vegetable>;

        if (shoppingCart != null)
        {
            foreach (Vegetable vegetable in shoppingCart)
            {
                totalPrice += vegetable.Price;
            }
        }
        lblTotal.Text = "Total: $" + totalPrice.ToString("0.00");
    }

    protected void btnCheckout_Click(object sender, EventArgs e)
    {
        Response.Redirect("Checkout.aspx");
    }
}

public class Vegetable
{
    public int BoxId { get; set; }
    public string BoxName { get; set; }
    public double Price { get; set; }
}