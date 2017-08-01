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
    public partial class CustomerInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //txtCusName.Attributes["required"] = "true";
        }

        //submit data
        [WebMethod]
        public static string InsertData(string cusId, string cusName, string gender, string cusType, string tel)
        {
            string sql = "insert into tblCustomer values('" + cusId + "',N'" + cusName + "',N'" + gender + "',N'" + cusType + "',N'" + tel + "') ";
            int maxCusId = 0;
            if (Operation.ExecuteSQL(sql) != 0)
            {
                string maxId = "select max(cusId) as cusId from tblCustomer";
                if (Operation.GenerateID(maxId) != 0)
                    maxCusId = Operation.GenerateID(maxId);
            }
            return maxCusId.ToString();
        }

        //update data
        [WebMethod]
        public static string UpdateData(string cusId, string cusName, string gender, string cusType, string tel)
        {
            string sql = "update tblCustomer set cusName=N'" + cusName + "',gender=N'" + gender + "',cusType=N'"+cusType+"',tel=N'" + tel + "' where cusId='" + cusId + "'";
            string result="";
            if (Operation.ExecuteSQL(sql) != 0)
                result = "success";
            return result;
        }

        //delete data
        [WebMethod]
        public static string DeleteData(string cusId)
        {
            string sql = "delete from tblCustomer where cusId='" + cusId + "'";
            string result = "";
            if (Operation.ExecuteSQL(sql) != 0)
                result = "deleted";
            return result;
        }

        //windowLoad
        [WebMethod]
        public static string WindowLoad()
        {
            int maxCusId = 0;
            string maxId = "select max(cusId) as cusId from tblCustomer";
            if (Operation.GenerateID(maxId) != 0)
                maxCusId = Operation.GenerateID(maxId);
            return maxCusId.ToString();
        }

        //DisplayData
        [WebMethod]
        public static List<Customer> DisplayAllData()
        {
            SqlConnection con = DBManager.getConnection();
            con.Open();
            var customers = new List<Customer>();
            string sql = "select * from tblCustomer";
            var cmd = new SqlCommand(sql, con);
            var dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                var customer = new Customer
                {
                    cusId = dr[0].ToString(),
                    cusName = dr[1].ToString(),
                    gender = dr[2].ToString(),
                    cusType = dr[3].ToString(),
                    tel = dr[4].ToString()
                };
                customers.Add(customer);
            }
            return customers;
        }
    }

}