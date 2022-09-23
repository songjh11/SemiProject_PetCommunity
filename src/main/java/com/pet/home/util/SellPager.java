package com.pet.home.util;

public class SellPager {
	
	private Long page;
	private Long perPage;
	private Long perBlock;
	private Long startRow;
	private Long lastRow;
	private Long startNum;
	private Long lastNum;
	
	//검색 컬럼의 종류
		private Long itemCatg;
		private String search;
		
		
		
		public Long getItemCatg() {
			if(this.itemCatg==null) {
				this.itemCatg = 1L;
			}
			return itemCatg;
		}

		public void setItemCatg(Long itemCatg) {
			this.itemCatg = itemCatg;
		}

		public String getSearch() {
			if(this.search == null) {
				this.search = "";
			}
			return search;
		}

		public void setSearch(String search) {
			this.search = search;
		}

	public Long getPage() {
		if(this.page==null||this.page<=0) {
			this.page=1L;
		}
		return page;
	}

	public void setPage(Long page) {
		this.page = page;
	}

	public Long getPerPage() {
		return perPage;
	}

	public void setPerPage(Long perPage) {
		this.perPage = perPage;
	}

	public Long getPerBlock() {
		return perBlock;
	}

	public void setPerBlock(Long perBlock) {
		this.perBlock = perBlock;
	}

	public Long getStartRow() {
		return startRow;
	}

	public void setStartRow(Long startRow) {
		this.startRow = startRow;
	}

	public Long getLastRow() {
		return lastRow;
	}

	public void setLastRow(Long lastRow) {
		this.lastRow = lastRow;
	}

	public Long getStartNum() {
		return startNum;
	}

	public void setStartNum(Long startNum) {
		this.startNum = startNum;
	}

	public Long getLastNum() {
		return lastNum;
	}

	public void setLastNum(Long lastNum) {
		this.lastNum = lastNum;
	}
//pager 메서드 모음==============================================================
	//page 생성자
	public SellPager() {
		this.perPage = 20L;
		this.perBlock = 3L;
	}
	
	//이전 블럭의 유무-이전 블럭이 있으면 true, 없으면 false
		private boolean pre;
		//다음 블럭의 유무-다음 블럭이 있으면 true, 없으면 false
		private boolean next;
	
	//mapper 쿼리 사용할 로우 생성
	public void getRowNum() throws Exception{
		this.startRow = (this.getPage()-1)*this.getPerPage()+1;
		this.lastRow = (this.getPage())*(this.getPerPage());
	}
	
	//jsp로 보내줄 페이지네이션 번호 계산
	public void getNum(Long totalCount) throws Exception{
		//totalPage 계산
		 Long totalPage = totalCount/this.getPerPage();
		 //totalCount에서 perPage 나눴을때 0이 아니라면 totalPage는 +1
		 //ex: totalCount:122 perPage:20 -> totalPage: 6+1 
		 if(totalCount%this.getPerPage()!=0) {
			 totalPage++;
		 }
		 
		 if(this.getPage()>totalPage) {
			 this.setPage(totalPage);
		 }
		 //totalBlock은 페이지네이션의 총 갯수
		 Long totalBlock = totalPage/this.getPerBlock();
		//totalPage를 PerBlock으로 나눴을때 0이 아니라면 totalBlock은 +1
		 //ex: totalPage:7 perPage:5 -> totalPage: 1+1 
		 if(totalPage%this.getPerBlock()!=0) {
			 totalBlock++;
		 }
		 
		 //curBlock: 페이지네이션의 현재 번호
		 Long curBlock = this.getPage()/this.getPerBlock();
		 if(this.getPage()%this.getPerBlock()!=0) {
			 curBlock++;
		 }
		 
		 
		 this.startNum = (curBlock-1)*this.getPerBlock();
		 this.lastNum = curBlock*this.getPerBlock();
		 
		 if(curBlock==totalBlock) {
			 this.lastNum = totalPage;
		 }
		 
		 if(curBlock>1) {
				pre=true;
			}
			
			if(curBlock<totalBlock) {
				next=true;
			}
		 
		 
	}
	

}
