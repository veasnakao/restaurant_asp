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
    public partial class Food : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        //submit data
        [WebMethod]
        public static string InsertFood(string foodId, string foodName, string foodCateId, string foodUnitId, int qty, float price)
        {
            string sql = "insert into tblFood values('" + foodId + "',N'" + foodName + "','" + foodCateId + "','" + foodUnitId + "'," + qty + "," + price + ") ";
            string maxFoodId = "";
            if (Operation.ExecuteSQL(sql) != 0)
            {
                string maxId = "select max(foodId) as foodId from tblFood";
                string prefix = "F";
                if (Operation.GenerateIDPrefix(maxId, prefix) != "")
                    maxFoodId = Operation.GenerateIDPrefix(maxId, prefix);
            }
            return maxFoodId.ToString();
        }

        //update data
        [WebMethod]
        public static string UpdateFood(string foodId, string foodName, string foodCateId, string foodUnitId, int qty, float price)
        {
            string sql = "update tblFood set foodName=N'" + foodName + "',foodCateId='" + foodCateId + "',foodUnitId='" + foodUnitId + "',qty=" + qty + ",price=" + price + " where foodId='" + foodId + "'";
            string result = "";
            if (Operation.ExecuteSQL(sql) != 0)
                result = "success";
            return result;
        }

        //delete data
        [WebMethod]
        public static string DeleteFood(string foodId)
        {
            string sql = "delete from tblFood where foodId='" + foodId + "'";
            string result = "";
            if (Operation.ExecuteSQL(sql) != 0)
                result = "deleted";
            return result;
        }

        //windowLoad
        [WebMethod]
        public static string WindowLoadFood()
        {
            string maxFoodId = "";
            string maxId = "select max(foodId) as foodId from tblFood";
            string prefix = "F";
            if (Operation.GenerateIDPrefix(maxId, prefix) != "")
                maxFoodId = Operation.GenerateIDPrefix(maxId, prefix);
            return maxFoodId;
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

        //DisplayFoodUnit
        [WebMethod]
        public static List<FoodUnit> DisplayAllFoodUnit()
        {
            SqlConnection con = DBManager.getConnection();
            con.Open();
            var foodUnits = new List<FoodUnit>();
            string sql = "select * from tblFoodUnit";
            var cmd = new SqlCommand(sql, con);
            var dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                var foodUnit = new FoodUnit
                {
                    foodUnitId = dr[0].ToString(),
                    foodUnitName = dr[1].ToString()
                };
                foodUnits.Add(foodUnit);
            }
            return foodUnits;
        }
    }
}