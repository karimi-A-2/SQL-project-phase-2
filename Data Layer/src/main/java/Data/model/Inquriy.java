package Data.model;

public class Inquriy {
    private int id;
    private int type;

    public Inquriy(int id, int type) {
        this.id = id;
        this.type = type;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return "Inquiry{" +
                "id=" + id +
                ", type='" + type + '\'' +
                '}';
    }
}
