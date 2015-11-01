package main.java;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.SortDirection;

public class UserReg {

	PreparedQuery pq;
	DatastoreService ds;
	Query q;
	Long foundstat=null;
	public UserReg() {
		// TODO Auto-generated constructor stub
	}
	
	public UserReg(Long fid)
	{
		ds=DatastoreServiceFactory.getDatastoreService();
		q=new Query("user");
		
		q.setFilter(
				new Query.FilterPredicate("fid", Query.FilterOperator.EQUAL, fid)
				);
	}
	
	public Long getmyuid()
	{
		Long uid = null;
		
		
		PreparedQuery pq=ds.prepare(q);
		for(Entity result:pq.asIterable())
		{
		
			uid=(Long)result.getProperty("uid");
			
			
		}
		
		return uid;
		
	}	
	
	
	
	public UserReg(String v)
	{
		ds=DatastoreServiceFactory.getDatastoreService();
		
	}
	
	public String getflag(String field_get)
	{
		String flag="found";
		pq=ds.prepare(q);
		
		for(Entity result:pq.asIterable())
		{
		
			//wishi=(String)result.getProperty(field_get);
		
			foundstat=(Long)result.getProperty(field_get);
		}
		
		if(foundstat==null)
		{
			flag="notfound";
		}
		else
		{
			flag="found";
		}
		
		return flag;
	}
	
	
	public void putData(String myname,String loc,Long fid)
	{
		
		Long uid=getuid();
		Entity useradd=new Entity("user");
		
		//code to make a new entity
		String prof="NotDefined",hobby="Notdefined";
		
		
		useradd.setProperty("fid", fid);
		useradd.setProperty("uid", uid);
		useradd.setProperty("location", loc);
		useradd.setProperty("profession", prof);
		useradd.setProperty("hobby", hobby);
		useradd.setProperty("myname", myname);
		
		ds.put(useradd);
	}
	

	public Long getuid()
	{
		Long uid = null;
		
		
		q=new Query("user");
		
		q.setFilter(
				new Query.FilterPredicate("uid", Query.FilterOperator.GREATER_THAN_OR_EQUAL, 1)
				);
		q.addSort("uid",SortDirection.ASCENDING);
		PreparedQuery pq=ds.prepare(q);
		for(Entity result:pq.asIterable())
		{
		
			uid=(Long)result.getProperty("uid");
			
			
		}
		uid=uid+1;
		return uid;
		
	}
}
