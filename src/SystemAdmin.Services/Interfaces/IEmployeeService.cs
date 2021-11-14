using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using SystemAdmin.Common.Models;

namespace SystemAdmin.Services.Interfaces
{
    public interface IEmployeeService
    {
        Task<IEnumerable<Employee>> GetAllAsync();
        Task<Employee> GetByIdAsync(Guid Id);
        Task<Employee> GetByIdentificationAsync(string Identification);
        Task<Employee> AddAsync(Employee entity);
        Task<Employee> UpdateAsync(Employee entity);
    }
}
