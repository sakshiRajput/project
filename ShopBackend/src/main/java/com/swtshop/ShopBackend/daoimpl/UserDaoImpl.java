package com.swtshop.ShopBackend.daoimpl;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;

import org.hibernate.SessionFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.hibernate.query.Query;
import com.swtshop.ShopBackend.dao.UserDao;
import com.swtshop.ShopBackend.model.Author;
import com.swtshop.ShopBackend.model.BillingAddress;
import com.swtshop.ShopBackend.model.ShippingAddress;
import com.swtshop.ShopBackend.model.User;
@Repository("userDao")
@Transactional
public class UserDaoImpl implements UserDao {


	@Autowired 
    SessionFactory sessionFactory;
//,	BillingAddress ba, ShippingAddress sa
          public boolean addUser(User u) {
		Session ss=	sessionFactory.getCurrentSession();
		 BillingAddress ba = u.getBillingaddress();
		 ShippingAddress sa = u.getShippingaddress();
		u.setUserId(u.getUserName());
	    Author auth=new Author();
		auth.setUsername(u.getUserId());
		auth.setAuthority("ROLE_USER");
		u.setActive(true);
		
			ss.persist(auth);
			ss.persist(u);
			ss.persist(ba);
			ss.persist(sa);
			
		
		return true;


}
	public List<User> getUser() {
		Session ss=sessionFactory.getCurrentSession();
		@SuppressWarnings("rawtypes")
		Query qu=ss.createQuery("from User");
		@SuppressWarnings("unchecked")
		List<User> listUser=(List<User>)qu.list();
		return listUser;

	}
	
	
		
	
public User getUserById(String id)
{
		
		
		
			return (User) sessionFactory.getCurrentSession().get(User.class, id);
		   
	}

public boolean updateUser(User u)
{
	
	 Session s =sessionFactory.getCurrentSession();
     s.update(u);
	return true;
	}
	
}
