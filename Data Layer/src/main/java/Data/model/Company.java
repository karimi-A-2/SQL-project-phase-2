package Data.model;

public class Company {
    private int id;
    private String cName;

    public Company(int id, String cName) {
        this.id = id;
        this.cName = cName;
    }

    @Override
    public String toString() {
        return "Company{" +
                "id=" + id +
                ", cName='" + cName + '\'' +
                '}';
    }
}
