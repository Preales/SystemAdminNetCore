using SystemAdmin.Common.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace SystemAdmin.Repo.Configurations
{

    public class EmployeeConfig : IEntityTypeConfiguration<Employee>
    {
        public void Configure(EntityTypeBuilder<Employee> builder)
        {
            builder.HasKey(pk => pk.Id);
            builder.Property(p => p.Id).IsRequired().ValueGeneratedOnAdd();
            builder.Property(p => p.Name).HasMaxLength(60).IsRequired();
            builder.Property(p => p.LastName).HasMaxLength(60).IsRequired();
            builder.Property(p => p.Identification).HasMaxLength(10).IsRequired();
            builder.Property(p => p.Charge).HasMaxLength(50).IsRequired();
            
        }
    }
}
