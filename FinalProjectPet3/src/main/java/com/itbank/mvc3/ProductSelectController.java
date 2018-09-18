package com.itbank.mvc3;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ProductSelectController {

		@Autowired
		ProductDAO ProductDAO;
	
	/*@RequestMapping("select.do")
	public String select(@RequestParam("id") String id, 
						ProductDTO ProductDTO, 
						Model model) throws Exception {
		ProductDTO ProductDTO2 = ProductDAO.select(ProductDTO);
		//ProductDTO ProductDTO2 = ProductDAO.select(ProductDTO.getId());
		System.out.println("id : "+ProductDTO2.getId());
		System.out.println("pw : "+ProductDTO2.getPw());
		System.out.println("name : "+ProductDTO2.getName());
		System.out.println("tel : "+ProductDTO2.getTel());
		model.addAttribute("ProductDTO2", ProductDTO2);
		
		return "selectResult";
	}*/
	

	@RequestMapping("selectAll2.do")
	public String select(Model model) throws Exception {
		ArrayList<ProductDTO> list =  (ArrayList<ProductDTO>) ProductDAO.selectAll();
		model.addAttribute("list", list);
		System.out.println(list.size());
		System.out.println(list.get(4).getName());
		return "ProductselectAllResult";
	}
}



