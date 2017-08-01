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
    public partial class ProductCate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // ------ food cate -------
        //submit data
        [WebMethod]
        public static string InsertFoodCate(string foodCateId, string foodCateName)
        {
            string sql = "insert into tblFoodCate values('" + foodCateId + "',N'" + foodCateName + "') ";
            int maxFoodCateId = 0;
            if (Operation.ExecuteSQL(sql) != 0)
            {
                string maxId = "select max(foodCateId) as foodCateId from tblFoodCate";
                if (Operation.GenerateID(maxId) != 0)
                    maxFoodCateId = Operation.GenerateID(maxId);
            }
            return maxFoodCateId.ToString();
        }

        //update data
        [WebMethod]
        public static string UpdateFoodCate(string foodCateId, string foodCateName)
        {
            string sql = "update tblFoodCate set foodCateName=N'" + foodCateName+ "' where foodCateId='" + foodCateId + "'";
            string result = "";
            if (Operation.ExecuteSQL(sql) != 0)
                result = "success";
            return result;
        }

        //delete data
        [WebMethod]
        public static string DeleteFoodCate(string foodCateId)
        {
            string sql = "delete from tblFoodCate where foodCateId='" + foodCateId + "'";
            string result = "";
            if (Operation.ExecuteSQL(sql) != 0)
                result = "deleted";
            return result;
        }

        //windowLoad
        [WebMethod]
        public static string WindowLoadFoodCate()
        {
            int maxFoodCateId = 0;
            string maxId = "select max(foodCateId) as foodCateId from tblFoodCate";
            if (Operation.GenerateID(maxId) != 0)
                maxFoodCateId = Operation.GenerateID(maxId);
            return maxFoodCateId.ToString();
        }

        //DisplayData
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
        // ------ end food cate -----

        // ------ drink cate -------
        //submit data
        [WebMethod]
        public static string InsertDrinkCate(string drinkCateId, string drinkCateName)
        {
            string sql = "insert into tblDrinkCate values('" + drinkCateId + "',N'" + drinkCateName + "') ";
            int maxDrinkCateId = 0;
            if (Operation.ExecuteSQL(sql) != 0)
            {
                string maxId = "select max(drinkCateId) as drinkCateId from tblDrinkCate";
                if (Operation.GenerateID(maxId) != 0)
                    maxDrinkCateId = Operation.GenerateID(maxId);
            }
            return maxDrinkCateId.ToString();
        }

        //update data
        [WebMethod]
        public static string UpdateDrinkCate(string drinkCateId, string drinkCateName)
        {
            string sql = "update tblDrinkCate set drinkCateName=N'" + drinkCateName + "' where drinkCateId='" + drinkCateId + "'";
            string result = "";
            if (Operation.ExecuteSQL(sql) != 0)
                result = "success";
            return result;
        }

        //delete data
        [WebMethod]
        public static string DeleteDrinkCate(string drinkCateId)
        {
            string sql = "delete from tblDrinkCate where drinkCateId='" + drinkCateId + "'";
            string result = "";
            if (Operation.ExecuteSQL(sql) != 0)
                result = "deleted";
            return result;
        }

        //windowLoad
        [WebMethod]
        public static string WindowLoadDrinkCate()
        {
            int maxDrinkCateId = 0;
            string maxId = "select max(drinkCateId) as drinkCateId from tblDrinkCate";
            if (Operation.GenerateID(maxId) != 0)
                maxDrinkCateId = Operation.GenerateID(maxId);
            return maxDrinkCateId.ToString();
        }

        //DisplayData
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
        // ------ end drink cate -----

    }
}