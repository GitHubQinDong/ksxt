package com.qindong.util;
//分页工具类
public class Page {
	private int pagenum;//总页数
	private int total;//总记录数
	private int pagesize=5;//每页显示条数
	private int pagenow=1;//当前页
	private boolean syy;//上一页
	private boolean xyy;//下一页
	
	public int getPagenum() {
		pagenum=total%pagesize==0?total/pagesize:(total/pagesize+1);
		return pagenum;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getPagesize() {
		return pagesize;
	}
	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}
	public int getPagenow() {
		return pagenow;
	}
	public void setPagenow(int pagenow) {
		this.pagenow = pagenow;
	}
	public boolean isSyy() {
		syy=pagenow>1?true:false;
		return syy;
	}
	public void setSyy(boolean syy) {
		this.syy = syy;
	}
	public boolean isXyy() {
		xyy=pagenow<getPagenum()?true:false;
		return xyy;
	}
	public void setXyy(boolean xyy) {
		this.xyy = xyy;
	}	

}
