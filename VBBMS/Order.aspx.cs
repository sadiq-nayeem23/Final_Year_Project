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
        lblTotal.Text = "Total: $" + totalPrice.ToString("N2");
    }

    protected void btnConfirm_Click(object sender, EventArgs e)
    {
        var cart = Session["ShoppingCart"] as List<Vegetable>;
        if (cart != null && cart.Count > 0)
        {
            if (PlaceOrder(cart, out int orderId))
            {
                ShowInvoice(orderId, cart);
                Session["CartOrderID"] = orderId;
            }
            else
            {
                // Handle the error, e.g., show a message to the user
            }
        }
    }

    private void ShowInvoice(int orderId, List<Vegetable> cart)
    {
        lblOrderId.Text = orderId.ToString();
        lblOrderDate.Text = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
        lblInvoiceTotal.Text = $"${cart.Sum(item => item.Price * item.Quantity):N2}";
        pnlInvoice.Visible = true; // Ensure the panel is set to visible
    }


    protected void btnCheckout_Click(object sender, EventArgs e)
    {
        Response.Redirect("Checkout.aspx");
    }

    private bool PlaceOrder(List<Vegetable> cart, out int orderId)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        orderId = 0;
        try
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlTransaction transaction = conn.BeginTransaction();

                SqlCommand cmd = new SqlCommand("INSERT INTO Orders (CustomerID, OrderDate, TotalAmount, Status) VALUES (@CustomerID, @OrderDate, @TotalAmount, @Status); SELECT SCOPE_IDENTITY();", conn, transaction);
                cmd.Parameters.AddWithValue("@CustomerID", HttpContext.Current.User.Identity.Name); // Adjust according to your authentication method
                cmd.Parameters.AddWithValue("@OrderDate", DateTime.Now);
                decimal totalAmount = cart.Sum(item => item.Price * item.Quantity);
                cmd.Parameters.AddWithValue("@TotalAmount", totalAmount);
                cmd.Parameters.AddWithValue("@Status", "Ordered");

                orderId = Convert.ToInt32(cmd.ExecuteScalar());

                foreach (var item in cart)
                {
                    SqlCommand cmdDetails = new SqlCommand("INSERT INTO OrderDetails (OrderID, BoxID, Quantity, Subtotal) VALUES (@OrderID, @BoxID, @Quantity, @Subtotal)", conn, transaction);
                    cmdDetails.Parameters.AddWithValue("@OrderID", orderId);
                    cmdDetails.Parameters.AddWithValue("@BoxID", item.BoxId);
                    cmdDetails.Parameters.AddWithValue("@Quantity", item.Quantity);
                    cmdDetails.Parameters.AddWithValue("@Subtotal", item.Price * item.Quantity);
                    cmdDetails.ExecuteNonQuery();
                }

                transaction.Commit();
                return true;
            }
        }
        catch (Exception)
        {
            // Log or handle exceptions here
            return false;
        }
    }
}

public class Vegetable
{
    public int BoxId { get; set; }
    public string BoxName { get; set; }
    public decimal Price { get; set; }
    public int Quantity { get; set; }
}
