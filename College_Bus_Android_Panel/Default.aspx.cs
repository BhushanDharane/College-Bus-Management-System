using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        if (txtmobile_no.Text == "admin" && txtpassword.Text == "123")
        {
            Response.Redirect("Dashboard.aspx");
        }
        else
        {
            if (Regex.IsMatch(txtmobile_no.Text, @"[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}", RegexOptions.IgnoreCase))
            {
                SqlConnection con = new SqlConnection("Data Source=103.191.208.118;Initial Catalog=idealtec_r3_college_bus;User ID=idealtec_r3_college_bus;Password=Mpiti@123");
                con.Open();
                SqlCommand cmd = new SqlCommand("select * FROM re_registration WHERE mobile_no='" + txtmobile_no.Text + "' and password='" + txtpassword.Text + "'");
                cmd.Connection = con;
                int OBJ = Convert.ToInt32(cmd.ExecuteScalar());
                if (OBJ > 0)
                {
                    Session["mobile"] = txtmobile_no.Text;
                    Session["name"] = lblname.Text;
                    Response.Redirect("users/UserDashboard.aspx");
                }
                else
                {
                    Response.Write("<script> alert('Invalid Username And Password or Contact To Adminitrator'); </script>");
                }
            }
            else
            {
                SqlConnection con = new SqlConnection("Data Source=103.191.208.118;Initial Catalog=idealtec_nashikestate;User ID=idealtec_nashikestate;Password=Mpiti@123");
                con.Open();
                SqlCommand cmd = new SqlCommand("select * FROM reg WHERE mobile='" + txtmobile_no.Text + "' and password='" + txtpassword.Text + "'");
                cmd.Connection = con;
                int OBJ = Convert.ToInt32(cmd.ExecuteScalar());

                if (OBJ > 0)
                {
                    Session["mobile"] = txtmobile_no.Text;
                    Session["id"] = lblid.Text;
                    Response.Redirect("users/UserDashboard.aspx");
                }
                else
                {
                    Response.Write("<script> alert('Invalid Username And Password Or Contact To Administrator'); </script>");
                }
            }
        }
    }
}