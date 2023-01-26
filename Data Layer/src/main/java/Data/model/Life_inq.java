package Data.model;

public class Life_inq {
    private int id;
    private String birth_date;
    private int contractPeriod;
    private int paymentWay;
    private int monthlyPay;
    private int premiumsIncrease;
    private int capitalIncrease;
    private int deathCoefficient;
    private int inq_id;

    public Life_inq(int id, String birth_date, int contractPeriod, int paymentWay, int monthlyPay, int premiumsIncrease,
                    int capitalIncrease, int deathCoefficient, int inq_id) {
        this.id = id;
        this.birth_date = birth_date;
        this.contractPeriod = contractPeriod;
        this.paymentWay = paymentWay;
        this.monthlyPay = monthlyPay;
        this.premiumsIncrease = premiumsIncrease;
        this.capitalIncrease = capitalIncrease;
        this.deathCoefficient = deathCoefficient;
        this.inq_id = inq_id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBirth_date() {
        return birth_date;
    }

    public void setBirth_date(String birth_date) {
        this.birth_date = birth_date;
    }

    public int getContractPeriod() {
        return contractPeriod;
    }

    public void setContractPeriod(int contractPeriod) {
        this.contractPeriod = contractPeriod;
    }

    public int getPaymentWay() {
        return paymentWay;
    }

    public void setPaymentWay(int paymentWay) {
        this.paymentWay = paymentWay;
    }

    public int getMonthlyPay() {
        return monthlyPay;
    }

    public void setMonthlyPay(int monthlyPay) {
        this.monthlyPay = monthlyPay;
    }

    public int getPremiumsIncrease() {
        return premiumsIncrease;
    }

    public void setPremiumsIncrease(int premiumsIncrease) {
        this.premiumsIncrease = premiumsIncrease;
    }

    public int getCapitalIncrease() {
        return capitalIncrease;
    }

    public void setCapitalIncrease(int capitalIncrease) {
        this.capitalIncrease = capitalIncrease;
    }

    public int getDeathCoefficient() {
        return deathCoefficient;
    }

    public void setDeathCoefficient(int deathCoefficient) {
        this.deathCoefficient = deathCoefficient;
    }

    public int getInq_id() {
        return inq_id;
    }

    public void setInq_id(int inq_id) {
        this.inq_id = inq_id;
    }

    @Override
    public String toString() {
        return "Life_inq{" +
                "id=" + id +
                ", birth_date='" + birth_date + '\'' +
                ", contractPeriod=" + contractPeriod +
                ", paymentWay=" + paymentWay +
                ", monthlyPay=" + monthlyPay +
                ", premiumsIncrease=" + premiumsIncrease +
                ", capitalIncrease=" + capitalIncrease +
                ", deathCoefficient=" + deathCoefficient +
                ", inq_id=" + inq_id +
                '}';
    }
}
