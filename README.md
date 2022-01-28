# Web-Indexleme-ve-Metin-Parcalama
asp.net,bootstrap,Sql Server kullanılarak oluşturulmuş bir Web Sitesi

### ÖZET
 Kullanıcı ve yönetim kısmı bulunan bir web
uygulamasıdır. Kullanıcılar, kendi yükledikleri pdflere
ulaşabilmekte ve arama ile farklı kategorilerde
bulabilmektedir.
Anahtar Kelimeler: web, sql server, c#, asp.net, pdf
okuma.
## I. GİRİŞ
 Tasarlanan web sitede; kullanıcı ve admin
olmak üzere iki login ekranı açılmaktadır. Kullanıcı;
admin tarafından eklenmekte, pdf yükleme ve
pdfler arasında sorgulama yapabilmektedir.
Admin; kullanıcı ekleme ve silme işlemleriyle
beraber yüklenen pdfler arasınnda sorgulama
yapabilmektedir.
 Sisteme yüklenen pdfler okutularak içerisinden
yazar, ders adı, başlık, jüri ve danışman isimleri,
unvanları, özet ve anahtar kelime bilgileri elde
edilir. Elde edinilen bilgiler pdflerle beraber bir
tabloda tutulmaktadır. Kullanıcı bu bilgilere ve
bilgiler üzerinden yüklediği pdflere arama yaparak
ulaşabilmektedir. Admin, kullanıcıların yüklediği
pdflerin tamamını ve içerdikleri bilgileri
görebilmektedir.
 Yüklenen pdfler Microsoft Sql Server
tablolarında tutulmaktadır. Microsoft SQL Server™,
verilerin güvenle ve bütünlük içerisinde
depolanmasını ve aynı anda birden fazla kullanıcı
tarafından erişilmesini sağlayan kurumsal çaplı bir
ilişkisel veri tabanı yönetim sistemidir. Birbiriyle
ilişkili verilerin sistematik bir şekilde kaydedilmesini
ve bu verilerden beslenen uygulamalar tarafından
ihtiyaç anında kullanılmasına olanak sağlayarak
işletmelerin BT altyapılarındaki veri aktarımını
sorunsuz bir şekilde yönetmelerini sağlar.
 Projemizde pdf ve bilgileri PDFFileTab, yazar
bilgileri Yazarss, kullanıcı bilgileri tblKullanici,
admin bilgileri Admin, anahtar kelime bilgileri
Kelime isimli tablolarda tutulmaktadır. Yöntemler
ve mimari kısmında daha detaylı olarak
açıklanmaktadır.
## II. TEMEL BİLGİLER
 Proje; C# programlama dilinde
gerçekleştirilmiş olup geliştirme ortamı olarak
Visual Studio 2019 kullanılmıştır. Web formu
için ASP.NET tercih edilmiştir. Microsoft Sql
veritabanı olarak kullanılmıştır.
## III. YÖNTEM VE PROGRAM
MİMARİSİ
 Bu kısımda programın farklı özelliklerini
oluşturmak için kullandığımız araçlar ve
yöntemler üzerinde durularak ayrıntılı olarak
bilgi verilecektir. Program mimarisi daha
detaylı bir şekilde açıklanacaktır.
### A. Algoritma
 Dosya yükleme kontrolü olan FileUpload()
nesnesi web formuna eklenerek dosyaların
sunucuya yüklenmesini sağlamaktadır. Alınan
dosyanın konum bilgisi SaveAs() ile kaydedilir.
 Pdf okuma işlemi, Atama() fonksiyonunda
gerçekleştirilir. Konumu üzerinden pdf okuma
PdfReader ile gerçekleştirilir. İlk olarak okunan her
pdf sayfası ‘a’ isimli bir arraylist’e atanır.
Arraylistte tutulan sayfa, Split() fonksiyonu ile
parçalanarak her satırı bir String dizisinde tutulacak
şekilde atanır. Oluşturulan giris() fonksiyonuna
pdf’in ikinci sayfası gönderilerek tezin ait olduğu
ders, tezin teslim edildiği dönem, danışman ve jürilerin ad-soyad-unvan bilgileri elde edilir. Pdf’in
dördüncü sayfası olan Arraylist’in 4. Elemanı
metin_oku() fonksiyonuna gönderilerek Equals()
gibi eşitlik fonksiyonlarının kontrolü sonucu tez
yazar veya yazarlarının ad-soyad-numara-öğretim
bilgileri alınır. Bu fonksiyon içerisinde Sql bağlantısı
yapılarak elde edilen yazar bilgileri Yazarss
tablosuna “INSERT INTO” komutu kullanılarak
kaydedilir. Arraylist’in 9. İndisinde bulunan pdf’in
10. Sayfası Ozet() fonksiyonuna gönderilir. Bu
sayfadan Equals() fonksiyonu yardımıyla tez
konusu, özeti ve anahtar kelimeler alınır. Yazar
bilgileri ve anahtar kelime bilgileri oluşturulan
Listelerde tutulmaktadır.
 İlk olarak yüklenen pdf; PDFFileTab isimli
