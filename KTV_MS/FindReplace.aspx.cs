using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KTV_MS
{
    public partial class FindReplace : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        //// ------ bevg cate -------
        ////insert bevg cate
        //[WebMethod]
        //public static string InsertBevgCate(string bevgCateId, string bevgCateName)
        //{
        //    string sql = "insert into tblBevgCate values('" + bevgCateId + "',N'" + bevgCateName + "') ";
        //    int maxBevgCateId = 0;
        //    if (Operation.ExecuteSQL(sql) != 0)
        //    {
        //        string maxId = "select max(bevgCateId) as bevgCateId from tblBevgCate";
        //        if (Operation.GenerateID(maxId) != 0)
        //            maxBevgCateId = Operation.GenerateID(maxId);
        //    }
        //    return maxBevgCateId.ToString();
        //}

        ////update bevg Cate
        //[WebMethod]
        //public static string UpdateBevgCate(string bevgCateId, string bevgCateName)
        //{
        //    string sql = "update tblBevgCate set bevgCateName=N'" + bevgCateName + "' where bevgCateId='" + bevgCateId + "'";
        //    string result = "";
        //    if (Operation.ExecuteSQL(sql) != 0)
        //        result = "success";
        //    return result;
        //}

        ////delete bevg Cate
        //[WebMethod]
        //public static string DeleteBevgCate(string bevgCateId)
        //{
        //    string sql = "delete from tblBevgCate where bevgCateId='" + bevgCateId + "'";
        //    string result = "";
        //    if (Operation.ExecuteSQL(sql) != 0)
        //        result = "deleted";
        //    return result;
        //}

        ////windowLoad bevg Cate
        //[WebMethod]
        //public static string WindowLoadBevgCate()
        //{
        //    int maxBevgCateId = 0;
        //    string maxId = "select max(bevgCateId) as bevgCateId from tblBevgCate";
        //    if (Operation.GenerateID(maxId) != 0)
        //        maxBevgCateId = Operation.GenerateID(maxId);
        //    return maxBevgCateId.ToString();
        //}

        ////Display bevg Cate
        //[WebMethod]
        //public static List<BevgCate> DisplayBevgCate(string bevgCateId)
        //{
        //    SqlConnection con = DBManager.getConnection();
        //    con.Open();
        //    var bevgCates = new List<BevgCate>();
        //    string sql = "select * from tblBevgCate where bevgCateId =" + bevgCateId + "";
        //    var cmd = new SqlCommand(sql, con);
        //    var dr = cmd.ExecuteReader();
        //    while (dr.Read())
        //    {
        //        var bevgCate = new BevgCate
        //        {
        //            bevgCateId = dr[0].ToString(),
        //            bevgCateName = dr[1].ToString()
        //        };
        //        bevgCates.Add(bevgCate);
        //    }
        //    return bevgCates;
        //}

        ////Display bevg Cate Limit 
        //[WebMethod]
        //public static List<BevgCate> DisplayBevgCateLimit(int offset, int rows)
        //{
        //    SqlConnection con = DBManager.getConnection();
        //    con.Open();
        //    var bevgCates = new List<BevgCate>();
        //    string sql = "SELECT * FROM tblBevgCate ORDER BY bevgCateId DESC OFFSET " + offset + " ROWS FETCH NEXT " + rows + " ROWS ONLY";
        //    var cmd = new SqlCommand(sql, con);
        //    var dr = cmd.ExecuteReader();
        //    while (dr.Read())
        //    {
        //        var bevgCate = new BevgCate
        //        {
        //            bevgCateId = dr[0].ToString(),
        //            bevgCateName = dr[1].ToString()
        //        };
        //        bevgCates.Add(bevgCate);
        //    }
        //    return bevgCates;
        //}

        ////DisplayShort bevg Cate
        //[WebMethod]
        //public static List<BevgCate> DisplayShortBevgCate(string shortField, string shortName, int offset, int rows)
        //{
        //    SqlConnection con = DBManager.getConnection();
        //    con.Open();
        //    var bevgCates = new List<BevgCate>();
        //    string sql = "SELECT * FROM tblBevgCate ORDER BY " + shortField + " " + shortName + " OFFSET " + offset + " ROWS FETCH NEXT " + rows + " ROWS ONLY";
        //    var cmd = new SqlCommand(sql, con);
        //    var dr = cmd.ExecuteReader();
        //    while (dr.Read())
        //    {
        //        var bevgCate = new BevgCate
        //        {
        //            bevgCateId = dr[0].ToString(),
        //            bevgCateName = dr[1].ToString()
        //        };
        //        bevgCates.Add(bevgCate);
        //    }
        //    return bevgCates;
        //}

        ////Search Cate
        //[WebMethod]
        //public static List<BevgCate> SearchBevgCate(string searchVal, int offset, int rows)
        //{
        //    SqlConnection con = DBManager.getConnection();
        //    con.Open();
        //    var bevgCates = new List<BevgCate>();
        //    string sql = "SELECT * FROM tblBevgCate where bevgCateId like '%" + searchVal + "%' or bevgCateName like N'%" + searchVal + "%' ORDER BY bevgCateId DESC OFFSET " + offset + " ROWS FETCH NEXT " + rows + " ROWS ONLY";
        //    var cmd = new SqlCommand(sql, con);
        //    var dr = cmd.ExecuteReader();
        //    while (dr.Read())
        //    {
        //        var bevgCate = new BevgCate
        //        {
        //            bevgCateId = dr[0].ToString(),
        //            bevgCateName = dr[1].ToString()
        //        };
        //        bevgCates.Add(bevgCate);
        //    }
        //    return bevgCates;
        //}
        //// ------ end bevg Cate -------


    }
}