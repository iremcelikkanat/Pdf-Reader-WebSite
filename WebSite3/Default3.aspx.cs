using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class Default3 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    

    protected void ButSearch_Click(object sender, EventArgs e)
    {
        int id = kullanici.Id;
        string mainconn = ConfigurationManager.ConnectionStrings["Myconnection"].ConnectionString;
        SqlConnection sqlconn = new SqlConnection(mainconn);
        sqlconn.Open();

        SqlCommand sqlcomn = new SqlCommand();
        string sqlquery = "SELECT PDFFileTab.FileName FROM PDFFileTab INNER JOIN Pdfyazar ON PDFFileTab.SL = Pdfyazar.pdfid  INNER JOIN Yazarss ON Pdfyazar.ogrno  =Yazarss.ogrno WHERE ad like '%'+@ad+'%'";
        sqlcomn.CommandText = sqlquery;
        sqlcomn.Connection = sqlconn;
        sqlcomn.Parameters.AddWithValue("ad", Textsearch.Text);
        DataTable dt = new DataTable();
        SqlDataAdapter sda = new SqlDataAdapter(sqlcomn);
        sda.Fill(dt);
        GridView1.DataSource = dt;
        GridView1.DataBind();
        sqlconn.Close();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string mainconn = ConfigurationManager.ConnectionStrings["Myconnection"].ConnectionString;
        SqlConnection sqlconn = new SqlConnection(mainconn);
        sqlconn.Open();

        SqlCommand sqlcomn = new SqlCommand();
        string sqlquery = "SELECT PDFFileTab.FileName FROM PDFFileTab INNER JOIN Kelime ON PDFFileTab.SL = Kelime.pdfid WHERE Kelime.kelime like '%'+@kelime+'%'";
        sqlcomn.CommandText = sqlquery;
        sqlcomn.Connection = sqlconn;
        sqlcomn.Parameters.AddWithValue("kelime", TextBox1.Text);
        DataTable dt = new DataTable();
        SqlDataAdapter sda = new SqlDataAdapter(sqlcomn);
        sda.Fill(dt);
        GridView3.DataSource = dt;
        GridView3.DataBind();
        sqlconn.Close();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        string mainconn = ConfigurationManager.ConnectionStrings["Myconnection"].ConnectionString;
        SqlConnection sqlconn = new SqlConnection(mainconn);
        sqlconn.Open();

        SqlCommand sqlcomn = new SqlCommand();
        string sqlquery = "SELECT PDFFileTab.FileName FROM PDFFileTab  WHERE tarih like '%'+@tarih+'%'"; 
        sqlcomn.CommandText = sqlquery;
        sqlcomn.Connection = sqlconn;
        sqlcomn.Parameters.AddWithValue("tarih", TextBox2.Text);
        DataTable dt = new DataTable();
        SqlDataAdapter sda = new SqlDataAdapter(sqlcomn);
        sda.Fill(dt);
        GridView2.DataSource = dt;
        GridView2.DataBind();
        sqlconn.Close();
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        string mainconn = ConfigurationManager.ConnectionStrings["Myconnection"].ConnectionString;
        SqlConnection sqlconn = new SqlConnection(mainconn);
        sqlconn.Open();

        SqlCommand sqlcomn = new SqlCommand();
        string sqlquery = "SELECT PDFFileTab.FileName FROM PDFFileTab  WHERE ders like '%'+@ders+'%'";
        sqlcomn.CommandText = sqlquery;
        sqlcomn.Connection = sqlconn;
    
        if(TextBox3.Text=="Araştırma Problemleri")
        {
            TextBox3.Text ="0";
        }
        else if(TextBox3.Text =="Bitirme Projesi")
        {
            TextBox3.Text = "1";
        }
        else
        {
            Console.WriteLine("");
        }
        sqlcomn.Parameters.AddWithValue("ders", TextBox3.Text);
        DataTable dt = new DataTable();
        SqlDataAdapter sda = new SqlDataAdapter(sqlcomn);
        sda.Fill(dt);
        GridView4.DataSource = dt;
        GridView4.DataBind();
        sqlconn.Close();
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        string mainconn = ConfigurationManager.ConnectionStrings["Myconnection"].ConnectionString;
        SqlConnection sqlconn = new SqlConnection(mainconn);
        sqlconn.Open();

        SqlCommand sqlcomn = new SqlCommand();
        string sqlquery = "SELECT PDFFileTab.FileName FROM PDFFileTab  WHERE konu like '%'+@konu+'%'"; 
        sqlcomn.CommandText = sqlquery;
        sqlcomn.Connection = sqlconn;

        sqlcomn.Parameters.AddWithValue("konu", TextBox4.Text);
        DataTable dt = new DataTable();
        SqlDataAdapter sda = new SqlDataAdapter(sqlcomn);
        sda.Fill(dt);
        GridView5.DataSource = dt;
        GridView5.DataBind();
        sqlconn.Close();
    }




    protected void Button5_Click(object sender, EventArgs e)
    {

        string mainconn = ConfigurationManager.ConnectionStrings["Myconnection"].ConnectionString;
        SqlConnection sqlconn = new SqlConnection(mainconn);
        sqlconn.Open();

        SqlCommand sqlcomn = new SqlCommand();


        string sqlquery = "SELECT FileName FROM PDFFileTab WHERE tarih like '%'+@tarih+'%'  and ders like'%'+@ders+'%' and SL IN(SELECT pdfid FROM kullaniciPdf WHERE kid IN(SELECT kid FROM tblKullanici WHERE Adi like '%'+@ad+'%' and Soyadi like '%'+@soyad+'%'))";
        sqlcomn.CommandText = sqlquery;
        sqlcomn.Connection = sqlconn;
        if (TextBox6.Text == "Araştırma Problemleri")
        {
            TextBox6.Text = "0";
        }
        else if (TextBox6.Text == "Bitirme Projesi")
        {
            TextBox6.Text = "1";
        }
        else
        {
            Console.WriteLine("");
        }
        sqlcomn.Parameters.AddWithValue("tarih", TextBox5.Text);
        sqlcomn.Parameters.AddWithValue("ders", TextBox6.Text);
        sqlcomn.Parameters.AddWithValue("ad", TextBox7.Text);
        sqlcomn.Parameters.AddWithValue("soyad", TextBox8.Text);
        DataTable dt = new DataTable();
        SqlDataAdapter sda = new SqlDataAdapter(sqlcomn);
        sda.Fill(dt);
        GridView6.DataSource = dt;
        GridView6.DataBind();
        sqlconn.Close();
    }
}