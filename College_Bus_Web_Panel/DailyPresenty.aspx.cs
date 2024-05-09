using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DailyPresenty : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        lblmobile.Text = Session["mobile"].ToString();
        lblbus_no.Text = Session["bus_no"].ToString();
        BindData();
    }

    private void BindData()
    {
        try
        {
            con.Open();
            string Query = String.Format("select name, stop from student where mobile='" + lblmobile.Text + "'");
            SqlCommand cmd = new SqlCommand(Query, con);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                lblstu_name.Text = dr["name"].ToString();
                lblstop_name.Text = dr["stop"].ToString();
            }
            dr.Close();
            con.Close();
        }
        catch (Exception ex)
        {
            //System.Windows.Forms.MessageBox.Show("errror" + ex);
        }
        finally
        {
            //Response.Write("<script> alert('Amount Deposited Successfully'); </script>");
        }
    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            con.Open();
            string query = String.Format("insert into present_absent (stu_name, stu_mobile, p_a, date, stop_name, bus_no) values (@stu_name, @stu_mobile, @p_a, @date, @stop_name, @bus_no)");
            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@stu_name", lblstu_name.Text);
            cmd.Parameters.AddWithValue("@stu_mobile", lblmobile.Text);
            cmd.Parameters.AddWithValue("@p_a", cmbpresent_absent.Text);
            cmd.Parameters.AddWithValue("@date", DateTime.Now.ToShortDateString());
            cmd.Parameters.AddWithValue("@stop_name", lblstop_name.Text);
            cmd.Parameters.AddWithValue("@bus_no", lblbus_no.Text);

            cmd.ExecuteNonQuery();
        }
        catch (Exception e1)
        {
            string msg = e1.Message;
        }
        finally
        {
            con.Close();
            Response.Write("<script> alert('Added Successfully'); </script>");
            Response.Redirect("DailyPresenty.aspx");
        }
    }
}