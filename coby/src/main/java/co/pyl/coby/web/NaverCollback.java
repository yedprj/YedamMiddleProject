package co.pyl.coby.web;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

@WebServlet("/NaverCollback.do")
public class NaverCollback extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public NaverCollback() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 네이버 로그인 처리 컨트롤러
		String clientId = "Qy86dSUCtITMUcO8bwIX";
		String clientSecret = "v1FqyMuBpR";
		String code = request.getParameter("code");
		String state = request.getParameter("state");
		String redirectURI = URLEncoder.encode("home.do", "UTF-8");

		String apiURL;
		apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
		apiURL += "client_id=" + clientId;
		apiURL += "&client_secret=" + clientSecret;
		apiURL += "&redirect_uri=" + redirectURI;
		apiURL += "&code=" + code;
		apiURL += "&state=" + state;
		String access_token = "";
		String refresh_token = "";

		try {
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			int responseCode = con.getResponseCode();
			BufferedReader br;

			if (responseCode == 200) { // 정상호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			
			String inputLine;
			StringBuffer res = new StringBuffer();
			
			while ((inputLine = br.readLine()) != null) {
				res.append(inputLine);
			}
			br.close();

			if (responseCode == 200) {
				System.out.println(res.toString());
				JSONParser parsing = new JSONParser();
				Object obj = parsing.parse(res.toString());
				JSONObject jsonObj = (JSONObject)obj;
					        
				access_token = (String)jsonObj.get("access_token");
				refresh_token = (String)jsonObj.get("refresh_token");
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		
		
		String token = access_token;	// 네이버 로그인 접근 토큰
		String header = "Bearer " + token;	// Bearer 다음에 공백 추가
		
		if(access_token != null) { // access_token을 잘 받아왔다면
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
		        StringBuffer res = new StringBuffer();
		        
		        while ((inputLine = br.readLine()) != null) {
		        	res.append(inputLine);
		        }
		        
		        br.close();
		        
		        JSONParser parsing = new JSONParser();
		        Object obj = parsing.parse(res.toString());
		        JSONObject jsonObj = (JSONObject)obj;
		        JSONObject resObj = (JSONObject)jsonObj.get("response");
		         
		        //왼쪽 변수 이름은 원하는 대로 정하면 된다. 
		        //단, 우측의 get()안에 들어가는 값은 와인색 상자 안의 값을 그대로 적어주어야 한다.
		        String naverCode = (String)resObj.get("id");
		        String email = (String)resObj.get("email");
		        String name = (String)resObj.get("name");
		        String nickName = (String)resObj.get("nickname");
		        String profile = (String)resObj.get("profile_image");		        
		        String phone = (String)resObj.get("mobile");
		        
		        
		        
		    } catch (Exception e) {
		    	System.out.println(e);
		    }
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
