using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using System;
using System.Threading;
using System.Threading.Tasks;
using SystemAdmin.Common.Models;
using SystemAdmin.Repo;
using SystemAdmin.Repo.Data;

namespace SystemAdmin.HostedServices
{
    public class MigratorHostedService : IHostedService, IDisposable
    {
        private readonly IServiceProvider _serviceProvider;

        public MigratorHostedService(
            IServiceProvider serviceProvider)
        {
            _serviceProvider = serviceProvider;
        }

        public async Task StartAsync(CancellationToken cancellationToken)
        {
            using var scope = _serviceProvider.CreateScope();
            using (var _context = scope.ServiceProvider.GetService<Context>())
            {
                var userManager = (UserManager<User>)scope.ServiceProvider.GetService(typeof(UserManager<User>));
                await _context.Database.MigrateAsync(CancellationToken.None);
                var seedDb = new SeedDb(_context, userManager);
                await seedDb.SeedDbAsync();
            }

        }
        public Task StopAsync(CancellationToken cancellationToken)
                => Task.CompletedTask;

        #region IDisposable Support
        private bool disposedValue = false; // Para detectar llamadas redundantes
        protected virtual void Dispose(bool disposing)
        {
            disposedValue = true;
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        ~MigratorHostedService() => Dispose(false);

        #endregion
    }
}