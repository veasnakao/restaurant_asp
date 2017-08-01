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
    public partial class ProductUnit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // ------ food unit -------
        //submit data
        [WebMethod]
        public static string InsertFoodUnit(string foodUnitId, string foodUnitName)
        {
            string sql = "insert into tblFoodUnit values('" + foodUnitId + "',N'" + foodUnitName + "') ";
            int maxFoodUnitId = 0;
            if (Operation.ExecuteSQL(sql) != 0)
            {
                string maxId = "select max(foodUnitId) as foodUnitId from tblFoodUnit";
                if (Operation.GenerateID(maxId) != 0)
                    maxFoodUnitId = Operation.GenerateID(maxId);
            }
            return maxFoodUnitId.ToString();
        }

        //update data
        [WebMethod]
        public static string UpdateFoodUnit(string foodUnitId, string foodUnitName)
        {
            string sql = "update tblFoodUnit set foodUnitName=N'" + foodUnitName + "' where foodUnitId='" + foodUnitId + "'";
            string result = "";
            if (Operation.ExecuteSQL(sql) != 0)
                result = "success";
            return result;
        }

        //delete data
        [WebMethod]
        public static string DeleteFoodUnit(string foodUnitId)
        {
            string sql = "delete from tblFoodUnit where foodUnitId='" + foodUnitId + "'";
            string result = "";
            if (Operation.ExecuteSQL(sql) != 0)
                result = "deleted";
            return result;
        }

        //windowLoad
        [WebMethod]
        public static string WindowLoadFoodUnit()
        {
            int maxFoodUnitId = 0;
            string maxId = "select max(foodUnitId) as foodUnitId from tblFoodUnit";
            if (Operation.GenerateID(maxId) != 0)
                maxFoodUnitId = Operation.GenerateID(maxId);
            return maxFoodUnitId.ToString();
        }

        //DisplayData
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
        // ------ end food unit -----

        // ------ drink unit -------
        //submit data
        [WebMethod]
        public static string InsertDrinkUnit(string drinkUnitId, string drinkUnitName)
        {
            string sql = "insert into tblDrinkUnit values('" + drinkUnitId + "',N'" + drinkUnitName + "') ";
            int maxDrinkUnitId = 0;
            if (Operation.ExecuteSQL(sql) != 0)
            {
                string maxId = "select max(drinkUnitId) as drinkUnitId from tblDrinkUnit";
                if (Operation.GenerateID(maxId) != 0)
                    maxDrinkUnitId = Operation.GenerateID(maxId);
            }
            return maxDrinkUnitId.ToString();
        }

        //update data
        [WebMethod]
        public static string UpdateDrinkUnit(string drinkUnitId, string drinkUnitName)
        {
            string sql = "update tblDrinkUnit set drinkUnitName=N'" + drinkUnitName + "' where drinkUnitId='" + drinkUnitId + "'";
            string result = "";
            if (Operation.ExecuteSQL(sql) != 0)
                result = "success";
            return result;
        }

        //delete data
        [WebMethod]
        public static string DeleteDrinkUnit(string drinkUnitId)
        {
            string sql = "delete from tblDrinkUnit where drinkUnitId='" + drinkUnitId + "'";
            string result = "";
            if (Operation.ExecuteSQL(sql) != 0)
                result = "deleted";
            return result;
        }

        //windowLoad
        [WebMethod]
        public static string WindowLoadDrinkUnit()
        {
            int maxDrinkUnitId = 0;
            string maxId = "select max(drinkUnitId) as drinkUnitId from tblDrinkUnit";
            if (Operation.GenerateID(maxId) != 0)
                maxDrinkUnitId = Operation.GenerateID(maxId);
            return maxDrinkUnitId.ToString();
        }

        //DisplayData
        [WebMethod]
        public static List<DrinkUnit> DisplayAllDrinkUnit()
        {
            SqlConnection con = DBManager.getConnection();
            con.Open();
            var drinkUnits = new List<DrinkUnit>();
            string sql = "select * from tblDrinkUnit";
            var cmd = new SqlCommand(sql, con);
            var dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                var drinkUnit = new DrinkUnit
                {
                    drinkUnitId = dr[0].ToString(),
                    drinkUnitName = dr[1].ToString()
                };
                drinkUnits.Add(drinkUnit);
            }
            return drinkUnits;
        }
        // ------ end drink unit -----

    }
}