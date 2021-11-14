using Moq;
using System;
using System.Threading.Tasks;
using SystemAdmin.Common.Models;
using SystemAdmin.Repo.Repository;
using SystemAdmin.Services.Interfaces;
using SystemAdmin.Services.Services;
using SystemAdmin.xUnit.Test.MockRepository;
using SystemAdmin.xUnit.Test.Stubs;
using Xunit;

namespace SystemAdmin.xUnit.Test
{
    public class EmployeeServiceShould
    {
        private static IEmployeeService _employeeService;

        public EmployeeServiceShould()
        {
            Mock<IEmployeeRepository> _employeeRepository = new EmployeeRepositoryMock()._employeeRepository;
            _employeeService = new EmployeeService(_employeeRepository.Object);
        }


        [Fact]
        public async Task AddAsync_Ok()
        {
            //Arrange
            var employee = EmployeeStub.employee1;
            //Act
            var result = await _employeeService.AddAsync(employee);
            //Assert
            Assert.Equal(employee, result);
        }

        [Fact]
        public void AddAsync_Exeption()
        {
            //Arrange
            Employee employee = new();

            //Act
            try
            {
                var result = _employeeService.AddAsync(employee);
            }
            catch (Exception)
            {

                throw;
            }
            
            //Assert
        }
    }
}
