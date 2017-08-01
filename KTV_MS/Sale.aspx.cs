using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Services;
using System.Web.Script.Services;
using System.Web.Script.Serialization;
using KTV_MS.App_Start;

namespace KTV_MS
{
    public partial class Sale : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //SaveProduct
        [WebMethod]
        public static string SaveProduct(object [] productSale)
        {
            var arr = productSale;
            SqlConnection con = DBManager.getConnection();
            con.Open();

            DateTime today = DateTime.Today;

            foreach (object value in productSale)
            {
                Dictionary<string, object> dicValue = new Dictionary<string, object>();
                dicValue = (Dictionary<string, object>)value;
                string productId = dicValue["productId"].ToString();
                int qty = Int32.Parse(dicValue["qty"].ToString());
                float price = Int32.Parse(dicValue["price"].ToString());
                float amount = Int32.Parse(dicValue["amount"].ToString());
                string sql = "insert into tblSaleDetail values('1001','"+productId+"',"+qty+","+price+","+amount+")";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.ExecuteNonQuery();
            }
            var str = "";
            return str;
        }

        //DisplayData
        [WebMethod]
        public static List<TableList> DisplayAllTable()
        {
            SqlConnection con = DBManager.getConnection();
            con.Open();
            var tables = new List<TableList>();
            string sql = "select * from tblTable";
            var cmd = new SqlCommand(sql, con);
            var dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                var table = new TableList
                {
                    tableId = dr[0].ToString(),
                    tableName = dr[1].ToString(),
                    tableType = dr[2].ToString(),
                    status = dr[3].ToString()
                };
                tables.Add(table);
            }
            return tables;
        }

        //DisplayFoodCate
        [WebMethod]
        public static List<FoodCate> DisplayAllFoodCate()
        {
            SqlConnection con = DBManager.getConnection();
            con.Open();
            var foodCates = new List<FoodCate>();
            string sql = "select * from tblFoodCate";
            var cmd = new SqlCommand(sql, con);
            var dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                var foodCate = new FoodCate
                {
                    foodCateId = dr[0].ToString(),
                    foodCateName = dr[1].ToString()
                };
                foodCates.Add(foodCate);
            }
            return foodCates;
        }

        //DisplayDrinkCate
        [WebMethod]
        public static List<DrinkCate> DisplayAllDrinkCate()
        {
            SqlConnection con = DBManager.getConnection();
            con.Open();
            var drinkCates = new List<DrinkCate>();
            string sql = "select * from tblDrinkCate";
            var cmd = new SqlCommand(sql, con);
            var dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                var drinkCate = new DrinkCate
                {
                    drinkCateId = dr[0].ToString(),
                    drinkCateName = dr[1].ToString()
                };
                drinkCates.Add(drinkCate);
            }
            return drinkCates;
        }

        //DisplayFood
        [WebMethod]
        public static List<VFood> DisplayAllFood()
        {
            SqlConnection con = DBManager.getConnection();
            con.Open();
            var foods = new List<VFood>();
            string sql = "select * from vFood";
            var cmd = new SqlCommand(sql, con);
            var dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                var food = new VFood
                {
                    foodId = dr[0].ToString(),
                    foodName = dr[1].ToString(),
                    foodCateId = dr[2].ToString(),
                    foodCateName = dr[3].ToString(),
                    foodUnitId = dr[4].ToString(),
                    foodUnitName = dr[5].ToString(),
                    qty = dr[6].ToString(),
                    price = dr[7].ToString()
                };
                foods.Add(food);
            }
            return foods;
        }

        //DisplayDrink
        [WebMethod]
        public static List<VDrink> DisplayAllDrink()
        {
            SqlConnection con = DBManager.getConnection();
            con.Open();
            var drinks = new List<VDrink>();
            string sql = "select * from vDrink";
            var cmd = new SqlCommand(sql, con);
            var dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                var drink = new VDrink
                {
                    drinkId = dr[0].ToString(),
                    drinkName = dr[1].ToString(),
                    drinkCateId = dr[2].ToString(),
                    drinkCateName = dr[3].ToString(),
                    drinkUnitId = dr[4].ToString(),
                    drinkUnitName = dr[5].ToString(),
                    qty = dr[6].ToString(),
                    price = dr[7].ToString()
                };
                drinks.Add(drink);
            }
            return drinks;
        }
    }
}