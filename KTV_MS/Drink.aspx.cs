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
    public partial class Drink : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //submit data
        [WebMethod]
        public static string InsertDrink(string drinkId, string drinkName, string drinkCateId, string drinkUnitId, int qty, float price)
        {
            string sql = "insert into tblDrink values('" + drinkId + "',N'" + drinkName + "','" + drinkCateId + "','" + drinkUnitId + "'," + qty + "," + price + ") ";
            string maxDrinkId = "";
            if (Operation.ExecuteSQL(sql) != 0)
            {
                string maxId = "select max(drinkId) as drinkId from tblDrink";
                string prefix = "F";
                if (Operation.GenerateIDPrefix(maxId, prefix) != "")
                    maxDrinkId = Operation.GenerateIDPrefix(maxId, prefix);
            }
            return maxDrinkId.ToString();
        }

        //update data
        [WebMethod]
        public static string UpdateDrink(string drinkId, string drinkName, string drinkCateId, string drinkUnitId, int qty, float price)
        {
            string sql = "update tblDrink set drinkName=N'" + drinkName + "',drinkCateId='" + drinkCateId + "',drinkUnitId='" + drinkUnitId + "',qty=" + qty + ",price=" + price + " where drinkId='" + drinkId + "'";
            string result = "";
            if (Operation.ExecuteSQL(sql) != 0)
                result = "success";
            return result;
        }

        //delete data
        [WebMethod]
        public static string DeleteDrink(string drinkId)
        {
            string sql = "delete from tblDrink where drinkId='" + drinkId + "'";
            string result = "";
            if (Operation.ExecuteSQL(sql) != 0)
                result = "deleted";
            return result;
        }

        //windowLoad
        [WebMethod]
        public static string WindowLoadDrink()
        {
            string maxDrinkId = "";
            string maxId = "select max(drinkId) as drinkId from tblDrink";
            string prefix = "D";
            if (Operation.GenerateIDPrefix(maxId, prefix) != "")
                maxDrinkId = Operation.GenerateIDPrefix(maxId, prefix);
            return maxDrinkId;
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

        //DisplayDrinkUnit
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
    }
}