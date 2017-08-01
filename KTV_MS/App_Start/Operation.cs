using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data.SqlClient;
using System.Configuration;
using KTV_MS.App_Start;
using System.Web.UI.WebControls;
using System.Data;

namespace KTV_MS.App_Start
{
    public class Operation
    {

        //ExecuteSQL
        public static int ExecuteSQL(string sql)
        {
            SqlConnection con = DBManager.getConnection();
            con.Open();
            SqlCommand cmd = new SqlCommand(sql, con);
            int rs = cmd.ExecuteNonQuery();
            return rs;
        }

        //GenerateID
        public static int GenerateID(string sql)
        {
            int maxId = 0;
            SqlConnection con = DBManager.getConnection();
            con.Open();
            SqlCommand cmd = new SqlCommand(sql, con);
            if (cmd.ExecuteScalar() != null && DBNull.Value!= cmd.ExecuteScalar())
            {
                maxId = Convert.ToInt32(cmd.ExecuteScalar());
                maxId += 1;
            }else
                maxId = 100001;
            return maxId;
        }

        //GenerateID
        public static string GenerateIDPrefix(string sql,string prefix)
        {
            string idGenerate="";
            SqlConnection con = DBManager.getConnection();
            con.Open();
            SqlCommand cmd = new SqlCommand(sql, con);
            if (cmd.ExecuteScalar() != null && DBNull.Value != cmd.ExecuteScalar())
            {
                object obj = cmd.ExecuteScalar();
                string maxId = obj.ToString();
                string[] splitPrefix = maxId.Split('-');
                idGenerate= prefix + "-"+ (Convert.ToInt32(splitPrefix[1].Trim()) + 1).ToString();
            }
            else
            {
                int maxId = 100001;
                idGenerate = prefix + "-" + (maxId).ToString();
            } 
            return idGenerate;
        }

        public static void LoadDataCombobox(string sql, DropDownList ddl)
        {
            SqlConnection con = DBManager.getConnection();
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter(sql, con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            ddl.DataSource = dt;
            ddl.DataValueField = dt.Columns[0].ToString();
            ddl.DataTextField = dt.Columns[1].ToString();
            ddl.DataBind();
            ddl.Items.Insert(0, new ListItem("សូមជ្រើសរើស", ""));
        }

    }
}