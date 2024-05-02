using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pending_Fees : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        BindData();
    }

    private void BindData()
    {
        try
        {
            String Str = string.Format("Select id, name, address, mobile, email, password, bus_no, stop, fees_paid, total_fees, pending_fees, college, year, dept from student where pending_fees != '0'");
            DataSet Ds = new DataSet();
            SqlDataAdapter SDA = new SqlDataAdapter(Str, con);
            SDA.Fill(Ds, "Temp");
            //GridView1.DataSource = Ds;
            //GridView1.DataMember = "Temp";
        }
        catch (Exception e1)
        {
            string msg = e1.Message;
        }
        finally
        {
            con.Close();
        }
    }
}