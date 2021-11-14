using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SystemAdmin.Common.Base;

namespace SystemAdmin.Repo.Base
{
    public class BaseConfig<T> : IEntityTypeConfiguration<T> where T : ModelBase
    {
        public virtual void Configure(EntityTypeBuilder<T> builder)
        {
            //builder.Property(x => x.CreationUser).IsRequired(false).HasMaxLength(20);
            //builder.Property(x => x.CreationDate).IsRequired(false).HasColumnType("smalldatetime");
            //builder.Property(x => x.ModificationUser).IsRequired(false).HasMaxLength(20);
            //builder.Property(x => x.ModificationDate).IsRequired(false).HasColumnType("smalldatetime");
            //builder.Property(x => x.Deleted).IsRequired(false);
            
        }
    }
}
