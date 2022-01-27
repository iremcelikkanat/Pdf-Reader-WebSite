using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class kullaniciEkle : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-799PNBF; Initial Catalog=kullanici; Integrated Security=true");
        con.Open();

        SqlCommand cmd = new SqlCommand("Insert into tblKullanici(Kadi, Adi, Soyadi, Eposta, Sifre) values ('" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "','" + TextBox5.Text + "')", con);
        cmd.ExecuteNonQuery();

    }
}