package dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import model.Product;
import util.HibernateUtil;


/**
 * CRUD database operations
 * @author Abdus Salam
 * @since 21/12/2019
 *
 */
public class ProductDao {
	
	/**
	 * Save Product
	 * @param product
	 */
	
	public void saveProduct(Product product) {
		Transaction transaction = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			// save the student object
			session.save(product);
			// commit transaction
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
	}
	
	
	public void saveProduct2(Product product) {
		
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();

		try{
			session.beginTransaction();
			session.save(product);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.getTransaction().commit();
			session.close();
			sessionFactory.close();
		}
	}

	/**
	 * Update Product
	 * @param product
	 */
	public void updateProduct(Product product) {
		Transaction transaction = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			// save the student object
			session.update(product);
			// commit transaction
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
	}

	/**
	 * Delete Product
	 * @param id
	 */
	public void deleteProduct(int id) {

		Transaction transaction = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();

			// Delete a user object
			Product product = session.get(Product.class, id);
			if (product != null) {
				session.delete(product);
				System.out.println("product is deleted");
			}

			// commit transaction
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
	}

	/**
	 * Get Product By ID
	 * @param id
	 * @return
	 */
	public Product getProduct(int id) {

		Transaction transaction = null;
		Product product = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			// get an user object
			product = session.get(Product.class, id);
			// commit transaction
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return product;
	}
	
	/**
	 * Get all Products
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Product> getAllProduct() {

		Transaction transaction = null;
		List<Product> listOfUser = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			// get an user object
			
			//listOfUser = session.createQuery("from product").list();
			listOfUser = session.createCriteria(Product.class).list();
			
			// commit transaction
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return listOfUser;
	}
}