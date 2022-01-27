﻿#pragma warning disable 1591
//------------------------------------------------------------------------------
// <auto-generated>
//     Bu kod araç tarafından oluşturuldu.
//     Çalışma Zamanı Sürümü:4.0.30319.42000
//
//     Bu dosyada yapılacak değişiklikler yanlış davranışa neden olabilir ve
//     kod yeniden oluşturulursa kaybolur.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.Linq;
using System.Data.Linq.Mapping;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;



[global::System.Data.Linq.Mapping.DatabaseAttribute(Name="kullanici")]
public partial class DataClassesDataContext : System.Data.Linq.DataContext
{
	
	private static System.Data.Linq.Mapping.MappingSource mappingSource = new AttributeMappingSource();
	
  #region Extensibility Method Definitions
  partial void OnCreated();
  partial void InsertPDFFileTab(PDFFileTab instance);
  partial void UpdatePDFFileTab(PDFFileTab instance);
  partial void DeletePDFFileTab(PDFFileTab instance);
  #endregion
	
	public DataClassesDataContext() : 
			base(global::System.Configuration.ConfigurationManager.ConnectionStrings["kullaniciConnectionString1"].ConnectionString, mappingSource)
	{
		OnCreated();
	}
	
	public DataClassesDataContext(string connection) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public DataClassesDataContext(System.Data.IDbConnection connection) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public DataClassesDataContext(string connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public DataClassesDataContext(System.Data.IDbConnection connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public System.Data.Linq.Table<PDFFileTab> PDFFileTab
	{
		get
		{
			return this.GetTable<PDFFileTab>();
		}
	}
}

[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.PDFFileTab")]
public partial class PDFFileTab : INotifyPropertyChanging, INotifyPropertyChanged
{
	
	private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
	
	private int _SL;
	
	private string _FileName;
	
	private string _FileLocation;
	
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnSLChanging(int value);
    partial void OnSLChanged();
    partial void OnFileNameChanging(string value);
    partial void OnFileNameChanged();
    partial void OnFileLocationChanging(string value);
    partial void OnFileLocationChanged();
    #endregion
	
	public PDFFileTab()
	{
		OnCreated();
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_SL", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
	public int SL
	{
		get
		{
			return this._SL;
		}
		set
		{
			if ((this._SL != value))
			{
				this.OnSLChanging(value);
				this.SendPropertyChanging();
				this._SL = value;
				this.SendPropertyChanged("SL");
				this.OnSLChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_FileName", DbType="NVarChar(50)")]
	public string FileName
	{
		get
		{
			return this._FileName;
		}
		set
		{
			if ((this._FileName != value))
			{
				this.OnFileNameChanging(value);
				this.SendPropertyChanging();
				this._FileName = value;
				this.SendPropertyChanged("FileName");
				this.OnFileNameChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_FileLocation", DbType="NVarChar(150)")]
	public string FileLocation
	{
		get
		{
			return this._FileLocation;
		}
		set
		{
			if ((this._FileLocation != value))
			{
				this.OnFileLocationChanging(value);
				this.SendPropertyChanging();
				this._FileLocation = value;
				this.SendPropertyChanged("FileLocation");
				this.OnFileLocationChanged();
			}
		}
	}
	
	public event PropertyChangingEventHandler PropertyChanging;
	
	public event PropertyChangedEventHandler PropertyChanged;
	
	protected virtual void SendPropertyChanging()
	{
		if ((this.PropertyChanging != null))
		{
			this.PropertyChanging(this, emptyChangingEventArgs);
		}
	}
	
	protected virtual void SendPropertyChanged(String propertyName)
	{
		if ((this.PropertyChanged != null))
		{
			this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
		}
	}
}
#pragma warning restore 1591
