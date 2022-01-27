<%@ Page Language="C#" AutoEventWireup="true" CodeFile="kullaniciGiris.aspx.cs" Inherits="kullaniciGiris" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    
    <style type="text/css">
        .auto-style1 {
            width: 300px;
        }
    </style>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Bare - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
         <!-- Responsive navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="#">Kullanıcı Paneli</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="kullaniciGiris.aspx">Anasayfa</a></li>
                        <li class="nav-item"><a class="nav-link" href="adminGiris.aspx">Admin Giriş</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">MENÜ</a>
                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="adminGiris.aspx">Admin Giriş</a></li>
                              
                                <li><hr class="dropdown-divider" /></li>
                         
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Page content-->
        <div class="container">
            <div class="text-center mt-5">
                <h1>Kullanıcı Girişi</h1>
                <p class="lead">Kullanıcı girişlerini bu sayfadan yapınız.</p>
                <p>Kocaeli Üniversitesi</p>
            </div>
        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <div>

        </div>
        <table class="auto-style1"  align="center">
            <tr>
                <td>   <label for="exampleInputEmail1">Kullanıcı Adı:</label></td>
                <td>
                    <asp:TextBox ID="exampleInputEmail1" TextMode="Email" runat="server" CssClass="form-control"  aria-describedby="emailHelp"></asp:TextBox>
                   
                </td>
            </tr>
            <tr>
                <td> <label for="exampleInputPassword1">Şifre:</label></td>
                <td>
                    <asp:TextBox ID="exampleInputPassword1" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                    <small id="emailHelp" class="form-text text-muted">Şifrenizi kimseyle paylaşmayın</small>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="Giriş" OnClick="Button1_Click" CssClass="btn btn-danger" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>