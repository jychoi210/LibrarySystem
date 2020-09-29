package JAVA;

import java.awt.*;
import java.awt.event.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.*;
import java.awt.BorderLayout;
import javax.swing.*;

public class BookPage extends JFrame implements ActionListener{
   JTabbedPane tabpane;
   
   public static final int NONE = 0;
   public static final int RINSERT = 1;
   public static final int RUPDATE = 2;
   public static final int RDELETE = 3;
   public static final int RSELECT = 4;
   public static final int BINSERT = 5;
   public static final int BUPDATE = 6;
   public static final int BDELETE = 7;
   public static final int BSELECT = 8;
   public static final int RSEARCH = 9;
   public static final int BSEARCHB = 10;
   public static final int BSEARCHA = 11;
   public static final int BSEARCHP = 12;
   public static final int BSEARCHR = 13;
   
   TextArea displayR, displayB, displayS, display;
   TextField rnum, rname, rage, rdate, rano, rfield;
   TextField bnum, bname, bano, bprice, byear, bpno;
   TextField RsearchR, RsearchG, RsearchA, BsearchB, BsearchA, BsearchP, BsearchR;

   JButton RInsert, RUpdate, RDelete, RSelect, BInsert, BUpdate, BDelete, BSelect;
   JButton RSearchR, RSearchG, RSearchA, BSearchB, BSearchP, BSearchR, BSearchA, STATUS;
   Connection conn;
   PreparedStatement pstmt = null;
   Statement stmt = null;
   int cmd;
   Font f;
   
