<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    <%@ page import="net.sf.json.JSONArray" %>
<%@ page import="net.sf.json.JSONObject" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/skel.min.js"></script>
<script src="resources/js/util.js"></script>
<script src="resources/js/main.js"></script>
<script src="https://code.jquery.com/jquery-1.12.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
 <%
    String clientId = "zlDriEj1_jvSJVtEmrwa";//애플리케이션 클라이언트 아이디값";
    String clientSecret = "8ksaDmLx1p";//애플리케이션 클라이언트 시크릿값";
    String code = request.getParameter("code");
    String state = request.getParameter("state");
    String redirectURI = URLEncoder.encode("http://localhost:8888/mvc3/callback.jsp", "UTF-8");
    String apiURL;
    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
    apiURL += "client_id=" + clientId;
    apiURL += "&client_secret=" + clientSecret;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&code=" + code;
    apiURL += "&state=" + state;
    String access_token = "";
    String refresh_token = "";
    System.out.println("apiURL="+apiURL);
    StringBuffer res = new StringBuffer();
    try {
      URL url = new URL(apiURL);
      HttpURLConnection con = (HttpURLConnection)url.openConnection();
      con.setRequestMethod("GET");
      int responseCode = con.getResponseCode();
      BufferedReader br;
      System.out.print("responseCode="+responseCode);
      if(responseCode==200) { // 정상 호출
        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
      } else {  // 에러 발생
        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
      }
      String inputLine;
      while ((inputLine = br.readLine()) != null) {
        res.append(inputLine);
      }
      br.close();
      if(responseCode==200) {
         out.println(res.toString()); 
      }
    } catch (Exception e) {
      System.out.println(e);
    }
    
    String s = res.toString();
    out.println(s); 
    String accesstoken = s.substring(s.indexOf(":")+2,s.indexOf("refresh_token")-3);
    String header = "Bearer " + accesstoken;
    
    try {
        apiURL = "https://openapi.naver.com/v1/nid/me";
        URL url = new URL(apiURL);
        HttpURLConnection con = (HttpURLConnection)url.openConnection();
        con.setRequestMethod("GET");
        con.setRequestProperty("Authorization", header);
        int responseCode = con.getResponseCode();
        BufferedReader br;
        if(responseCode==200) { // 정상 호출
            br = new BufferedReader(new InputStreamReader(con.getInputStream()));
        } else {  // 에러 발생
            br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
        }
        String inputLine;
        String resStr = "[";
        while ((inputLine = br.readLine()) != null) {
            resStr += inputLine;
        }
        resStr += "]";
        String temp = resStr.replace("responseCode=200", "");
        br.close();
        JSONArray json = JSONArray.fromObject(temp);
        JSONObject jObj = json.getJSONObject(0);
        String respon = "["+jObj.getString("response")+"]";
		JSONArray responjson = JSONArray.fromObject(respon);
        JSONObject responjsonObj = responjson.getJSONObject(0);
        String nickname 		= responjsonObj.getString("nickname");
        String age 				= responjsonObj.getString("age");
        String id 				= responjsonObj.getString("id");
        String name 			= responjsonObj.getString("name");
        session.setAttribute("nickname", "<img src = 'resources/images/Nmark.jpg'>" +nickname  );
        session.setAttribute("age", age);
        session.setAttribute("id", id);
        session.setAttribute("name", name);
        out.println(session.getAttribute("nickname"));
        out.println("<script>alert('로그인에 성공하셨습니다.');</script>");
        response.sendRedirect("main.jsp");
    }
        catch (Exception e) {
            System.out.println(e);
        }
  %>
  
</body>
</html>