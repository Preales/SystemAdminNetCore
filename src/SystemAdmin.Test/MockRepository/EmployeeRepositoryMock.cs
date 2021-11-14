using Microsoft.EntityFrameworkCore;
using Moq;
using System;
using System.Threading.Tasks;
using SystemAdmin.Common.Models;
using SystemAdmin.Repo.Repository;
using SystemAdmin.Test.Stubs;

namespace SystemAdmin.Test.MockRepository
{
    public class EmployeeRepositoryMock
    {
        public Mock<IEmployeeRepository> _employeeRepository { get; set; }

        public EmployeeRepositoryMock()
        {
            _employeeRepository = new Mock<IEmployeeRepository>();
            Setup();
        }

        private void Setup()
        {
            _employeeRepository.Setup(sp => sp.AddAsync(It.IsAny<Employee>())).Returns(Task.Delay(5));
            _employeeRepository.Setup(sp => sp.AddAsync(null)).Throws(new DbUpdateException("Entity is null"));
            _employeeRepository.Setup(sp => sp.Update(It.IsAny<Employee>()));
            _employeeRepository.Setup(sp => sp.GetAllAsync()).ReturnsAsync(EmployeeStub.employees);
            _employeeRepository.Setup(sp => sp.GetByIdAsync(It.IsAny<Guid>())).ReturnsAsync(EmployeeStub.employee1);
            _employeeRepository.Setup(sp => sp.GetByIdentificationAsync("78546321")).ReturnsAsync(EmployeeStub.employee2);
        }
    }
}