   public BookPage()
   {
      super("BookPage");
      tabpane=new JTabbedPane();

      
      displayR = new TextArea();
      displayR.setEditable(false);
      displayR.setBackground(new Color(252, 222, 131));
      displayB = new TextArea();
      displayB.setEditable(false);
      displayB.setBackground(new Color(252, 222, 131));
      displayS = new TextArea();
      displayS.setEditable(false);
      displayS.setBackground(new Color(252, 222, 131));
      display = new TextArea();
      display.setEditable(false);
      display.setBackground(new Color(252, 222, 131));
      
      JPanel reader = new JPanel();
      reader.setLayout(new BorderLayout());
      reader.setBackground(Color.pink);
      
      JPanel book = new JPanel();
      book.setLayout(new BorderLayout());
      book.setBackground(Color.pink);
      
      JPanel search = new JPanel();
      search.setLayout(new BorderLayout());
      search.setBackground(Color.pink);
      
      JPanel salestatus = new JPanel();
      salestatus.setLayout(new BorderLayout());
      salestatus.setBackground(Color.pink);

      JPanel leftR = new JPanel();
      leftR.add(new JLabel("Reader 빈칸을 모두 채워주세요."));
      leftR.setLayout(new GridLayout(8,1));
      leftR.setBackground(Color.pink);
      
      JPanel bottomR = new JPanel();
      bottomR.setLayout(new GridLayout(1,4,10,0));
      bottomR.setBackground(Color.pink);
      
      JPanel p_rnum = new JPanel();
      p_rnum.add(new JLabel("독자번호(R#)"));
      p_rnum.add(rnum = new TextField(20));
      p_rnum.setBackground(Color.pink);
      
      JPanel p_rname = new JPanel();
      p_rname.add(new JLabel("독자 이름"));
      p_rname.add(rname = new TextField(20));
      p_rname.setBackground(Color.pink);
      
      JPanel p_rage = new JPanel();
      p_rage.add(new JLabel("독자나이"));
      p_rage.add(rage = new TextField(20));
      p_rage.setBackground(Color.pink);
      
      JPanel p_rdate = new JPanel();
      p_rdate.add(new JLabel("등록일자"));
      p_rdate.add(rdate = new TextField(20));
      p_rdate.setBackground(Color.pink);
      
      JPanel p_rano = new JPanel();
      p_rano.add(new JLabel("좋아하는 작가(A#)"));
      p_rano.add(rano = new TextField(20));
      p_rano.setBackground(Color.pink);
      
      JPanel p_rfield = new JPanel();
      p_rfield.add(new JLabel("좋아하는 장르"));
      p_rfield.add(rfield = new TextField(20));
      p_rfield.setBackground(Color.pink);
      
      JPanel leftB = new JPanel();
      leftB.add(new JLabel("Book 빈칸을 모두 채워주세요."));
      leftB.setLayout(new GridLayout(8,1));
      leftB.setBackground(Color.pink);
      
      JPanel bottomB = new JPanel();
      bottomB.setLayout(new GridLayout(1,4,10,0));
      bottomB.setBackground(Color.pink);
      
      JPanel p_bnum = new JPanel();
      p_bnum.add(new JLabel("책 번호(B#)"));
      p_bnum.add(bnum = new TextField(20));
      p_bnum.setBackground(Color.pink);
      
      JPanel p_bname = new JPanel();
      p_bname.add(new JLabel("책 이름"));
      p_bname.add(bname = new TextField(20));
      p_bname.setBackground(Color.pink);
      
      JPanel p_bano = new JPanel();
      p_bano.add(new JLabel("작가번호(A#)"));
      p_bano.add(bano = new TextField(20));
      p_bano.setBackground(Color.pink);
      
      JPanel p_bprice = new JPanel();
      p_bprice.add(new JLabel("가격"));
      p_bprice.add(bprice = new TextField(20));
      p_bprice.setBackground(Color.pink);
      
      JPanel p_byear = new JPanel();
      p_byear.add(new JLabel("출판연도"));
      p_byear.add(byear = new TextField(20));
      p_byear.setBackground(Color.pink);
      
      JPanel p_bpno = new JPanel();
      p_bpno.add(new JLabel("출판사번호(P#)"));
      p_bpno.add(bpno = new TextField(20));
      p_bpno.setBackground(Color.pink);
      
      JPanel status = new JPanel();
      status.add(STATUS = new JButton("1~20위 순위 책 보기"));
      STATUS.addActionListener(this);
      
      JPanel top = new JPanel();
      top.setLayout(new GridLayout(7,1));
      top.setBackground(Color.pink);      
      
      JPanel p_RsearchR = new JPanel();
      p_RsearchR.add(new JLabel("독자 검색하기 : 독자번호(R#)을 입력하세요."));
      p_RsearchR.add(RsearchR = new TextField(20));
      p_RsearchR.add(RSearchR = new JButton("검색"));
      RSearchR.addActionListener(this);
      p_RsearchR.setBackground(Color.pink);
      
      JPanel p_RsearchG = new JPanel();
      p_RsearchG.add(new JLabel("독자가 선호하는 장르의 책 추천 : 독자번호(R#)을 입력하세요."));
      p_RsearchG.add(RsearchG = new TextField(20));
      p_RsearchG.add(RSearchG = new JButton("추천"));
      RSearchG.addActionListener(this);
      p_RsearchG.setBackground(Color.pink);
      
      JPanel p_RsearchA = new JPanel();
      p_RsearchA.add(new JLabel("독자가 선호하는 작가의 책 추천 : 독자번호(R#)을 입력하세요."));
      p_RsearchA.add(RsearchA = new TextField(20));
      p_RsearchA.add(RSearchA = new JButton("추천"));
      RSearchA.addActionListener(this);
      p_RsearchA.setBackground(Color.pink);      
      
      JPanel p_BsearchB = new JPanel();
      p_BsearchB.add(new JLabel("책 검색하기 : 책번호(B#)을 입력하세요."));
      p_BsearchB.add(BsearchB = new TextField(20));
      p_BsearchB.add(BSearchB = new JButton("검색"));
      BSearchB.addActionListener(this);
      p_BsearchB.setBackground(Color.pink);
      
      JPanel p_BsearchA = new JPanel();
      p_BsearchA.add(new JLabel("책 검색하기 : 작가번호(A#)을 입력하세요."));
      p_BsearchA.add(BsearchA = new TextField(20));
      p_BsearchA.add(BSearchA = new JButton("검색"));
      BSearchA.addActionListener(this);
      p_BsearchA.setBackground(Color.pink);
      
      JPanel p_BsearchP = new JPanel();
      p_BsearchP.add(new JLabel("책 검색하기 : 출판사번호(P#)을 입력하세요."));
      p_BsearchP.add(BsearchP = new TextField(20));
      p_BsearchP.add(BSearchP = new JButton("검색"));
      BSearchP.addActionListener(this);
      p_BsearchP.setBackground(Color.pink);
      
      JPanel p_BsearchR = new JPanel();
      p_BsearchR.add(new JLabel("책 검색하기 : 몇 순위의 책이 궁금하신가요?"));
      p_BsearchR.add(BsearchR = new TextField(20));
      p_BsearchR.add(BSearchR = new JButton("검색"));
      BSearchR.addActionListener(this);
      p_BsearchR.setBackground(Color.pink);
      
      bottomR.add(RInsert = new JButton("등록"));
      RInsert.addActionListener(this);
      
      bottomR.add(RUpdate = new JButton("수정"));
      RUpdate.addActionListener(this);
      
      bottomR.add(RDelete = new JButton("삭제"));
      RDelete.addActionListener(this);
      
      bottomR.add(RSelect = new JButton("list"));
      RSelect.addActionListener(this);
      
      bottomB.add(BInsert = new JButton("등록"));
      BInsert.addActionListener(this);
      
      bottomB.add(BUpdate = new JButton("수정"));
      BUpdate.addActionListener(this);
      
      bottomB.add(BDelete = new JButton("삭제"));
      BDelete.addActionListener(this);
      
      bottomB.add(BSelect = new JButton("list"));
      BSelect.addActionListener(this);
      
      leftR.add(p_rnum);
      leftR.add(p_rname);
      leftR.add(p_rage);
      leftR.add(p_rdate);
      leftR.add(p_rano);
      leftR.add(p_rfield);
      leftR.add(bottomR);
      
      leftB.add(p_bnum);
      leftB.add(p_bname);
      leftB.add(p_bano);
      leftB.add(p_bprice);
      leftB.add(p_byear);
      leftB.add(p_bpno);
      leftB.add(bottomB);
      
      top.add(p_RsearchR);
      top.add(p_RsearchA);
      top.add(p_RsearchG);
      top.add(p_BsearchB);
      top.add(p_BsearchA);
      top.add(p_BsearchP);
      top.add(p_BsearchR);
      
      reader.add("Center", displayR);
      reader.add("West",leftR);
      
      book.add("Center", displayB);
      book.add("West",leftB);
      
      search.add("Center",top);
      search.add("North",displayS);

      salestatus.add("North", status);
      salestatus.add("Center", display);
      
      
      addWindowListener(new WindowAdapter() {
    	  public void windowClosing(WindowEvent e){
    		  destroy();
    		  setVisible(false);
    		  dispose();
    		  System.exit(0);
    	  }
      });
      

      tabpane.addTab("Reader", reader);
      tabpane.addTab("Book", book);
      tabpane.addTab("Search", search);
      tabpane.addTab("SaleStatus", salestatus);
      init();

      getContentPane().add(tabpane, BorderLayout.CENTER);
      setDefaultCloseOperation(EXIT_ON_CLOSE);
      setSize(1000, 650);
      setVisible(true);
   }
   
