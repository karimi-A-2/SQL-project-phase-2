package Data.model;

public enum BuildingMaterial {
    ;
    private int id;
     private String material;

    BuildingMaterial(int id, String material) {
        this.id = id;
        this.material = material;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMaterial() {
        return material;
    }

    public void setMaterial(String material) {
        this.material = material;
    }

    @Override
    public String toString() {
        return "BuildingMaterial{" +
                "id=" + id +
                ", material='" + material + '\'' +
                '}';
    }
}
