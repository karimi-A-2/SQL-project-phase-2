package Data.model;

public class Property_inq {
    private int id;
    private int provinceId;
    private int cityId;
    private int structureType;
    private int uinitCount;
    private int buildingType;
    private int lifeBulding;
    private int meterage;
    private int costPerMeter;
    private int appliancePrice;
    private int inq_id;

    public Property_inq(int id, int provinceId, int cityId, int structureType, int uinitCount,
                        int buildingType, int lifeBulding, int meterage, int costPerMeter,
                        int appliancePrice, int inq_id) {
        this.id = id;
        this.provinceId = provinceId;
        this.cityId = cityId;
        this.structureType = structureType;
        this.uinitCount = uinitCount;
        this.buildingType = buildingType;
        this.lifeBulding = lifeBulding;
        this.meterage = meterage;
        this.costPerMeter = costPerMeter;
        this.appliancePrice = appliancePrice;
        this.inq_id = inq_id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProvinceId() {
        return provinceId;
    }

    public void setProvinceId(int provinceId) {
        this.provinceId = provinceId;
    }

    public int getCityId() {
        return cityId;
    }

    public void setCityId(int cityId) {
        this.cityId = cityId;
    }

    public int getStructureType() {
        return structureType;
    }

    public void setStructureType(int structureType) {
        this.structureType = structureType;
    }

    public int getUinitCount() {
        return uinitCount;
    }

    public void setUinitCount(int uinitCount) {
        this.uinitCount = uinitCount;
    }

    public int getBuildingType() {
        return buildingType;
    }

    public void setBuildingType(int buildingType) {
        this.buildingType = buildingType;
    }

    public int getLifeBulding() {
        return lifeBulding;
    }

    public void setLifeBulding(int lifeBulding) {
        this.lifeBulding = lifeBulding;
    }

    public int getMeterage() {
        return meterage;
    }

    public void setMeterage(int meterage) {
        this.meterage = meterage;
    }

    public int getCostPerMeter() {
        return costPerMeter;
    }

    public void setCostPerMeter(int costPerMeter) {
        this.costPerMeter = costPerMeter;
    }

    public int getAppliancePrice() {
        return appliancePrice;
    }

    public void setAppliancePrice(int appliancePrice) {
        this.appliancePrice = appliancePrice;
    }

    public int getInq_id() {
        return inq_id;
    }

    public void setInq_id(int inq_id) {
        this.inq_id = inq_id;
    }

    @Override
    public String toString() {
        return "Property_inq{" +
                "id=" + id +
                ", provinceId=" + provinceId +
                ", cityId=" + cityId +
                ", structureType=" + structureType +
                ", uinitCount=" + uinitCount +
                ", buildingType=" + buildingType +
                ", lifeBulding=" + lifeBulding +
                ", meterage=" + meterage +
                ", costPerMeter=" + costPerMeter +
                ", appliancePrice=" + appliancePrice +
                ", inq_id=" + inq_id +
                '}';
    }
}
