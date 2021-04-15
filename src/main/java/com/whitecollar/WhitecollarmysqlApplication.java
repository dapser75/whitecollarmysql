package com.whitecollar;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;


@SpringBootApplication
//@ComponentScan({"com.whitecollar.controllers","com.whitecollar.dao","com.whitecollar.project"})
//@ComponentScan(basePackages = {"com.whitecollar"})
//@EnableJpaRepositories("com.whytecollar")
public class WhitecollarmysqlApplication {

	public static void main(String[] args) {
		SpringApplication.run(WhitecollarmysqlApplication.class, args);
	}

}
