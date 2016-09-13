package article.model;

public class ArticleContent {

	private Integer number; //null값이 필요한 경우 Int 대신 Integer 사용
	private String content;
	
	public ArticleContent(Integer number, String content) {
		this.number = number;
		this.content = content;
	}

	public Integer getNumber() {
		return number;
	}

	public String getContent() {
		return content;
	}
}
