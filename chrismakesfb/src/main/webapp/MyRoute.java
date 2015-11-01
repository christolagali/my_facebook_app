package main.webapp;

import java.io.Console;
import java.io.IOException;
import java.util.ArrayList;

import javax.activation.DataSource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.appengine.api.datastore.*;
import com.google.appengine.api.datastore.Query.Filter;
import com.google.appengine.api.datastore.Query.FilterOperator;
import com.google.appengine.api.datastore.Query.FilterPredicate;
import com.google.appengine.api.datastore.Query.CompositeFilterOperator;

import main.java.MyFetch;
import main.java.UserReg;
/**
 * Servlet implementation class MyRoute
 */
public class MyRoute extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyRoute(){
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
	public String act=null,url="";
	public int wishid=0;
	public String wishi,descr="val";
	ArrayList<String> al=new ArrayList<String>();
	HttpSession sess;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		act=request.getParameter("act");
		
		if(act==null)
		{
			url="index.jsp";
			RequestDispatcher dispatch=getServletContext().getRequestDispatcher(url);
			dispatch.forward(request, response);
		}
		else if(act.equalsIgnoreCase("hi"))
		{
			url="/WEB-INF/profile.jsp";
			RequestDispatcher dispatch=getServletContext().getRequestDispatcher(url);
			dispatch.forward(request, response);
		}
	
		else if(act.equalsIgnoreCase("login"))
		{
			
			sess=request.getSession(true);
			
			Long fid=null;
			String myname="",myloc="";
			
			fid=Long.valueOf(request.getParameter("myfbid"));
			myname=request.getParameter("myname");
			myloc=request.getParameter("myloc");
			
			UserReg ur=new UserReg(fid);
			String flg=ur.getflag("fid");
			
			if(flg.equalsIgnoreCase("found"))
			{
			//	request.setAttribute("status", "found");
				url="/user_page.html";
				UserReg urid=new UserReg(fid);
				sess.setAttribute("uid", urid.getmyuid());
			}
			else
			{
				String p="put";
				UserReg urs=new UserReg(p);
				urs.putData(myname,myloc,fid);
				url="/index.html";
			//	request.setAttribute("status", "notfound");
			}
			
			RequestDispatcher dispatch=getServletContext().getRequestDispatcher(url);
			dispatch.forward(request, response);
		}
		else if(act.equalsIgnoreCase("mywish"))
		{
			url="/WEB-INF/mywish.jsp";
			Long uid=null;
			//we have to do java data fetching
			
			sess=request.getSession(false);
			if(sess!=null)
			{
				uid=(Long)sess.getAttribute("uid");
			}
			DatastoreService ds=DatastoreServiceFactory.getDatastoreService();
			String kind="user";
			String field="uid";
			MyFetch mf=new MyFetch(kind,uid);
			wishi=mf.getData(field);
			
			
				//int wid=Integer.parseInt(wishi);

				Query q1=new Query("wish");
//				
//				q1.setFilter(
//						new Query.FilterPredicate("uid", Query.FilterOperator.EQUAL, Long.valueOf(wishi))
//						);
				
				Filter uf = new FilterPredicate("uid",FilterOperator.EQUAL,Long.valueOf(wishi));
				Filter stf = new FilterPredicate("status",FilterOperator.EQUAL,"on");
				Filter compfilter = CompositeFilterOperator.and(uf, stf);
				
				q1.setFilter(compfilter);
				
				PreparedQuery pq1=ds.prepare(q1);
				al.clear();
				for(Entity result:pq1.asIterable())
				{
				//	String title=(String)result.getProperty("myname");
					String des=(String)result.getProperty("desc");
					Long wid=(Long)result.getProperty("wishid");
					al.add(String.valueOf(wid));
					al.add(des);
					
					
				}
				request.setAttribute("myname", al);
			
			
			
			RequestDispatcher dispatch=getServletContext().getRequestDispatcher(url);
			dispatch.forward(request, response);
		}
		else if(act.equalsIgnoreCase("addnew"))
		{
			url="/WEB-INF/Add_Wish.jsp";
			RequestDispatcher dispatch=getServletContext().getRequestDispatcher(url);
			dispatch.forward(request, response);
		}
		else if(act.equalsIgnoreCase("showwall"))
		{
			url="/Wishwall.html";
			RequestDispatcher dispatch=getServletContext().getRequestDispatcher(url);
			dispatch.forward(request, response);
		}	
		else if(act.equalsIgnoreCase("exit"))
		{
			url="/index.html";
			sess=request.getSession(false);
			sess.invalidate();
			RequestDispatcher dispatch=getServletContext().getRequestDispatcher(url);
			dispatch.forward(request, response);
		}
	}

}
