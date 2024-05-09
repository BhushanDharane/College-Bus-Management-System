using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZXing;

public partial class StudentQRCodeShow : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            lblmobile.Text = Session["mobile"].ToString();
            GenerateCode(lblmobile.Text);
            lblscan_mobile_no.Text = Session["mobile"].ToString();
        }
        catch (Exception e1)
        {
            //string msg = e1.Message;
        }
    }

    private void GenerateCode(string name)
    {
        BarcodeWriter writer = new BarcodeWriter();
        writer.Format = BarcodeFormat.QR_CODE;
        Bitmap result = writer.Write(name);
        string path = Server.MapPath("~/images/QRImage.jpg");
        Bitmap barcodeBitmap = new Bitmap(result);

        using (MemoryStream memory = new MemoryStream())
        {
            using (FileStream fs = new FileStream(path, FileMode.Create, FileAccess.ReadWrite))
            {
                barcodeBitmap.Save(memory, ImageFormat.Jpeg);
                byte[] bytes = memory.ToArray();
                fs.Write(bytes, 0, bytes.Length);
            }
        }
        imgQRCode.Visible = true;
        imgQRCode.ImageUrl = "~/images/QRImage.jpg";
    }
}