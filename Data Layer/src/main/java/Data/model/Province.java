package Data.model;

public class Province {
    private int id;
    private String pName;

    public Province(int id, String pName) {
        this.id = id;
        this.pName = pName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    @Override
    public String toString() {
        return "Province{" +
                "id=" + id +
                ", pName='" + pName + '\'' +
                '}';
    }
}
