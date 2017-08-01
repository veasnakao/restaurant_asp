using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data.SqlClient;
using System.Configuration;

namespace KTV_MS.App_Start
{
    public class DBManager
    {
        static string ConnectionString;
        static DBManager()
        {
            ConnectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ToString();

        }
        public static SqlConnection getConnection()
        {
            return new SqlConnection(ConnectionString);
        }
    }
}