tabloya “INSERT INTO” komutuyla eklenir.
PDFFileTab tablosu; pdf id’si,adı,lokasyonu, tezin
konusu,ders ismi, danışman ve jüri üyelerinin isimsoyad-unvan bilgisi, tez tarihi ve tezin özet bilgisi
tutulmaktadır. Pdfyazar isimli, pdf ile yazarının
id’sinin tutulduğu tabloya ekleme yapılır. Pdflere
ait anahtar kelimelerin tutulması için Kelime isimli
pdfid ve kelime bilgisi içeren tablo oluşturulur.
Kelime listesindeki kelimeler bu tabloya sql komutu
ile eklenir. Kullanıcı bilgilerinin tutulması için
tblKullanici isimli, admin bilgilerinin tutulması için
ise Admin tablosu oluşturulmuştur.
![1](https://user-images.githubusercontent.com/56557278/151547826-e91bf758-028a-4dd7-b843-f6114a492f9c.PNG)
Program çalıştırıldığında kullanıcıyı bir ara yüz
karşılar. Bu ara yüzde toplamda 2 farklı textbox ve
buton bulunmaktadır. 1.Buton olan Giriş butonu
textbox ile sisteme giriş yapılan Kullanıcı Adı ve
Şifreyi sisteme kaydedilmesini sağlar. Veritabanına
kayıtlı Kullanıcı Adı ve şifresi yanlış ise Kullanıcının
tekrardan giriş yapmasını ister.Kullanıcı giriş
paneli,Pdf yükleme,kelime arama gibi işlemler için
bu kısımdan giriş yapılır.

![2](https://user-images.githubusercontent.com/56557278/151547952-a206cef0-04c0-46d2-93eb-722733a1dd09.PNG)

Şekil 2 Kullanıcı Paneli
Veritabanına pdf yükleme yapılan panel.Toplamda
2 adet buton bulunmaktadır.Butonlardan biri dosya
arama butonu, diğeri işe veritabanına pdf
adı,lokasyonu eklemek için kullanılan butondur.
Üst taraftakı menü sekmeleri sayesinde Admin
paneline,kelime arama sayfasıne,Kullanıcı Giriş
sayfasına yönlendirir.

![3](https://user-images.githubusercontent.com/56557278/151548015-d65c88e9-db9b-4bd4-ae29-74a3038806a2.PNG)

**Şekil 3 Kullanıcı Paneli**

9 adet textbox’dan oluşmaktadır.Birinci arama
kısmında yazar adı veritabanı üzerinden sorgulanır.
![ad](https://user-images.githubusercontent.com/56557278/151548126-ebc07774-efd3-4974-ae78-53ea84108269.png)

 **Şekil 4 Yazar arama**
DataGridWiev sayesinde sorgular ekran üzerinde
gösterilir.

![anahra](https://user-images.githubusercontent.com/56557278/151548158-509705a8-154c-47cf-a098-484057b3f8a6.PNG)

**Şekil 5 Anahtar Kelime arama**
İkinci arama kısmı bir adet textbox ve bir ad İkinci arama kısmı bir adet textbox ve bir adet
butondan oluşmaktadır.Anahtar Kelimeler
veritabanı üzerinden sorgulanır. DataGridWiev
sayesinde sorgular ekran üzerinde gösterilir.


![ders](https://user-images.githubusercontent.com/56557278/151548266-4886c8a6-9bff-489f-9281-065c044630f5.PNG)

**Şekil 6 Ders Adı arama**
Üçüncü arama kısmı bir adet textbox ve bir adet
butondan oluşmaktadır.ders isimleri veritabanı
üzerinden sorgulanır. DataGridWiev sayesinde
sorgular ekran üzerinde gösterilir.

![donem](https://user-images.githubusercontent.com/56557278/151548274-7b8b7d23-cb3b-4759-b5ba-9e99420b2b85.PNG)


**Şekil 7 Dönem arama**
Dorduncu arama kısmı bir adet textbox ve bir adet
butondan oluşmaktadır.Donem Adları veritabanı
üzerinden sorgulanır. DataGridWiev sayesinde
sorgular ekran üzerinde gösterilir.

![konu](https://user-images.githubusercontent.com/56557278/151548344-b039cccf-4723-4e2c-8dbc-d25b2bc1ff09.PNG)


**Şekil 8 Konu Arama**

Beşinci arama kısmı bir adet textbox ve bir adet
butondan oluşmaktadır.Pdf üzerindeki konular
veritabanı üzerinden sorgulanır. DataGridWiev
sayesinde sorgular ekran üzerinde gösterilir.

![dörtlü](https://user-images.githubusercontent.com/56557278/151548289-61c5f2aa-fbf4-4485-a136-adb6c411e063.PNG)


**Şekil 9 Dörtlü Sorgu**

Bu kısım 4 adet TextBox ve bir adet butonda
oluşmaktadır.Bu arama kısmında tarih,ders,ad ve
soyad textboxlarından giriş yapılarak 5’li sorgu
yapılabilir. veritabanı üzerinden sorgulanır.
DataGridWiev sayesinde sorgular ekran üzerinde
gösterilir.
![1a](https://user-images.githubusercontent.com/56557278/151548770-ad2250fa-3ce4-4f11-97b7-15a2e5509a14.PNG)

Bu kısımda Admini bir ara yüz karşılar. Bu ara yüzde
toplamda 2 farklı textbox ve buton bulunmaktadır.
1.Buton olan Giriş butonu textbox ile sisteme giriş
yapılmasını sağlar.Veritabanına kayıtlı Kullanıcı Adı
ve şifresi yanlış ise Kullanıcının tekrardan giriş
yapmasını ister.Adm,n giriş paneli,Pdf
yükleme,kelime arama gibi işlemler için bu
kısımdan giriş yapılır.
![2a](https://user-images.githubusercontent.com/56557278/151548773-8466de9c-8240-4760-95b0-3d47064884eb.PNG)

 **Şekil 11 Admin Paneli**
Bu kısımda kullanıcıyı bir ara yüz karşılar. Bu ara
yüzde toplamda 5 farklı textbox ve3 farklı buton
bulunmaktadır. 1.Buton olan Sil butonu textbox ile
sistemde kayıtlı Kullanıcı bilgilerini silmeyi,2.Buton
olan düzenle butonu sistemdeki kullanıcı bilgilerini
güncellemeye, 3.Buton olan ekle butonu sisteme
yeni kullanıcı eklemeye ve temizle butonuda
textbox girdilerini temizlemeye yarar.
Orta kısımda bulunan DataGridWievda
Veritabanındakı tüm pdf dosyalarını
görebiliriz.Ayrıca sistemde kayıtlı
pdAdı,Lokasyonu,Pdf’in konusu ,Tarihi ,Ders türü
Danişman Adı,soyadı,Unvanı,Ad ve soyadı ve özet
gibi bilgileride ekran üzerinde görünür.


## Veri Tabanı Sorguları

` Sorgu 1: SqlCommand cmd = new
SqlCommand("Select * from admin Where Adi='" +
exampleInputEmail1.Text + "' and Sifre='" +
exampleInputPassword1.Text + "'", con);
Sorgusu ile Admin giriş panelinden alınan ad soyad
bilgilerini admin tablosunda adi ve sifre adlı
kolonlarla sorgulamayı yapar.
Sorgu 2:
komut = "INSERT INTO
PDFFileTab(FileName,FileLocation,konu,tarih,ders,
dad,dsoyad,dunvan,jad,jsoyad,junvan,jad1,jsoy
ad1,junvan1,ozet) VALUES('"+
FileUpload1.FileName + "','" +
pathstring + "','"+ konu + "','" +tarih
+ "','"+ders + "'," +
 "'" +
isim[0] + "','" + soyad[0] +
"','" + unvan[0] + "','" +
isim[1] + "','" + soyad[1] +
"','" + unvan[1] + "','" +
isim[2] + "','" + soyad[2] +
"','" + unvan[2] + "','" + ozet +
"')";
PdfFile Tablosuna ekleme yapılan
sorgudur.
Sorgu 3:komut = "INSERT INTO
Pdfyazar(pdfid,ogrno) VALUES('" + pdf_id + "','" +
no[k] + "')";
Pdfyazar tablosuna ekleme yapılan sorgu.
Sorgu 4:komut = "INSERT INTO
Kelime(kelime,pdfid) VALUES('" + kelime[k] + "','" +
pdf_id + "')";
Kelime tablosuna ekleme yapılan sorgu.
Sorgu5:komut = "INSERT INTO
kullaniciPdf(kid,pdfid) VALUES('" + kullanici.Id + "','"
+ pdf_id + "')";
kullaniciPdf tablosuna ekleme yapılansorgu.
Sorgu 6:komut = "INSERT INTO
Yazarss(ogrno,ad,soyad,ogrtur) VALUES('" + no[i] +
"','" + isimler[i] + "','" + soyadlar[i] + "','" + durum[i]
+ "')";
Yazarss tablosuna ekleme yapılan sorgu.
Sorgu 7: string sqlquery = "SELECT
PDFFileTab.FileName FROM PDFFileTab INNER
JOIN Pdfyazar ON PDFFileTab.SL = Pdfyazar.pdfid
INNER JOIN Yazarss ON Pdfyazar.ogrno
=Yazarss.ogrno WHERE ad like '%'+@ad+'%'";
PDFFileTab, Pdfyazar ve Yazarss tabloları üzerinden
yazar adı aranan sorgu.
Sorgu 8:string sqlquery = "SELECT
PDFFileTab.FileName FROM PDFFileTab INNER
JOIN Kelime ON PDFFileTab.SL = Kelime.pdfid
WHERE Kelime.kelime like '%'+@kelime+'%'";
PDFFileTab ve Kelime tabloları üzerinden kelime
adı aranan sorgu.
Sorgu 9:string sqlquery = "SELECT
PDFFileTab.FileName FROM PDFFileTab WHERE
tarih like '%'+@tarih+'%'"; ;
PDFFileTab tablosu üzerinden tarih aranan sorgu.
Sorgu 10:string sqlquery = "SELECT
PDFFileTab.FileName FROM PDFFileTab WHERE
ders like '%'+@ders+'%'";
PDFFileTab tablosu üzerinden ders adı aranan
sorgu.
Sorgu 11:string sqlquery = "SELECT
PDFFileTab.FileName FROM PDFFileTab WHERE
konu like '%'+@konu+'%'";
PDFFileTab tablosu üzerinden konu aranan sorgu.
Sorgu 12:string sqlquery = "SELECT FileName
FROM PDFFileTab WHERE tarih like '%'+@tarih+'%'
and ders like'%'+@ders+'%' and SL IN(SELECT pdfid
FROM kullaniciPdf WHERE kid IN(SELECT kid FROM
tblKullanici WHERE Adi like '%'+@ad+'%' and
Soyadi like '%'+@soyad+'%'))";`
PDFFileTab, kullaniciPdf ve tblKullanici tabloları
üzerinden tarih,ders,id,ad,soyad aranan sorgu.
IV. DENEYSEL SONUÇLAR
 Projeyi araştırma aşamasında metin işleme ve
doğal dil işleme hakkında teorik bilgiler edindik. İlk
defa bir web uygulaması gerçekleştirdik. Web
uygulaması ile masaüstü uygulamanın farklarını
görmüş olduk. Asp.Net üzerinden web uygulaması
ortaya çıkarmayı deneyimledik. Bootstrap tasarım
kodlarını kullanarak deneyimledik. İlk kez HTML
dilinin kullanımının yanı sıra Microsoft Sql Server’ı
da ilk kez kullanmış olduk. Bu proje ile C#
programlama dili bilgimizi geliştirme imkanı
sağlamış olduk.

## V. SONUÇ
 C# ta web form yapısını ve nasıl
kullanıldığı öğrenildi.
 C# ta harici kütüphaneler ile işlemler
yapmayı öğrendik.
 C# ta List yapılarının nasıl kullanıldığı
öğrenildi.
 Asp.net ile web geliştirme platformunu
deneyimlemiş olduk.
 C# programlama dili kullanarak Sql
veritabanı ile bir web uygulaması
geliştirmiş olduk.
VI. YALANCI KOD
 BAŞLA
 Kullanıcı eposta ve şifre gir
 Eğer kullanıcı eposta ve şifre
veritabanındaki kullanıcı eposta ve şifre ile
eşleşiyor ise
 Default Formunu aç
 Gözat butonuna tıkla yüklenecek pdfi seç
 Pdfin ismini yaz
 Yükle butonuna tıkla
 Yüklenen pdfi Atama() fonksiyonunda oku
 Tarih, ders, danışman ad-soyad-unvan, jüri
ad-soyad-unvan, yazar ad-soyad-noöğretim türü, anahtar kelimeler ,özet
bilgilerini değişkenlere ata
 Elde edilen bilgileri Sql tablolarına kaydet
 Admin eposta ve şifre gir
 Eğer admin eposta ve şifre veritabanındaki
eposta ve şifre ile eşleşiyor ise
 Default2 Formunu aç
 Textboxa eposta sifre gir
 Ekle butonuna bas kullanıcı ekle
 Düzenle butonu ile kullanıcı bilgilerini
düzenle
 Panelde pdf ara’ ya bas
 Text’e yazar adı yaz
 Ara butonuna bas
 Panelde Home ‘a bas anasayfaya dön
 Bitir

