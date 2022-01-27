using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iTextSharp.text.pdf;
using iTextSharp.text.pdf.parser;
using System.Data.SqlClient;
using System.Collections;
using System.Threading.Tasks;
public partial class Default2 : System.Web.UI.Page
{

    SqlConnection con;
    SqlCommand cmd;
    SqlDataReader read;
    int ders = 0;
    string konu = "";
    int pdf_id = 0;
    string konum = "";
    string tarih = "";
    string ozet = "";
    String[] unvan = new String[3];
    String[] isim = new String[3];
    String[] soyad = new String[3];
    List<string> kelime = new List<string>();
    List<string> no = new List<string>();

    protected void Page_Load(object sender, EventArgs e)
    {
       if(!IsPostBack)
        {
            LoadData();
        }
    }
   
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        int a = kullanici.Id;
        int rowIndex = ((GridViewRow)((sender as Control)).NamingContainer).RowIndex;
     
        string filelocation = GridView1.Rows[rowIndex].Cells[3].Text;
        string FilePath = Server.MapPath("~/"+filelocation);

        WebClient User = new WebClient();

        Byte[] FileBuffer = User.DownloadData(FilePath);

        if(FileBuffer !=null)
        {
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-length", FileBuffer.Length.ToString());
            Response.BinaryWrite(FileBuffer);


        }
    }

    public Default2()
    {

    }


    void LoadData()
    {
        var st = from s in db.PDFFileTab select s;
        GridView1.DataSource = st;
        GridView1.DataBind();
    }

    DataClassesDataContext db = new DataClassesDataContext();
    protected void Button1_Click(object sender, EventArgs e)
    {
        string fname = FileUpload1.FileName;
        string flocation = "PDF File/";
        string pathstring = System.IO.Path.Combine(flocation, fname);
        var st = new PDFFileTab
        {
            FileName = FileUpload1.FileName,
            FileLocation = pathstring,
        };
        db.PDFFileTab.InsertOnSubmit(st);
        db.SubmitChanges();
        FileUpload1.SaveAs(MapPath(pathstring));
        Label1.Text = "Başarılı";
        LoadData();
        

        if (FileUpload1.HasFile)
            try
            {
                if (FileUpload1.PostedFile.ContentType == "application/pdf")
                {
                    FileUpload1.SaveAs("C:\\Users\\kanat\\source\\repos\\WebSite3\\WebSite3\\PDF File\\" + FileUpload1.FileName);
                    //Label1.Text = "Başarıyla kaydedildi";
                    konum = "C:\\Users\\kanat\\source\\repos\\WebSite3\\WebSite3\\PDF File\\" + FileUpload1.FileName;
                    Atama(@"C:\\Users\\kanat\\source\\repos\\WebSite3\\WebSite3\\PDF File\\" + FileUpload1.FileName);

                    con = new SqlConnection("Data Source=DESKTOP-799PNBF;Initial Catalog=kullanici;Integrated Security=True");
                    string komut;
                    komut = "INSERT INTO PDFFileTab(FileName,FileLocation,konu,tarih,ders,dad,dsoyad,dunvan,jad,jsoyad,junvan,jad1,jsoyad1,junvan1,ozet) VALUES('"+ FileUpload1.FileName + "','" + pathstring + "','"+ konu + "','" +tarih + "','"+ders  + "'," +
                        "'" + isim[0] + "','" + soyad[0] + "','" + unvan[0] + "','" + isim[1] + "','" + soyad[1] + "','" + unvan[1] + "','" + isim[2] + "','" + soyad[2] + "','" + unvan[2] + "','" + ozet + "')";
                    cmd = new SqlCommand(komut, con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                    con.Open();
                    komut = "SELECT MAX(SL) FROM PDFFileTab";
                    cmd = new SqlCommand(komut, con);
                    read = cmd.ExecuteReader();
                    if (read.Read())
                    {
                        pdf_id = read.GetInt32(0);
                    }
                    con.Close();

                    for (int k = 0; k < no.Count; k++)
                    {
                        con.Open();
                        komut = "INSERT INTO Pdfyazar(pdfid,ogrno) VALUES('" + pdf_id + "','" + no[k] + "')";
                        cmd = new SqlCommand(komut, con);
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }



                    for (int k = 0; k < kelime.Count; k++)
                    {
                        komut = "INSERT INTO Kelime(kelime,pdfid) VALUES('" + kelime[k] + "','" + pdf_id + "')";
                        cmd = new SqlCommand(komut, con);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                
                    con.Open();
                    komut = "INSERT INTO kullaniciPdf(kid,pdfid) VALUES('" + kullanici.Id + "','" + pdf_id + "')";
                    cmd = new SqlCommand(komut, con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Label1.Text = "basarili";
                }
                else
                {
                    Label1.Text = "Resim dosyası seçin.";
                }

            }
            catch (Exception ex)
            {
                Label1.Text = "Hata Oluştu: " + ex.Message.ToString();
            }
        else
        {
            Label1.Text = "Dosya Seçin ve GÖNDER Butonuna Tıklayın.";
        }

    }

   
    void Atama(string flocation)
    {
        ArrayList a = new ArrayList();
        StringBuilder sb = new StringBuilder();
        string file = flocation;
        using (PdfReader reader = new PdfReader(file))
        {
            for (int pageNo = 1; pageNo <= reader.NumberOfPages; pageNo++)
            {
                ITextExtractionStrategy strategy = new SimpleTextExtractionStrategy();
                string text = PdfTextExtractor.GetTextFromPage(reader, pageNo, strategy);
                text = Encoding.UTF8.GetString(ASCIIEncoding.Convert(Encoding.Default, Encoding.UTF8, Encoding.Default.GetBytes(text)));
                sb.Append(text);
                a.Add(text.ToString());
            }
        }
        String[] b = a[1].ToString().Split('\n');
        giris(b);
        b = a[3].ToString().Split('\n');
        metin_oku(b);
        b = a[9].ToString().Split('\n');
        Ozet(b);

    }

    void giris(String[] b)
    {
        int x = 0;

        for (int i = 0; i < b.Length; i++)
        {

            b[i] = b[i].TrimStart();
            b[i] = b[i].TrimEnd();
            b[i] = b[i].ToLower();
            //ders adı alındı
            if (b[i].Equals("bitirme projesi"))
            {
                ders = 1;
            }
            else if (b[i].Equals("araştırma problemleri"))
            {
                ders = 0;
            }
            //öğr üye alınmaya çalışıldı
            if (b[i].StartsWith("danışman,"))
            {
                String temp;
                temp = b[i - 1].Trim();

                int indeks = temp.IndexOf('.');
                if (indeks == 4)
                {
                    unvan[0] = "Prof.Dr.";
                }
                else if (indeks == 3)
                {
                    unvan[0] = "Doç.Dr.";
                }
                else if (indeks == 2)
                {
                    unvan[0] = "Dr. Öğretim Üyesi";
                }
                String[] c;
                c = temp.Split(' ');

                isim[0] = c[c.Length - 2];
                soyad[0] = c[c.Length - 1];
            }
            else if (b[i].StartsWith("jüri"))
            {
                x++;
                String temp;
                temp = b[i - 1].Trim();

                int indeks = temp.IndexOf('.');
                if (x == 1)
                {
                    if (indeks == 4)
                    {
                        unvan[1] = "Prof.Dr.";
                    }
                    else if (indeks == 3)
                    {
                        unvan[1] = "Doç.Dr.";
                    }
                    else if (indeks == 2)
                    {
                        unvan[1] = "Dr. Öğretim Üyesi";
                    }
                    String[] c;
                    c = temp.Split(' ');
                    isim[1] = c[c.Length - 2];
                    soyad[1] = c[c.Length - 1];
                }
                else if (x == 2)
                {
                    if (indeks == 4)
                    {
                        unvan[2] = "Prof.Dr.";
                    }
                    else if (indeks == 3)
                    {
                        unvan[2] = "Doç.Dr.";
                    }
                    else if (indeks == 2)
                    {
                        unvan[2] = "Dr. Öğretim Üyesi";
                    }
                    String[] c;
                    c = temp.Split(' ');
                    isim[2] = c[c.Length - 2];
                    soyad[2] = c[c.Length - 1];
                }
            }

            if (b[i].StartsWith("tezin"))//tarih alındı
            {
                int yil1;
                int ay;
                string yil;
                String tarih1;
                String[] t;
                t = b[i].Split(':');
                tarih1 = t[1];
                String[] t1;
                t1 = tarih1.Split('.');
                ay = Convert.ToInt32(t1[1]);
                yil1 = Convert.ToInt32(t1[2]) + 1;
                yil = t1[2];
                if (ay >= 3 && ay <= 7)
                {
                    tarih = yil + "-" + yil1.ToString() + "Bahar Dönemi";
                }
                else if (ay == 1 || ay == 2)
                {
                    tarih = yil + "-" + yil1.ToString() + "Güz Dönemi";
                }
                else if (ay >= 9 && ay <= 12)
                {
                    tarih = yil + "-" + yil1.ToString() + "Güz Dönemi";
                }
            }
        }
        x = 0;

    }

    void Ozet(String[] b)
    {

        int j = 0;
        String konu1 = "";
        String[] kelime1;
        //konu1 = b[0].TrimStart();
        for (int i = 0; i < b.Length; i++)
        {
            b[i] = b[i].TrimStart();//konu başlığı alındı
            b[i] = b[i].TrimEnd();

            if (b[i].Equals("ÖZET"))
            {
                j = i + 1;
                break;
            }
            konu1 = konu1 + " " + b[i];
        }
        konu = konu1.Trim();

        String ozet1;
        ozet1 = b[j];
        for (int i = j + 1; i < b.Length; i++)
        {
            if (b[i].StartsWith("Anahtar kelimeler:"))
            {
                j = i;
                if ((i + 1) != b.Length)
                {
                    if (b[i + 1] != " ")//anahtar kelimeler alındı
                    {
                        b[i] = b[i] + " " + b[i + 1];
                    }
                }
                break;
            }
            else
            {
                ozet1 = ozet1 + " " + b[i];//özet bilgisi alındı
            }

        }
        ozet = ozet1;
        String[] a = b[j].Split(':');
        kelime1 = a[1].Split(',');//anahtar kelime alındı.
        for (int m = 0; m < kelime1.Length; m++)
        {
            kelime.Add(kelime1[m]);
        }

    }

    void metin_oku(String[] b)
    {

        List<string> isimler = new List<string>();
        List<string> soyadlar = new List<string>();
        string ogrsoyad;
        List<int> durum = new List<int>();
        int x = 0;
        string no1;

        for (int i = 0; i < b.Length; i++)
        {
            if (b[i].StartsWith("Öğrenci"))
            {
                String[] c = b[i].Split(':');//öğrenci no alındı
                no1 = c[1].TrimStart();
                no.Add(no1);
                //Console.WriteLine(no);
                //öğretim durumu alındı
                if (no1.Substring(4, 2).Equals("01"))
                {
                    durum.Add(1);//1.öğretim
                    //Console.WriteLine(durum + "1.öğretim");
                }
                else if (no1.Substring(4, 2).Equals("02"))
                {
                    durum.Add(2);//2.öğretim
                    //Console.WriteLine(durum + "2.öğretim");
                }
                c = b[i + 1].Split(':');
                String d = c[1].TrimStart();//ad-soyad alındı
                c = d.Split(' ');
                isimler.Add(c[0].TrimStart());

                ogrsoyad = c[1].TrimStart();
                ogrsoyad = ogrsoyad.TrimEnd();
                soyadlar.Add(ogrsoyad);
                //Console.WriteLine(ad);
                //Console.WriteLine(soyad);

            }
        }
        for (int i = 0; i < isimler.Count; i++)
        {
            con = new SqlConnection("Data Source=DESKTOP-799PNBF;Initial Catalog=kullanici;Integrated Security=True");
            string komut;
            komut = "INSERT INTO Yazarss(ogrno,ad,soyad,ogrtur) VALUES('" + no[i] + "','" + isimler[i] + "','" + soyadlar[i] + "','" + durum[i] + "')";
            SqlCommand cmd = new SqlCommand(komut, con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }


    protected void TextBox2_TextChanged(object sender, EventArgs e)
    {

    }
}