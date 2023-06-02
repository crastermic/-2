using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace курсач_тц_новый;

public partial class MalldbContext : DbContext
{
    public MalldbContext()
    {
    }

    public MalldbContext(DbContextOptions<MalldbContext> options)
        : base(options)
    {
    }

    public virtual DbSet<TblCardhall> TblCardhalls { get; set; }

    public virtual DbSet<TblHall> TblHalls { get; set; }

    public virtual DbSet<TblPavilion> TblPavilions { get; set; }

    public virtual DbSet<TblRoom> TblRooms { get; set; }

    public virtual DbSet<TblStat> TblStats { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseMySql("host=localhost;user=root;password=student;database=malldb", Microsoft.EntityFrameworkCore.ServerVersion.Parse("8.0.32-mysql"));

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder
            .UseCollation("utf8mb4_0900_ai_ci")
            .HasCharSet("utf8mb4");

        modelBuilder.Entity<TblCardhall>(entity =>
        {
            entity.HasKey(e => e.IdCard).HasName("PRIMARY");

            entity.ToTable("tbl_cardhall");

            entity.HasIndex(e => e.CardHall, "FK_tbl_cardhall_tbl_hall_IdHall");

            entity.HasIndex(e => e.CardPav, "FK_tbl_cardhall_tbl_pavilion_Idpav");

            entity.HasIndex(e => e.CardRoom, "FK_tbl_cardhall_tbl_rooms_IdRoom");

            entity.HasIndex(e => e.CardStat, "FK_tbl_cardhall_tbl_stat_IdStat");

            entity.HasOne(d => d.CardHallNavigation).WithMany(p => p.TblCardhalls)
                .HasForeignKey(d => d.CardHall)
                .HasConstraintName("FK_tbl_cardhall_tbl_hall_IdHall");

            entity.HasOne(d => d.CardPavNavigation).WithMany(p => p.TblCardhalls)
                .HasForeignKey(d => d.CardPav)
                .HasConstraintName("FK_tbl_cardhall_tbl_pavilion_Idpav");

            entity.HasOne(d => d.CardRoomNavigation).WithMany(p => p.TblCardhalls)
                .HasForeignKey(d => d.CardRoom)
                .HasConstraintName("FK_tbl_cardhall_tbl_rooms_IdRoom");
        });

        modelBuilder.Entity<TblHall>(entity =>
        {
            entity.HasKey(e => e.IdHall).HasName("PRIMARY");

            entity.ToTable("tbl_hall");

            entity.Property(e => e.HallSide).HasMaxLength(255);
        });

        modelBuilder.Entity<TblPavilion>(entity =>
        {
            entity.HasKey(e => e.Idpav).HasName("PRIMARY");

            entity.ToTable("tbl_pavilion");

            entity.HasIndex(e => e.PavStatistic, "FK_tbl_pavilion_tbl_graf_IdGraf");

            entity.Property(e => e.PavAdre).HasMaxLength(255);
            entity.Property(e => e.PavMail).HasMaxLength(255);
            entity.Property(e => e.PavMenag).HasMaxLength(255);
            entity.Property(e => e.PavName).HasMaxLength(255);
            entity.Property(e => e.PavOwner).HasMaxLength(255);
            entity.Property(e => e.PavTeleph).HasMaxLength(255);
            entity.Property(e => e.PavTitle).HasMaxLength(255);
        });

        modelBuilder.Entity<TblRoom>(entity =>
        {
            entity.HasKey(e => e.IdRoom).HasName("PRIMARY");

            entity.ToTable("tbl_rooms");

            entity.Property(e => e.RoomName).HasMaxLength(255);
        });

        modelBuilder.Entity<TblStat>(entity =>
        {
            entity.HasKey(e => e.IdStat).HasName("PRIMARY");

            entity.ToTable("tbl_stat");

            entity.HasIndex(e => e.StatCardId, "FK_tbl_stat_tbl_cardhall_CardStat");

            entity.Property(e => e.StatCardId).HasColumnName("StatCardID");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
