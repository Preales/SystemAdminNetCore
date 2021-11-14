using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using SystemAdmin.Common.Models;
using SystemAdmin.Repo.Repository;
using SystemAdmin.Services.Interfaces;

namespace SystemAdmin.Services.Services
{
    public class EmployeeService : IEmployeeService
    {
        private readonly IUnitOfWork _unitOfWork;

        #region Constructor
        public EmployeeService(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }
        #endregion

        public async Task<IEnumerable<Employee>> GetAllAsync()
            => await _unitOfWork.EmployeeRepository.GetAllAsync();

        public async Task<Employee> GetByIdAsync(Guid Id)
            => await _unitOfWork.EmployeeRepository.GetByIdAsync(Id);

        public async Task<Employee> GetByIdentificationAsync(string Identification)
        {
            var result = await _unitOfWork.EmployeeRepository.GetAsync(w => w.Identification == Identification);
            return result.FirstOrDefault();
        }

        public async Task<Employee> AddAsync(Employee entity)
        {
            await _unitOfWork.EmployeeRepository.AddAsync(entity);
            await _unitOfWork.SaveChangesAsync();
            return entity;
        }

        public async Task<Employee> UpdateAsync(Employee entity)
        {
            _unitOfWork.EmployeeRepository.Update(entity);
            await _unitOfWork.SaveChangesAsync();
            return entity;
        }
    }
}

#region Cambios
//public class EmployeeService : BaseService, IEmployeeService
//{
//    #region Constructor
//    public EmployeeService(Context context) : base(context)
//    {
//    }
//    #endregion

//    public async Task<IEnumerable<Employee>> GetAllAsync()
//        => await _contexto.Employee.ToListAsync();

//    public async Task<Employee> GetByIdAsync(Guid Id)
//        => await _contexto.Employee.FindAsync(Id);

//    public async Task<Employee> GetByIdentidadAsync(string Identity)
//        => await _contexto.Employee.Where(w => w.Identification == Identity).FirstOrDefaultAsync();

//    public async Task<Employee> PostAsync(Employee entity)
//    {
//        _contexto.Employee.Add(entity);
//        await _contexto.SaveChangesAsync();
//        return entity;
//    }

//    public async Task<Employee> PutAsync(Employee entity)
//    {
//        var entry = await GetByIdAsync(entity.Id);
//        _contexto.Entry(entry).CurrentValues.SetValues(entity);
//        await _contexto.SaveChangesAsync();
//        return entity;
//    }
//}

//public class EmployeeService : GenericRepository<Employee>, IEmployeeService //BaseService, IEmployeeService
//{
//    #region Constructor
//    public EmployeeService(Context context) : base(context)
//    {
//    }
//    #endregion


//    public async Task<IEnumerable<Employee>> GetAllAsync()
//        => await _contexto.Employee.ToListAsync();

//    public async Task<Employee> GetByIdAsync(Guid Id)
//        => await _contexto.Employee.FindAsync(Id);

//    public async Task<Employee> GetByIdentidadAsync(string Identity)
//        => await _context.Employee.Where(w => w.Identification == Identity).FirstOrDefaultAsync();

//    public async Task<Employee> AddAsync(Employee entity)
//    {
//        _contexto.Employee.Add(entity);
//        await _contexto.SaveChangesAsync();
//        return entity;
//    }

//    public async Task<Employee> UpdateAsync(Employee entity)
//    {
//        var entry = await GetByIdAsync(entity.Id);
//        _contexto.Entry(entry).CurrentValues.SetValues(entity);
//        await _contexto.SaveChangesAsync();
//        return entity;
//    }
//}

#endregion