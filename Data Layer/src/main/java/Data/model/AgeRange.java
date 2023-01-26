package Data.model;

public class AgeRange {
    private int id;
    private String range;

    public AgeRange(int id, String range) {
        this.id = id;
        this.range = range;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRange() {
        return range;
    }

    public void setRange(String range) {
        this.range = range;
    }

    @Override
    public String toString() {
        return "AgeRange{" +
                "id=" + id +
                ", range='" + range + '\'' +
                '}';
    }
}
