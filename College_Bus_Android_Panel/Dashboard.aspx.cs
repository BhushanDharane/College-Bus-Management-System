using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Dashboard : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        Total_bus();
        Total_student();
    }

    private void Total_bus()
    {
        string SelectQuery = String.Format("SELECT count([id]) FROM add_bus");
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand(SelectQuery, con);
            SqlDataReader Result = cmd.ExecuteReader();
            if (Result.Read())
            {
                lbltotal_bus.Text = Result[0].ToString();
            }
        }
        catch (Exception e1)
        {
            string message = e1.Message;
        }
        finally
        {
            con.Close();
        }
    }

    private void Total_student()
    {
        string SelectQuery = String.Format("SELECT count([id]) FROM student");
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand(SelectQuery, con);
            SqlDataReader Result = cmd.ExecuteReader();
            if (Result.Read())
            {
                lblstudent.Text = Result[0].ToString();
            }
        }
        catch (Exception e1)
        {
            string message = e1.Message;
        }
        finally
        {
            con.Close();
        }
    }
}