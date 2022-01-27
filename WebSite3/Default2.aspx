<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
      <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>PDF Yükleme</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            width: 300px;
        }
        .auto-style2 {
            width: 285px;
        }
        .auto-style3 {
            width: 285px;
            height: 30px;
        }
        .auto-style4 {
            height: 30px;
        }
        .auto-style5 {
            height: 21px;
        }
        .auto-style6 {
            height: 21px;
            width: 150px;
        }
        .auto-style7 {
            width: 150px;
        }
        .auto-style8 {
            width: 300px;
            margin-right: 1px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="#">Kullanıcı Paneli</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="adminGiris.aspx">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="Default3.aspx">Kelime Arama</a></li>
                        <li class="nav-item dropdown" style="left: 0px; top: 0px; width: 1186px">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">MENÜ</a>
                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#">Action</a></li>
                                <li><a class="dropdown-item" href="#">Another action</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="#">Something else here</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Page content-->
        <div class="container">
            <div class="text-center mt-5">

            </div>
        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <div>
            <table class="auto-style1" align="center">
                <tr>
                    <td class="auto-style2" style="background-color: #000000; color: #FFFFFF;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Dosya Yükle</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3"><asp:FileUpload ID="FileUpload1" runat="server" />
                    </td>
                    <td class="auto-style4"></td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Button ID="Button1" runat="server" Text="Yükle" OnClick="Button1_Click" Width="203px" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label1" runat="server"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:GridView ID="GridView1" runat="server" Width="306px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" Text='<%# Bind("FileName") %>' onclick="LinkButton1_Click"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F7F7F7" />
                            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                            <SortedDescendingCellStyle BackColor="#E5E5E5" />
                            <SortedDescendingHeaderStyle BackColor="#242121" />
                        </asp:GridView>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <table class="auto-style8">
                            <tr>
                                <td class="auto-style5"></td>
                                <td class="auto-style6"></td>
                                <td class="auto-style6">&nbsp;</td>
                                <td class="auto-style6">&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td class="auto-style7">&nbsp;</td>
                                <td class="auto-style7">
                                    &nbsp;</td>
                                <td class="auto-style7">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td class="auto-style7">&nbsp;</td>
                                <td class="auto-style7">&nbsp;</td>
                                <td class="auto-style7">&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td class="auto-style7">&nbsp;</td>
                                <td class="auto-style7">
                                    &nbsp;</td>
                                <td class="auto-style7">&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td class="auto-style7">&nbsp;</td>
                                <td class="auto-style7">&nbsp;</td>
                                <td class="auto-style7">&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td class="auto-style7">&nbsp;</td>
                                <td class="auto-style7">
                                    &nbsp;</td>
                                <td class="auto-style7">&nbsp;</td>
                            </tr>
                        </table>
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
