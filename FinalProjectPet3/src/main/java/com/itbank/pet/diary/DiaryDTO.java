package com.itbank.pet.diary;

public class DiaryDTO {
private int no;
private String title;
private String calendar;
private String content;
private String id;

public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
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
public String getCalendar() {
	return calendar;
}
public void setCalendar(String calendar) {
	this.calendar = calendar;
}
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}

}
