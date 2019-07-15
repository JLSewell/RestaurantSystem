using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace RestaurantSystem
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            

        }

        private int GetRestaurantId()
        {

            int iRestaurantId = Int32.Parse(DropDownList1.SelectedValue.Split(' ').First());

            return iRestaurantId;

        }


        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                int restaurantId = GetRestaurantId();

                if (TextBox1.Text.Length > 0)
                    SqlDataSource1.SelectCommand = "SELECT restaurant.restaurant_Name, delivery.delivery_Id, ingredients.ingredient_Id, ingredients.ingredient_Name, delivery.quantity, delivery.delivery_Date " +
                                                   "FROM delivery INNER JOIN ingredients ON delivery.ingredient_Id = ingredients.ingredient_Id " +
                                                   "INNER JOIN restaurant ON delivery.restaurant_Id = restaurant.restaurant_Id " +
                                                   "WHERE delivery.restaurant_Id = " + restaurantId + " AND delivery.delivery_Date LIKE '%" + TextBox1.Text + "%'";
                else
                    SqlDataSource1.SelectCommand = "SELECT restaurant.restaurant_Name, delivery.delivery_Id, ingredients.ingredient_Id, ingredients.ingredient_Name, delivery.quantity, delivery.delivery_Date " +
                                                   "FROM delivery INNER JOIN ingredients ON delivery.ingredient_Id = ingredients.ingredient_Id " +
                                                   "INNER JOIN restaurant ON delivery.restaurant_Id = restaurant.restaurant_Id " +
                                                   "WHERE delivery.restaurant_Id = " + restaurantId;
            }
            catch (Exception)
            {
                Label3.Text = "Error. Please check your search and try again.";
            }
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            try
            {
                int restaurantId = GetRestaurantId();

                if (TextBox1.Text.Length > 0)
                    SqlDataSource1.SelectCommand = "SELECT restaurant.restaurant_Name, delivery.delivery_Id, ingredients.ingredient_Id, ingredients.ingredient_Name, delivery.quantity, delivery.delivery_Date " +
                                                   "FROM delivery INNER JOIN ingredients ON delivery.ingredient_Id = ingredients.ingredient_Id " +
                                                   "INNER JOIN restaurant ON delivery.restaurant_Id = restaurant.restaurant_Id " +
                                                   "WHERE delivery.restaurant_Id = " + restaurantId + " AND delivery.delivery_Date LIKE '%" + TextBox1.Text + "%'";
                else
                    SqlDataSource1.SelectCommand = "SELECT restaurant.restaurant_Name, delivery.delivery_Id, ingredients.ingredient_Id, ingredients.ingredient_Name, delivery.quantity, delivery.delivery_Date " +
                                                   "FROM delivery INNER JOIN ingredients ON delivery.ingredient_Id = ingredients.ingredient_Id " +
                                                   "INNER JOIN restaurant ON delivery.restaurant_Id = restaurant.restaurant_Id " +
                                                   "WHERE delivery.restaurant_Id = " + restaurantId;
            }
            catch (Exception)
            {
                Label3.Text = "Error. Please check your search and try again.";
            }
        }
    }
}