   private void init() {
	   try{
		   conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ESQL","root", "0000");

		   ResultSet rs = null;
		   stmt = conn.createStatement();
		   //initialize();
		   System.out.println("DB에 접속되었습니다.");
	   }catch(Exception e){
		   e.printStackTrace(System.out);
	   }
   }
   
   
   private void destroy(){
	   try{
		   if(stmt != null){
			   stmt.close();
		   }
		   if(conn != null){
			   conn.close();
		   }
	   }catch (Exception e){
	   }
   }
  
   public void clear(){
	   
	   rnum.setText("");
	   rname.setText("");
	   rage.setText("");
	   rdate.setText("");
	   rano.setText("");
	   rfield.setText("");
	   
	   bnum.setText("");
	   bname.setText("");
	   bano.setText("");
	   bprice.setText("");
	   byear.setText("");
	   bpno.setText("");
	   
	   RsearchR.setText("");
	   RsearchA.setText("");
	   RsearchG.setText("");
	   BsearchB.setText("");
	   BsearchA.setText("");
	   BsearchP.setText("");
	   BsearchR.setText("");
   }
   
   public void actionPerformed(ActionEvent e){
	   ResultSet rs = null;
	   Component c = (Component) e.getSource();
	   try{
		   if(c == RInsert){
			   String s_rnum = rnum.getText().trim();
			   String s_rname = rname.getText().trim();
			   int s_rage = Integer.parseInt(rage.getText().trim());
			   int s_rdate = Integer.parseInt(rdate.getText().trim());
			   String s_rano = rano.getText().trim();
			   String s_rfield = rfield.getText().trim();
			   
			   if(s_rnum == null
				   ||s_rname == null
				   ||s_rage == 0
				   ||s_rdate == 0
				   ||s_rano == null
				   ||s_rfield == null
				   ||s_rnum.length() == 0
				   ||s_rname.length() == 0
				   ||s_rano.length() == 0
				   ||s_rfield.length() == 0)
				   return;
			   
			   stmt = conn.createStatement();
			   rs = stmt.executeQuery("SELECT rnum FROM READER WHERE rnum = '"+s_rnum+"'");
			   
			   if(rs.next()){
				   JOptionPane.showMessageDialog(null, "이미 등록된 독자번호(R#)입니다.", "독자 등록", JOptionPane.ERROR_MESSAGE);
			   }
			   
			   else{
			   String query = "insert into READER values(?,?,?,?,?,?)";
			   pstmt = conn.prepareStatement(query);
			   pstmt.setString(1, s_rnum);
			   pstmt.setString(2, s_rname);
			   pstmt.setInt(3, s_rage);
			   pstmt.setInt(4, s_rdate);
			   pstmt.setString(5, s_rano);
			   pstmt.setString(6, s_rfield);
			   pstmt.executeUpdate();
			   JOptionPane.showMessageDialog(null, "독자가 한 명 추가되었습니다.", "독자 데이터 추가", JOptionPane.INFORMATION_MESSAGE);
			   
			   rs = stmt.executeQuery("select * from READER");
			   displayR.append("__________________________________________________________________________"+"\n");
			   displayR.append("독자번호(R#) 독자이름\t\t나이\t등록일자  좋아하는 작가   좋아하는 분야 \n");
			   displayR.append("__________________________________________________________________________"+"\n");
			   while(rs.next()){
				   String rnum = rs.getString(1);
				   String rname = rs.getString(2);
				   int rage = rs.getInt(3);
				   int rdate = rs.getInt(4);
				   String rano = rs.getString(5);
				   String rfield = rs.getString(6);
				   
				   displayR.append(rnum + "\t" + rname + "\t\t" + rage + "\t" + rdate + "\t" + rano + "\t" + rfield + "\n");
				   
			   }
			   }
			   clear();
			   //initialize();		   
		   }else if(c == RSelect){
			   
			   rs = stmt.executeQuery("select * from READER");
			   displayR.append("__________________________________________________________________________"+"\n");
			   displayR.append("독자번호(R#) 독자이름\t\t나이\t등록일자  좋아하는 작가   좋아하는 분야 \n");
			   displayR.append("__________________________________________________________________________"+"\n");
			   while(rs.next()){
				   String rnum = rs.getString(1);
				   String rname = rs.getString(2);
				   int rage = rs.getInt(3);
				   int rdate = rs.getInt(4);
				   String rano = rs.getString(5);
				   String rfield = rs.getString(6);
				   
				   displayR.append(rnum + "\t" + rname + "\t\t" + rage + "\t" + rdate + "\t" + rano + "\t" + rfield + "\n");
				 
			   }
			   clear();
			   
		   }else if(c == RDelete){
				   String s_rnum = rnum.getText().trim();
				   if(s_rnum == null || s_rnum.length()==0)
					   return;
				   stmt.executeUpdate("delete from READER where rnum = '"+s_rnum+"'");
				   JOptionPane.showMessageDialog(null, "독자가 한 명 삭제되었습니다.", "독자 데이터 삭제", JOptionPane.INFORMATION_MESSAGE);
				   
				   rs = stmt.executeQuery("select * from READER");
				   displayR.append("__________________________________________________________________________"+"\n");
				   displayR.append("독자번호(R#) 독자이름\t\t나이\t등록일자  좋아하는 작가   좋아하는 분야 \n");
				   displayR.append("__________________________________________________________________________"+"\n");
				   while(rs.next()){
					   String rnum = rs.getString(1);
					   String rname = rs.getString(2);
					   int rage = rs.getInt(3);
					   int rdate = rs.getInt(4);
					   String rano = rs.getString(5);
					   String rfield = rs.getString(6);
					   
					   displayR.append(rnum + "\t" + rname + "\t\t" + rage + "\t" + rdate + "\t" + rano + "\t" + rfield + "\n");
				   }
			   clear();	    
		   
	   		}else if(c == RUpdate){
	   			String s_rnum = rnum.getText().trim();
				String s_rname = rname.getText().trim();
				int s_rage = Integer.parseInt(rage.getText().trim());
				int s_rdate = Integer.parseInt(rdate.getText().trim());
				String s_rano = rano.getText().trim();
				String s_rfield = rfield.getText().trim();
				   
				if(s_rnum == null
					||s_rname == null
					||s_rage == 0
					||s_rdate == 0
					||s_rano == null
					||s_rfield == null
					||s_rnum.length() == 0
					||s_rname.length() == 0
					||s_rano.length() == 0
					||s_rfield.length() == 0)
				   return;
				String query = "update READER set rname=?, rage=?, rdate=?, rano=?, rfield=? WHERE rnum=?";
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, s_rname);
				pstmt.setInt(2, s_rage);
				pstmt.setInt(3, s_rdate);
				pstmt.setString(4, s_rano);
				pstmt.setString(5, s_rfield);
				pstmt.setString(6, s_rnum);
				pstmt.executeUpdate();
				JOptionPane.showMessageDialog(null, "독자가 한 명 수정되었습니다.", "독자 데이터 수정", JOptionPane.INFORMATION_MESSAGE);
				
				rs = stmt.executeQuery("select * from READER");
				displayR.append("__________________________________________________________________________"+"\n");
				displayR.append("독자번호(R#) 독자이름\t\t나이\t등록일자  좋아하는 작가   좋아하는 분야 \n");
				displayR.append("__________________________________________________________________________"+"\n");
				while(rs.next()){
					String rnum = rs.getString(1);
					String rname = rs.getString(2);
					int rage = rs.getInt(3);
					int rdate = rs.getInt(4);
					String rano = rs.getString(5);
					String rfield = rs.getString(6);
					
					displayR.append(rnum + "\t" + rname + "\t\t" + rage + "\t" + rdate + "\t" + rano + "\t" + rfield + "\n");
				}
				clear();
	   		}else if(c == BInsert){
	   			String s_bnum = bnum.getText().trim();
	   			String s_bname = bname.getText().trim();
	   			String s_bano = bano.getText().trim();
	   			int s_bprice = Integer.parseInt(bprice.getText().trim());
	   			int s_byear = Integer.parseInt(byear.getText().trim());				   
	   			String s_bpno = bpno.getText().trim();
				   
				   if(s_bnum == null
					   ||s_bname == null
					   ||s_bano == null
					   ||s_bprice == 0
					   ||s_byear == 0
					   ||s_bpno == null
					   ||s_bnum.length() == 0
					   ||s_bname.length() == 0
					   ||s_bano.length() == 0
					   ||s_bpno.length() == 0)
					   return;
				   stmt = conn.createStatement();
				   rs = stmt.executeQuery("SELECT bnum FROM BOOK WHERE bnum = '"+s_bnum+"'");
				   
				   if(rs.next()){
					   JOptionPane.showMessageDialog(null, "이미 등록된 책번호(b#)입니다.", "책 등록", JOptionPane.ERROR_MESSAGE);
				   }
				   
				   else{
				   String query = "insert into BOOK values(?,?,?,?,?,?)";
				   pstmt = conn.prepareStatement(query);
				   pstmt.setString(1, s_bnum);
				   pstmt.setString(2, s_bname);
				   pstmt.setString(3, s_bano);
				   pstmt.setInt(4, s_bprice);
				   pstmt.setInt(5, s_byear);
				   pstmt.setString(6, s_bpno);
				   pstmt.executeUpdate();
				   JOptionPane.showMessageDialog(null, "책이 한 권 추가되었습니다.", "책 데이터 추가", JOptionPane.INFORMATION_MESSAGE);
				   
				   rs = stmt.executeQuery("select * from BOOK");
				   displayB.append("__________________________________________________________________________"+"\n");
				   displayB.append("책번호(B#)   책이름\t        작가번호(A#)\t  가격      출판연도   출판사번호(P#) \n");
				   displayB.append("__________________________________________________________________________"+"\n");
				   while(rs.next()){
					   String bnum = rs.getString(1);
					   String bname = rs.getString(2);
					   String bano = rs.getString(3);
					   int bprice = rs.getInt(4);
					   int byear = rs.getInt(5);
					   String bpno = rs.getString(6);
					   
					   displayB.append(bnum + "\t" + bname + "\t\t" + bano + "\t" + bprice + "\t" + byear + "\t" + bpno + "\n");
				   }
				   }
				   clear();
				   //initialize();	   			
	   		}else if(c == BSelect){
	   			rs = stmt.executeQuery("select * from BOOK");
				   displayB.append("__________________________________________________________________________"+"\n");
				   displayB.append("책번호(B#)   책이름\t        작가번호(A#)\t  가격      출판연도   출판사번호(P#) \n");
				   displayB.append("__________________________________________________________________________"+"\n");
				   while(rs.next()){
					   String bnum = rs.getString(1);
					   String bname = rs.getString(2);
					   String bano = rs.getString(3);
					   int bprice = rs.getInt(4);
					   int byear = rs.getInt(5);
					   String bpno = rs.getString(6);
					   
					   displayB.append(bnum + "\t" + bname + "\t\t" + bano + "\t" + bprice + "\t" + byear + "\t" + bpno + "\n");
					   //System.out.println(bnum + "\t" + bname + "\t\t" + bano + "\t" + bprice + "\t" + byear + "\t" + bpno + "\n");
				   }
				   clear();
				   //initialize();
	   		}else if(c == BDelete){
				   	String s_bnum = bnum.getText().trim();
		   			if(s_bnum == null || s_bnum.length()==0)
					   return;
				   stmt.executeUpdate("delete from BOOK where bnum = '"+s_bnum+"'");
				   JOptionPane.showMessageDialog(null, "책이 한 권 삭제되었습니다.", "책 데이터 삭제", JOptionPane.INFORMATION_MESSAGE);
				   
				   rs = stmt.executeQuery("select * from BOOK");
				   displayB.append("__________________________________________________________________________"+"\n");
				   displayB.append("책번호(B#)   책이름\t        작가번호(A#)\t  가격      출판연도   출판사번호(P#) \n");
				   displayB.append("__________________________________________________________________________"+"\n");
				   while(rs.next()){
					   String bnum = rs.getString(1);
					   String bname = rs.getString(2);
					   String bano = rs.getString(3);
					   int bprice = rs.getInt(4);
					   int byear = rs.getInt(5);
					   String bpno = rs.getString(6);
					   
					   displayB.append(bnum + "\t" + bname + "\t\t" + bano + "\t" + bprice + "\t" + byear + "\t" + bpno + "\n");				   }
			   clear();
			   //initialize();		    
		   
	   		}else if(c == BUpdate){
	   			String s_bnum = bnum.getText().trim();
	   			String s_bname = bname.getText().trim();
	   			String s_bano = bano.getText().trim();
	   			int s_bprice = Integer.parseInt(bprice.getText().trim());
	   			int s_byear = Integer.parseInt(byear.getText().trim());				   
	   			String s_bpno = bpno.getText().trim();
				   
				if(s_bnum == null
						||s_bname == null
						||s_bano == null
						||s_bprice == 0
						||s_byear == 0
						||s_bpno == null
						||s_bnum.length() == 0
						||s_bname.length() == 0
						||s_bano.length() == 0
						||s_bpno.length() == 0)
				   return;
				String query = "update BOOK set bname=?, bano=?, bprice=?, byear=?, bpno=? WHERE bnum=?";
				pstmt = conn.prepareStatement(query);
				
				pstmt.setString(1, s_bname);
				pstmt.setString(2, s_bano);
				pstmt.setInt(3, s_bprice);
				pstmt.setInt(4, s_byear);
				pstmt.setString(5, s_bpno);
				pstmt.setString(6, s_bnum);
				pstmt.executeUpdate();
				JOptionPane.showMessageDialog(null, "책이 한 권 수정되었습니다.", "책 데이터 수정", JOptionPane.INFORMATION_MESSAGE);
				
				rs = stmt.executeQuery("select * from BOOK");
				   displayB.append("__________________________________________________________________________"+"\n");
				   displayB.append("책번호(B#)   책이름\t        작가번호(A#)\t  가격      출판연도   출판사번호(P#) \n");
				   displayB.append("__________________________________________________________________________"+"\n");
				   while(rs.next()){
					   String bnum = rs.getString(1);
					   String bname = rs.getString(2);
					   String bano = rs.getString(3);
					   int bprice = rs.getInt(4);
					   int byear = rs.getInt(5);
					   String bpno = rs.getString(6);
					   
					   displayB.append(bnum + "\t" + bname + "\t\t" + bano + "\t" + bprice + "\t" + byear + "\t" + bpno + "\n");
				}
				clear();
	   		}else if(c == STATUS){
	   			rs = stmt.executeQuery("select * from SALESTATUS_DETAIL");
	   		   display.append("________________________________________________________________________________"+"\n");
	   		   display.append("순위\t 작가이름\t\t 책이름\t\t 출판사이름\t\t 판매개수\n");
	   		   display.append("________________________________________________________________________________"+"\n");
	   		   while(rs.next()){
	   			   String rank = rs.getString(1);
	   			   String aname = rs.getString(2);
	   			   String bname = rs.getString(3);
	   			   String pname = rs.getString(4);
	   			   int sale = rs.getInt(5);
	   			   
	   			   display.append(rank + "\t" + aname + "\t\t" + bname + "\t\t" + pname + "\t\t" + sale +"\n");
	   		   }
	   		clear();
	   		}else if(c == RSearchR){
	   			String s_RsearchR = RsearchR.getText().trim();
	   			rs = stmt.executeQuery("select * from READER WHERE rnum='"+s_RsearchR+"'");
	   			displayS.append("___________________________________________________________________"+"\n");
	   			displayS.append("독자(R#)\t독자이름\t나이\t등록일자\t선호작가\t선호분야 \n");
	   			displayS.append("___________________________________________________________________"+"\n");
	   			if(rs.next()){
	   				String rnum = rs.getString(1);
	   				String rname = rs.getString(2);
	   				int rage = rs.getInt(3);
	   				int rdate = rs.getInt(4);
	   				String rano = rs.getString(5);
	   				String rfield = rs.getString(6);
	   				
	   				displayS.append(rnum + "\t" + rname + "\t" + rage + "\t" + rdate + "\t" + rano + "\t" + rfield + "\n");
	   			}else{
	   				JOptionPane.showMessageDialog(null, "검색 결과가 없습니다.", "독자 검색", JOptionPane.ERROR_MESSAGE);

	   			}
	   			clear();
	   		}else if(c == RSearchA){
	   			String s_RsearchA = RsearchA.getText().trim();
	   			rs = stmt.executeQuery("SELECT READER.rname, AUTHOR.aname, BOOK.bname, BOOK.bprice FROM READER,AUTHOR,BOOK WHERE READER.rano = AUTHOR.anum AND READER.rano = BOOK.bano AND rnum='"+s_RsearchA+"'");
	   			displayS.append("___________________________________________________________________"+"\n");
	   			displayS.append("독자이름\t선호 작가\t추천 책\t책 가격 \n");
	   			displayS.append("___________________________________________________________________"+"\n");
	   			if(rs.next()){
	   				String rname = rs.getString(1);
	   				String aname = rs.getString(2);
	   				String bname = rs.getString(3);
	   				int bprice = rs.getInt(4);
	   				
	   				displayS.append(rname + "\t" + aname + "\t" + bname + "\t" + bprice + "\n");
	   			}else{
	   				JOptionPane.showMessageDialog(null, "검색 결과가 없습니다.", "독자 검색", JOptionPane.ERROR_MESSAGE);

	   			}
	   			clear();
	   		}else if(c == RSearchG){
	   			String s_RsearchG = RsearchG.getText().trim();
	   			rs = stmt.executeQuery("SELECT READER.rname, READER.rfield, BOOK.bname, PUBLISHER.pname, BOOK.bprice  FROM READER,PUBLISHER,BOOK WHERE READER.rfield = PUBLISHER.pfield AND PUBLISHER.pnum = BOOK.bpno AND rnum='"+s_RsearchG+"'");
	   			displayS.append("___________________________________________________________________"+"\n");
	   			displayS.append("독자이름\t선호 장르\t추천 책\t출판사\t책 가격 \n");
	   			displayS.append("___________________________________________________________________"+"\n");
	   			if(rs.next()){
	   				String rname = rs.getString(1);
	   				String rfield = rs.getString(2);
	   				String bname = rs.getString(3);
	   				String pname = rs.getString(4);
	   				int bprice = rs.getInt(5);
	   				
	   				displayS.append(rname + "\t" + rfield + "\t" + bname + "\t" +pname+ "\t" + bprice + "\n");
	   			}else{
	   				JOptionPane.showMessageDialog(null, "검색 결과가 없습니다.", "독자 검색", JOptionPane.ERROR_MESSAGE);

	   			}
	   			clear();
	   		}else if(c == BSearchB){
	   			String s_BsearchB = BsearchB.getText().trim();
	   			rs = stmt.executeQuery("SELECT * FROM BOOK WHERE bnum='"+s_BsearchB+"'");
	   			displayS.append("__________________________________________________________________________"+"\n");
	   			displayS.append("책번호(B#)   책이름\t        작가번호(A#)\t  가격      출판연도   출판사번호(P#) \n");
	   			displayS.append("__________________________________________________________________________"+"\n");
	   			if(rs.next()){
					   String bnum = rs.getString(1);
					   String bname = rs.getString(2);
					   String bano = rs.getString(3);
					   int bprice = rs.getInt(4);
					   int byear = rs.getInt(5);
					   String bpno = rs.getString(6);
					   
					   displayS.append(bnum + "\t" + bname + "\t\t" + bano + "\t" + bprice + "\t" + byear + "\t" + bpno + "\n");
	   			}else{
	   				JOptionPane.showMessageDialog(null, "검색 결과가 없습니다.", "책 검색", JOptionPane.ERROR_MESSAGE);

	   			}
	   			clear();
	   		}else if(c == BSearchA){
	   			String s_BsearchA = BsearchA.getText().trim();
	   			rs = stmt.executeQuery("SELECT * FROM BOOK WHERE bano='"+s_BsearchA+"'");
	   			displayS.append("__________________________________________________________________________"+"\n");
	   			displayS.append("책번호(B#)   책이름\t        작가번호(A#)\t  가격      출판연도   출판사번호(P#) \n");
	   			displayS.append("__________________________________________________________________________"+"\n");
	   			while(rs.next()){
					   String bnum = rs.getString(1);
					   String bname = rs.getString(2);
					   String bano = rs.getString(3);
					   int bprice = rs.getInt(4);
					   int byear = rs.getInt(5);
					   String bpno = rs.getString(6);
					   
					   displayS.append(bnum + "\t" + bname + "\t\t" + bano + "\t" + bprice + "\t" + byear + "\t" + bpno + "\n");
	   			}
	   			clear();
	   		}else if(c == BSearchP){
	   			String s_BsearchP = BsearchP.getText().trim();
	   			rs = stmt.executeQuery("SELECT * FROM BOOK WHERE bpno='"+s_BsearchP+"'");
	   			displayS.append("__________________________________________________________________________"+"\n");
	   			displayS.append("책번호(B#)   책이름\t        작가번호(A#)\t  가격      출판연도   출판사번호(P#) \n");
	   			displayS.append("__________________________________________________________________________"+"\n");
	   			while(rs.next()){
					   String bnum = rs.getString(1);
					   String bname = rs.getString(2);
					   String bano = rs.getString(3);
					   int bprice = rs.getInt(4);
					   int byear = rs.getInt(5);
					   String bpno = rs.getString(6);
					   
					   displayS.append(bnum + "\t" + bname + "\t\t" + bano + "\t" + bprice + "\t" + byear + "\t" + bpno + "\n");
	   			}
	   			clear();
	   		}else if(c == BSearchR){
	   			String s_BsearchR = BsearchR.getText().trim();
	   			rs = stmt.executeQuery("SELECT SALESTATUS.RANK, BOOK.* FROM SALESTATUS, BOOK"
	   			+"WHERE SALESTATUS.bno = BOOK.bnum AND SALESTATUS.rank='"+s_BsearchR+"'");
	   			displayS.append("__________________________________________________________________________"+"\n");
	   			displayS.append("순위\t책번호(B#)   책이름\t        작가번호(A#)\t  가격      출판연도   출판사번호(P#) \n");
	   			displayS.append("__________________________________________________________________________"+"\n");
	   			if(rs.next()){
	   					int rank = rs.getInt(1);
					   	String bnum = rs.getString(2);
					   	String bname = rs.getString(3);
					   	String bano = rs.getString(4);
					   	int bprice = rs.getInt(5);
					   	int byear = rs.getInt(6);
					   	String bpno = rs.getString(7);
					   
					   displayS.append(rank + "\t" +bnum + "\t" + bname + "\t\t" + bano + "\t" + bprice + "\t" + byear + "\t" + bpno + "\n");
	   			}else{
	   				JOptionPane.showMessageDialog(null, "검색 결과가 없습니다.", "책 검색", JOptionPane.ERROR_MESSAGE);

	   			}
	   		}
		   clear();
	   
	   	}catch(Exception x){
		   System.out.println(x.getMessage());
	   }
	   return;
   }
   
   

   public static void main(String[] args){
	   BookPage bpp = new BookPage();
   }
}


