package Data.model;

public class Member {
    private int id;
    private int base_in;
    private int age_range;
    private int relation;
    private int head_id;
    private int health_inq_id;

    public Member(int id, int base_in, int age_range, int relation, int head_id, int health_inq_id) {
        this.id = id;
        this.base_in = base_in;
        this.age_range = age_range;
        this.relation = relation;
        this.head_id = head_id;
        this.health_inq_id = health_inq_id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getBase_in() {
        return base_in;
    }

    public void setBase_in(int base_in) {
        this.base_in = base_in;
    }

    public int getAge_range() {
        return age_range;
    }

    public void setAge_range(int age_range) {
        this.age_range = age_range;
    }

    public int getRelation() {
        return relation;
    }

    public void setRelation(int relation) {
        this.relation = relation;
    }

    public int getHead_id() {
        return head_id;
    }

    public void setHead_id(int head_id) {
        this.head_id = head_id;
    }

    public int getHealth_inq_id() {
        return health_inq_id;
    }

    public void setHealth_inq_id(int health_inq_id) {
        this.health_inq_id = health_inq_id;
    }

    @Override
    public String toString() {
        return "Member{" +
                "id=" + id +
                ", base_in=" + base_in +
                ", age_range=" + age_range +
                ", relation=" + relation +
                ", head_id=" + head_id +
                ", health_inq_id=" + health_inq_id +
                '}';
    }
}
