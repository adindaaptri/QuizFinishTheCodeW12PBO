package model;

public class User {
    private int id;
    private String name;
    private String username;
    private String email;
    private String password;

    // Default constructor
    public User() {}

    // Constructor to initialize all fields
    public User(int id, String name, String username, String email, String password) {
        this.id = id;
        this.name = name;
        this.username = username;
        this.email = email;
        this.password = password;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    // Optional: Override toString for better string representation
    @Override
    public String toString() {
        return "User{id=" + id + ", name='" + name + "', username='" + username + "', email='" + email + "'}";
    }
}
