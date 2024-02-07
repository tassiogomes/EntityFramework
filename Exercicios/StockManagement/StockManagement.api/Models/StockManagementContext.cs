using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace StockManagement.api.Models;

public partial class StockManagementContext : DbContext
{
    public StockManagementContext()
    {
    }

    public StockManagementContext(DbContextOptions<StockManagementContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Family> Families { get; set; }

    public virtual DbSet<GetFamily> GetFamilies { get; set; }

    public virtual DbSet<GetProduct> GetProducts { get; set; }

    public virtual DbSet<GetProductsStock> GetProductsStocks { get; set; }

    public virtual DbSet<GetProductsStockByWarehouse> GetProductsStockByWarehouses { get; set; }

    public virtual DbSet<GetWarehouse> GetWarehouses { get; set; }

    public virtual DbSet<Product> Products { get; set; }

    public virtual DbSet<Stock> Stocks { get; set; }

    public virtual DbSet<StocksDetail> StocksDetails { get; set; }

    public virtual DbSet<StocksHeader> StocksHeaders { get; set; }

    public virtual DbSet<Warehouse> Warehouses { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        => optionsBuilder.UseSqlServer("name=DBConnectionString");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Family>(entity =>
        {
            entity.HasKey(e => e.FamilyId).HasName("PK__Family__41D82F6B93434E6E");

            entity.ToTable("Family");

            entity.Property(e => e.FamilyId).HasMaxLength(10);
            entity.Property(e => e.FamilyName).HasMaxLength(60);
            entity.Property(e => e.InsertDateTime)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.InsertUserId)
                .HasMaxLength(30)
                .HasDefaultValueSql("(original_login())");
            entity.Property(e => e.LastModifiedDateTime).HasColumnType("datetime");
            entity.Property(e => e.LastModifiedUserId).HasMaxLength(60);
        });

        modelBuilder.Entity<GetFamily>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("GetFamilies");

            entity.Property(e => e.FamilyId).HasMaxLength(10);
            entity.Property(e => e.FamilyName).HasMaxLength(60);
        });

        modelBuilder.Entity<GetProduct>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("GetProducts");

            entity.Property(e => e.Ean13code)
                .HasMaxLength(13)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("EAN13Code");
            entity.Property(e => e.FamilyId).HasMaxLength(10);
            entity.Property(e => e.ProductId).HasMaxLength(15);
            entity.Property(e => e.ProductName).HasMaxLength(150);
        });

        modelBuilder.Entity<GetProductsStock>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("GetProductsStock");

            entity.Property(e => e.ProductId).HasMaxLength(15);
            entity.Property(e => e.ProductName).HasMaxLength(150);
            entity.Property(e => e.Stock).HasColumnType("decimal(38, 5)");
        });

        modelBuilder.Entity<GetProductsStockByWarehouse>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("GetProductsStockByWarehouse");

            entity.Property(e => e.ProductName).HasMaxLength(150);
            entity.Property(e => e.StockAvailable).HasColumnType("decimal(18, 5)");
            entity.Property(e => e.WarehouseName).HasMaxLength(60);
        });

        modelBuilder.Entity<GetWarehouse>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("GetWarehouses");

            entity.Property(e => e.WarehouseId).HasMaxLength(10);
            entity.Property(e => e.WarehouseName).HasMaxLength(60);
        });

        modelBuilder.Entity<Product>(entity =>
        {
            entity.HasKey(e => e.ProductId).HasName("PK__Product__B40CC6CDD0E79483");

            entity.ToTable("Product");

            entity.HasIndex(e => e.Ean13code, "UQ__Product__4425E36934F9973B").IsUnique();

            entity.Property(e => e.ProductId).HasMaxLength(15);
            entity.Property(e => e.Ean13code)
                .HasMaxLength(13)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("EAN13Code");
            entity.Property(e => e.FamilyId).HasMaxLength(10);
            entity.Property(e => e.InsertDateTime)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.InsertUserId)
                .HasMaxLength(30)
                .HasDefaultValueSql("(original_login())");
            entity.Property(e => e.LastModifiedDateTime).HasColumnType("datetime");
            entity.Property(e => e.LastModifiedUserId).HasMaxLength(60);
            entity.Property(e => e.ProductName).HasMaxLength(150);

            entity.HasOne(d => d.Family).WithMany(p => p.Products)
                .HasForeignKey(d => d.FamilyId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Product__FamilyI__3B75D760");
        });

        modelBuilder.Entity<Stock>(entity =>
        {
            entity.HasKey(e => new { e.ProductId, e.WarehouseId }).HasName("PK__Stock__366C4C323299A516");

            entity.ToTable("Stock");

            entity.HasIndex(e => e.StockAvailable, "Stock_StockAvailable");

            entity.Property(e => e.ProductId).HasMaxLength(15);
            entity.Property(e => e.WarehouseId).HasMaxLength(10);
            entity.Property(e => e.InsertDateTime)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.InsertUserId)
                .HasMaxLength(30)
                .HasDefaultValueSql("(original_login())");
            entity.Property(e => e.LastModifiedDateTime).HasColumnType("datetime");
            entity.Property(e => e.LastModifiedUserId).HasMaxLength(60);
            entity.Property(e => e.StockAvailable).HasColumnType("decimal(18, 5)");

            entity.HasOne(d => d.Product).WithMany(p => p.Stocks)
                .HasForeignKey(d => d.ProductId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Stock__ProductId__3E52440B");

            entity.HasOne(d => d.Warehouse).WithMany(p => p.Stocks)
                .HasForeignKey(d => d.WarehouseId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Stock__Warehouse__3F466844");
        });

        modelBuilder.Entity<StocksDetail>(entity =>
        {
            entity.HasKey(e => new { e.DocumentType, e.DocumentNumber, e.DocumentLineNumber }).HasName("PK__StocksDe__F871093C0A2534EF");

            entity.HasIndex(e => e.ProductId, "StocksDetails_ProductId");

            entity.HasIndex(e => e.WarehouseId, "StocksDetails_WarehouseId");

            entity.Property(e => e.DocumentType)
                .HasMaxLength(1)
                .IsUnicode(false)
                .IsFixedLength();
            entity.Property(e => e.InitValue).HasColumnType("decimal(18, 4)");
            entity.Property(e => e.InsertDateTime)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.InsertUserId)
                .HasMaxLength(30)
                .HasDefaultValueSql("(original_login())");
            entity.Property(e => e.LastModifiedDateTime).HasColumnType("datetime");
            entity.Property(e => e.LastModifiedUserId).HasMaxLength(60);
            entity.Property(e => e.ProductId).HasMaxLength(15);
            entity.Property(e => e.Quantity).HasColumnType("decimal(18, 5)");
            entity.Property(e => e.TotalLineValue)
                .HasComputedColumnSql("([Quantity]*[InitValue])", false)
                .HasColumnType("decimal(37, 9)");
            entity.Property(e => e.WarehouseId).HasMaxLength(10);

            entity.HasOne(d => d.StocksHeader).WithMany(p => p.StocksDetails)
                .HasForeignKey(d => new { d.DocumentType, d.DocumentNumber })
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__StocksDetails__440B1D61");
        });

        modelBuilder.Entity<StocksHeader>(entity =>
        {
            entity.HasKey(e => new { e.DocumentType, e.DocumentNumber }).HasName("PK__StocksHe__3F0EB6CABB9A6C81");

            entity.ToTable("StocksHeader");

            entity.HasIndex(e => e.DocumentDate, "StocksHeader_DocumentDate").IsDescending();

            entity.HasIndex(e => e.DocumentType, "StocksHeader_DocumentType");

            entity.Property(e => e.DocumentType)
                .HasMaxLength(1)
                .IsUnicode(false)
                .HasDefaultValue("E")
                .IsFixedLength();
            entity.Property(e => e.DocumentDate).HasDefaultValueSql("(getdate())");
            entity.Property(e => e.InsertDateTime)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.InsertUserId)
                .HasMaxLength(30)
                .HasDefaultValueSql("(original_login())");
            entity.Property(e => e.LastModifiedDateTime).HasColumnType("datetime");
            entity.Property(e => e.LastModifiedUserId).HasMaxLength(60);
        });

        modelBuilder.Entity<Warehouse>(entity =>
        {
            entity.HasKey(e => e.WarehouseId).HasName("PK__Warehous__2608AFF9FDC14376");

            entity.ToTable("Warehouse");

            entity.Property(e => e.WarehouseId).HasMaxLength(10);
            entity.Property(e => e.InsertDateTime)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.InsertUserId)
                .HasMaxLength(30)
                .HasDefaultValueSql("(original_login())");
            entity.Property(e => e.LastModifiedDateTime).HasColumnType("datetime");
            entity.Property(e => e.LastModifiedUserId).HasMaxLength(60);
            entity.Property(e => e.WarehouseName).HasMaxLength(60);
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
