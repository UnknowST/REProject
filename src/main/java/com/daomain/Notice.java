package com.daomain;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Notice {
  Integer num;
  String news;

  @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss")
  Date createdate, startime, endtime;

  public Integer getNum() {
    return num;
  }

  public void setNum(Integer num) {
    this.num = num;
  }

  public String getNews() {
    return news;
  }

  public void setNews(String news) {
    this.news = news;
  }

  public Date getCreatedate() {
    return createdate;
  }

  public void setCreatedate(Date createdate) {
    this.createdate = createdate;
  }

  public Date getStartime() {
    return startime;
  }

  public void setStartime(Date startime) {
    this.startime = startime;
  }

  public Date getEndtime() {
    return endtime;
  }

  public void setEndtime(Date endtime) {
    this.endtime = endtime;
  }

  @Override
  public String toString() {
    return "Notice{" +
            "num=" + num +
            ", news='" + news + '\'' +
            ", createdate=" + createdate +
            ", startime=" + startime +
            ", endtime=" + endtime +
            '}';
  }
}
