
public class App {
    public String getGreeting() {
        return "Hello 충돌.";
    }

    public static void main(String[] args) {
        System.out.println(new App().getGreeting());
        
        System.out.println("오");
        System.out.println("호");
        System.out.println("라");
    }
}

