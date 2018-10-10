package com.itbank.mvc3;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller	//동물병원 주소 검색 API
public class PetHospitalController {

	@RequestMapping("petHospital")
    public String PetHospital(HttpServletRequest request, Model model) {
		String hospital = request.getParameter("petHospital");
		model.addAttribute("addr", hospital);
		
        String clientId = "jaG8KkSiXrEU9enGCL8N";	//애플리케이션 클라이언트 아이디값;
        String clientSecret = "rk7TR5x_fh";			//애플리케이션 클라이언트 시크릿값;
        try {
            String text = URLEncoder.encode((hospital + " 동물병원"), "UTF-8");
            String apiURL = "https://openapi.naver.com/v1/search/local.json?query="+ text; // json 결과
            
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
            	response.append(inputLine);	//나온 모든 값을 넣어준다.
            }
            br.close();
            
            
            String hospitalAddr = response.toString();	//동물병원 정보 값들을 String으로 저장
            System.out.println(hospitalAddr);
            model.addAttribute("hospitalAddr", hospitalAddr);	
            
        } catch (Exception e) {
            System.out.println(e);
        }        
        return "mapSearch";
    }
}