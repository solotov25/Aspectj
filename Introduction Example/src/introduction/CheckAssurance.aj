package introduction;
import java.util.Scanner;

public aspect CheckAssurance{
    private static Scanner input = new Scanner(System.in);
	pointcut verifyAssurance():execution(void PetStore.makeAppointment(..))
		|| execution(void PetStore.UpdateLevel(..));
	
	
	before() : verifyAssurance(){
		System.out.println("Verifying assurance...");
		String name = readConsole("Name of your pet: ");
		System.out.println("Welcome "+ name);
		System.out.println("You are able to use this service");
    }
	
	after() : verifyAssurance(){
		System.out.println("Request was executed successfully");
		readConsole("Press another key to keep using: ");
    }
	
	public static  String readConsole(String mensaje){
        System.out.println(mensaje);  
        String inputText;
        inputText = input.nextLine();           
        return inputText;
    }
}
