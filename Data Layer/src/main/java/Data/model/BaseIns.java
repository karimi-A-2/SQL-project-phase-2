package Data.model;

public class BaseIns {
    private int id;
    private String baseIns;

    public BaseIns(int id, String baseIns) {
        this.id = id;
        this.baseIns = baseIns;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBaseIns() {
        return baseIns;
    }

    public void setBaseIns(String baseIns) {
        this.baseIns = baseIns;
    }

    @Override
    public String toString() {
        return "BaseIns{" +
                "id=" + id +
                ", baseIns='" + baseIns + '\'' +
                '}';
    }
}
