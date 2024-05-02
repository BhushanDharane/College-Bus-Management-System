using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Add_Bus : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        LblId.Visible = true;
        if (Session["id"] != null)
        {
            LblId.Text = Session["id"].ToString();

            if (LblId.Text != null)
            {
                Binddata(LblId.Text);
            }
            Session.RemoveAll();
        }

        if (!this.IsPostBack)
        {
            string constr = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT distinct bus_no FROM bus_master"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    con.Open();
                    txtbus_no.DataSource = cmd.ExecuteReader();
                    txtbus_no.DataValueField = "bus_no";
                    txtbus_no.DataBind();
                    con.Close();
                }
            }
            txtbus_no.Items.Insert(0, new ListItem("--Select Bus No.--", "0"));
        }
    }

    private void Binddata(string Id)
    {
        try
        {
            btnsubmit.Text = "Update";
            SqlCommand com;
            string str;

            con.Open();
            str = "select * from add_bus where id='" + LblId.Text.Trim() + "'";
            com = new SqlCommand(str, con);
            SqlDataReader rd = com.ExecuteReader();
            if (rd.Read())
            {
                txtbus_no.Text = rd["bus_no"].ToString();
                txtbus_name.Text = rd["bus_name"].ToString();
                txtroute.Text = rd["route"].ToString();
                txtdriver_name.Text = rd["driver_name"].ToString();
                txtdriver_contact.Text = rd["driver_contact"].ToString();
                txtpassword.Text = rd["password"].ToString();
                lblimg_path.Text = rd["bus_timetable_image"].ToString();
            }
        }
        catch (Exception e1)
        {
            //string message = e1.Message;
        }
        finally
        {
            con.Close();
        }
    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        if (btnsubmit.Text == "Update")
        {
            Update_data();
        }
        else
        {
            Insert_data();
        }
    }

    string FileNamePicture;
    object id;
    private void Insert_data()
    {
        get_id();

        if (FileUpload1.HasFile)
        {
            string filename1 = FileUpload1.FileName;
            FileInfo fi = new FileInfo(filename1);
            string ext = fi.Extension;
            if (ext == ".JPG" || ext == ".bmp" || ext == ".png" || ext == ".jpeg" || ext == ".jpg")
            {
                FileNamePicture = id_new + "1" + "_timetable_image" + ext;
                FileUpload1.SaveAs(Server.MapPath("/images/timetable/") + FileNamePicture);
                Session["FullIconPath"] = "/images/timetable/" + FileNamePicture;
                Response.Write("<script type=\"text/javascript\">alert('File Uploaded, Save the Changes');</script>");
            }
            else
            {
                Response.Write("<script type=\"text/javascript\">alert('Invalid File Format..Please Choose Image File');</script>");
                Server.Transfer("Add-Bus.aspx");
            }
        }
        else
        {
            Session["FullIconPath"] = "/images/service_images/no_image.jpg" + FileNamePicture;
        }

        try
        {
            con.Open();
            string query = String.Format("insert into add_bus (bus_no, bus_name, route, driver_name, driver_contact, password, bus_timetable_image) values (@bus_no, @bus_name, @route, @driver_name, @driver_contact, @password, @bus_timetable_image)");
            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@bus_no", txtbus_no.Text);
            cmd.Parameters.AddWithValue("@bus_name", txtbus_name.Text);
            cmd.Parameters.AddWithValue("@route", txtroute.Text);
            cmd.Parameters.AddWithValue("@driver_name", txtdriver_name.Text);
            cmd.Parameters.AddWithValue("@driver_contact", txtdriver_contact.Text);
            cmd.Parameters.AddWithValue("@password", txtpassword.Text);
            cmd.Parameters.AddWithValue("@bus_timetable_image", Session["FullIconPath"].ToString());

            cmd.ExecuteNonQuery();
        }
        catch (Exception e1)
        {
            string msg = e1.Message;
        }
        finally
        {
            con.Close();
            Response.Redirect("Add-Bus.aspx");
        }
    }

    static Int32 id1;
    static Int32 id_new;
    private void get_id()
    {
        String mycon = "Persist Security Info=False;User ID=idealtec_r3_college_bus;Password=Mpiti@123;Initial Catalog=idealtec_r3_college_bus;Data Source=103.191.208.118";
        SqlConnection scon = new SqlConnection(mycon);
        String myquery = "select id from add_bus";
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = myquery;
        cmd.Connection = scon;
        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        DataSet ds = new DataSet();
        da.Fill(ds);
        scon.Close();
        if (ds.Tables[0].Rows.Count < 1)
        {
            id1 = 10001;

        }
        else
        {
            String mycon1 = "Persist Security Info=False;User ID=idealtec_r3_college_bus;Password=Mpiti@123;Initial Catalog=idealtec_r3_college_bus;Data Source=103.191.208.118";
            SqlConnection scon1 = new SqlConnection(mycon1);
            String myquery1 = "select max(id) from add_bus";
            SqlCommand cmd1 = new SqlCommand();
            cmd1.CommandText = myquery1;
            cmd1.Connection = scon1;
            SqlDataAdapter da1 = new SqlDataAdapter();
            da1.SelectCommand = cmd1;
            DataSet ds1 = new DataSet();
            da1.Fill(ds1);
            id = Convert.ToInt32(ds1.Tables[0].Rows[0][0].ToString());
            id1 = Convert.ToInt32(id.ToString());
            id_new = id1 + 1;
            scon1.Close();
        }
    }

    private void Update_data()
    {
        if (FileUpload1.HasFile)
        {
            string filename1 = FileUpload1.FileName;
            FileInfo fi = new FileInfo(filename1);
            string ext = fi.Extension;
            if (ext == ".JPG" || ext == ".bmp" || ext == ".png" || ext == ".jpeg" || ext == ".jpg")
            {
                FileNamePicture = LblId.Text + "1" + "_timetable_image" + ext;
                FileUpload1.SaveAs(Server.MapPath("/images/timetable/") + FileNamePicture);
                Session["FullIconPath"] = "/images/timetable/" + FileNamePicture;
                Response.Write("<script type=\"text/javascript\">alert('File Uploaded, Save the Changes');</script>");
            }
            else
            {
                Response.Write("<script type=\"text/javascript\">alert('Invalid File Format..Please Choose Image File');</script>");
                Server.Transfer("Add-Bus.aspx");
            }
        }
        else
        {
            Session["FullIconPath"] = lblimg_path.Text; // "/images/service_images/no_image.jpg" + FileNamePicture;
        }

        try
        {
            con.Open();
            string query = String.Format("update add_bus set bus_no=@bus_no, bus_name=@bus_name, route=@route, driver_name=@driver_name, driver_contact=@driver_contact, password=@password, bus_timetable_image=@bus_timetable_image where id='{0}'", LblId.Text);
            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@id", LblId.Text);
            cmd.Parameters.AddWithValue("@bus_no", txtbus_no.Text);
            cmd.Parameters.AddWithValue("@bus_name", txtbus_name.Text);
            cmd.Parameters.AddWithValue("@route", txtroute.Text);
            cmd.Parameters.AddWithValue("@driver_name", txtdriver_name.Text);
            cmd.Parameters.AddWithValue("@driver_contact", txtdriver_contact.Text);
            cmd.Parameters.AddWithValue("@password", txtpassword.Text);
            cmd.Parameters.AddWithValue("@bus_timetable_image", Session["FullIconPath"].ToString());

            cmd.ExecuteNonQuery();
        }
        catch (Exception e1)
        {
            string msg = e1.Message;
        }
        finally
        {
            con.Close();
            Response.Redirect("Add-Bus.aspx");
        }
    }
}