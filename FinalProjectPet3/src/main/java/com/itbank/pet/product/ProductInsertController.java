package com.itbank.pet.product;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductInsertController {
	
	@Autowired
	ProductDAO productDAO;
	
	
	@RequestMapping("B2")
	public  String crowling(Model model, ProductDTO productDTO) throws Exception {
		int num[] = new int[97];
				for (int i = 0; i < num.length; i++) {
					num[i]= i+31800;
				}
				String one = "";	//한페이지에 전부 출력
				String all = ""; //한번에 출력
		for (int i = 0; i < num.length; i++) {
			try {
			
				String URL = "http://www.ohdog.co.kr/shop/goods/goods_view.php?goodsno="+num[i]+"&category=001";
				Document doc = Jsoup.connect(URL).get();
			/*Elements elem3 = doc.select("#goods_spec");
			String elem2 =  elem3.toString();
			elem = elem + elem2;
			model.addAttribute("elem2",elem);*/
				Elements img = doc.select("#objImg");
				String img2 = img.toString();
				img2 = img2.replace("..", "http://www.ohdog.co.kr/shop");
				
			Elements price = doc.select("#price");
			String price2 =  price.toString();

			
			Elements name = doc.select("#goods_spec");
			String name2 =  name.toString();
				String name3 = name2.substring(name2.indexOf("<b>")+34,name2.indexOf("</b>")-7); //상품 이름
				String other = name2.substring(name2.lastIndexOf("<b>")+34,name2.lastIndexOf("</b>")-7);//상품 기타 정보
				all = price2+name3+other;
				one = img2+ one + all + "<br>";
				
				productDTO.setName(name3);
				productDTO.setPrice(price2);
				productDTO.setImg(img2);
				productDTO.setOther(other);
				productDTO.setLink(URL);
				productDAO.insert(productDTO);
		} catch (Exception e) {
				
			} 
			//String elem6= elem2.substring(elem2.indexOf("")+60,elem2.indexOf("<span>")-7);
			//model.addAttribute("elem3",elem2);
			//model.addAttribute("elem4",elem5);
			
		}
				model.addAttribute("elem",one);
		return "ProductInsertResult";
		
}
}
