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
            // Initialize the shopping cart if it's not already created
            if (Session["ShoppingCart"] == null)
            {
                Session["ShoppingCart"] = new List<CartItem>();
            }

            // Bind the vegetable details to the GridView
            BindVegetableDetails();
        }
    }
    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }
    protected void BindVegetableDetails()
    {
        // Fetch vegetable details from the database and bind to the GridView
        // Replace this with your actual logic to fetch data from the database
        // For example, you can use a DataAdapter or an ORM like Entity Framework

        // Sample data for demonstration purposes
        List<Vegetable> vegetables = new List<Vegetable>
    {
        new Vegetable { BoxId = 1, BoxName = "Potatoes", Price = 1.89 },
        new Vegetable { BoxId = 4, BoxName = "Cauliflower", Price = 3.50 },
        // Add more vegetables as needed
    };

        // Add this line to bind the data to the GridView
        gvVegetableBoxes.DataBind();
    }

    protected void gvVegetableBoxes_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "AddToCart")
        {
            int BoxId = Convert.ToInt32(e.CommandArgument);

            // Fetch the selected vegetable box details
            // Replace this with your actual logic to fetch data from the database
            // For example, you can use a DataAdapter or an ORM like Entity Framework

            // Sample data for demonstration purposes
            Vegetable selectedVegetableBox = GetVegetableDetails(BoxId);

            // Add the selected vegetable box to the shopping cart
            AddToCart(selectedVegetableBox);

            // Refresh the shopping cart GridView
            BindShoppingCart();

            // Update the total price label
            UpdateTotalPrice();
        }
    }

    private Vegetable GetVegetableDetails(int BoxId)
    {
        // Replace this with your actual logic to fetch vegetable details from the database
        // For example, you can use a DataAdapter or an ORM like Entity Framework

        // Sample data for demonstration purposes
        return new Vegetable { BoxId = BoxId, BoxName = "Potatoes", Price = 1.89 };
    }

    private void AddToCart(Vegetable vegetable)
    {
        // Get the current shopping cart from the session
        List<CartItem> shoppingCart = (List<CartItem>)Session["ShoppingCart"];

        // Check if the vegetable is already in the cart
        CartItem existingItem = shoppingCart.Find(item => item.BoxId == vegetable.BoxId);

        if (existingItem != null)
        {
            // If the vegetable is already in the cart, increase the quantity
            existingItem.Quantity++;
        }
        else
        {
            // If the vegetable is not in the cart, add a new item
            CartItem newItem = new CartItem
            {
                BoxId = vegetable.BoxId,
                BoxName = vegetable.BoxName,
                Price = vegetable.Price,
                Quantity = 1
            };

            shoppingCart.Add(newItem);
        }

        // Save the updated shopping cart back to the session
        Session["ShoppingCart"] = shoppingCart;
    }

    private void BindShoppingCart()
    {
        // Bind the shopping cart to the GridView
        gvShoppingCart.DataSource = (List<CartItem>)Session["ShoppingCart"];
    }

    private void UpdateTotalPrice()
    {
        // Calculate and display the total price in the label
        List<CartItem> shoppingCart = (List<CartItem>)Session["ShoppingCart"];
        double totalPrice = 0;

        foreach (CartItem item in shoppingCart)
        {
            totalPrice += item.Price * item.Quantity;
        }

        lblTotal.Text = "Total: " + totalPrice.ToString("C");
    }

    protected void gvVegetableBoxes_SelectedIndexChanged(object sender, EventArgs e)
    {
        // Get the selected row index
        int selectedIndex = gvVegetableBoxes.SelectedIndex;

        // Ensure a row is actually selected
        if (selectedIndex >= 0 && selectedIndex < gvVegetableBoxes.Rows.Count)
        {
            // Get the data key value of the selected row (assuming BoxID is the data key name)
            int vegetableBoxID = Convert.ToInt32(gvVegetableBoxes.DataKeys[selectedIndex].Value);

            // Fetch the selected vegetable box details
            Vegetable selectedVegetableBox = GetVegetableDetails(vegetableBoxID);

            // Add the selected vegetable box to the shopping cart
            AddToCart(selectedVegetableBox);

            // Refresh the shopping cart GridView
            BindShoppingCart();

            // Update the total price label
            UpdateTotalPrice();
        }
    }
}

// Class to represent a vegetable
public class Vegetable
{
    public int BoxId { get; set; }
    public string BoxName { get; set; }
    public double Price { get; set; }
}

// Class to represent an item in the shopping cart
public class CartItem
{
    public int BoxId { get; set; }
    public string BoxName { get; set; }
    public double Price { get; set; }
    public int Quantity { get; set; }
}