package com.toni.ferreiro;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class EurosnovosApplication implements CommandLineRunner {

	public static void main(String[] args) {
		SpringApplication.run(EurosnovosApplication.class, args);
	}

	@Override
	public void run(String... args) throws Exception {
	}
}

