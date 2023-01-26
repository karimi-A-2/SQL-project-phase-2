package Data.model;

public class Reminder {
    private int id;
    private int ins_type;
    private String due_date;
    private int ins_period;
    private String ins_description;
    private int provinceId;
    private int cityId;
    private int userId;

    public Reminder(int id, int ins_type, String due_date, int ins_period, String ins_description,
                    int provinceId, int cityId, int userId) {
        this.id = id;
        this.ins_type = ins_type;
        this.due_date = due_date;
        this.ins_period = ins_period;
        this.ins_description = ins_description;
        this.provinceId = provinceId;
        this.cityId = cityId;
        this.userId = userId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIns_type() {
        return ins_type;
    }

    public void setIns_type(int ins_type) {
        this.ins_type = ins_type;
    }

    public String getDue_date() {
        return due_date;
    }

    public void setDue_date(String due_date) {
        this.due_date = due_date;
    }

    public int getIns_period() {
        return ins_period;
    }

    public void setIns_period(int ins_period) {
        this.ins_period = ins_period;
    }

    public String getIns_description() {
        return ins_description;
    }

    public void setIns_description(String ins_description) {
        this.ins_description = ins_description;
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

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Override
    public String toString() {
        return "Reminder{" +
                "id=" + id +
                ", ins_type=" + ins_type +
                ", due_date='" + due_date + '\'' +
                ", ins_period=" + ins_period +
                ", ins_description='" + ins_description + '\'' +
                ", provinceId=" + provinceId +
                ", cityId=" + cityId +
                ", userId=" + userId +
                '}';
    }
}
