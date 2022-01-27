<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
         <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Bare - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            width: 377px;
            height: 337px;
        }
        .auto-style2 {
            width: 350px;
        }
        .auto-style3 {
            margin-left: 0px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="#">Admin Paneli</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="adminGiris.aspx">Anasayfa</a></li>
                        <li class="nav-item"><a class="nav-link" href="AdminArama.aspx">Kelime Arama</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Menü</a>
                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="kullaniciGiris.aspx">Kullanıcı Girişe Dön</a></li>
                          
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
          
            </div>
        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <table class="auto-style1" align="center">
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:ListView ID="ListView1" runat="server" DataKeyNames="Id" DataSourceID="SqlDataSource1" InsertItemPosition="LastItem">
                        <AlternatingItemTemplate>
                            <tr style="background-color: #FAFAD2; color: #284775;">
                                <td>
                                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Sil" />
                                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Düzenle" />
                                </td>
                                <td>
                                    <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="KadiLabel" runat="server" Text='<%# Eval("Kadi") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="AdiLabel" runat="server" Text='<%# Eval("Adi") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="SoyadiLabel" runat="server" Text='<%# Eval("Soyadi") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="EpostaLabel" runat="server" Text='<%# Eval("Eposta") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="SifreLabel" runat="server" Text='<%# Eval("Sifre") %>' />
                                </td>
                            </tr>
                        </AlternatingItemTemplate>
                        <EditItemTemplate>
                            <tr style="background-color: #FFCC66; color: #000080;">
                                <td>
                                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Güncelleştir" />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="İptal" />
                                </td>
                                <td>
                                    <asp:Label ID="IdLabel1" runat="server" Text='<%# Eval("Id") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="KadiTextBox" runat="server" Text='<%# Bind("Kadi") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="AdiTextBox" runat="server" Text='<%# Bind("Adi") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="SoyadiTextBox" runat="server" Text='<%# Bind("Soyadi") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="EpostaTextBox" runat="server" Text='<%# Bind("Eposta") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="SifreTextBox" runat="server" Text='<%# Bind("Sifre") %>' />
                                </td>
                            </tr>
                        </EditItemTemplate>
                        <EmptyDataTemplate>
                            <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
                                <tr>
                                    <td>Hiçbir veri döndürülmedi.</td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        <InsertItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Ekle" />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Temizle" />
                                </td>
                                <td>&nbsp;</td>
                                <td>
                                    <asp:TextBox ID="KadiTextBox" runat="server" Text='<%# Bind("Kadi") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="AdiTextBox" runat="server" Text='<%# Bind("Adi") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="SoyadiTextBox" runat="server" Text='<%# Bind("Soyadi") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="EpostaTextBox" runat="server" Text='<%# Bind("Eposta") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="SifreTextBox" runat="server" Text='<%# Bind("Sifre") %>' />
                                </td>
                            </tr>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <tr style="background-color: #FFFBD6; color: #333333;">
                                <td>
                                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Sil" />
                                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Düzenle" />
                                </td>
                                <td>
                                    <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="KadiLabel" runat="server" Text='<%# Eval("Kadi") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="AdiLabel" runat="server" Text='<%# Eval("Adi") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="SoyadiLabel" runat="server" Text='<%# Eval("Soyadi") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="EpostaLabel" runat="server" Text='<%# Eval("Eposta") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="SifreLabel" runat="server" Text='<%# Eval("Sifre") %>' />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table runat="server">
                                <tr runat="server">
                                    <td runat="server">
                                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;">
                                            <tr runat="server" style="background-color: #FFFBD6; color: #333333;">
                                                <th runat="server"></th>
                                                <th runat="server">Id</th>
                                                <th runat="server">Kadi</th>
                                                <th runat="server">Adi</th>
                                                <th runat="server">Soyadi</th>
                                                <th runat="server">Eposta</th>
                                                <th runat="server">Sifre</th>
                                            </tr>
                                            <tr id="itemPlaceholder" runat="server">
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr runat="server">
                                    <td runat="server" style="text-align: center; background-color: #FFCC66; font-family: Verdana, Arial, Helvetica, sans-serif; color: #333333;">
                                        <asp:DataPager ID="DataPager1" runat="server">
                                            <Fields>
                                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                            </Fields>
                                        </asp:DataPager>
                                    </td>
                                </tr>
                            </table>
                        </LayoutTemplate>
                        <SelectedItemTemplate>
                            <tr style="background-color: #FFCC66; font-weight: bold; color: #000080;">
                                <td>
                                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Sil" />
                                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Düzenle" />
                                </td>
                                <td>
                                    <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="KadiLabel" runat="server" Text='<%# Eval("Kadi") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="AdiLabel" runat="server" Text='<%# Eval("Adi") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="SoyadiLabel" runat="server" Text='<%# Eval("Soyadi") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="EpostaLabel" runat="server" Text='<%# Eval("Eposta") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="SifreLabel" runat="server" Text='<%# Eval("Sifre") %>' />
                                </td>
                            </tr>
                        </SelectedItemTemplate>
                    </asp:ListView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:kullaniciConnectionString2 %>" DeleteCommand="DELETE FROM [tblKullanici] WHERE [Id] = @Id AND ([Kadi] = @Kadi) AND ([Adi] = @Adi)  AND ([Soyadi] = @Soyadi)  AND ([Eposta] = @Eposta) AND ([Sifre] = @Sifre)" InsertCommand="INSERT INTO [tblKullanici] ([Kadi], [Adi], [Soyadi], [Eposta], [Sifre]) VALUES (@Kadi, @Adi, @Soyadi, @Eposta, @Sifre)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [Id], [Kadi], [Adi], [Soyadi], [Eposta], [Sifre] FROM [tblKullanici]" UpdateCommand="UPDATE [tblKullanici] SET [Kadi] = @Kadi, [Adi] = @Adi, [Soyadi] = @Soyadi, [Eposta] = @Eposta, [Sifre] = @Sifre WHERE [Id] = @original_Id AND (([Kadi] = @original_Kadi) OR ([Kadi] IS NULL AND @original_Kadi IS NULL)) AND (([Adi] = @original_Adi) OR ([Adi] IS NULL AND @original_Adi IS NULL)) AND (([Soyadi] = @original_Soyadi) OR ([Soyadi] IS NULL AND @original_Soyadi IS NULL)) AND (([Eposta] = @original_Eposta) OR ([Eposta] IS NULL AND @original_Eposta IS NULL)) AND (([Sifre] = @original_Sifre) OR ([Sifre] IS NULL AND @original_Sifre IS NULL))">
                        <DeleteParameters>
                            <asp:Parameter Name="Id" />
                            <asp:Parameter Name="Kadi" />
                            <asp:Parameter Name="Adi" />
                            <asp:Parameter Name="Soyadi" />
                            <asp:Parameter Name="Eposta" />
                            <asp:Parameter Name="Sifre" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Kadi" Type="String" />
                            <asp:Parameter Name="Adi" Type="String" />
                            <asp:Parameter Name="Soyadi" Type="String" />
                            <asp:Parameter Name="Eposta" Type="String" />
                            <asp:Parameter Name="Sifre" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Kadi" Type="String" />
                            <asp:Parameter Name="Adi" Type="String" />
                            <asp:Parameter Name="Soyadi" Type="String" />
                            <asp:Parameter Name="Eposta" Type="String" />
                            <asp:Parameter Name="Sifre" Type="String" />
                            <asp:Parameter Name="original_Id" Type="Int32" />
                            <asp:Parameter Name="original_Kadi" Type="String" />
                            <asp:Parameter Name="original_Adi" Type="String" />
                            <asp:Parameter Name="original_Soyadi" Type="String" />
                            <asp:Parameter Name="original_Eposta" Type="String" />
                            <asp:Parameter Name="original_Sifre" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="Black" GridLines="Horizontal" Width="983px" DataKeyNames="SL">
                        <Columns>
                            <asp:BoundField DataField="SL" HeaderText="ID" SortExpression="SL" InsertVisible="False" ReadOnly="True" />
                            <asp:BoundField DataField="FileName" HeaderText="Pdf Adı" SortExpression="FileName" />
                            <asp:BoundField DataField="FileLocation" HeaderText="Lokasyon" SortExpression="FileLocation" />
                            <asp:BoundField DataField="konu" HeaderText="Konu" SortExpression="konu" />
                            <asp:BoundField DataField="tarih" HeaderText="Tarih" SortExpression="tarih" />
                            <asp:BoundField DataField="ders" HeaderText="Ders" SortExpression="ders" />
                            <asp:BoundField DataField="dad" HeaderText="Danışman Adı" SortExpression="dad" />
                            <asp:BoundField DataField="dsoyad" HeaderText="Danışman SoyAdı" SortExpression="dsoyad" />
                            <asp:BoundField DataField="junvan1" HeaderText="Juri Unvan" SortExpression="junvan1" />
                            <asp:BoundField DataField="jsoyad1" HeaderText="Juri Soyad" SortExpression="jsoyad1" />
                            <asp:BoundField DataField="jad1" HeaderText="jad1" SortExpression="jad1" />
                            <asp:BoundField DataField="junvan" HeaderText="junvan" SortExpression="junvan" />
                            <asp:BoundField DataField="jsoyad" HeaderText="jsoyad" SortExpression="jsoyad" />
                            <asp:BoundField DataField="jad" HeaderText="Juri Ad" SortExpression="jad" />
                            <asp:BoundField DataField="dunvan" HeaderText="Danışman Unvan" SortExpression="dunvan" />
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
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
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:kullaniciConnectionString10 %>" SelectCommand="SELECT [SL], [FileName], [FileLocation], [konu], [tarih], [ders], [dad], [dsoyad], [junvan1], [jsoyad1], [jad1], [junvan], [jsoyad], [jad], [dunvan] FROM [PDFFileTab]"></asp:SqlDataSource>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" CssClass="auto-style3" DataSourceID="SqlDataSource3" ForeColor="Black" GridLines="Horizontal" Width="993px">
                        <Columns>
                            <asp:BoundField DataField="FileName" HeaderText="Pdf Adı" SortExpression="FileName" />
                            <asp:BoundField DataField="ozet" HeaderText="Özet" SortExpression="ozet" />
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
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
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:deneme %>" SelectCommand="SELECT [FileName], [ozet] FROM [PDFFileTab]"></asp:SqlDataSource>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
