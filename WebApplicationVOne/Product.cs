using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Diagnostics;

public class Product
{
    public Product()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public static DataTable FetchProducts()
    {
        try
        {
            string UserName_p;
            UserName_p = "Dr Know";

            using (EventLog eventLog = new EventLog("Application"))
            {
                eventLog.Source = "WebApplicationVOne";
                eventLog.WriteEntry(UserName_p + " Products.FetchProducts() Entry.", EventLogEntryType.Information);

                string StrCon = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
                using (SqlConnection Conn = new SqlConnection(StrCon))
                {
                    //string SqlSelect = "select ProductId ,Name ,ProductNumber ,Color ,Category , Cost   from products";
                    string SqlSelect = "usp_SelectProduct @Name";
                    SqlCommand cmd = new SqlCommand(SqlSelect, Conn);
                    cmd.Parameters.Add(new SqlParameter("@Name", UserName_p));
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    da.Fill(ds, "table1");

                    eventLog.WriteEntry(UserName_p + " Products.FetchProducts() Exit.", EventLogEntryType.Information);
                    return ds.Tables[0];
                }
            }
        }
        catch (Exception ex)
        {
            EventLog eventLog = new EventLog("Application");
            eventLog.WriteEntry("Products.FetchProducts() exception thrown. " + ex.Message, EventLogEntryType.Error);
            return null;
        }

    }


    public static DataTable FetchCategory()
    {
        string StrCon = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        SqlConnection Conn = new SqlConnection(StrCon);
        string SqlSelect = "select Cat_Id, Cat_Desc  from Category ";
        SqlCommand Cmd = new SqlCommand(SqlSelect, Conn);
        SqlDataAdapter da = new SqlDataAdapter(Cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "table1");
        return ds.Tables[0];
    }

    public static int update(string ProductId_p, string Name_p, string ProductNumber_p,
        string Color_p, string Category_p, string Cost_p)
    {
        string StrCon = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        SqlConnection Con = new SqlConnection(StrCon);
        string SqlUpd =
            "update products set Name=@Name, ProductNumber=@ProductNumber ," +
            "Color=@Color ,Category=@Category, Cost=@Cost  where ProductId=@ProductId";
        SqlCommand cmd = new SqlCommand(SqlUpd, Con);
        cmd.Parameters.Add(new SqlParameter("@Name", Name_p));
        cmd.Parameters.Add(new SqlParameter("@ProductNumber", ProductNumber_p));
        cmd.Parameters.Add(new SqlParameter("@Color", Color_p));
        cmd.Parameters.Add(new SqlParameter("@Category", Category_p));
        cmd.Parameters.Add(new SqlParameter("@Cost", Cost_p));
        cmd.Parameters.Add(new SqlParameter("@ProductId", ProductId_p));
        Con.Open();
        int upd = cmd.ExecuteNonQuery();
        Con.Close();
        return upd;
    }

    public static int insertRow(string Name_p, string ProductNumber_p, string Color_p,
        string Category_p, string Cost_p)
    {
        string strcon = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        SqlConnection con = new SqlConnection(strcon);
        string sqlselect = "select max(ProductId) from products";
        SqlCommand cmd = new SqlCommand(sqlselect, con);
        con.Open();
        int maxID = (int)cmd.ExecuteScalar();
        maxID++;
        //string sqlInsert = "insert into products values (@ProductId,  @Name, @ProductNumber, @Color, @Category, @Cost )";
        string sqlInsert = "insert into products values (@Name, @ProductNumber, @Color, @Category, @Cost )";
        cmd.CommandText = sqlInsert;
        cmd.Connection = con;
        //cmd.Parameters.Add(new SqlParameter("@ProductId", maxID));
        cmd.Parameters.Add(new SqlParameter("@Name", Name_p));
        cmd.Parameters.Add(new SqlParameter("@ProductNumber", ProductNumber_p));
        cmd.Parameters.Add(new SqlParameter("@Color", Color_p));
        cmd.Parameters.Add(new SqlParameter("@Category", Category_p));
        cmd.Parameters.Add(new SqlParameter("@Cost", Cost_p));
        int rowInsert = cmd.ExecuteNonQuery();
        con.Close();
        return rowInsert;
    }

    public static int RowDelete(string ProductId_p)
    {
        string StrCon = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        SqlConnection Conn = new SqlConnection(StrCon);
        string sqlDelete = "delete from products where ProductId = @ProductId";
        SqlCommand cmd = new SqlCommand(sqlDelete, Conn);
        cmd.Parameters.Add(new SqlParameter("@ProductId", ProductId_p));
        Conn.Open();
        int rowdel = cmd.ExecuteNonQuery();
        Conn.Close();
        return rowdel;
    }
}