using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class kullaniciGiris : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-799PNBF; Initial Catalog=kullanici; Integrated Security=true");
        con.Open();


        SqlCommand cmd = new SqlCommand("Select Id from tblKullanici Where Eposta='" + exampleInputEmail1.Text + "' and Sifre='" + exampleInputPassword1.Text + "'", con);
        SqlDataReader dr = cmd.ExecuteReader();



        if (dr.Read())
        {
            kullanici.Id = dr.GetInt32(0);
         
            Response.Redirect("Default2.aspx");
        }
        else
        {
            Response.Write("Kullanıcı adı veya şifre hatalı");

        }
    }
}