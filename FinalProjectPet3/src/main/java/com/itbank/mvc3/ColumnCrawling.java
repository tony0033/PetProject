package com.itbank.mvc3;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class ColumnCrawling {
	
	@RequestMapping("column.do")
	public String get(Model model, HttpServletRequest request) throws Exception {
		//String domain = "http://www.bodeum.co.kr/html/edu_movie/community/community_list.php";
		String address = request.getParameter("addr");
		System.out.println(address);
		Document doc = (Document)Jsoup.connect(address).get();
		String title = doc.select(".title").text();
		String date = doc.select(".date").text();
		String viewCount = doc.select(".viewCount").text();
		
		Elements content = doc.select(".listEditor");
		Elements content2 = content.select("div");
		Elements content3 = content.select("p");
		Elements content4 = content3.select("span");
		
		ArrayList<String> list = new ArrayList<String>();
		ArrayList<String> list2 = new ArrayList<String>();
		list.add(title);
		list.add(date);
		list.add(viewCount);
		int idx = 0;
		int idx1 = 0;
		for (Element element : content2) {
			if(idx != 0) {
			list.add(element.text());
			}
			idx++;
		}
		if(content4 != null) {
			for (Element element : content4) {
				if(idx1 != 0) {
					list2.add(element.text());
				}
				idx1++;
			}		
		}
		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
		return "column";
	}
}

