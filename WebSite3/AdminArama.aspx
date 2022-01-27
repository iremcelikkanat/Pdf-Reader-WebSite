<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminArama.aspx.cs" Inherits="AdminArama" %>

<!DOCTYPE html>
 
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Kelime Arama</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
         <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
            
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="Default.aspx">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="Default.aspx">Geri Dön</a></li>
                       
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Page content-->
        <div class="container">
       
        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <center>
            <hr />
            Yazar ad:<asp:TextBox ID="Textsearch" runat="server"></asp:TextBox>
        <asp:Button ID="ButSearch" runat="server" Text="Ara" OnClick="ButSearch_Click" />
        <hr />
        <asp:GridView ID="GridView1" runat="server" ShowHeaderWhenEmpty="true" EmptyDataText="kayit yok">


        </asp:GridView>

                     <hr />
            Anahtar Kelime:<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="Ara" OnClick="Button1_Click" />
        <hr />
        <asp:GridView ID="GridView3" runat="server" ShowHeaderWhenEmpty="true" EmptyDataText="kayit yok">


        </asp:GridView>

                                 <hr />
            Donem:<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <asp:Button ID="Button2" runat="server" Text="Ara" OnClick="Button2_Click" />
        <hr />
        <asp:GridView ID="GridView2" runat="server" ShowHeaderWhenEmpty="true" EmptyDataText="kayit yok">


        </asp:GridView>
                                        <hr />
            Ders:<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <asp:Button ID="Button3" runat="server" Text="Ara" OnClick="Button3_Click" />
        <hr />
        <asp:GridView ID="GridView4" runat="server" ShowHeaderWhenEmpty="true" EmptyDataText="kayit yok">


        </asp:GridView>

             <hr />
            Konu:<asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <asp:Button ID="Button4" runat="server" Text="Ara" OnClick="Button4_Click" />
        <hr />
        <asp:GridView ID="GridView5" runat="server" ShowHeaderWhenEmpty="true" EmptyDataText="kayit yok">


        </asp:GridView>
              <hr />
            tarih:<asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            ders:<asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
            ad:<asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
            soyad:<asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
            <asp:Button ID="Button5" runat="server" Text="Button" OnClick="Button5_Click" />

             <hr />
              <asp:GridView ID="GridView6" runat="server" ShowHeaderWhenEmpty="true" EmptyDataText="kayit yok">


        </asp:GridView>
            </center>

    </div>
    </form>
</body>
</html>