package Data.model;

public class Life_insurance {
    private int id;
    private int redemptionValue;
    private int deathCapital;
    private int medicalExpences;
    private int ins_id;

    public Life_insurance(int id, int redemptionValue, int deathCapital, int medicalExpences, int ins_id) {
        this.id = id;
        this.redemptionValue = redemptionValue;
        this.deathCapital = deathCapital;
        this.medicalExpences = medicalExpences;
        this.ins_id = ins_id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getRedemptionValue() {
        return redemptionValue;
    }

    public void setRedemptionValue(int redemptionValue) {
        this.redemptionValue = redemptionValue;
    }

    public int getDeathCapital() {
        return deathCapital;
    }

    public void setDeathCapital(int deathCapital) {
        this.deathCapital = deathCapital;
    }

    public int getMedicalExpences() {
        return medicalExpences;
    }

    public void setMedicalExpences(int medicalExpences) {
        this.medicalExpences = medicalExpences;
    }

    public int getIns_id() {
        return ins_id;
    }

    public void setIn_id(int ins_id) {
        this.ins_id = ins_id;
    }

    @Override
    public String toString() {
        return "Life_insurance{" +
                "id=" + id +
                ", redemptionValue=" + redemptionValue +
                ", deathCapital=" + deathCapital +
                ", medicalExpences=" + medicalExpences +
                ", in_id=" + ins_id +
                '}';
    }
}
