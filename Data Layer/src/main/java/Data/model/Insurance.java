package Data.model;

public class Insurance {
    private int id;
    private int companyId;
    private int price;
    private int type;
    private int discount;

    public Insurance(int id, int companyId, int price, int type, int discount) {
        this.id = id;
        this.companyId = companyId;
        this.price = price;
        this.type = type;
        this.discount = discount;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCompanyId() {
        return companyId;
    }

    public void setCompanyId(int companyId) {
        this.companyId = companyId;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    @Override
    public String toString() {
        return "Insurance{" +
                "id=" + id +
                ", companyId=" + companyId +
                ", price=" + price +
                ", type=" + type +
                ", discount=" + discount +
                '}';
    }
}