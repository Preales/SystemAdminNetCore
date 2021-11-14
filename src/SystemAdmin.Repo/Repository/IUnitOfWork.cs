using System;
using System.Threading.Tasks;
using SystemAdmin.Common.Models;

namespace SystemAdmin.Repo.Repository
{
    public interface IUnitOfWork : IDisposable
    {
        IGenericRepository<Employee> EmployeeRepository { get; }

        void SaveChanges();
        Task SaveChangesAsync();
    }
}
