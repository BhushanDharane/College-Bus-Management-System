using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Add_Complaints : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        lblmobile.Text = Session["mobile"].ToString();
    }

    protected void btnadd_Click(object sender, EventArgs e)
    {
        try
        {
            con.Open();
            string query = String.Format("insert into complaints (msg, name, contact) values (@msg, @name, @contact)");
            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@msg", txtcomplaint.Text);

            cmd.Parameters.AddWithValue("@name", txtname.Text);
            cmd.Parameters.AddWithValue("@contact", txtcontact.Text);

            cmd.ExecuteNonQuery();
        }
        catch (Exception e1)
        {
            string msg = e1.Message;
        }
        finally
        {
            con.Close();
            txtcomplaint.Text = "";
            Response.Write("<script> alert('Complaint Added Successfully'); </script>");
        }
    }
}