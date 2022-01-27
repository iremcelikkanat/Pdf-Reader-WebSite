using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// kullanici için özet açıklama
/// </summary>
public class kullanici
{
    static int id;
    static string ad;
    public kullanici()
    {
        //
        //TODO: Buraya oluşturucu mantığı ekleyin
        //
    }

    public static int Id { get => id; set => id = value; }
    public static string Ad { get => ad; set => ad = value; }
}