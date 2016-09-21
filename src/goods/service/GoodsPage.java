package goods.service;

import java.util.List;

import goods.model.Goods;

public class GoodsPage {

	private int total;
	private int currentPage;
	private List<Goods> content;
	private int totalPages;
	private int startPage;
	private int endPage;
	
	public GoodsPage(int total, int currentPage, int size, List<Goods> content){
		this.total = total;
		this.currentPage = currentPage;
		this.content = content;
		if(total == 0){
			totalPages = 0;
			startPage = 0;
			endPage = 0;
		} else {
			totalPages = total / size;
			if(total % size > 0){
				totalPages++;
			}
			int modVal = currentPage % 5;
			startPage = currentPage / 5 * 5 + 1;
			if(modVal == 0) startPage -= 5;
			
			endPage = startPage + 4;
			if(endPage > totalPages) endPage = totalPages;
		}
	}

	public int getTotal() {
		return total;
	}
	
	public boolean hasNoGoods(){
		return total == 0;
	}
	
	public boolean hasGoods(){
		return total > 0;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public List<Goods> getContent() {
		return content;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}
}
