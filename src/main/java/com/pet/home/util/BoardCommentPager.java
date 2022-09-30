package com.pet.home.util;

public class BoardCommentPager {
	
	// -- Mappe에서 사용
		private Long startRow;
		private Long lastRow;
		private Long num;
		private Long page;
		private Long perPage;
		private Long totalPage;
		
		
		public void getRowNum() {
			this.startRow = (this.getPage()-1)*this.getPerPage() + 1;
			this.lastRow = this.getPage() * this.getPerPage();
		}
		
		//전체 페이지 개수 계산
		public void makePage(Long totalCount) {
			this.totalPage = totalCount/this.getPerPage();
			if(totalCount%this.getPerPage() != 0 ) {
				this.totalPage++;
			}
		}
		
		
		
		public Long getNum() {
			return num;
		}

		public void setNum(Long num) {
			this.num = num;
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


		public Long getPage() {
			if(this.page == null || this.page < 0) {
				this.page = 1L;
			}
			return page;
		}


		public void setPage(Long page) {
			this.page = page;
		}


		public Long getPerPage() {
			if(this.perPage == null || this.perPage < 0) {
				this.perPage = 5L;
			}
			return perPage;
		}


		public void setPerPage(Long perPage) {
			this.perPage = perPage;
		}

		public Long getTotalPage() {
			return totalPage;
		}

		public void setTotalPage(Long totalPage) {
			this.totalPage = totalPage;
		}
}
