using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Query;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;

namespace SystemAdmin.Repo.Repository
{

    public class GenericRepository<T> : IDisposable, IGenericRepository<T> where T : class 
    {
        protected Context _context;
        private readonly DbSet<T> _dbSet;

        public GenericRepository(Context context)
        {
            _context = context;
            _dbSet = _context.Set<T>();
        }

        protected IQueryable<T> PrepareQuery(
            IQueryable<T> query,
            Expression<Func<T, bool>> predicate = null,
            Func<IQueryable<T>, IIncludableQueryable<T, object>> include = null,
            string includeProperties = "",
            Func<IQueryable<T>, IOrderedQueryable<T>> orderBy = null,
            int? take = null
        )
        {

            if (include != null)
                query = include(query);

            foreach (var includeProperty in includeProperties.Split
                (new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries))
                query = query.Include(includeProperty);

            if (predicate != null)
                query = query.Where(predicate);

            if (orderBy != null)
                query = orderBy(query);

            if (take.HasValue)
                query = query.Take(Convert.ToInt32(take));

            return query;
        }

        public async Task AddAsync(T model)
        {
            await _dbSet.AddAsync(model);
        }

        public void Update(T model)
        {
            _dbSet.Update(model);            
        }

        public async Task Delete(Guid Id)
        {
            var model = await GetByIdAsync(Id);
            if (model != null)
            {
                var property = model.GetType().GetProperty("Estado");
                if (property is null) throw new ArgumentNullException();
                property.SetValue(model, false);
                _dbSet.Update(model);
            }
        }

        public virtual async Task<IEnumerable<T>> GetAsync(
            Expression<Func<T, bool>> filter = null,
            Func<IQueryable<T>, IOrderedQueryable<T>> orderBy = null,
            string includeProperties = "")
        {
            IQueryable<T> query = _dbSet;

            query = PrepareQuery(query, filter, null, includeProperties, orderBy, null);

            return await query.ToListAsync();
        }

        public async Task<IEnumerable<T>> GetAllAsync()
            => await _dbSet.ToListAsync();

        public async Task<T> GetByIdAsync(Guid Id)
            => await _dbSet.FindAsync(Id);

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

        ~GenericRepository() => Dispose(false);
        #endregion

    }
}