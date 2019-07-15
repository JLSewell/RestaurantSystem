using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RestaurantSystem
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private int GetDishId()
        {
            int dishId = Int32.Parse(DropDownList1.SelectedValue.Split(' ').First());

            return dishId;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            try
            {
                int dishId = GetDishId();

                if (TextBox1.Text.Length == 0 | TextBox2.Text.Length == 0)

                    SqlDataSource1.SelectCommand = "SELECT restaurant.restaurant_Name, dishes.dish_Name, SUM(order_dishes.quantity) AS Total_Sold " +
                                                   "FROM customer_order INNER JOIN " +
                                                   "order_dishes ON customer_order.order_Id = order_dishes.order_Id INNER JOIN " +
                                                   "restaurant ON customer_order.restaurant_Id = restaurant.restaurant_Id INNER JOIN " +
                                                   "dishes ON order_dishes.dish_Id = dishes.dish_Id " +
                                                   "WHERE(order_dishes.dish_Id = " + dishId + ") " +
                                                   "GROUP BY dishes.dish_Name, restaurant.restaurant_Name";
                else

                    SqlDataSource1.SelectCommand = "SELECT restaurant.restaurant_Name, dishes.dish_Name, SUM(order_dishes.quantity) AS Total_Sold " +
                                                       "FROM customer_order INNER JOIN " +
                                                       "order_dishes ON customer_order.order_Id = order_dishes.order_Id INNER JOIN " +
                                                       "restaurant ON customer_order.restaurant_Id = restaurant.restaurant_Id INNER JOIN " +
                                                       "dishes ON order_dishes.dish_Id = dishes.dish_Id " +
                                                       "WHERE(order_dishes.dish_Id = " + dishId + ") AND (customer_order.order_Date BETWEEN " + "'" + TextBox1.Text + "'" + "AND " + "'" + TextBox2.Text + "'" + ") " +
                                                       "GROUP BY dishes.dish_Name, restaurant.restaurant_Name";
            }
            catch (Exception)
            {
                Label6.Text =" Error. Please check your search and try again.";
            }

        }
    }
}