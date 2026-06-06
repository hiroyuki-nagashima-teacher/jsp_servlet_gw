package gw05.bean;

import java.io.Serializable;

/**
 * 書籍情報を保持するJavaBeansクラスです。
 * JavaBeansの規約に従って実装されています。
 */
public class BookBean implements Serializable {
    private static final long serialVersionUID = 1L;

    private String title;
    private String author;
    private String price;

    public BookBean() {
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }
}
