package com.itbank.mvc3;

public class DiaryDTO {
private int no;
private String title;
private String date;
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public String getDate() {
	return date;
}
public void setDate(String date) {
	this.date = date;
}
private String content;
public int getNo() {
	return no;
}
public void setNo(int no) {
	this.no = no;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}

}
