package Data.model;

public class Health_inq {
    private int id;
    private boolean family;
    private int inq_id;
    private int countOfMembers;

    public Health_inq(int id, boolean family, int inq_id, int countOfMembers) {
        this.id = id;
        this.family = family;
        this.inq_id = inq_id;
        this.countOfMembers = countOfMembers;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public boolean isFamily() {
        return family;
    }

    public void setFamily(boolean family) {
        this.family = family;
    }

    public int getInq_id() {
        return inq_id;
    }

    public void setInq_id(int inq_id) {
        this.inq_id = inq_id;
    }

    public int getCountOfMembers() {
        return countOfMembers;
    }

    public void setCountOfMembers(int countOfMembers) {
        this.countOfMembers = countOfMembers;
    }

    @Override
    public String toString() {
        return "Health_inq{" +
                "id=" + id +
                ", family=" + family +
                ", inq_id=" + inq_id +
                ", countOfMembers=" + countOfMembers +
                '}';
    }
}
