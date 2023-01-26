package Data.model;

public class City {
    private int id;
    private String cName;
    private int pId;

    public City(int id, String cName, int pId) {
        this.id = id;
        this.cName = cName;
        this.pId = pId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getcName() {
        return cName;
    }

    public void setcName(String cName) {
        this.cName = cName;
    }

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    @Override
    public String toString() {
        return "City{" +
                "id=" + id +
                ", cName='" + cName + '\'' +
                ", pId=" + pId +
                '}';
    }
}
