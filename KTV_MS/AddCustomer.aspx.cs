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

namespace KTV_MS
{
    public partial class AddCustomer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        [WebMethod]
        public static string OnSubmit(string cusId, string cusName, string gender, string cusType, string tel)
        {
            string sql = "insert into tblCustomer values('" + cusId + "',N'" + cusName + "','" + gender + "','" + cusType + "','" + tel + "') ";
            int maxCusId = 0;
            if (KTV_MS.App_Start.Operation.ExecuteSQL(sql) != 0)
            {
                string maxId = "select max(cusId) as cusId from tblCustomer";
                if (KTV_MS.App_Start.Operation.GenerateID(maxId) != 0)
                    maxCusId = KTV_MS.App_Start.Operation.GenerateID(maxId);
            }
            return maxCusId.ToString();
        }

        [WebMethod]
        public static string WindowLoad()
        {
            int maxCusId = 0;
            string maxId = "select max(cusId) as cusId from tblCustomer";
            if (KTV_MS.App_Start.Operation.GenerateID(maxId) != 0)
                maxCusId = KTV_MS.App_Start.Operation.GenerateID(maxId);
            return maxCusId.ToString();
        }



        protected void btnsave_Click(object sender, EventArgs e)
        {

        }

    }
}