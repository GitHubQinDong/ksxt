package com.qindong.util;
//��ҳ������
public class Page {
	private int pagenum;//��ҳ��
	private int total;//�ܼ�¼��
	private int pagesize=5;//ÿҳ��ʾ����
	private int pagenow=1;//��ǰҳ
	private boolean syy;//��һҳ
	private boolean xyy;//��һҳ
	
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
