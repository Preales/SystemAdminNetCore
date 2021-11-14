using Microsoft.EntityFrameworkCore;
using System;
using System.Linq;
using System.Threading.Tasks;
using SystemAdmin.Common.Models;

namespace SystemAdmin.Repo.Repository
{
    public interface IEmployeeRepository : IGenericRepository<Employee>
    {
        Task<Employee> GetByIdentificationAsync(string Identification);
    }

    public class EmployeeRepository : GenericRepository<Employee>, IEmployeeRepository
    {
        public EmployeeRepository(Context context) : base(context)
        {                
        }

        public async Task<Employee> GetByIdentificationAsync(string Identification)
            => await _context.Employee.Where(w => w.Identification == Identification).FirstOrDefaultAsync();

    }
}
