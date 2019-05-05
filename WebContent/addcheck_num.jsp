<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import="graduate.DataConner" %>
     
     <%@ page import="java.text.*"%>  
     <%@page import="graduate.ManageDAO" %>
    <%@page import="graduate.Manage" %>
    <%@page import="java.util.List" %>
    <%@page import="java.util.*" %>
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>增加签到次数界面处理</title>
</head>
<body>
		    
<%	
 
 
String[] check_id= request.getParameterValues("no");
//String tech_id=(String)request.getSession().getAttribute("username").toString();
int i;
  ManageDAO dao=new ManageDAO();
List<Manage> list =dao.readFirstTitle();     
 for(Manage tl:list){
	 for(i=0;i<check_id.length;i++){
	 if(tl.getCheck_id().equals(check_id[i])){
		 //JDBC 驱动名及数据库 URL
	    
     /* SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
       
		 
      
			 start=df.format(start);
			 end=df.format(end); */
		 
DataConner manager=DataConner.getInstance();
			Connection conn = manager.connect();
			try{
			Statement stmt = null;
			 // 执行查询
			System.out.println(" 实例化Statement对象...");
			stmt = conn.createStatement();
			request.setCharacterEncoding("UTF-8");
			 //String radio= (String)request.getParameter("no");
			  String check_num;
			 
			check_num= (String)request.getParameter("check_num");
			/*   System.out.print("b"+tl.getCheck_num()); */
			//int title_id=Integer.valueOf(title_id);
		    //String title_name=(String)request.getParameter("title_name");
		    //String tech_id=(String)request.getParameter("tech_id");//取出login.jsp的值
			//String title_state= (String)request.getParameter("title_state");
			//int title_state=Integer.valueOf(title_stat);
			
		    //String title_show=(String)request.getParameter("title_show");
		   // String stu_id=(String)request.getSession().getAttribute("username").toString();
		  // */ 
		   String sql;
		    //Boolean pwd;
		   /*  System.out.print(radio);
		    System.out.print(title_id);
		    System.out.print(title_name);
		    System.out.print(tech_id);
		    System.out.print(title_state);
		    
		    System.out.print(title_show);
		    System.out.print(stu_id); */
		    	//sql = "insert into title (title_name,tech_id,title_state,title_show) values('"+title_name+"','"+tech_id+"','"+title_state+"','"+title_show+"')";
	    	/* int s=0;
		    if(check_num==null){
		    	
	    		s=1;
	    	}else{
	    		s=Integer.parseInt(check_num);
	    		s+=1;
	    	}
		    check_num=String.valueOf(s); */
		    /* System.out.print( tl.getCheck_id().equals(""));
		    System.out.print( tl.getCheck_id().equals("(null)"));
		    System.out.print("".equals(tl.getCheck_id()));
		    System.out.print((String)tl.getCheck_id()  );
		    System.out.print(  (Object)tl.getCheck_num()==null ); */
		    int s=0;
		    if((Object)tl.getCheck_num()==null)
		    { 
		    	check_num="1";
		    	System.out.print("good"+tl.getCheck_id()+"good");
		    }else{
		    	s=Integer.parseInt(tl.getCheck_num());
		    	s+=1;
		    	check_num=String.valueOf(s);
		    	System.out.print("bad"+tl.getCheck_id()+"bad");
		    }
		    /* check_num="1"; */
		    
		    sql="UPDATE check_in SET check_num='"+check_num+"' WHERE check_id='"+check_id[i]+"'";
	
		    //sql="UPDATE title SET title_state='已选',stu_id='"+stu_id+"' WHERE title_id='"+title_id+"'";
		    	//sql = "select * from teacher  where tech_id='"+name+"'";
		    	stmt.executeUpdate(sql);
		    	
		    	out.print("<script type='text/javascript' language='javaScript'> alert('添加课题数据成功');</script>");
		 }finally{
			// 完成后关闭
			  manager.disconnect(conn);	
			}		 
		    response.setHeader("refresh", "0;url=checktest.jsp");

				System.out.println("bye!");
	 }
 }
 } 
/* 
//JDBC 驱动名及数据库 URL
	DataConner manager=DataConner.getInstance();
	Connection conn = manager.connect();
	try{
	Statement stmt = null;
	 // 执行查询
	System.out.println(" 实例化Statement对象...");
	stmt = conn.createStatement();
	request.setCharacterEncoding("UTF-8");
	String radio= (String)request.getParameter("no");
	String title_id= (String)request.getParameter("title_id");
	//int title_id=Integer.valueOf(title_id);
    String title_name=(String)request.getParameter("title_name");
    String tech_id=(String)request.getParameter("tech_id");//取出login.jsp的值
	String title_state= (String)request.getParameter("title_state");
	//int title_state=Integer.valueOf(title_stat);
	
    String title_show=(String)request.getParameter("title_show");
    String stu_id=(String)request.getSession().getAttribute("username").toString();
    String sql;
    Boolean pwd;
    System.out.print(radio);
    System.out.print(title_id);
    System.out.print(title_name);
    System.out.print(tech_id);
    System.out.print(title_state);
    
    System.out.print(title_show);
    System.out.print(stu_id);
    	//sql = "insert into title (title_name,tech_id,title_state,title_show) values('"+title_name+"','"+tech_id+"','"+title_state+"','"+title_show+"')";
    	sql="UPDATE title SET title_state='未选',stu_id='null' WHERE title_id='"+title_id+"'";
    	//sql = "select * from teacher  where tech_id='"+name+"'";
    	stmt.executeUpdate(sql);
    	
    	out.print("<script type='text/javascript' language='javaScript'> alert('添加课题数据成功');</script>");
 }finally{
	// 完成后关闭
	  manager.disconnect(conn);	
	}		 
    response.setHeader("refresh", "0;url=backselect.jsp");

		System.out.println("bye!"); */
 %>  
</body>
</html>