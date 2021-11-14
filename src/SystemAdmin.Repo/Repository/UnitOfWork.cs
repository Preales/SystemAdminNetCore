using System;
using System.Threading.Tasks;
using SystemAdmin.Common.Models;
using SystemAdmin.Repo.Repository;

namespace SystemAdmin.Repo.Repository
{
    public class UnitOfWork : IUnitOfWork
    {
        private readonly Context _context;
        private IGenericRepository<Employee> _employeeRepository;

        public UnitOfWork(Context context)
        {
            _context = context;
        }

        public IGenericRepository<Employee> EmployeeRepository => _employeeRepository ?? new EmployeeRepository(_context);

        public void SaveChanges()
        {
            _context.SaveChanges();
        }

        public async Task SaveChangesAsync()
        {
            await _context.SaveChangesAsync();
        }

        #region Implementacion Disposable

        private bool disposed = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposed && disposing)
                    _context.Dispose();
            this.disposed = true;
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        
        #endregion
    }
}
