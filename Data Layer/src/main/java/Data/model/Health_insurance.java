package Data.model;

public class Health_insurance {
    private int id;
    private String insService;
    private int childBirth;
    private int chronicDisease;
    private int shareOfCosts;
    private int ins_id;

    public Health_insurance(int id, String insService, int childBirth, int chronicDisease, int shareOfCosts, int ins_id) {
        this.id = id;
        this.insService = insService;
        this.childBirth = childBirth;
        this.chronicDisease = chronicDisease;
        this.shareOfCosts = shareOfCosts;
        this.ins_id = ins_id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getInsService() {
        return insService;
    }

    public void setInsService(String insService) {
        this.insService = insService;
    }

    public int getChildBirth() {
        return childBirth;
    }

    public void setChildBirth(int childBirth) {
        this.childBirth = childBirth;
    }

    public int getChronicDisease() {
        return chronicDisease;
    }

    public void setChronicDisease(int chronicDisease) {
        this.chronicDisease = chronicDisease;
    }

    public int getShareOfCosts() {
        return shareOfCosts;
    }

    public void setShareOfCosts(int shareOfCosts) {
        this.shareOfCosts = shareOfCosts;
    }

    public int getIns_id() {
        return ins_id;
    }

    public void setIns_id(int ins_id) {
        this.ins_id = ins_id;
    }

    @Override
    public String toString() {
        return "Health_insurance{" +
                "id=" + id +
                ", insService='" + insService + '\'' +
                ", childBirth=" + childBirth +
                ", chronicDisease=" + chronicDisease +
                ", shareOfCosts=" + shareOfCosts +
                ", ins_id=" + ins_id +
                '}';
    }
}
