package entities;
// Generated Jun 11, 2017 9:28:42 PM by Hibernate Tools 4.3.1



/**
 * Agent generated by hbm2java
 */
public class Agent  implements java.io.Serializable {


     private String agentCode;
     private String agentId;
     private String idcard;
     private String firstname;
     private String lastnames;
     private String birthday;
     private String address;
     private String phonenumberMain;
     private String phonenumberReserve;
     private String gender;
     private String nationality;
     private String relatedpersons;
     private String relationshipRelatedpersons;
     private String phonenumberRelatedpersons;
     private String expiredDate;
     private String degreeId;
     private String province;
     private String amphur;
     private String district;
     private String zipcode;
     private String password;
     private String username;
     private String active;
     private String imgPath;
     private String imgName;
     private String facebook;
     private String line;
     private String instagram;

    public Agent() {
    }

	
    public Agent(String agentCode) {
        this.agentCode = agentCode;
    }
    public Agent(String agentCode, String agentId, String idcard, String firstname, String lastnames, String birthday, String address, String phonenumberMain, String phonenumberReserve, String gender, String nationality, String relatedpersons, String relationshipRelatedpersons, String phonenumberRelatedpersons, String expiredDate, String degreeId, String province, String amphur, String district, String zipcode, String password, String username, String active, String imgPath, String imgName, String facebook, String line, String instagram) {
       this.agentCode = agentCode;
       this.agentId = agentId;
       this.idcard = idcard;
       this.firstname = firstname;
       this.lastnames = lastnames;
       this.birthday = birthday;
       this.address = address;
       this.phonenumberMain = phonenumberMain;
       this.phonenumberReserve = phonenumberReserve;
       this.gender = gender;
       this.nationality = nationality;
       this.relatedpersons = relatedpersons;
       this.relationshipRelatedpersons = relationshipRelatedpersons;
       this.phonenumberRelatedpersons = phonenumberRelatedpersons;
       this.expiredDate = expiredDate;
       this.degreeId = degreeId;
       this.province = province;
       this.amphur = amphur;
       this.district = district;
       this.zipcode = zipcode;
       this.password = password;
       this.username = username;
       this.active = active;
       this.imgPath = imgPath;
       this.imgName = imgName;
       this.facebook = facebook;
       this.line = line;
       this.instagram = instagram;
    }
   
    public String getAgentCode() {
        return this.agentCode;
    }
    
    public void setAgentCode(String agentCode) {
        this.agentCode = agentCode;
    }
    public String getAgentId() {
        return this.agentId;
    }
    
    public void setAgentId(String agentId) {
        this.agentId = agentId;
    }
    public String getIdcard() {
        return this.idcard;
    }
    
    public void setIdcard(String idcard) {
        this.idcard = idcard;
    }
    public String getFirstname() {
        return this.firstname;
    }
    
    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }
    public String getLastnames() {
        return this.lastnames;
    }
    
    public void setLastnames(String lastnames) {
        this.lastnames = lastnames;
    }
    public String getBirthday() {
        return this.birthday;
    }
    
    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }
    public String getAddress() {
        return this.address;
    }
    
    public void setAddress(String address) {
        this.address = address;
    }
    public String getPhonenumberMain() {
        return this.phonenumberMain;
    }
    
    public void setPhonenumberMain(String phonenumberMain) {
        this.phonenumberMain = phonenumberMain;
    }
    public String getPhonenumberReserve() {
        return this.phonenumberReserve;
    }
    
    public void setPhonenumberReserve(String phonenumberReserve) {
        this.phonenumberReserve = phonenumberReserve;
    }
    public String getGender() {
        return this.gender;
    }
    
    public void setGender(String gender) {
        this.gender = gender;
    }
    public String getNationality() {
        return this.nationality;
    }
    
    public void setNationality(String nationality) {
        this.nationality = nationality;
    }
    public String getRelatedpersons() {
        return this.relatedpersons;
    }
    
    public void setRelatedpersons(String relatedpersons) {
        this.relatedpersons = relatedpersons;
    }
    public String getRelationshipRelatedpersons() {
        return this.relationshipRelatedpersons;
    }
    
    public void setRelationshipRelatedpersons(String relationshipRelatedpersons) {
        this.relationshipRelatedpersons = relationshipRelatedpersons;
    }
    public String getPhonenumberRelatedpersons() {
        return this.phonenumberRelatedpersons;
    }
    
    public void setPhonenumberRelatedpersons(String phonenumberRelatedpersons) {
        this.phonenumberRelatedpersons = phonenumberRelatedpersons;
    }
    public String getExpiredDate() {
        return this.expiredDate;
    }
    
    public void setExpiredDate(String expiredDate) {
        this.expiredDate = expiredDate;
    }
    public String getDegreeId() {
        return this.degreeId;
    }
    
    public void setDegreeId(String degreeId) {
        this.degreeId = degreeId;
    }
    public String getProvince() {
        return this.province;
    }
    
    public void setProvince(String province) {
        this.province = province;
    }
    public String getAmphur() {
        return this.amphur;
    }
    
    public void setAmphur(String amphur) {
        this.amphur = amphur;
    }
    public String getDistrict() {
        return this.district;
    }
    
    public void setDistrict(String district) {
        this.district = district;
    }
    public String getZipcode() {
        return this.zipcode;
    }
    
    public void setZipcode(String zipcode) {
        this.zipcode = zipcode;
    }
    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    public String getUsername() {
        return this.username;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }
    public String getActive() {
        return this.active;
    }
    
    public void setActive(String active) {
        this.active = active;
    }
    public String getImgPath() {
        return this.imgPath;
    }
    
    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }
    public String getImgName() {
        return this.imgName;
    }
    
    public void setImgName(String imgName) {
        this.imgName = imgName;
    }
    public String getFacebook() {
        return this.facebook;
    }
    
    public void setFacebook(String facebook) {
        this.facebook = facebook;
    }
    public String getLine() {
        return this.line;
    }
    
    public void setLine(String line) {
        this.line = line;
    }
    public String getInstagram() {
        return this.instagram;
    }
    
    public void setInstagram(String instagram) {
        this.instagram = instagram;
    }




}


