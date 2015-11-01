package main.java;

import java.util.ArrayList;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;

public class MyFetch {

	public String wishi,descr="val";
	PreparedQuery pq;
	DatastoreService ds;
	Query q;
	public MyFetch() {
		// TODO Auto-generated constructor stub
		
		
	}
	
	public MyFetch(Long wid)
	{
		ds=DatastoreServiceFactory.getDatastoreService();
		q=new Query("wish");
		//Key k=KeyFactory.createKey("user", "chris");
		q.setFilter(
				new Query.FilterPredicate("wishid", Query.FilterOperator.EQUAL, wid)
				);
	}
	
	public ArrayList<String> getWish()
	{
		ArrayList<String> al=new ArrayList<String>();
		pq=ds.prepare(q);
		Long cid=null;
		for(Entity result:pq.asIterable())
		{
	
			String des=(String)result.getProperty("desc");
			Long wid=(Long)result.getProperty("wishid");
			String addinfo=(String)result.getProperty("add_info");
			cid=(Long)result.getProperty("comment_id");
			String loc=(String)result.getProperty("location");
			String status=(String)result.getProperty("status");
			String image=(String)result.getProperty("image");
			
			al.add(String.valueOf(wid));
			al.add(des);
			al.add(addinfo);
			al.add(String.valueOf(cid));
			al.add(loc);
			al.add(status);
			al.add(image);
			
		}
		
		
		return al;
		
	}
	
	public MyFetch(String tkind,Long uid)
	{
		ds=DatastoreServiceFactory.getDatastoreService();
		q=new Query(tkind);
		//Key k=KeyFactory.createKey("user", "chris");
		q.setFilter(
				new Query.FilterPredicate("uid", Query.FilterOperator.EQUAL, uid)
				);
		//q.addSort("bname");
		
	/*	q.setFilter(
				new Query.FilterPredicate("wishid", Query.FilterOperator.EQUAL, 1234)
				);*/
		
		
	}
	
	public String getData(String field_get)
	{
		pq=ds.prepare(q);
		
		for(Entity result:pq.asIterable())
		{
		
			//wishi=(String)result.getProperty(field_get);
		
			wishi=String.valueOf(result.getProperty(field_get));
		}
		
		return wishi;
	}

}
