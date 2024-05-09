using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);

    string maincon = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;

    string connStr = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
    SqlCommand com;
    string str;
    SqlCommand com1;
    string str1;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnforget_password_Click(object sender, EventArgs e)
    {
        Response.Redirect("ForgetPassword.aspx");
    }

    protected void btnlogin_Click(object sender, EventArgs e)
    {
        if(cmblogin_as.Text == "Student")
        {
            SqlConnection con = new SqlConnection(connStr);
            con.Open();
            str = "select count(*)from student where mobile='" + txtmobile.Text + "' and password='" + txtpassword.Text + "'";
            com = new SqlCommand(str, con);
            int count = Convert.ToInt32(com.ExecuteScalar());
            if (count == 0)
            {
                lblmsg.Visible = true;
                lblmsg.ForeColor = System.Drawing.Color.Red;
                lblmsg.Text = "Invalid Login";
                //ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + lblmsg.Text + "');", true);
                //Response.Write("<script language = 'javascript'>window.alert('Add Your Account First.');window.location='Login.aspx';</script>");
            }
            else
            {
                LoginData();
            }
        }
        else if(cmblogin_as.Text == "Driver")
        {
            SqlConnection con = new SqlConnection(connStr);
            con.Open();
            str = "select count(*)from add_bus where driver_contact='" + txtmobile.Text + "' and password='" + txtpassword.Text + "'";
            com = new SqlCommand(str, con);
            int count = Convert.ToInt32(com.ExecuteScalar());
            if (count == 0)
            {
                lblmsg.Visible = true;
                lblmsg.ForeColor = System.Drawing.Color.Red;
                lblmsg.Text = "Invalid Login";
                //ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + lblmsg.Text + "');", true);
                //Response.Write("<script language = 'javascript'>window.alert('Add Your Account First.');window.location='Login.aspx';</script>");
            }
            else
            {
                this.lblLatitude.Text = hfLat.Value;
                this.lblLongitude.Text = hfLon.Value;
                UpdateCurrentLocation();
                LoginDataDriver();
            }
        }
    }

    private void UpdateCurrentLocation()
    {
        try
        {
            con.Open();
            string query = String.Format("update add_bus set lat=@lat, long=@long where driver_contact='{0}'", txtmobile.Text);
            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@lat", hfLat.Value);
            cmd.Parameters.AddWithValue("@long", hfLon.Value);
            cmd.Parameters.AddWithValue("@driver_contact", txtmobile.Text);

            cmd.ExecuteNonQuery();
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

    private void LoginDataDriver()
    {
        //Session["mobile"] = txtmobile.Text;
        //Response.Redirect("Driver-Dashboard.aspx");
        string maincon = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
        SqlConnection sqlcon = new SqlConnection(maincon);
        sqlcon.Open();
        SqlCommand cmd = new SqlCommand("select * FROM add_bus WHERE driver_contact='" + txtmobile.Text + "' and password='" + txtpassword.Text + "'");
        cmd.Connection = sqlcon;
        int OBJ = Convert.ToInt32(cmd.ExecuteScalar());
        if (OBJ > 0)
        {
            
            BindBusNO();
            Session["bus_no"] = lblbus_no.Text;
            Session["mobile"] = txtmobile.Text;
            Response.Redirect("Driver-Dashboard.aspx");
        }
        else
        {
            lblmsg.Visible = true;
            lblmsg.Text = "Invalid Mobile No. Or Password";
            lblmsg.ForeColor = System.Drawing.Color.White;
        }
    }

    private void BindBusNO()
    {
        try
        {
            con.Open();
            string Query = String.Format("select bus_no from add_bus where driver_contact='" + txtmobile.Text + "'");
            SqlCommand cmd = new SqlCommand(Query, con);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                lblbus_no.Text = dr["bus_no"].ToString();
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

    private void LoginData()
    {
        //Session["mobile"] = txtmobile.Text;
        //Response.Redirect("dashboard.aspx");
        string maincon = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
        SqlConnection sqlcon = new SqlConnection(maincon);
        sqlcon.Open();
        SqlCommand cmd = new SqlCommand("select * FROM student WHERE mobile='" + txtmobile.Text + "' and password='" + txtpassword.Text + "'");
        cmd.Connection = sqlcon;
        int OBJ = Convert.ToInt32(cmd.ExecuteScalar());
        if (OBJ > 0)
        {
            BindStudentBusNO();
            Session["bus_no"] = lblbus_no.Text;
            Session["mobile"] = txtmobile.Text;
            Response.Redirect("DailyPresenty.aspx");
        }
        else
        {
            lblmsg.Visible = true;
            lblmsg.Text = "Invalid Mobile No. Or Password";
            lblmsg.ForeColor = System.Drawing.Color.White;
        }
    }

    private void BindStudentBusNO()
    {
        try
        {
            con.Open();
            string Query = String.Format("select bus_no from student where mobile='" + txtmobile.Text + "'");
            SqlCommand cmd = new SqlCommand(Query, con);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                lblbus_no.Text = dr["bus_no"].ToString();
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
}