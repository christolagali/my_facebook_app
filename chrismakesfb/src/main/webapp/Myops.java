package main.webapp;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.juli.logging.LogFactory;
import org.mortbay.log.Log;

import sun.util.logging.resources.logging;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.EntityNotFoundException;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.SortDirection;

//import com.google.appengine.labs.repackaged.org.json.JSONException;
//import com.google.appengine.labs.repackaged.org.json.JSONObject;

import org.json.simple.*;

import java.util.ArrayList;
import java.util.logging.Logger;

import main.java.AddWish;
import main.java.MyFetch;
/**
 * Servlet implementation class Myops
 */
public class Myops extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private static final Logger log = Logger.getLogger(Myops.class.getName());
	JSONObject json;
	JSONArray ja;
	HttpSession sess;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Myops() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		super.init(config);
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	String act=null,url="";
	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		act=request.getParameter("act");
		
		PrintWriter out=response.getWriter();
		response.setContentType("text/html;charset=UTF-8");
		if(act.equalsIgnoreCase("null"))
		{
			
			//we just push it the default page
			url="/WEB-INF/Add_Wish.jsp";
			RequestDispatcher dispatch=getServletContext().getRequestDispatcher(url);
			dispatch.forward(request, response);
		}
		else if(act.equalsIgnoreCase("put"))
		{
			// Here we get the data and put it into datastore
			
			Long cid=null; String uid="",status="on",desc="",addinfo="",image="",wid="";
			
			sess=request.getSession(false);
			cid=Long.valueOf(request.getParameter("cid"));
		
			status=request.getParameter("status");
			desc=request.getParameter("desc");
			addinfo=request.getParameter("addinfo");
			image=request.getParameter("FileUpload1");
			
			String v="hi";
			AddWish aw=new AddWish(v);
			Long uidl=(Long)sess.getAttribute("uid");
			
			log.finest("I have these values " + uidl);
			AddWish aw2=new AddWish(v);
			aw2.putData(cid, uidl, desc, image, status, addinfo);
			
			
			url="/WEB-INF/Add_Wish.jsp";
			RequestDispatcher dispatch=getServletContext().getRequestDispatcher(url);
			dispatch.forward(request, response);
		}
		
		else if(act.equalsIgnoreCase("showeach"))
		{
			
			url="/WEB-INF/Wish_View.jsp";
			ArrayList<String> al=new ArrayList<>();
			Long wid=Long.valueOf(request.getParameter("wid"));
			
			MyFetch mf=new MyFetch(wid);
			al=mf.getWish();
			
			request.setAttribute("mylist", al);
			RequestDispatcher dispatch=getServletContext().getRequestDispatcher(url);
			dispatch.forward(request, response);
		}
		else if(act.equalsIgnoreCase("getcomment"))
		{
			
			Long wid=null;
			json=new JSONObject();
			ja=new JSONArray();
			Long cid=Long.valueOf(request.getParameter("cid"));
			
			DatastoreService ds=DatastoreServiceFactory.getDatastoreService();
			Query q=new Query("comment");
			//Key k=KeyFactory.createKey("user", "chris");
			q.setFilter(
					new Query.FilterPredicate("comment_id", Query.FilterOperator.EQUAL, cid)
					);
			PreparedQuery pq=ds.prepare(q);
			String desc = null,by=null;
			int i=0;
			for(Entity result:pq.asIterable())
			{
		

//				desc=(String)result.getProperty("desc");
//				by=(String)result.getProperty("by_uname");
//				
//		//		json.put("by", by);
//		//		json.put("desc", desc);
//				ja.add(desc);
//				ja.add(by);

				wid=(Long)result.getProperty("wishid");
			
			}
			
			//Now get all those that have the same wishid
			ds=DatastoreServiceFactory.getDatastoreService();
			q=new Query("comment");
			//Key k=KeyFactory.createKey("user", "chris");
			q.setFilter(
					new Query.FilterPredicate("wishid", Query.FilterOperator.EQUAL, wid)
					);
			
			PreparedQuery pq1=ds.prepare(q);
			for(Entity result1:pq1.asIterable())
			{
				desc=(String)result1.getProperty("desc");
				by=(String)result1.getProperty("by_uname");
					
				ja.add(desc);
				ja.add(by);

				
			
			}
			out.print(ja);
					

		}
		
		else if(act.equalsIgnoreCase("fulfill"))
		{
			
			Long cid=Long.valueOf(request.getParameter("cid"));
			Long wid=null;
			String k = "";
			DatastoreService ds=DatastoreServiceFactory.getDatastoreService();			
			Query q=new Query("comment");
			//Key k=KeyFactory.createKey("user", "chris");
			q.setFilter(
					new Query.FilterPredicate("comment_id", Query.FilterOperator.EQUAL, cid)
					);
			PreparedQuery pq=ds.prepare(q);
		
	
			for(Entity result:pq.asIterable())
			{
				wid=(Long)result.getProperty("wishid");
						
			}
			
			//now to change the status from on to off
			
			//step 1 Get the key for the record
			DatastoreService ds1=DatastoreServiceFactory.getDatastoreService();			
			Query q1=new Query("wish");
			//Key k=KeyFactory.createKey("user", "chris");
			q1.setFilter(
					new Query.FilterPredicate("wishid", Query.FilterOperator.EQUAL, wid)
					);
			PreparedQuery pq1=ds1.prepare(q1);
			for(Entity result:pq1.asIterable())
			{
				k=KeyFactory.keyToString(result.getKey());
					
			}		
			
			
			
			//step 2 now change the value of status
			
			Key ke=KeyFactory.stringToKey(k);
			
			try {
				Entity wup=ds1.get(ke);
				wup.setProperty("status", "off");
				ds1.put(wup);
				
				
				
			} catch (EntityNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			out.print("Done");

		}
		
		else if(act.equalsIgnoreCase("saythanks"))
		{
			
			Long cid=Long.valueOf(request.getParameter("cid"));
			Long wid=null;
			String k = "";
			DatastoreService ds=DatastoreServiceFactory.getDatastoreService();			
			Query q=new Query("comment");
			//Key k=KeyFactory.createKey("user", "chris");
			q.setFilter(
					new Query.FilterPredicate("comment_id", Query.FilterOperator.EQUAL, cid)
					);
			PreparedQuery pq=ds.prepare(q);
		
	
			for(Entity result:pq.asIterable())
			{
				wid=(Long)result.getProperty("wishid");
						
			}
			
			//now to change the status from on to off
			
			//step 1 Get the key for the record
			Long uid=null;
			DatastoreService ds1=DatastoreServiceFactory.getDatastoreService();			
			Query q1=new Query("wish");
			//Key k=KeyFactory.createKey("user", "chris");
			q1.setFilter(
					new Query.FilterPredicate("wishid", Query.FilterOperator.EQUAL, wid)
					);
			PreparedQuery pq1=ds1.prepare(q1);
			for(Entity result:pq1.asIterable())
			{
				uid=(Long)result.getProperty("uid");
					
			}		
			
			
			
			//step 2 now fetch the user facebook id
			Long fid=null;
			ds1=DatastoreServiceFactory.getDatastoreService();			
			q1=new Query("user");
			//Key k=KeyFactory.createKey("user", "chris");
			q1.setFilter(
					new Query.FilterPredicate("uid", Query.FilterOperator.EQUAL, uid)
					);
			PreparedQuery pq2=ds1.prepare(q1);
			for(Entity result:pq2.asIterable())
			{
				fid=(Long)result.getProperty("fid");
					
			}		
			
			
			out.print(fid);

		}
		
		
		else if(act.equalsIgnoreCase("addcomment"))
		{
			
			Long cid=Long.valueOf(request.getParameter("cid"));
			String desc=request.getParameter("desc");
			String uname=request.getParameter("uname");
			Long wid=null;
			String k = "";
			DatastoreService ds=DatastoreServiceFactory.getDatastoreService();			
			Query q=new Query("comment");
			//Key k=KeyFactory.createKey("user", "chris");
			q.setFilter(
					new Query.FilterPredicate("comment_id", Query.FilterOperator.EQUAL, cid)
					);
			PreparedQuery pq=ds.prepare(q);
		
	
			for(Entity result:pq.asIterable())
			{
				wid=(Long)result.getProperty("wishid");
						
			}
			
			//now we have wishid ready as wid we now need comment_id of the last comment for incrementing
			
			//step 1 Get the comment_id
			Long coid=null;
			DatastoreService ds1=DatastoreServiceFactory.getDatastoreService();			
			Query q1=new Query("comment");
			//Key k=KeyFactory.createKey("user", "chris");
			q1.setFilter(
					new Query.FilterPredicate("comment_id", Query.FilterOperator.GREATER_THAN, 1)
					);
			q.addSort("comment_id",SortDirection.ASCENDING);
			PreparedQuery pq1=ds1.prepare(q1);
			for(Entity result:pq1.asIterable())
			{
				coid=(Long)result.getProperty("comment_id");
					
			}		
			coid=coid+1;
			
			
			//step 2 now to add the new entity
			Entity addcomm=new Entity("comment");
			
			//code to make a new entity
			String prof="NotDefined",hobby="Notdefined";
			
			
			addcomm.setProperty("comment_id", coid);
			addcomm.setProperty("desc", desc);
			addcomm.setProperty("by_uname", uname);
			addcomm.setProperty("wishid", wid);

			
			ds.put(addcomm);
			
			
			out.print("Done!");

		}
		
		else if(act.equalsIgnoreCase("getallwish"))
		{
			
			
			json=new JSONObject();
			ja=new JSONArray();
			
			
			DatastoreService ds=DatastoreServiceFactory.getDatastoreService();
			Query q=new Query("wish");
			//Key k=KeyFactory.createKey("user", "chris");
			q.setFilter(
					new Query.FilterPredicate("wishid", Query.FilterOperator.GREATER_THAN_OR_EQUAL, 1)
					);
			PreparedQuery pq=ds.prepare(q);
			String desc=null;
			int i=1;
			
			for(Entity result:pq.asIterable())
			{
		

				desc=(String)result.getProperty("desc");

				ja.add(desc+i);
				i=i+1;
			}
			
		
			out.print(ja);
					

		}
		
		else if(act.equalsIgnoreCase("addnewwish"))
		{
			
			Long cid=null;
			Long wid=null;
			json=new JSONObject();
			String k = "";
			DatastoreService ds=DatastoreServiceFactory.getDatastoreService();			
			Query q=new Query("wish");
			//Key k=KeyFactory.createKey("user", "chris");
			q.setFilter(
					new Query.FilterPredicate("wishid", Query.FilterOperator.GREATER_THAN_OR_EQUAL, 1)
					);
			PreparedQuery pq=ds.prepare(q);
		
			sess=request.getSession(false);
			for(Entity result:pq.asIterable())
			{
				wid=(Long)result.getProperty("wishid");
						
			}
			
			//now to change the status from on to off
			
			//step 1 Get the key for the record
			Long uid=Long.valueOf(4);
			
			DatastoreService ds1=DatastoreServiceFactory.getDatastoreService();			
			Query q1=new Query("wish");
			wid=wid+1;
			json.put("wid", wid);
			json.put("uid", sess.getAttribute("uid"));
//			//Key k=KeyFactory.createKey("user", "chris");
//			q1.setFilter(
//					new Query.FilterPredicate("wishid", Query.FilterOperator.EQUAL, wid)
//					);
//			PreparedQuery pq1=ds1.prepare(q1);
//			for(Entity result:pq1.asIterable())
//			{
//				uid=(Long)result.getProperty("uid");
//					
//			}		
			
			
			
			//step 2 now fetch the user facebook id
//			Long fid=null;
//			ds1=DatastoreServiceFactory.getDatastoreService();			
//			q1=new Query("user");
//			//Key k=KeyFactory.createKey("user", "chris");
//			q1.setFilter(
//					new Query.FilterPredicate("uid", Query.FilterOperator.EQUAL, uid)
//					);
//			PreparedQuery pq2=ds1.prepare(q1);
//			for(Entity result:pq2.asIterable())
//			{
//				fid=(Long)result.getProperty("fid");
//					
//			}		
			
			
			out.print(json);

		}
		
		
	}

}
