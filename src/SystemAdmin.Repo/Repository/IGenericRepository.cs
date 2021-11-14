using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;

namespace SystemAdmin.Repo.Repository
{
    public interface IGenericRepository<T> where T : class
    {
        Task AddAsync(T model);
        void Update(T model);
        Task Delete(Guid Id);

        Task<IEnumerable<T>> GetAsync(
            Expression<Func<T, bool>> filter = null,
            Func<IQueryable<T>, IOrderedQueryable<T>> orderBy = null,
            string includeProperties = "");
        Task<IEnumerable<T>> GetAllAsync();
        Task<T> GetByIdAsync(Guid Id);
    }
}
