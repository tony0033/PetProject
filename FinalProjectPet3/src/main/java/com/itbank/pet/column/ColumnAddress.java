package com.itbank.pet.column;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;


public class ColumnAddress {
	private final static String address1 = "http://www.bodeum.co.kr/html/edu_movie/community/community_list.php";
	private final static String address2 = "http://www.bodeum.co.kr/html/edu_movie/community/community_list.php?code=community_column&category=&PageNumber=2&goods_idx=&search_order=";
	private final static String address3 = "http://www.bodeum.co.kr/html/edu_movie/community/community_list.php?code=community_column&category=&PageNumber=3&goods_idx=&search_order=";
	
	
public static void main(String[] args) throws Exception{
		
		
		Document doc1 = (Document)Jsoup.connect(address1).get();
		Document doc2 = (Document)Jsoup.connect(address2).get();
		Document doc3 = (Document)Jsoup.connect(address3).get();
		
		Elements domain1 = doc1.select(".white-Pannel").select(".title").select("a");
		Elements domain2 = doc2.select(".white-Pannel").select(".title").select("a");
		Elements domain3 = doc3.select(".white-Pannel").select(".title").select("a");
		Elements title1 = doc1.select(".white-Pannel").select(".title").select(".titleSpan");
		Elements title2 = doc2.select(".white-Pannel").select(".title").select(".titleSpan");
		Elements title3 = doc3.select(".white-Pannel").select(".title").select(".titleSpan");
		
		String domain = "http://www.bodeum.co.kr/html/edu_movie/community/community_list.php";
		
		ColumnDAO dao = new ColumnDAO();
		
		for(int i=0;i<domain1.size();i++) {
			ColumnDTO dto = new ColumnDTO();
			dto.setAddr(domain+domain1.eq(i).attr("href"));
			dto.setTitle(title1.eq(i).text());
			dao.insert(dto);
			System.out.println(domain1.eq(i).attr("href"));
			System.out.println(title1.eq(i).text());
		}
		for(int i=0;i<domain2.size();i++) {
			ColumnDTO dto = new ColumnDTO();
			dto.setAddr(domain+domain2.eq(i).attr("href"));
			dto.setTitle(title2.eq(i).text());
			dao.insert(dto);
			System.out.println(domain2.eq(i).attr("href"));
			System.out.println(title2.eq(i).text());
			
		}
		for(int i=0;i<domain3.size();i++) {
			ColumnDTO dto = new ColumnDTO();
			dto.setAddr(domain+domain3.eq(i).attr("href"));
			dto.setTitle(title3.eq(i).text());
			dao.insert(dto);
			System.out.println(domain3.eq(i).attr("href"));
			System.out.println(title3.eq(i).text());
			
		}

	}
}

