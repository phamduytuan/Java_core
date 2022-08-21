package hello;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan("hello")
public class SpringHelloWorldApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringHelloWorldApplication.class, args);
	}

}
