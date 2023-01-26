package Data.model;

public class Property_ins {
    private int id;
    private int rating;
    private int ability;
    private int satisfaction;
    private int branch;
    private int ins_id;

    public Property_ins(int id, int rating, int ability, int satisfaction, int branch, int ins_id) {
        this.id = id;
        this.rating = rating;
        this.ability = ability;
        this.satisfaction = satisfaction;
        this.branch = branch;
        this.ins_id = ins_id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public int getAbility() {
        return ability;
    }

    public void setAbility(int ability) {
        this.ability = ability;
    }

    public int getSatisfaction() {
        return satisfaction;
    }

    public void setSatisfaction(int satisfaction) {
        this.satisfaction = satisfaction;
    }

    public int getBranch() {
        return branch;
    }

    public void setBranch(int branch) {
        this.branch = branch;
    }

    public int getIns_id() {
        return ins_id;
    }

    public void setIns_id(int ins_id) {
        this.ins_id = ins_id;
    }

    @Override
    public String toString() {
        return "Property_ins{" +
                "id=" + id +
                ", rating=" + rating +
                ", ability=" + ability +
                ", satisfaction=" + satisfaction +
                ", branch=" + branch +
                ", ins_id=" + ins_id +
                '}';
    }
}
