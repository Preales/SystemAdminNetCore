using Moq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SystemAdmin.Common.Models;
using SystemAdmin.Repo.Repository;
using SystemAdmin.xUnit.Test.Stubs;

namespace SystemAdmin.xUnit.Test.MockRepository
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
            _employeeRepository.Setup(sp => sp.UpdateAsync(It.IsAny<Employee>())).Returns(Task.Delay(5));
            _employeeRepository.Setup(sp => sp.GetAllAsync()).ReturnsAsync(EmployeeStub.employees);
            _employeeRepository.Setup(sp => sp.GetByIdAsync(It.IsAny<Guid>())).ReturnsAsync(EmployeeStub.employee1);
        }
    }
}
