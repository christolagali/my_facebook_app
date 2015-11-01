package main.java;

import org.mortbay.log.Log;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.SortDirection;

public class AddWish {

	Entity wishe;
	DatastoreService ds;
	Query q;
	public AddWish() {
		// TODO Auto-generated constructor stub
	}
	
	public AddWish(String v)
	{
		
		ds=DatastoreServiceFactory.getDatastoreService();

		
		

	}
	
	public void putData(Long cid,Long uid,String desc,String image,String status,String addinfo)
	{
		
		Long wid=getWid();
		wishe=new Entity("wish");
		
		//code to make a new entity
		
		
		wishe.setProperty("comment_id", cid);
		wishe.setProperty("uid", uid);
		wishe.setProperty("desc", desc);
		wishe.setProperty("image", image);
		wishe.setProperty("status", status);
		wishe.setProperty("add_info", addinfo);
		wishe.setProperty("wishid", wid);
		
		ds.put(wishe);
	}
	
	public Long getUid(String vs)
	{
		Long uid = null;
		vs="1404995383144820";
		Long v=Long.valueOf(vs);
		
		
		q=new Query("user");
		
		q.setFilter(
				new Query.FilterPredicate("fid", Query.FilterOperator.EQUAL, v)
				);
		PreparedQuery pq=ds.prepare(q);
		for(Entity result:pq.asIterable())
		{
		
			uid=(Long)result.getProperty("uid");
			
			
		}
		return uid;
		
	}
	
	public Long getWid()
	{
		Long wid = null;
		
		
		q=new Query("wish");
		
		q.setFilter(
				new Query.FilterPredicate("wishid", Query.FilterOperator.GREATER_THAN, 1)
				);
		q.addSort("wishid",SortDirection.ASCENDING);
		PreparedQuery pq=ds.prepare(q);
		for(Entity result:pq.asIterable())
		{
		
			wid=(Long)result.getProperty("wishid");
			
			
		}
		wid=wid+1;
		return wid;
		
	}
}
