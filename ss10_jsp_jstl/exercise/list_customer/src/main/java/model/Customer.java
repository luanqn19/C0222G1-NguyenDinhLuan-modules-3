package model;

public class Customer {
    private String name, birthDay, address, pathFile;

    public Customer (String name , String birthDay , String address , String pathFile) {
        this.name = name;
        this.birthDay = birthDay;
        this.address = address;
        this.pathFile = pathFile;
    }

    public String getName () {
        return name;
    }

    public void setName (String name) {
        this.name = name;
    }

    public String getBirthDay () {
        return birthDay;
    }

    public void setBirthDay (String birthDay) {
        this.birthDay = birthDay;
    }

    public String getAddress () {
        return address;
    }

    public void setAddress (String address) {
        this.address = address;
    }

    public String getPathFile () {
        return pathFile;
    }

    public void setPathFile (String pathFile) {
        this.pathFile = pathFile;
    }
}
