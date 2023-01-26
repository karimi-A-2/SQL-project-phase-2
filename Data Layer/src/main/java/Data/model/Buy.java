package Data.model;

public class Buy {
    private int buyId;
    private int userId;
    private int insId;
    private int inqId;
    private String discountCode;
    private int finalPrice;

    public Buy(int buyId, int userId, int insId, int inqId, String discountCode, int finalPrice) {
        this.buyId = buyId;
        this.userId = userId;
        this.insId = insId;
        this.inqId = inqId;
        this.discountCode = discountCode;
        this.finalPrice = finalPrice;
    }

    public Buy(int buyId, int userId, int insId, int inqId, String discountCode) {
        this.buyId = buyId;
        this.userId = userId;
        this.insId = insId;
        this.inqId = inqId;
        this.discountCode = discountCode;
    }

    public int getBuyId() {
        return buyId;
    }

    public void setBuyId(int buyId) {
        this.buyId = buyId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getInsId() {
        return insId;
    }

    public void setInsId(int insId) {
        this.insId = insId;
    }

    public int getInqId() {
        return inqId;
    }

    public void setInqId(int inqId) {
        this.inqId = inqId;
    }

    public String getDiscountCode() {
        return discountCode;
    }

    public void setDiscountCode(String discountCode) {
        this.discountCode = discountCode;
    }

    public int getFinalPrice() {
        return finalPrice;
    }

    public void setFinalPrice(int finalPrice) {
        this.finalPrice = finalPrice;
    }

    @Override
    public String toString() {
        return "Buy{" +
                "buyId=" + buyId +
                ", userId=" + userId +
                ", insId=" + insId +
                ", inqId=" + inqId +
                ", discountCode=" + discountCode +
                ", finalPrice=" + finalPrice +
                '}';
    }
}
