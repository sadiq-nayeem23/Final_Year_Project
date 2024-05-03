using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Linq;
using System.Web;

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
            SqlCommand cmd = new SqlCommand("SELECT BoxId, BoxName, StockQuantity, Price FROM VegetableBoxes", conn);
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
            BindShoppingCart();
            UpdateTotalPrice();
        }
    }
    protected void gvVegetableBoxes_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "AddToCart")
        {
            int rowIndex = Convert.ToInt32(e.CommandArgument);
            AddItemToCart(rowIndex, 1);
        }
    }
    protected void gvShoppingCart_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int rowIndex = Convert.ToInt32(e.CommandArgument);
        List<Vegetable> cart = (List<Vegetable>)Session["ShoppingCart"];

        switch (e.CommandName)
        {
            case "Increase":
                cart[rowIndex].Quantity += 1;
                break;
            case "Decrease":
                if (cart[rowIndex].Quantity > 1)
                {
                    cart[rowIndex].Quantity -= 1;
                }
                else
                {
                    cart.RemoveAt(rowIndex);
                }
                break;
            case "Remove":
                cart.RemoveAt(rowIndex);
                break;
        }

        Session["ShoppingCart"] = cart;
        BindShoppingCart();
        UpdateTotalPrice();
    }
    private void AddItemToCart(int rowIndex, int quantity)
    {
        int boxId = Convert.ToInt32(gvVegetableBoxes.DataKeys[rowIndex].Value);
        Label lblPrice = gvVegetableBoxes.Rows[rowIndex].FindControl("lblPrice") as Label;
        if (lblPrice == null)
            throw new InvalidOperationException("Failed to find the price label in GridView row.");

        decimal price = Decimal.Parse(lblPrice.Text, System.Globalization.NumberStyles.Currency);
        List<Vegetable> cart = Session["ShoppingCart"] as List<Vegetable> ?? new List<Vegetable>();

        var existingItem = cart.FirstOrDefault(v => v.BoxId == boxId);
        if (existingItem != null)
        {
            existingItem.Quantity += quantity;
        }
        else
        {
            cart.Add(new Vegetable { BoxId = boxId, BoxName = gvVegetableBoxes.Rows[rowIndex].Cells[1].Text, Price = price, Quantity = quantity });
        }

        Session["ShoppingCart"] = cart;
        BindShoppingCart();
        UpdateTotalPrice();
    }
    private void BindShoppingCart()
    {
        gvShoppingCart.DataSource = Session["ShoppingCart"] as List<Vegetable>;
        gvShoppingCart.DataBind();
    }
    private void UpdateTotalPrice()
    {
        List<Vegetable> cart = (List<Vegetable>)Session["ShoppingCart"];
        decimal totalPrice = cart.Sum(item => item.Price * item.Quantity);
        lblTotal.Text = "Total: £" + totalPrice.ToString("N2");
    }
    protected void btnCheckout_Click(object sender, EventArgs e)
    {
        var cart = Session["ShoppingCart"] as List<Vegetable>;
        if (cart != null && cart.Count > 0)
        {
            // Retrieve email from TextBox
            string email = txtEmail.Text.Trim();

            // Retrieve Customer ID based on email
            int customerId = GetCustomerIdByEmail(email);

            if (customerId != -1)
            {
                decimal totalAmount = cart.Sum(item => item.Price * item.Quantity);
                string queryString = $"Checkout.aspx?totalAmount={totalAmount}&customerId={customerId}";

                foreach (var item in cart)
                {
                    queryString += $"&boxId={item.BoxId}&boxName={item.BoxName}&price={item.Price}&quantity={item.Quantity}";
                }

                Response.Redirect(queryString);
            }
            else
            {
                lblErrorMessage.Text = "Please input the registered email.";
            }
        }
    }
    private int GetCustomerIdByEmail(string email)
    {
        int customerId = -1;
        string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT CustomerID FROM Customers WHERE Email = @Email", conn);
            cmd.Parameters.AddWithValue("@Email", email);
            object result = cmd.ExecuteScalar();

            if (result != null)
            {
                customerId = Convert.ToInt32(result);
            }
        }

        return customerId;
    }
}
public class Vegetable
{
    public int BoxId { get; set; }
    public string BoxName { get; set; }
    public decimal Price { get; set; }
    public int Quantity { get; set; }
}