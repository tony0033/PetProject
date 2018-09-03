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

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Controller	//동물병원 주소 검색 API
public class PetHospitalController {

	@RequestMapping("petHospital")
    public String PetHospital(HttpServletRequest request, Model model) {
		String hospital = request.getParameter("petHospital");
		
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
            
            //object 안에 object가 있는 경우
            JsonParser Parser = new JsonParser();	//파싱을 위해 JsonParser 객체를 만듬
            JsonObject JsonObj = (JsonObject) Parser.parse(hospitalAddr);	//object에 key값이 있어 JsonParser를 Object로 먼저 파싱
            JsonArray itemsArray = (JsonArray) JsonObj.get("items");	//object에서 key(items)를 get하여 해당하는 object를 array로 저장
            System.out.println(JsonObj);

            //key의  value를 가져와 저장하기 위한 배열 생성
            String[] title= new String[itemsArray.size()];
            String[] link= new String[itemsArray.size()];
            String[] telephone= new String[itemsArray.size()];
            String[] address= new String[itemsArray.size()];
            String[] roadAddress= new String[itemsArray.size()];
            
            //key에 해당하는 value값 추출
            for (int i = 0; i < itemsArray.size(); i++) {
				JsonObject items = (JsonObject) itemsArray.get(i);	//array에서 object에 해당하는 key로 value를 추출할 수 있게 일렬로 정렬
				title[i] = String.valueOf(items.get("title")).replaceAll("<b>", " ").replaceAll("</b>", "");
				link[i] = String.valueOf(items.get("link"));
				telephone[i] = String.valueOf(items.get("telephone"));
				address[i] = String.valueOf(items.get("address"));
				roadAddress[i] = String.valueOf(items.get("roadAddress"));
			}
            
            model.addAttribute("title", title);				//이름을 title로 지정
            model.addAttribute("link", link);				//이름을 link로 지정
            model.addAttribute("telephone", telephone);		//이름을 telephone로 지정
            model.addAttribute("address", address);			//이름을 address로 지정
            model.addAttribute("roadAddress", roadAddress);	//이름을 roadAddress로 지정
            
        } catch (Exception e) {
            System.out.println(e);
        }        
        return "mapSearch";
    }
}