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
    public partial class TableInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //submit data
        [WebMethod]
        public static string InsertData(string tableId, string tableName, string tableType)
        {
            int status = 0;
            string sql = "insert into tblTable values('" + tableId + "',N'" + tableName + "',N'" + tableType + "',"+status+")";
            int maxTableId = 0;
            if (Operation.ExecuteSQL(sql) != 0)
            {
                string maxId = "select max(tableId) as tableId from tblTable";
                if (Operation.GenerateID(maxId) != 0)
                    maxTableId = Operation.GenerateID(maxId);
            }
            return maxTableId.ToString();
        }

        //update data
        [WebMethod]
        public static string UpdateData(string tableId, string tableName,string tableType)
        {
            string sql = "update tblTable set tableName=N'" + tableName + "',type=N'" + tableType + "' where tableId='" + tableId + "'";
            string result = "";
            if (Operation.ExecuteSQL(sql) != 0)
                result = "success";
            return result;
        }

        //delete data
        [WebMethod]
        public static string DeleteData(string tableId)
        {
            string sql = "delete from tblTable where tableId='" + tableId + "'";
            string result = "";
            if (Operation.ExecuteSQL(sql) != 0)
                result = "deleted";
            return result;
        }

        //windowLoad
        [WebMethod]
        public static string WindowLoad()
        {
            int maxTableId = 0;
            string maxId = "select max(tableId) as tableId from tblTable";
            if (Operation.GenerateID(maxId) != 0)
                maxTableId = Operation.GenerateID(maxId);
            return maxTableId.ToString();
        }

        //DisplayData
        [WebMethod]
        public static List<TableList> DisplayAllData()
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
                    tableName=dr[1].ToString(),
                    tableType=dr[2].ToString()
                };
                tables.Add(table);
            }
            return tables;
        }
    }
}