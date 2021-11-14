using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using System.Diagnostics.CodeAnalysis;
using System.Reflection;
using SystemAdmin.Common.Models;

namespace SystemAdmin.Repo
{
    [ExcludeFromCodeCoverage]
    public class Context : IdentityDbContext
    {
        #region Constructor
        public Context(DbContextOptions options) : base(options)
        {
        }
        #endregion

        public DbSet<Employee> Employee { get; set; }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            //
            builder.ApplyConfigurationsFromAssembly(Assembly.GetExecutingAssembly());
            base.OnModelCreating(builder);
        }
    }
}
